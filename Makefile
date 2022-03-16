platform := windows
home_dir := $(shell echo "$$HOME")
git_ssh_key_file_path := $(shell echo "$(home_dir)/.ssh/id_ed25519")
aws_svc_profile_name := inferno-svc

set-up-initial-directories:
	@mkdir -p "$(home_dir)/.ssh"
	@mkdir -p "$(home_dir)/.aws"

configure-bash-profile:
	@cp ./templates/$(platform)/.bash_profile "$(home_dir)/.bash_profile"

configure-cygwin:
ifeq ("$(platform)", "windows")
	@cp ./templates/$(platform)/nsswitch.conf /etc/nsswitch.conf
	@cp ./templates/$(platform)/cygpath-git-editor.sh "$(home_dir)/cygpath-git-editor.sh"
	@chmod +x "$(home_dir)/cygpath-git-editor.sh"
	@git config --global core.editor "$(home_dir)/cygpath-git-editor.sh"
endif

configure-vscode:
ifeq ("$(platform)", "windows")
	@cp ./templates/$(platform)/cygpath-git-vscode.bat "$(home_dir)/cygpath-git-vscode.bat"
	@cp -f ~/AppData/Roaming/Code/User/settings.json ~/AppData/Roaming/Code/User/settings.json.bak && \
	cp ./templates/$(platform)/vscode_user_settings.json ~/AppData/Roaming/Code/User/settings.json && \
	sed -i -e "s/USER_PROFILE/$$USERPROFILE/g" ~/AppData/Roaming/Code/User/settings.json
endif

#https://apple.stackexchange.com/questions/254380/why-am-i-getting-an-invalid-active-developer-path-when-attempting-to-use-git-a
install-xcode:
ifeq ("$(platform)", "mac")
	xcode-select --install
endif

create-git-ssh-key: check-email set-up-initial-directories prompt-git-create-ssh-key
	ssh-keygen -t ed25519 -C "$(email)" -f $(git_ssh_key_file_path)
	@chmod 700 $(git_ssh_key_file_path)
	@$(MAKE) --no-print-directory prompt-user-to-complete-setup
	
prompt-git-create-ssh-key:
	@echo ">>>> enter a password when prompted (password is required in order for key to be used with github)"

prompt-user-to-complete-setup:
	@echo ">>>> create a new SSH Key in [github](https://github.com/settings/ssh/new)."
	@echo ">>>> use name='$(email)'" 
	@echo ">>>> use key='$(shell cat $(git_ssh_key_file_path).pub)'"

configure-git: check-github-username 
	@cp ./templates/git/.gitignore_global 			"$(home_dir)/.gitignore_global"
	@cp ./templates/git/.gitconfig 					"$(home_dir)/.gitconfig"
	@sed -i -e "s/GITHUB_USERNAME/$(github-username)/g" 	"$(home_dir)/.gitconfig"

configure-aws: check-aws-access-key-id check-aws-secret-access-key set-up-initial-directories
	@cp ./templates/aws/config "$(home_dir)/.aws/config"
	@cp ./templates/aws/credentials "$(home_dir)/.aws/credentials"
	@chmod 600 "$(home_dir)/.aws/credentials"
	@sed -i -e "s/AWS_SVC_PROFILE_NAME/$(aws_svc_profile_name)/g" 	"$(home_dir)/.aws/config"
	@sed -i -e "s/AWS_SVC_PROFILE_NAME/$(aws_svc_profile_name)/g" 	"$(home_dir)/.aws/credentials"
	@sed -i -e "s/AWS_ACCESS_KEY_ID/$(aws-access-key-id)/g" 		"$(home_dir)/.aws/credentials"
	@sed -i -e "s/AWS_SECRET_ACCESS_KEY/$(aws-secret-access-key)/g" "$(home_dir)/.aws/credentials"

set-up-git: configure-git create-git-ssh-key


check-email:
ifndef email
	$(error email is not defined)
endif

check-github-username:
ifndef github-username
	$(error github-username is not defined)
endif

check-aws-access-key-id:
ifndef aws-access-key-id
	$(error aws-access-key-id is not defined)
endif

check-aws-secret-access-key:
ifndef aws-secret-access-key
	$(error aws-secret-access-key is not defined)
endif
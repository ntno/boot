platform := windows
home_dir := $(shell echo "$$HOME")
git_ssh_key_file_path := $(shell echo "$(home_dir)/.ssh/id_ed25519")

update-bash-profile:
	@cp ./templates/$(platform)/.bash_profile "$(home_dir)/.bash_profile"

update-cygwin-profile:
ifeq ("$(platform)", "windows")
	@cp ./templates/$(platform)/nsswitch.conf /etc/nsswitch.conf
endif

create-git-ssh-key: check-email
	@mkdir -p "$(home_dir)/.ssh"
	@echo ">>>> enter a password when prompted (password is required in order for key to be used with github)"
	ssh-keygen -t ed25519 -C "$(email)" -f $(git_ssh_key_file_path) 
	@echo ">>>> create a new SSH Key in [github](https://github.com/settings/ssh/new)."
	@echo ">>>> use name='$(email)'." 
	@echo ">>>> use key='$(shell cat $(git_ssh_key_file_path).pub)'."

configure-git: check-git-username 
	@cp ./templates/git/.gitignore_global "$(home_dir)/.gitignore_global"
	@cp ./templates/git/.gitconfig "$(home_dir)/.gitconfig"
	@sed -i -e "s/GIT_USERNAME/$(git-username)/g" "$(home_dir)/.gitconfig"


set-up-initial-repos:
	@mkdir -p "${CODE_HOME}"
	

check-email:
ifndef email
	$(error email is not defined)
endif

check-git-username:
ifndef git-username
	$(error git-username is not defined)
endif
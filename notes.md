# misc notes

## [fix permissions on private key](https://itectec.com/superuser/windows-ssh-permissions-for-private-key-are-too-open/)

	@if(test -f $(git_ssh_key_file_path)) then echo "key already exists. exiting..." && exit; else echo "key does not exist, creating key..."; fi;


## not working as of 3/15/22
```
configure-vscode:
ifeq ("$(platform)", "windows")
	@cp ./templates/$(platform)/cygpath-git-vscode.bat "$(home_dir)/cygpath-git-vscode.bat"
	@cp -f ~/AppData/Roaming/Code/User/settings.json ~/AppData/Roaming/Code/User/settings.json.bak && \
	cp ./templates/$(platform)/vscode_user_settings.json ~/AppData/Roaming/Code/User/settings.json && \
	sed -i -e "s/USER_PROFILE/$$USER/g" ~/AppData/Roaming/Code/User/settings.json
endif
```

output from vscode
```
[2022-03-15T20:57:25.162Z] Validating found git in: C:\Program Files\Git\cmd\git.exe
[2022-03-15T20:57:25.166Z] Validating found git in: C:\Program Files (x86)\Git\cmd\git.exe
[2022-03-15T20:57:25.167Z] Validating found git in: C:\Program Files\Git\cmd\git.exe
[2022-03-15T20:57:25.167Z] Validating found git in: C:\Users\natan.MY\AppData\Local\Programs\Git\cmd\git.exe
[2022-03-15T20:57:25.216Z] Git installation not found.

```
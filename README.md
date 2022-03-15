# boot

this repository includes instructions for setting up a development environment on Windows and Unix.  the notes were most recently updated while setting up development environment on Windows 11 Pro in March 2022.  these instructions should be completed before working on Inferno development projects.

## prerequisites 
- the computer must be a real machine, not a Windows VM.  see [system-specs](./system-specs.md) for example machine set ups.  
- [github](https://github.com/) account
- [dockerhub](https://hub.docker.com/) account


## credential information
you will need to keep track of several usernames, passwords, tokens, etc.  a secure password manager is highly recommended.  please note the following as you proceed through the instructions:  

- github username, password, ssh key passphrase 
- dockerhub username, password
- AWS username, password, access token, secret access token  


## install initial software

- [Chrome](https://www.google.com/chrome)
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Docker](https://docs.docker.com/get-docker/)  
  + if necessary, install [WSL 2 Linux kernel](https://docs.microsoft.com/en-us/windows/wsl/install-manua) via separate package
    + install Alpine WSL via Microsoft Store app
    + create UNIX username/password (prompt will pop up after first launch)
- [cygwin](https://cygwin.com/cygwin-ug-net/setup-net.html#internet-setup)
  + root folder: `C:\cygwin`
  + package folder: `C:\cygwin-packages`
  + packages to install: 
    - install the 'make' package `Devel > make`
    - install the 'git' package
 
## choose default folders, add to environment variables

### Windows
 
Settings > About > Advanced System Settings > Environment Variables  
Add a USERPROFILE environment variable.  It should look something like one of the following:
`USERPROFILE=C:\Users\natan.MY`
or 
`USERPROFILE=C:\Users\natan`

Next, set HOME to the value of USERPROFILE:
```
HOME=%USERPROFILE%
```

### Mac

HOME variable should be set automatically so no action is necessary here

[fix permissions on private key](https://itectec.com/superuser/windows-ssh-permissions-for-private-key-are-too-open/)

	@if(test -f $(git_ssh_key_file_path)) then echo "key already exists. exiting..." && exit; else echo "key does not exist, creating key..."; fi;

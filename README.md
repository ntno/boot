# boot

this repository includes instructions for setting up a development environment on Windows and Unix.  the notes were most recently updated while setting up development environment on Windows 11 Pro in March 2022.  these instructions should be completed before working on development projects.

## prerequisites 
- the computer must be a real machine, not a Windows VM.  see [system-specs](./system-specs.md) for example machine set ups.  
- [github](https://github.com/) account
- [dockerhub](https://hub.docker.com/) account


## credentials
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
- [git](https://git-scm.com/download)
  + during the install set up you will be asked to choose a default text editor.  choose "Use Visual Studio Code as Git's default editor" unless you are already comfortable using vim 
  + override default branch name to "main"
- [cygwin](https://cygwin.com/cygwin-ug-net/setup-net.html#internet-setup) (required for Windows only)
  + root folder: `C:\cygwin`
  + package folder: `C:\cygwin-packages`
  + packages to install: 
    - install the 'make' package `Devel > make`
    - install the 'git' package

## set USERPROFILE and HOME environment variables

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


## run auto-setup commands

### Windows  

1. download this repository as zip: https://github.com/ntno/boot/archive/refs/tags/0.0.0.zip  
2. move zip file to your documents folder and unzip (ex: `C:\Users\natan.MY\Documents`)  
3. open cygwin and navigate to the repository source code:    
    - `cd /cygdrive/c/Users/natan.MY/Documents/boot`
4. run initial set up commands:
    - `make configure-bash-profile`
    - `make configure-cygwin-profile`
    - `make configure-vscode`
    - `make set-up-git github-username=YOUR_GITHUB_USERNAME email=YOUR_EMAIL`
5. STOP! do not proceed until you have added your new github ssh key to your github account

### Mac  

1. download this repository as zip:https://github.com/ntno/boot/archive/refs/tags/0.0.0.zip   
2. move zip file to your documents folder and unzip (ex: `/Users/ntno/Documents`)  
3. open terminal and navigate to the repository source code:  
    - `cd /Users/ntno/Documents/boot`  
4. run initial set up commands:   
    - `make configure-bash-profile platform=mac`  
    - `make install-xcode platform=mac`  
    - `make set-up-git github-username=YOUR_GITHUB_USERNAME email=YOUR_EMAIL platform=mac`  

5. STOP! do not proceed until you have added your new github ssh key to your github account


## verify initial git set up  

- close current cygwin/terminal window and open a new one
  - enter your ssh key passphrase if prompted
- follow github's [Testing your SSH connection](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection) article to verify your git credentials are set up correctly

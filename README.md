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
 
## set up git
- open cygwin terminal and navigate to home directory 
  - `cd ~`
- print the current working directory
  - `pwd`
  - you should see something like "/home/natan" printed out
- [generate a SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).  this will be used to securely connect to github.com. 
  - `ssh-keygen -t ed25519 -C "your_email@example.com"`
  - when you're prompted to "Enter a file in which to save the key," press Enter. this accepts the default file location.
  - when you're prompted to "Enter a passphrase," enter a secret passsphrase.  keep track of this password in your password manager.
- verify that the public and private key were successfully created      
  - `ls -ltra ~/.ssh`   
    ```
    $ ls -ltra ~/.ssh
    total 16
    -rw-r--r--  1 natan Domain Users 102 Mar 15 10:26 id_ed25519.pub
    -rw-------  1 natan Domain Users 464 Mar 15 10:26 id_ed25519
    ```
  - you should see `id_ed25519` and `id_ed25519.pub`
- add your public ssh key to your github account
  - Settings > SSH and GPG keys > New SSH key
  - enter a name for the key that will help you distinguish it from other keys (ex: "name_of_computer, your_email@example.com") 
  - for the key content, copy in your *public* key
    - `cat ~/.ssh/id_ed25519.pub`
    ```
     cat ~/.ssh/id_ed25519.pub
     ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFhbo7fA3wqCY4der3VHpikmw1EXBhF9l3i2UDJvh+6W natan@infernomfg.com
    ```
- copy either the [Unix](./unix/config) or [Windows](./windows/config) ssh config file to your ssh folder (`~/.ssh`)

# update HOME environment variable

[instructions](https://thecategorizer.com/windows/how-to-add-path-and-environment-variables-in-windows/)  

```
USERPROFILE=C:\Users\natan.MY
HOME=%USERPROFILE%
```

[fix permissions on private key](https://itectec.com/superuser/windows-ssh-permissions-for-private-key-are-too-open/)

	@if(test -f $(git_ssh_key_file_path)) then echo "key already exists. exiting..." && exit; else echo "key does not exist, creating key..."; fi;

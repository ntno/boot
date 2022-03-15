notes compiled while setting up development environment on Windows 11 Pro in March 2022.  the computer must be a real machine, not a Windows VM.  see [system-specs](./windows/system-specs.md) for full description.

# install initial software

- [Chrome](https://www.google.com/chrome)
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Docker](https://docs.docker.com/get-docker/)  
  + install [WSL 2 Linux kernel](https://docs.microsoft.com/en-us/windows/wsl/install-manua) via separate package
  + install Alpine WSL via Microsoft Store app
    + create UNIX username/password (prompt will pop up after first launch)
- [cygwin](https://cygwin.com/cygwin-ug-net/setup-net.html#internet-setup)
  + root folder: `C:\cygwin`
  + package folder: `C:\cygwin-packages`
  + packages to install: 
    - install the 'make' package `Devel > make`
    - install the 'git' package
 
# update HOME environment variable

[instructions](https://thecategorizer.com/windows/how-to-add-path-and-environment-variables-in-windows/)  

```
USERPROFILE=C:\Users\natan.MY
HOME=%USERPROFILE%
```

[fix permissions on private key](https://itectec.com/superuser/windows-ssh-permissions-for-private-key-are-too-open/)

	@if(test -f $(git_ssh_key_file_path)) then echo "key already exists. exiting..." && exit; else echo "key does not exist, creating key..."; fi;

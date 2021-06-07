notes compiled while setting up development environment on Windows 10 in May 2021.  must be a real machine, not a Windows VM.

# install initial software

- [Firefox](https://www.mozilla.org/en-US/firefox/all/#product-desktop-release)  
  + use MSI release
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Docker](https://docs.docker.com/get-docker/)  
- [cygwin](https://cygwin.com/cygwin-ug-net/setup-net.html#internet-setup)
  + root folder: `C:\cygwin`
  + package folder: `C:\cygwin-packages`
  + packages to install: 
    - install the 'make' package `Devel > make`
    - install the 'git' package
 
# update HOME environment variable

```
HOME=%USERPROFILE%
```

[fix permissions on private key](https://itectec.com/superuser/windows-ssh-permissions-for-private-key-are-too-open/)

	@if(test -f $(git_ssh_key_file_path)) then echo "key already exists. exiting..." && exit; else echo "key does not exist, creating key..."; fi;

# manual set up 
alternate to running 
`make set-up-git email=YOUR_EMAIL git-username=YOUR_GITHUB_USERNAME`

## set up git
- open cygwin terminal and navigate to home directory 
  - `cd ~`
- print the current working directory
  - `pwd`
  - you should see something like "/home/natan" printed out
- [generate a SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).  this will be used to securely connect to github.com. 

### ssh key
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
     ssh-ed25519 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx your_email@example.com
    ```
- copy either the [Unix](./unix/config) or [Windows](./windows/config) ssh config file to your ssh folder (`~/.ssh/config`)

### general config
- copy the [git ignore file](./git/gitignore_global) to  your home folder (`~/gitignore_global`)
- copy the [git config file](./git/gitconfig) to your home folder (`~/.gitconfig`)
  - replace **GITHUB_USERNAME** with *your* github username
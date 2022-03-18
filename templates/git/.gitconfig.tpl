[user]
        name = GITHUB_USERNAME
        email = GITHUB_USERNAME@users.noreply.github.com
[core]
        autocrlf = false
        safecrlf = true
        editor = vi
        excludesfile = ~/.gitignore_global
[alias]
        hist = log --pretty=format:'%h %ad | %s %d [%an]' --graph --max-count=25
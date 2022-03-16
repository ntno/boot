#!/bin/bash
# author nickbudi
# https://gist.github.com/nickbudi/4b489f50086db805ea0f3864aa93a9f8
# install instructions: Daniel Kaplan
# https://stackoverflow.com/questions/62724723/git-in-visual-studio-code-says-file-is-modified-even-when-there-is-no-change/69340165#69340165


# wrapper to convert linux paths to windows
# so vscode will work as a git editor with cygwin
# editor="/home/this/file.sh" in .gitconfig

# extract last argument (the file path)
for last; do true; done

# get all the initial command arguments
all="${@:1:$(($#-1))}"

# launch editor with windows path
code $all $(cygpath -w $last) --wait -n
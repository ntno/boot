#!/bin/bash
# this script helps cygwin to properly use vscode as an external editor for git
# save this file to your home directory and make executable (chmod +x)
# then set core.editor git option to the path to this file
# example:
# editor="/home/this/file.sh" in .gitconfig
#
# author nickbudi
# https://gist.github.com/nickbudi/4b489f50086db805ea0f3864aa93a9f8


# extract last argument (the file path)
for last; do true; done

# get all the initial command arguments
all="${@:1:$(($#-1))}"

# launch editor with windows path
code $all $(cygpath -w $last) --wait -n
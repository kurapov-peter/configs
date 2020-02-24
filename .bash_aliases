#!/bin/bash

# aliases
alias ..='cd ../'
alias ...='cd ../../'

alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias ll='ls -Fls' # long listing format

# funcs
mcd()
{
    mkdir -p $1
    cd $1
}


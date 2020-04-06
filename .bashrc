#path
PATH=/usr/local/bin:/usr/local/sbin:$PATH
alias gcc=gcc-4.9

#postgresql
export PGDATA=/usr/local/var/postgres

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

# PERL_MB_OPT="--install_base \"/Users/kazumasa/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/kazumasa/perl5"; export PERL_MM_OPT;

# vi
alias vim='/usr/local/bin/vim -v'
alias vi='vim'

# search a word in text file
alias search="find ./ -type f -print | xargs grep"

# check permission
alias checkmod="find ./ -perm 644"

# rsync shortcut
alias rsyncnav="rsync -nav --exclude-from ~/.rsyncignore "
alias rsyncav="rsync -av --exclude-from ~/.rsyncignore "

# port forwarding
alias pf="ssh -N -D 10080 "

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# swift
export PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/:$PATH"

# hugo
alias hugoorg="hugo server -t purehugo --watch"

# bashmark
source ~/.local/bin/bashmarks.sh

# jupyter / ipython notebook
alias jup="jupyter notebook"
alias ip="ipython notebook"

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# autocd
shopt -s autocd

# rvm
source "$rvm_path/contrib/ps1_functions"
ps1_set --notime

# ls by enter

# rust
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

alias youtube-dl-mp3="youtube-dl -x --audio-format mp3"

alias to-utf8="nkf -w --overwrite"

alias matlab="/Applications/MATLAB_R2015b.app/bin/matlab -nodesktop"

# Docker
function dockerlogin()
{
  sudo docker exec -i -t $1 /bin/bash
}

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

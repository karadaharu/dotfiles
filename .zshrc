#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias gcc=gcc-4.9

#postgresql
export PGDATA=/usr/local/var/postgres

# PERL_MB_OPT="--install_base \"/Users/kazumasa/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/kazumasa/perl5"; export PERL_MM_OPT;

# vi
alias vi='/usr/local/bin/nvim'

# search a word in text file
alias search="find ./ -type f -print | xargs grep"

# check permission
alias checkmod="find ./ -perm 644"

# rsync shortcut
alias rsyncnav="rsync -nav --exclude-from ~/.rsyncignore "
alias rsyncav="rsync -av --exclude-from ~/.rsyncignore "

# port forwarding
alias pf="ssh -N -D 10080 "

# swift
export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/"

# hugo
alias hugoorg="hugo server -t karadaharu-hugo --watch -D --disableFastRender"

# jupyter / ipython notebook
alias jup="jupyter notebook"
alias ip="ipython notebook"

# ls by enter

# rust
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

alias youtube-dl-mp3="youtube-dl -x --audio-format mp3"

alias to-utf8="nkf -w --overwrite"

alias matlab="/Applications/MATLAB_R2016b.app/bin/matlab -nodesktop"

# Docker
function dockerlogin()
{
  sudo docker exec -i -t $1 /bin/bash
}

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

setopt AUTO_CD

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# z
. ~/z/z.sh

# iterm2 tab name
function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

source /usr/local/etc/bash_completion.d

# plenv
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init - zsh)"

zstyle ':completion:*' special-dirs true
# autoload -Uz compinit
# compinit
#

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
# rvm
# source "$rvm_path/contrib/ps1_functions"
# ps1_set --notime


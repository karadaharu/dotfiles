#path
PATH=/usr/local/bin:/usr/local/sbin:$PATH
alias gcc=gcc-4.9

#postgresql
export PGDATA=/usr/local/var/postgres

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

PERL_MB_OPT="--install_base \"/Users/kazumasa/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/kazumasa/perl5"; export PERL_MM_OPT;

# vi
alias vim=/Applications/MacVim.app/Contents/MacOS/vim
alias vi=vim

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

# swift
export PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/:$PATH"

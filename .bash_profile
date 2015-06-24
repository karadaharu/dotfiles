#to read .bashrc
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias chrome='open -a "/Applications/Google Chrome.app"'
export PATH=/usr/local/bin:$PATH

export PATH="/usr/texbin:$PATH"

# 2014年 10月12日 日曜日 18時09分35秒 JST - MODIS Reprojection Swath Tool modifications
MRTSWATH_HOME="/Users/kazumasa/mrt/"
PATH="$PATH:/Users/kazumasa/mrt//bin"
MRTSWATH_DATA_DIR="/Users/kazumasa/mrt//data"
export MRTSWATH_HOME PATH MRTSWATH_DATA_DIR

# GDAL 2014 14th Oct
export PATH=$PATH:/Library/Frameworks/GDAL.framework/Programs

alias preview='open -a Preview'

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# npm for kohgen
export PATH="/Users/kazumasa/workspace/digitiminimi/kohgen/node_modules/.bin:$PATH"


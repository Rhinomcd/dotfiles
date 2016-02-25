export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[34m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=cxFxBxDxCxegedabagacad
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:/Applications/DevDesktop/drush"
export ANDROID_HOME='/usr/local/opt/android-sdk'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home'

alias ls='ls -GFh'
alias brewup='echo "Updating and Upgrading brew....." ; brew update && brew upgrade'
eval "$(thefuck --alias fuck)"

# Local Aliases
alias b='cd ~/Projects/PersonalProjects/Box5Scores/'
alias bcc='cd ~/Projects/PersonalProjects/Box5Scores/Box5CloudCode/'
alias h='cd ~/Projects/HouseProjects/'
alias p='cd ~/Projects/'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
function google() { open /opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app "http://www.google.com/search?q= $1"; }
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
alias vlc='/opt/homebrew-cask/Caskroom/vlc/2.2.1/VLC.app/Contents/MacOS/VLC'

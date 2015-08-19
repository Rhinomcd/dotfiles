export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[34m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=cxFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias b='cd ~/Box5Scores/'
alias bcc='cd ~/Box5Scores/Box5CloudCode/'export PATH="/usr/local/sbin:$PATH"
alias brewup='echo "Updating and Upgrading brew....." ; brew update && brew upgrade'
eval "$(thefuck --alias fuck)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
function google() { open /opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app "http://www.google.com/search?q= $1"; }
export PATH="$PATH:/Applications/DevDesktop/drush"

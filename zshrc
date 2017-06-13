DISABLE_AUTO_UPDATE="true"
export ZSH=$HOME/.oh-my-zsh
  
ZSH_THEME="rmcdono"
DISABLE_AUTO_UPDATE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export GOROOT="$HOME/local/go"
export PATH="$GOROOT/bin:$HOME/local/bin:$PATH"
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

eval $(cat $HOME/.LS_COLORS)


if [ -z $TMUX ] && [ -t 0 ]; then
	tmux
fi

ssh() {
    tmux rename-window "$*"
    command ssh "$@"
}

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="rmcdono"
if [[ -e "$HOME/.LS_COLORS" ]]; then
    eval "$(cat "$HOME/.LS_COLORS")"
fi

plugins=(git docker)
source "$ZSH/oh-my-zsh.sh"
export GOROOT="$HOME/local/go"
export PYTHON3_BIN="/usr/local/Cellar/python/3.6.5/Frameworks/Python.framework/Versions/3.6/bin"
export PATH="$PYTHON3_BIN:$$HOME/.local/bin:GOROOT/bin:$HOME/local/bin:~/SDK/groovy-3.0.0-alpha-1/bin:$PATH"
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

export JBOSS_HOME="$HOME/WildFLy/latest"

# https://github.com/nvbn/thefuck 
# a magnificent app that corrects errors in previous console commands
if [[ !  -z "$(command -v thefuck)" ]]; then
    eval "$(thefuck --alias)"
fi

# Source ZSH Plugins/overrides 
OVERRIDE_DIR="$HOME/.zsh_overrides"
if [[ -d "$OVERRIDE_DIR" ]];then
    echo > "$HOME/.zsh_overrides.txt"
    for i in "$OVERRIDE_DIR"/*.zsh
    do
        source $i
        echo "$i" >> .zsh_overrides.txt
    done
fi

export PATH="/usr/local/sbin:$PATH"

[ -s "/Users/rmcdono/.jabba/jabba.sh" ] && source "/Users/rmcdono/.jabba/jabba.sh"

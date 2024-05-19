# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"
if [[ -e "$HOME/.LS_COLORS" ]]; then
    eval "$(cat "$HOME/.LS_COLORS")"
fi

plugins=(
    git
    docker
    zsh-autosuggestions
    1password
    battery
    kubectl
    )
source "$ZSH/oh-my-zsh.sh"
export GOPATH=$HOME/go 
export GOROOT=/usr/local/go 
export GOBIN=$GOPATH/bin 
export CGO_CFLAGS="-I/usr/include/x86_64-linux-gnu"
export PATH=$PATH:$GOPATH 
export PATH=$PATH:$GOBIN
export PYTHON3_BIN="/usr/local/Cellar/python/3.6.5/Frameworks/Python.framework/Versions/3.6/bin"
export PATH="$PYTHON3_BIN:$$HOME/.local/bin:GOROOT/bin:$HOME/local/bin:~/SDK/groovy-3.0.0-alpha-1/bin:$PATH"
export PATH="/${HOME}/.local/lib/python3.10/site-packages:/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/${HOME}/.local/bin:${PATH}"
export PATH="/${HOME}/.fzf/bin:${PATH}"
export PATH="${PATH}:/opt/nvim-linux64/bin"
export PATH="${PATH}:/opt/websocat"
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

export JBOSS_HOME="$HOME/WildFLy/latest"

# https://github.com/nvbn/thefuck 
# a magnificent app that corrects errors in previous console commands
if [[ !  -z "$(command -v thefuck)" ]]; then
    eval "$(thefuck --alias)"
fi

# Source ZSH Plugins/overrides 
OVERRIDE_DIR="$HOME/.zsh_overrides"
OVERRIDE_LIST="$HOME/.zsh_overrides.txt"
if [[ -d "$OVERRIDE_DIR" ]];then
    echo > "$OVERRIDE_LIST"
    for i in "$OVERRIDE_DIR"/*.zsh
    do
        source $i
        echo "$i" >> "$OVERRIDE_LIST"
    done
fi

export PATH="/usr/local/sbin:$PATH"

[ -s "/Users/rmcdono/.jabba/jabba.sh" ] && source "/Users/rmcdono/.jabba/jabba.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/rhino/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
#

if command -v nvim >/dev/null; then
    alias vim=nvim
    alias vi=nvim
fi

source ~/dotfiles/install_neovim.sh

eval "$(fzf --zsh)"
kubectl completion zsh > "${fpath[1]}/_kubectl"

eval "$(zoxide init zsh --cmd cd)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

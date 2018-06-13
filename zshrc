DISABLE_AUTO_UPDATE="true"
export ZSH=$HOME/.oh-my-zsh
  
ZSH_THEME="rmcdono"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# =============================================================================== 
# Ab Initio                                                                      |
# =============================================================================== 
export AB_BASE=/opt/abinitio
export AB_HOME=${AB_BASE}/abinitio-V3-3-2
export AB_BIN=${AB_HOME}/bin
export AB_AIR_HOME=${AB_BASE}/abinitio-V3-3-2
export AB_AIR_BRANCH=main
export AB_WORK_DIR=${AB_BASE}/work
export AB_DATA_DIR=${AB_WORK_DIR}/data
export AB_OPS_DIR=${AB_DATA_DIR}/ops
export AB_APPLICATION_HUB=${AB_BASE}/abinitio-app-hub
export AB_ADMIN_DIR=/opt/transient/data/admin
export AB_AIR_ROOT=//ablapp01.slo-devapp.truelink.com/opt/abinitio/eme/repoqa
alias abiadm="ssh -l abiadm `hostname`"
alias abiappl="ssh -l abiappl `hostname`"
#================================================================================

export GOROOT="$HOME/local/go"
export PATH="$$HOME/.local/bin:GOROOT/bin:$HOME/local/bin:~/SDK/groovy-3.0.0-alpha-1/bin:$PATH"
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

# =============================================================================== 

eval $(cat $HOME/.LS_COLORS)

# =============================================================================== 
# Docker                                                                         |
# =============================================================================== 
export COMPOSE_HTTP_TIMEOUT=240
if [[ -a "ucp/env.sh" ]]; then
	cd ucp
	. ./env.sh
	cd
fi
export DOCKER_API_VERSION=1.23
# =============================================================================== 
# =============================================================================== 

# Name Tmux window SSH target
ssh() {
    if [ ! -z $TMUX ]; then
        tmux rename-window "$*"
    fi
    command ssh "$@"
}
export JBOSS_HOME="~/WildFLy/latest"

# https://github.com/nvbn/thefuck 
# a magnificent app that corrects errors in previous console commands
if [[ !  -z $(which thefuck) ]]; then
    eval $(thefuck --alias)
fi

export TMOUT=172800

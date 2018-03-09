export HOME="/home/rmcdono"
DISABLE_AUTO_UPDATE="true"
export ZSH=$HOME/.oh-my-zsh
setopt share_history
  
ZSH_THEME="rmcdono-pizza"
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
alias abiadm="ssh -l abiadm `hostname`"
alias abiappl="ssh -l abiappl `hostname`"
alias rsand="cd /opt/persistent/qa/code/apps/sandbox/ebop_rmcdono"

if [ $HOSTNAME = "ablrun00.slo-devapp.truelink.com" ]; then
    export AB_AIR_ROOT=//ablapp00.slo-devapp.truelink.com/opt/abinitio/eme/repoqa
elif [ $HOSTNAME = "ablrun01.slo-devapp.truelink.com" ]; then
    export AB_AIR_ROOT=//ablapp01.slo-devapp.truelink.com/opt/abinitio/eme/repoqa
fi

# =============================================================================== 
# PATHS                                                                         |
# =============================================================================== 
export GOROOT="$HOME/local/go"
export GOPATH="/home/rmcdono/local/go/external"
export PYTHONPATH=$HOME/local/lib/python2.7/site-packages:$PYTHONPATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export PATH="$AB_BIN:$GOROOT/bin:$HOME/local/bin:$PATH:$HOME/local/pip:$HOME/.local/bin"


# =============================================================================== 
# Docker                                                                         |
# =============================================================================== 
export COMPOSE_HTTP_TIMEOUT=240
if [[ -a "ucp/env.sh" ]]; then
  cd ucp
  source ./env.sh
  cd
fi
export DOCKER_API_VERSION=1.23

# =============================================================================== 
# Host Specific Workarounds/configuration
# =============================================================================== 
if [[ "$HOSTNAME" = ablrun01.slo-devapp.truelink.com ]] && [[ "$USER" = abiappl ]]; then
  export HOME=/home/abiappl
fi

if [[ "$HOSTNAME" = dblmidev00.wrkgrp.slo.tuint.com ]]; then
  alias vim='/usr/bin/vim'
fi

if [[ "$HOST" = tool006 ]]; then
  alias dockToLB="/opt/truelink/prod-tools/docker/current/dockToLB/dockToLB.pl -env=slo-dev"
  alias modifyBigIP="/opt/truelink/prod-tools/f5/current/modifyBigipPool.pl"
fi

# =============================================================================== 
# Misc Tweaks
# =============================================================================== 

export TMOUT=172800

export TMOUT=172800
alias flake8="python -m flake8"

ssh() {
  if [[ ! -z "$TMUX" ]]; then
    tmux rename-window "$*"
  fi
  command ssh "$@"
}
eval $(cat $HOME/.LS_COLORS)

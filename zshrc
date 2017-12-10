DISABLE_AUTO_UPDATE="true"
export ZSH=$HOME/.oh-my-zsh
  
ZSH_THEME="rmcdono"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ================================================================================
# Ab Initio
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
export AB_AIR_ROOT=//ablapp00.slo-devapp.truelink.com/opt/abinitio/eme/repodev
#export AB_HOST_ALIAS_FILE=/home/abiadm/abconfig/admin/mfs/ab_host_alias
alias abiadm="ssh -l abiadm `hostname`"
alias abiappl="ssh -l abiappl `hostname`"
#==================================================================================

export GOROOT="$HOME/local/go"
export PATH="$GOROOT/bin:$HOME/local/bin:$PATH"
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH


if [ $HOST = tool006 ]; then
	alias dockToLB="/opt/truelink/prod-tools/docker/current/dockToLB/dockToLB.pl -env=slo-dev"
	alias modifyBigIP="/opt/truelink/prod-tools/f5/current/modifyBigipPool.pl"
fi

if [ -z $TMUX ] && [ -t 0 ] && [[ $HOSTNAME =~ '.*\.slo-off\.truelink\.com' || $HOSTNAME =~ '.*\.wrkgrp\.slo\..*' ]]; then
	tmux
fi
eval $(cat $HOME/.LS_COLORS)

#docker compose settings because we're slowww
export COMPOSE_HTTP_TIMEOUT=240
if [[ -a "ucp/env.sh" ]]; then
	cd ucp
	. ./env.sh
	cd
fi
ssh() {
    if [ ! -z $TMUX ]; then
        tmux rename-window "$*"
    fi
    command ssh "$@"
}
alias p="cd ~/Documents/Projects"
export JBOSS_HOME="~/WildFLy/latest"
OOHWEE="oohwee"
OWIE=\!
function f {
    ls -lt
    OOHWEE="o${OOHWEE}e"
    OWIE=$OWIE\!
    echo $OOHWEE$OWIE
}
alias ll=f
function f2 {
echo '............................................________ 
....................................,.-"...................``~., 
.............................,.-"..................................."-., 
.........................,/...............................................":, 
.....................,?......................................................, 
.................../...........................................................,} 
................./......................................................,:`^`..} 
.............../...................................................,:"........./ 
..............?.....__.........................................:`.........../ 
............./__.(....."~-,_..............................,:`........../ 
.........../(_...."~,_........"~,_....................,:`........_/ 
..........{.._$;_......"=,_......."-,_.......,.-~-,},.~";/....} 
...........((.....*~_......."=-._......";,,./`..../"............../ 
...,,,___.`~,......"~.,....................`.....}............../ 
............(....`=-,,.......`........................(......;_,,-" 
............/.`~,......`-...................................../ 
.............`~.*-,.....................................|,./.....,__ 
,,_..........}.>-._...................................|..............`=~-, 
.....`=~-,__......`,................................. 
...................`=~-,,.,............................... 
................................`:,,...........................`..............__ 
.....................................`=-,...................,%`>--==`` 
........................................_..........._,-%.......` 
..................................., '
}

alias sl=f2


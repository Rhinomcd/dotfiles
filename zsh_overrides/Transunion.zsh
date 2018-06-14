# Firewall makes autoupdate hard
DISABLE_AUTO_UPDATE="true"

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

# =============================================================================== 
# Docker                                                                         |
# =============================================================================== 
export COMPOSE_HTTP_TIMEOUT=240
if [[ -a "ucp/env.sh" ]]; then
	cd ucp
	. ./env.sh
	cd
fi
export TMOUT=172800

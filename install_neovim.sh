#!/usr/bin/bash
#
update_neovim () {
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
}

install_neovim () {
  if ! command -v nvim; then
    update_neovim
  fi
}


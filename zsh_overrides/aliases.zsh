# aliases.zsh
if [[ ! -z $(command -v python3) ]]; then
    alias python="python3"
fi

alias tmux="tmux -u"
alias oracle="ssh oracle@$HOST"
alias flake8="python -m flake8"
alias ls="ls -G --color"

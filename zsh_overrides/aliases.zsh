if [[ ! -z $(which python3) ]]; then
    alias python="python3"
fi

alias p="python ~/scripts/tmux.py"
alias tmux="tmux -u"
alias oracle="ssh oracle@$HOST"
alias flake8="python -m flake8"
alias ls="ls -lG"

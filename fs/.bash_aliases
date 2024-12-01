alias python=python3
alias py=python
alias pip="python -m pip"
alias venv="python -m venv"

alias rup=rustup
alias crg=cargo
alias rc=rustc
alias clippy="cargo clippy"

alias bashrc="$EDITOR $MYBASHRC"
alias _bashrc=". $MYBASHRC"

alias vimrc="$EDITOR $MYVIMRC"
alias _vimrc="vim +source$MYVIMRC"

alias genpas="py -c \"print('$0');import random, string;print(''.join([random.choice([*string.ascii_letters, *string.digits]) for _ in range(${1:-20})]))\""


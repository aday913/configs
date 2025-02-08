eval "$(starship init zsh)"

export ZSH="$ZSH"

alias ll="ls -lta"
alias ..="cd ../"
alias python="python3"

alias econfig="sudo nvim /etc/nixos/"
alias osswitch="sudo nixos-rebuild switch"
alias cleanup="sudo nix-collect-garbage --delete-older-than 7d && sudo nixos-rebuild boot && sudo nix-store --gc"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias mvenv="python -m venv venv"
alias avenv="source ./venv/bin/activate"

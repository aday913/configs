# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/home/aday/.nvm/versions/node/v22.17.0/bin:/home/linuxbrew/.linuxbrew/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker
  docker-compose
  python
  golang
)

source $ZSH/oh-my-zsh.sh

# User configuration

alias ll="ls -lta"
alias ..="cd ../"
alias python="python3"
alias docker="sudo docker"
alias docker-compose="sudo docker compose"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Automatically add ghub ssh key
eval "$(ssh-agent -s)" >/dev/null 2>&1
ssh-add ~/.ssh/INSERT_SSH_FILES_HERE >/dev/null 2>&1



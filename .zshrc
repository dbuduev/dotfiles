# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/dennis/.oh-my-zsh"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
git
npm
yarn
brew
aws
docker
docker-compose
terraform
osx
kubectl
)

source $ZSH/oh-my-zsh.sh

# User configuration

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
function flushdns(){
sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper; sudo dscacheutil -flushcache
}
export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export FZF_DEFAULT_COMMAND='rg --files'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go config
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if command -v minikube >/dev/null 2>&1; then
	source <(minikube completion zsh)
	alias k=kubectl
	complete -F __start_kubectl k
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

if command -v gron &>/dev/null; then
  alias ungron="gron --ungron"
fi

alias d=docker
complete -F __start_docker d

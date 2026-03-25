# Add wisely, as too many plugins slow down shell startup.
# render venv correctly
plugins=(git virtualenv)
unset VIRTUAL_ENV_DISABLE_PROMPT
source $ZSH/oh-my-zsh.sh
alias zoom="i3-msg exec zoom && exit"
alias chrome="i3-msg exec google-chrome && exit"
alias vim="nvim"
alias i3config="vim ~/.config/i3/config"
alias vimconfig="vim ~/.config/nvim"
# some keybinds
bindkey -v
bindkey '\ef' forward-word

#zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# python version
alias python="python3.12"

alias kbinit="setxkbmap -layout real-prog-qwerty"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/zig/zig-linux-x86_64-0.13.0"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/scripts
export PATH=$PATH:$HOME/personal/dev-env
bindkey '^H' backward-kill-word
export PATH="/Library/TeX/texbin:$PATH"

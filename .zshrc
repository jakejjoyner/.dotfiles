# Add wisely, as too many plugins slow down shell startup.
# render venv correctly
 plugins=(
  git
 )

# Load the completion system
unset VIRTUAL_ENV_DISABLE_PROMPT
alias vim="nvim"
bindkey "^E" beginning-of-line
bindkey "^V" end-of-line
#alias mail="neomutt"
# some keybinds
bindkey -v
bindkey '\ef' forward-word

# cursor
echo -ne '\e[5 q'
precmd() { echo -ne '\e[5 q' }

#zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# python version
alias python="python3.11"

eval "$(keychain --eval --quiet id_ed25519)"
export GPG_TTY=$(tty)
export PATH=$PATH:$HOME/dev-env/.local/scripts
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=$PATH:$HOME
export PATH="$PATH:$HOME/zig/zig-linux-x86_64-0.13.0"
export GPG_TTY=$(tty)
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/scripts
export PATH=$PATH:$HOME/personal/dev-env
bindkey '^H' backward-kill-word
export PATH="/Library/TeX/texbin:$PATH"
export GPG_TTY=$(tty)
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey '^Y' autosuggest-accept

# Created by `pipx` on 2026-04-03 20:20:32
export PATH="$PATH:/home/jjoyner/.local/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jjoyner/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jjoyner/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jjoyner/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jjoyner/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/go/bin:$PATH"

# Gastown laptop shortcuts
alias lab='cd ~/gt-lab && tmux new -As lab'
alias town='ssh jjoyner@100.113.167.50 -t tmux new -As jjoyner'

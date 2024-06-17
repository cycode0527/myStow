# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH

# some export
EDITOR=/usr/bin/vim
export EDITOR
export _Z_SRC=/home/sxrhhh/.zsh/plugins/z/z.sh
export MANPAGER='nvim +Man!'

# export WINEARCH=win32


# avoid execute '*' or '?' in zsh
setopt no_nomatch

# use VI-mode to edit command line; 使用了vi模式来进行命令行的编辑
bindkey -v
bindkey "jk" vi-cmd-mode
bindkey -a "H" vi-first-non-blank
bindkey -a "L" vi-end-of-line

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

#--------------------
#  docker completion
#--------------------
export fpath=(~/.zsh/completion $fpath)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
#--------------------



autoload -Uz compinit
compinit
# End of lines added by compinstall

#--------------------
#  history config
#--------------------
    # Lines configured by zsh-newuser-install
    HISTFILE="/$HOME/.zsh_history"
    HISTSIZE=500000
    SAVEHIST=10000
    # History won't save duplicates.
    setopt HIST_IGNORE_ALL_DUPS
    # History won't show duplicates on search.
    setopt HIST_FIND_NO_DUPS
#--------------------


#--------------------
#  Auto completion config
#--------------------
    # enable complete features;启用自动补全(可以双击Tab进行菜单选择哦)
    zstyle ':completion:*:*:*:*:*' menu select
    zstyle ':completion:*' auto-description 'specify: %d'
    zstyle ':completion:*' completer _expand _complete
    zstyle ':completion:*' format 'Completing %d'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' list-colors ''
    zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    zstyle ':completion:*' rehash true
    zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
    zstyle ':completion:*' use-compctl false
    zstyle ':completion:*' verbose true
    zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#--------------------


#--------------------
#  zsh-syntax-highlighting config
#--------------------
    # Download plugin if not exist
    if [ ! -f $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] ; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/plugins/zsh-syntax-highlighting
    else
        # Load zsh-synatx
        source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        # change color 自定义语法高亮颜色
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[path]=bold
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
#--------------------


#--------------------
#  default alias ls config
#--------------------
    # some more ls aliases
    alias ll='ls -l'
    alias la='ls -A'
    alias l='ls -cF'
    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'
    
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
#--------------------


#--------------------
#  zsh-autosuggestions config
#--------------------
    # Download the plugin if not exist
    if [ ! -f $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] ; then
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.zsh/plugins/zsh-autosuggestions
    else
	# Load the plugin
        source $HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
        # change suggestion color;将自动提示的底色改为灰色
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
	# bind "ctrl+A" to accept the suggestion;使用快捷键自动接受建议
	bindkey '^A' autosuggest-accept
	# bind "ctrl+E" to accept and execute the suggestion;使用快捷键自动接受并执行建议
	bindkey '^E' autosuggest-execute
   fi

#--------------------
#  p10k config
#--------------------
    if [ ! -f $HOME/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme ] ; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.zsh/themes/powerlevel10k
    else
        # Load Theme
        source $HOME/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
        # Change prompt color to cyan;用淡蓝色替换提示符
        # sed -i 's/DIR_BACKGROUND=4/DIR_BACKGROUND=6/g' $HOME/.p10k.zsh
        # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    fi #--------------------


#--------------------
#  Z jump config
#--------------------
    if [ ! -f $HOME/.zsh/plugins/z/z.sh ] ; then
	git clone https://github.com/rupa/z.git $HOME/.zsh/plugins/z
    else
        source $HOME/.zsh/plugins/z/z.sh
        # accostom to autojump;使用了j键来进行跳转,符合autojump的使用习惯
        alias j='z'
    fi
#--------------------

#--------------------
#  fzf settings
#--------------------
    export FZF_COMPLETION_TRIGGER=']'
    #bindkey '^T' fzf-completion
    #bindkey '^I' $fzf_default_completion
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    unalias z 2> /dev/null
    z() {
        [ $# -gt 0 ] && _z "$*" && return
        cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
    }
#--------------------



#--------------------
#  tmux alias
#--------------------
    alias tls='tmux ls'
    alias ta='tmux attach -t'
    alias nv='nvim'


#--------------------
#  ranger setting and alias
#--------------------
    alias ras='ranger'
    alias ra='source ranger'
    alias here='dolphin .'
    alias tod='cd ~/下载'


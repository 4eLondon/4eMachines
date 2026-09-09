#
# ~/.bashrc
#



# = = = = = General = = = = =
[[ $- != *i* ]] && return

PS1='\n[\t]-[\u@\h \W]\$ '

# -- Defaults
[[ $- != *i* ]] && return
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PAGER="less -R"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# -- Preformance
shopt -s cdable_vars
shopt -s cmdhist
shopt -s lithist
shopt -s cdspell
shopt -s dotglob
shopt -s nocaseglob
shopt -s nocasematch
shopt -s extglob

# -- History
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# = = = = = Aliases = = = = =

# + + [ Base Aliases ]
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias qe='pacman -Qe'
alias df='df -h'
alias du='du -sh'
alias cal='cal -3'

# + + [ Tool Aliases ]
export BAT_THEME="Nord"
export EDITOR=nvim
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
alias ll='eza -a --color=auto --icons'
alias lo='eza --tree -a --icons -I ".git|node_modules|.venv"'
alias pf='pfetch'
alias v='nvim'
alias vv='vim'
alias fir='firefox'
alias fira='firefox --private-window'

# = = = = = Functions = = = = =


# --Yazi cd on close
function yy() {
local tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# --View services
services() {
    case "$1" in
        -a|--all)      systemctl list-units --type=service --all ;;
        -r|--running)  systemctl list-units --type=service --state=running ;;
        -f|--failed)   systemctl list-units --type=service --state=failed ;;
        -i|--inactive) systemctl list-units --type=service --state=inactive ;;
        *) echo "Usage: svc [-a|--all] [-r|--running] [-f|--failed] [-i|--inactive]" ;;
    esac
}

# = = = = = Theme = = = = =
if [[ "$(tty)" == /dev/tty[0-9]* ]]; then
  printf '\e]P0000000\n'
  printf '\e]P1804000\n'
  printf '\e]P2996600\n'
  printf '\e]P3b28000\n'
  printf '\e]P4996633\n'
  printf '\e]P5cc7a00\n'
  printf '\e]P6e6994d\n'
  printf '\e]P7ffb84d\n'
  printf '\e]P8402000\n'
  printf '\e]P9ff9900\n'
  printf '\e]PAffc266\n'
  printf '\e]PBffd699\n'
  printf '\e]PCcc8533\n'
  printf '\e]PDff8c1a\n'
  printf '\e]PEffe0b3\n'
  printf '\e]PFfff2cc\n'
  clear
fi

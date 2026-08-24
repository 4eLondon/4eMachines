# ~/.bashrc
case $- in
    *i*) ;;
      *) return;;
esac
export TERM=xterm-256color
export PAGER="less -R"
shopt -s cdable_vars
shopt -s cmdhist
shopt -s lithist
shopt -s cdspell
shopt -s dotglob
shopt -s nocaseglob
shopt -s nocasematch
shopt -s extglob
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s cdspell
shopt -s globstar
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
 PS1='\[\033[34m\]\u\[\033[00m\]@\[\033[36m\]\h\[\033[00m\]: \[\033[34m\]\w\[\033[00m\] \[\033[35m\][\t]\[\033[00m\]\$ '
alias ls='ls -a --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias copy='xclip -selection clipboard'
alias v='vi'
alias pf='pfetch'
alias brc='nvim ~/.bashrc && sleep 2s ; source ~/.bashrc'
alias fir='firefox'
alias n='nano'
alias v='nvim'
alias uninstall='sudo apt purge'
alias install='sudo apt install'
alias qe='apt-mark showmanual'
function rr() {
local tmp="$(mktemp -t ranger-cwd.XXXXXX)"
  ranger --choosedir="$tmp" -- "${@:-$PWD}"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

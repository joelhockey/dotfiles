# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=1000000000
HISTSIZE=1000000
HISTTIMEFORMAT="%F %T "
shopt -s cmdhist
shopt -s histappend
function history_precmd { history -a; history -c; history -r; }
precmd_functions+=(history_precmd)

export TZ=PST8PDT

# FZF bash completion
# sudo apt install fd-find
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='fdfind --type f'

export PATH=$PATH:${HOME}/depot_tools

export XAUTHORITY=~/.Xauthority
export CHROMIUM_SRC=/usr/local/google/home/joelhockey/chromium/src
export CHROMIUM_BUILDTOOLS_PATH=${CHROMIUM_SRC}/buildtools
export USER_DATA_DIR=~/user-data-dir/gnchromeos

umask 022

function d {
  s=`printf "%d" $1`
  while [ "$s" -gt 9000000000 ]; do
     s=$((s / 1000))
  done
  date --date=@"$s"
}

function hex {
  printf "%x\n" $1
}

# powerline: sudo apt install python3-pip && pip3 install powerline-shell
# sudo apt install fonts-powerline
function _update_ps1() {
  PS1=$(~/.local/bin/powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

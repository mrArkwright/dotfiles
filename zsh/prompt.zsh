# vim:ft=zsh ts=2 sw=2 sts=2

init() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  SEGMENT_SEPARATOR=''

  # colors
  base03=8
  base02=0
  base01=10
  base00=11
  base0=12
  base1=14
  base2=7
  base3=15
  yellow=3
  orange=9
  red=1
  magenta=5
  violet=13
  blue=4
  cyan=6
  green=2

  bright=($base1 $base3)
  middle=($base00 $base2)
  dark=($base02 $base1)
  darkDimm=($base02 $base01)
  highlight=($yellow $base3)
  hightlight2=($orange $base3)
}

# Begin a segment
# Takes two arguments, background and foreground.
prompt_segment() {
  if [[ -n $CURRENT_BG && $1 != $CURRENT_BG ]]; then
    MYPROMPT+="%{%K{$1}%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{%F{$2}%}"
  else
    MYPROMPT+="%{%K{$1}%F{$2}%}"
  fi

  MYPROMPT+=$3

  CURRENT_BG=$1
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    MYPROMPT+="%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    MYPROMPT+="%{%k%}"
  fi

  MYPROMPT+="%{%f%}"

  CURRENT_BG=()
}

### Prompt components
# Each component will draw itself

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local max_host_length=$(($COLUMNS * 15 / 100))
  local host=$(print -P "%m")

  #if [[ -n $SSH_CLIENT ]]; then
  if [[ ${#host} -le $max_host_length && -n $SSH_CLIENT ]]; then
    prompt_segment $1 $2 " $(print -P "%n@%m") "
  else
    prompt_segment $1 $2 " %n "
  fi
}

# Status:
# - am I root
# - are there background jobs?
# - is this is git repo?
prompt_status() {
  local symbols
  symbols=()

  [[ $UID -eq 0 ]] && symbols+="⚡"

  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

  if git rev-parse --quiet > /dev/null 2>&1; then
			if git diff-files --quiet --ignore-submodules > /dev/null 2>&1; then
				symbols+="" # clean repo
			else
				symbols+="%{%F{$yellow}%}%{%F{default}%}" # dirty repo
			fi
		fi

  if [[ -n "$symbols" ]]; then
    prompt_segment $1 $2 " $symbols "
  else
    prompt_segment $1 $2 ""
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment $1 $2 " $(print -P "%$3<..<%.%<<") "
}



## Main prompt
build_prompt() {
  local zero='%([BSUbfksu]|([FBK]|){*})'

  init

  CURRENT_BG=()

  MYPROMPT="%{%f%b%k%}"

  MAX_LENGTH=$(($COLUMNS * 35 / 100))

  prompt_context $bright
  prompt_status $middle

  local prompt_length=${#${(S%%)MYPROMPT//$~zero/}}
  local max_dir_length=$(($MAX_LENGTH - $prompt_length))
  [[ $max_dir_length -lt 1 ]] && max_dir_length=1
  prompt_dir $dark $max_dir_length

  prompt_end

  MYPROMPT+=" "

  echo -n $MYPROMPT
}


PROMPT='$(build_prompt)'

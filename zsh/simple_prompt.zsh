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

# Context: user@hostname (who am I and where am I)
build_prompt() {
	if [[ -n $SSH_CLIENT ]]; then
		MYPROMPT+="%{%F{$base00}%}[%n@%m] "
	else
		MYPROMPT+="%{%F{$base00}%}[%n] "
	fi

	#local symbols
	#symbols=()

	#[[ $UID -eq 0 ]] && symbols+="⚡"

	#[[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="⚙"

	#if git rev-parse --quiet > /dev/null 2>&1; then
	#	if git diff-files --quiet --ignore-submodules > /dev/null 2>&1; then
	#		symbols+="" # clean repo
	#	else
	#		symbols+="%{%F{$yellow}%}" # dirty repo
	#	fi
	#fi

	#if [[ -n "$symbols" ]]; then
	#	MYPROMPT+="$symbols "
	#fi


	MYPROMPT+="%{%F{$base0}%}%. "

	MYPROMPT+="%{%F{$green}%}➜ "

	echo -n $MYPROMPT
}


PROMPT='$(build_prompt)'

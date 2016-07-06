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


PROMPT="%{%B%}"

if [[ -n $SSH_CLIENT ]]; then
	PROMPT+="%{%F{$base00}%}[%n@%m]%{%f%} "
else
	PROMPT+="%{%F{$base00}%}[%n]%{%f%} "
fi

PROMPT+="%{%F{$base1}%}%.%{%f%} "

PROMPT+="%{%b%}"

PROMPT+="%{%F{$green}%}➜%{%f%} "


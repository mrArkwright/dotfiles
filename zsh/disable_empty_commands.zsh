accept-nonempty-line () {
	if [[ -n $BUFFER ]] then
		unset RESPONSIVE_TEST
		zle reset-prompt
		zle accept-line
	else
		if [[ -z $RESPONSIVE_TEST ]] then
			RESPONSIVE_TEST=true
			RESPONSIVE_TEST_CYCLE=0
		else
			RESPONSIVE_TEST_CYCLE=$((($RESPONSIVE_TEST_CYCLE + 1) % 4))
		fi

		zle reset-prompt
	fi
}

zle -N accept-nonempty-line
bindkey "^M" accept-nonempty-line


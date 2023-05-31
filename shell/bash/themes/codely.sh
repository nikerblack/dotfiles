#!/usr/bin/env bash
PROMPT_COMMAND="codely_theme"

MIDDLE_CHARACTER="◂"
GREEN_COLOR="32"
RED_COLOR="31"

codely_theme() {
	LAST_CODE="$?"
	current_dir=$(dot core short_pwd)
	STATUS_COLOR=$GREEN_COLOR

	if [ $LAST_CODE -ne 0 ]; then
		STATUS_COLOR=$RED_COLOR
		MIDDLE_CHARACTER="▪"
	fi

	if [ -z "$CODELY_THEME_MINIMAL" ]; then
		export PS1="\[\e[${STATUS_COLOR}m\]<\[\e[m\]${MIDDLE_CHARACTER}\[\e[${STATUS_COLOR}m\]>\[\e[m\] \[\e[33m\]${current_dir}\[\e[m\] "
	else
#export PS1="\[\e[${STATUS_COLOR}m\]<\[\e[m\]${MIDDLE_CHARACTER}\[\e[${STATUS_COLOR}m\]>\[\e[m\] "
# show the git  branch when it exists
export PS1="\[\033[36m\]\u\[\033[m\]@\h\[\033[32m\] \[\033[33;1m\]\W\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))]\$ "
	fi
}

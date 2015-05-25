source ~/bash/chosen-colors

if [ "$TERM" = "linux" -o "$TERM" = "screen" ];
then
	alias google='google -c '


elif [ "$TERM" = "guake" -o "$TERM" = "gnome" ];
then
	alias google='google'
fi

if [ "$(date '+%d%b')" = "01Apr" ];
then
	PROMPT_COMMAND='PS1="C: $(pwd | sed s,/,\\\\\\\\,g)>"'
else
	#credit for this goes to: http://maketecheasier.com/8-useful-and-interesting-bash-prompts/2009/09/04
	PROMPT_COMMAND=' PS1=`RET=$?; if [[ $RET = "0" ]]; then
		name=$name1;
		ret=$ret1;
		dir=$dir1;
		prompt=$prompt1;
		command=$command1;
		host=$host1;
	else
		name=$name2;
		ret=$ret2;
		dir=$dir2;
		prompt=$prompt2
		command=$command2;
		host=$host2;
	fi
	echo -n "\\[$ret\\]$RET: \\[$reset\\]\\[$name\\]\\u@\\[$reset\\]\\[$host\\]\\h \\[$reset\]\\[$dir\\]\\w\\[$reset\\]\\[$prompt\\]\$\\[$reset\\]\\[$command\\] "`'
fi

stty eof  # is right above  on the keyboard. That's just asking for trouble :/

source ~/bash/aliases.sh
source ~/bash/variables.sh
alias addf='cat >>~/bash/functions.sh';

upBS() {
	local X="$1"
	Y=0
	while [ "$Y" -lt "$X" ];
	do
		echo -e -n "\b"
		Y=$(($Y + 1))
	done
	echo -e -n " \b"
}
up() 
{
	if [ "$1" = "-s" ] ;
	then
		source ~/bash/chosen-colors
		name=$name1;
		ret=$ret1;
		dir=$dir1;
		prompt=$prompt1;
		command=$command1;
		host=$host1;
		PS1="\\[$ret\\]0: \\[$reset\\]\\[$name\\]\\u@\\[$reset\\]\\[$host\\]\\h \\[$reset\]\\[$dir\\]\\w\\[$reset\\]\\[$prompt\\]\$\\[$reset\\]\\[$command\\] "
		TPS1=$(echo -e "$PS1" | sed 's/\\\[//g' | sed 's/\\\]//g' | sed 's/\\u/'"$(whoami)"'/g' | sed 's/\\h/'"$(hostname)"'/g' | sed 's/\\w/'"$(pwd | sed 's/\//\\\//g')"'/g')
		WD=$(pwd)
		NUMWD=$(echo "$WD" | sed -e 's/\\\\//g' -e 's/\\\///g' -e 's/^\/\(.*\)/\1/g' | tr '/' '\n' | wc -l)
		X=$NUMWD
		stty -echo
		LEN=0
		NEWWD=$(echo "$WD" | sed 's/^\/\(.*\)/\1/g' | sed 's/\//\n/g' | sed "$X"'s/^\(.*\)$/'"$(echo -e $dirsel )"'\1'"$(echo -e $dir1)"'/g' | tr '\n' '/' | sed 's/\//\\\//g')
		TPS12=$(echo -e -n "$PS1" | sed -e 's/\\u/'"$(whoami)"'/g' -e 's/\\\[//g' -e 's/\\\]//g' | sed 's/\\h/'"$(hostname)"'/g' | sed 's/\\w/'"$NEWWD"'/g')
		LEN=$(echo "$TPS12" | wc -c)
		echo -e -n $TPS12
		while read -rsn1 COMMAND ;
		do
			if [ "$COMMAND" = "h" ] ;
			then
				X=$(($X - 1))
				upBS $LEN
			elif [ "$COMMAND" = "l" ] ;
			then
				X=$(($X + 1))
				upBS $LEN
			else
				stty sane
				stty eof  
				cd $(Y=0 ; while [ "$Y" -lt "$(($NUMWD - $X))" ]; do echo -n "../" ; Y=$(($Y + 1)) ; done)
				echo -e -n "\n"
				return
			fi
			NEWWD=$(echo "$WD" | sed 's/^\/\(.*\)/\1/g' | sed 's/\//\n/g' | sed "$X"'s/^\(.*\)$/'"$(echo -e $dirsel )"'\1'"$(echo -e $dir1)"'/g' | tr '\n' '/' | sed 's/\//\\\//g')
			TPS12=$(echo -e -n "$PS1" | sed -e 's/\\u/'"$(whoami)"'/g' -e 's/\\\[//g' -e 's/\\\]//g' | sed 's/\\h/'"$(hostname)"'/g' | sed 's/\\w/'"$NEWWD"'/g')
			LEN=$(echo "$TPS12" | wc -c)
			echo -e -n $TPS12
		done
		return
	fi

	if [ "$1" = "" ];
	then
		cd ..;
		return;
	fi

	if [ "$1" = "-i" ]; # 'i' for "interactive"
	then
		while read -n 1 -s COMMAND;
		do
			if [ "$COMMAND" = "h" ];
			then
				CURRENT_DIR_OFFSET=$(basename $(pwd) | wc -c)
				echo -en "\033[1A\033["$CURRENT_DIR_OFFSET"D" ;
			fi
			if [ "$COMMAND" = "" ];
			then
				break
			fi
		done
	fi

	NUM_TIMES=$( echo $(($1 - 1)) );
	DOTS=""

	for ((x=0;$x<=$NUM_TIMES; x++))
	do
		DOTS="../$DOTS"
	done;

	cd $DOTS
}


frequency()
{
	history | sed 's/^[[:space:]]*[0-9]*[[:space:]]*\([-_a-zA-Z0-9]*\).*$/\1/g' | sort | uniq -c | sort -nr;
}

myfunctions()
{
	head -7 ~/bash/aliases.sh;
	head -1 ~/bash/functions.sh;
	head -4 ~/bash/variables.sh;
}


touchexe()
{
	touch $@
	chmod u+x $@
}

mkcd() 
{
	mkdir $@ && cd $@
}

randline()
{
	LINES=$(cat $1 | wc -l)
	echo $(cat $1 | sed -n "$(echo $(($(($RANDOM%$LINES))+1)) | sed 's/\n//g')"'p')
}

loadcolor()
{
	TMP=$(mktemp)
	cp $1 $TMP
	mv --backup $TMP ~/bash/chosen-colors
}

resetcolor()
{
	mv ~/bash/chosen-colors{\~,}
}

mod2oct()
{
	echo "$1" | sed -e 's/r/4+/g' \
	-e 's/w/2+/g' \
	-e 's/x/1+/g' \
	-e 's/-/0+/g' \
	-e 's/\(.*\).$/\1/g' | bc
}

urlxray()
{
	curl -s http://urlxray.com/display.php?url=$1 | grep -o '<title>.*</title>' | sed 's/<title>.*--> \(.*\)<\/title>/\1/g';
}

tinyurl()
{
	curl -s http://tinyurl.com/create.php?url=$1 | sed -n 's/.*\(http:\/\/tinyurl.com\/[a-z0-9][a-z0-9]*\).*/\1/p' | uniq ;
}

timer()
{
	sleep $1; timeout -k 1s 10s cvlc ~/Sound/ding.wav
}

update() 
{
	if [ -f /etc/debian_version ] ;
	then
		[ "$1" = "-y" ] && sudo bash -c 'apt-get update && apt-get -y dist-upgrade' || sudo bash -c 'apt-get update && apt-get dist-upgrade'
	fi
}

burnimage()
{
	IMG=$1
	SIZE=$(du -b $IMG  | sed 's/^\(.*\)[[:space:]]\+.*$/\1/g')
	sudo bash -c "dd if=$IMG | pv -s $SIZE | dd of=$2"
}

function man() 
{  
	$(which man) "$@" || help2man "$@" | $(which man) -l - ;
}

source ~/bash/local-functions.sh

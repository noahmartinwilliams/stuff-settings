source ~/bash/aliases.sh
source ~/bash/variables.sh
alias addf='cat >>~/bash/functions.sh';

function up {
	if [ "$1" = "" ];
	then
		cd ..;
		return;
	fi

	NUM_TIMES=$( echo $(($1 - 1)) );
	DOTS=""

	for ((x=0;$x<=$NUM_TIMES; x++))
	do
		DOTS="../$DOTS"
	done;

	cd $DOTS
}

function frequency {
	history | sed 's/^[[:space:]]*[0-9]*[[:space:]]*\([-_a-zA-Z0-9]*\).*$/\1/g' | sort | uniq -c | sort -nr;
}

function myfunctions {
	head -7 ~/bash/aliases.sh;
	head -1 ~/bash/functions.sh;
	head -4 ~/bash/variables.sh;
}


function touchexe {
	touch $@
	chmod u+x $@
}

function mkcd() {
	mkdir $@ && cd $@
}

function randline {
	LINES=$(cat $1 | wc -l)
	echo $(cat $1 | sed -n "$(echo $(($(($RANDOM%$LINES))+1)) | sed 's/\n//g')"'p')
}



function google { #A thanks to westeros91 for cracking the google API, God knows I couldn't.
	Q="$1"; 
	GOOG_URL="http://www.google.com/search?q="; 
	AGENT="Mozilla/4.0"; 
	stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}\"${Q/\ /+}\"" |\
	grep -oP '\/url\?q=.+?&amp' | sed 's/\/url?q=//;s/&amp//'); 
	echo -e "${stream//\%/\x}"
}

function addvocab {
	WORD=$(randline /usr/share/dict/words) 
	if [ -z "$WORD" ]; 
	then
		return 1;
	fi
	echo "$WORD" >>~/Documents/words/$WORD
	END=$(define "$WORD" | grep -n '^\.' | head -n 1 | cut -f 1 -d ':')
	echo $END | grep '^[0-9]\+'
	if [ "$?" != "0" ];
	then
		define $WORD | sed 's/\n//g' >>~/Documents/words/$WORD
	else
		define $WORD | sed -e "$END,"'$d' | sed 's/\n//g'   >>~/Documents/words/$WORD	
	fi
	vim ~/Documents/words/$WORD
}

function loadcolor {
	TMP=$(mktemp)
	cp $1 $TMP
	mv --backup $TMP ~/bash/chosen-colors
}

function resetcolor {
	mv ~/bash/chosen-colors{\~,}
}

function mod2oct {
	echo "$1" | sed -e 's/r/4+/g' \
	-e 's/w/2+/g' \
	-e 's/x/1+/g' \
	-e 's/-/0+/g' \
	-e 's/\(.*\).$/\1/g' | bc
}

function irc {
	nik=clf$RANDOM;sr=$1;expect -c "set timeout -1;spawn nc $sr 6666;set send_human {.1 .2 1 .2 1};expect AUTH*\n ;send -h \"user $nik * * :$nik commandlinefu\nnick $nik\n\"; interact -o -re (PING.:)(.*\$) {send \"PONG :\$interact_out(2,string)\"}"
}

source ~/bash/local-functions.sh

function addv
{
	echo $* >>~/bash/variables.sh;
}

MANPATH="~/bin/man:$MANPATH";
NULL=/dev/null
CLI_WEB_BROWSER=links
TMP=~/tmp
LIBRARY_PATH=/usr/include:./include
SPEECH="espeak"
PATH="/bin:/usr/bin:/usr/local/bin:/usr/games:/usr/local/games:/sbin:/usr/sbin:/usr/local/sbin:~/bin"

source ~/bash/local-variables.sh

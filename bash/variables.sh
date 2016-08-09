function addv
{
	echo $* >>~/bash/variables.sh;
}

export MANPATH="$MANPATH"
NULL=/dev/null
CLI_WEB_BROWSER=links
TMP=~/tmp
LIBRARY_PATH=/usr/include:./include
SPEECH="espeak"
PATH="/bin:/usr/bin:/usr/local/bin:/usr/games:/usr/local/games:/sbin:/usr/sbin:/usr/local/sbin:~/bin"
Ki=1024
Mi=$(( 1024 * 1024))
Gi=$(( 1024 * 1024 * 1024))

source ~/bash/local-variables.sh

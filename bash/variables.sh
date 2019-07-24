function addv
{
	echo $* >>~/bash/variables.sh;
}

export MANPATH=/usr/share/man:~/bin/man
NULL=/dev/null
CLI_WEB_BROWSER=links
TMP=~/tmp
LIBRARY_PATH=/usr/include:./include
SPEECH="espeak"
PATH="/usr/local/bin:/bin:/usr/bin:/usr/games:/usr/local/games:/sbin:/usr/sbin:/usr/local/sbin:"$HOME/bin:/opt/cuda/bin
Ki=1024
Mi=$(( 1024 * 1024))
Gi=$(( 1024 * 1024 * 1024))
export HISTCONTROL=ignorespace
export GOPATH=$HOME

source ~/bash/local-variables.sh

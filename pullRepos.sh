#!/bin/bash

#Rup Version für yocto git repos: 

#old mode 100755  
#new mode 100644
#-> git config core.filemode false

REPOS="ea143g_appswitcher ea143g_a200_firmware_gui ea143g_c200_firmware_gui
       ea143g_resources w1controller syslinkcorr DspTransfer
       ea143g_firmware_pccorr meta-ea20  docker"

stage_pull()
{
    for name in $REPOS
    do
	echo " "
	cd $name
	echo $name
	git remote update
	git pull origin master
	cd ..
    done
}

stage_help()
{
    echo "pull origin master in"
    for name in $REPOS
    do
	echo $name
    done
}

die()
{
    echo $*
    exit 1
}

# When no stage is specified, do all of them or help
if [ $# -eq 0 ]; then
    set -- pull
fi

while [ $# -gt 0 ]; do
    case $1 in
		 pull|help)
		     eval "stage_$1"
		     ;;
		 *)
		     echo "unknown stage '$1'" >&2
		     die
		     ;;
    esac
    shift
done

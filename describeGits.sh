#!/bin/bash

#Bastian Ruppert 24.09.2018

#Zeigt die Version und den Commit-Hash von git-Repositories an.
#Diese Informationen können dann in Yocto-Rezepten verwendet werden. 

REPOS="ea143g_a200_firmware_gui ea143g_c200_firmware_gui
       ea143g_resources syslinkcorr  w1controller ea143g_appswitcher"
#       DspTransfer"

stage_info()
{
    for name in $REPOS
    do
	echo " "
	cd $name
	echo "$name:"
	echo "#`git describe --dirty`"
	echo "SRCREV = \"`git log -1 --pretty=format:"%H"`\""
	cd ..
    done
    echo " "
    echo "********** ATTENTION ***********"
    echo "update meta-ea20 in poky folder!"
}

stage_help()
{
    echo "zeigt repo Infos für yocto Rezepte an REPOS:"
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
    set -- info
fi

while [ $# -gt 0 ]; do
    case $1 in
		 info|help)
		     eval "stage_$1"
		     ;;
		 *)
		     echo "unknown stage '$1'" >&2
		     die
		     ;;
    esac
    shift
done

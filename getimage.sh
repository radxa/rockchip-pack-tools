#!/bin/bash

set -e
cd `dirname $0`
mkdir -p Linux&&cd Linux

url="http://dl.radxa.com/rock/images/ubuntu/partitions/"
bootimg="boot-linux-latest.img"
rootfs="rootfs.img"

function checkfile()
{
	c1="`md5sum $1 | cut -d' ' -f1`"
	#echo c1: $c1
	c2="`cat $1.md5 | cut -d' ' -f1`"
	#echo c2: $c2

	if [ $c1 != $c2 ]; then
		echo "$1: wrong md5 check"
		rm -f $1 $1.md5
		exit
	fi
}

if [ ! -s $bootimg ]; then
	echo Not found Linux boot.img, download it...
	wget ${url}/$bootimg -O $bootimg
	wget ${url}/${bootimg}.md5 -O ${bootimg}.md5

	checkfile $bootimg
fi

if [ ! -s $rootfs ]; then
	echo Not found Linux rootfs
	while true; do
		read -p "Download the 1.server(512MB) or 2.desktop(1GB) rootfs [1/2] " r
		case $r in
			1) d="rootfs-server.img"; break;;
			2) d="rootfs-desktop.img"; break;;
			*) echo "please choose 1 or 2" ;;
		esac
	done

	wget ${url}/$d -O $rootfs
	wget ${url}/${d}.md5 -O ${rootfs}.md5
	
	checkfile $rootfs
fi

echo "========Download images from dl.radxa.com successfully! ============="

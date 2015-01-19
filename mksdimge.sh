#!/bin/sh -e

TODAY="`date +"%y-%m-%d"`"
IMG="radxa_rock_${TODAY}_sdcard.img"

rkcrc -p parameter parameter.img

dd of=$IMG conv=notrunc,sync if=sdboot_rk3188.img
dd of=$IMG conv=notrunc,sync bs=512 if=parameter.img seek=$((0x2000))

dd of=$IMG conv=notrunc,sync if=Linux/boot-linux.img seek=$((0x2000+0x2000))

echo "${IMG} is done"

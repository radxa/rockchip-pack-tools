#!/bin/bash

set -e

cd `dirname $0`

rm -f update_tmp.img
rm -f update.img

./afptool  -pack . update_tmp.img
./img_maker -rk31 RK3188Loader\(L\)_V2.08.bin 1 0 0 update_tmp.img update.img
echo "update.img is at `pwd`/update.img"

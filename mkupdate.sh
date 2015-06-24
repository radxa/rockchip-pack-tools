#!/bin/bash

set -e

TOP=$(cd $(dirname $0) && pwd)
cd $TOP

rm -f update_tmp.img
rm -f update.img

./afptool  -pack . update_tmp.img
./img_maker -rk32 RK3288UbootLoader_V2.19.01.bin 1 0 0 update_tmp.img update.img
echo "Image is at $TOP/update.img"

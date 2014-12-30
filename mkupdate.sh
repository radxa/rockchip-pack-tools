#!/bin/bash

set -e

TOP=$(cd $(dirname $0) && pwd)
cd $TOP

rm -f update_tmp.img
rm -f update.img

./afptool  -pack . update_tmp.img
./img_maker -rk31 RK3188Loader\(L\)_V2.19.bin 1 0 0 update_tmp.img update.img
echo "Image is at $TOP/update.img"

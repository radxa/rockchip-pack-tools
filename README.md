Tools for packing a Linux firmware(aka update.img) for rockchip platform.


### How to use it
#### Prepare kernel and rootfs
Run

    ./getimage.sh    # Download the kernel and rootfs from dl.radxa.com
Or

    mkdir Linux

Put your [boot.img](http://wiki.radxa.com/Rock/Booting_Linux) as name `boot-linux.img` and [rootfs](http://wiki.radxa.com/Rock/ubuntu) as name `rootfs.img` under Linux folder

#### Pack the image     
Run

    ./mkupdate.sh    # Pack the image

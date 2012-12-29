CMDLINE="console=ttyHSL0,115200,n8 androidboot.hardware=hws7300u vmalloc=578M kgsl.ptcount=16"
BASE="0x40300000"
ramdisk_dir=/home/aftersilence/ramdisk.cpio.gz

make -j4

cp arch/arm/boot/zImage .

find -name '*.ko' -exec cp -av {} lib/modules/ \;

# Make boot.img

./mkbootimg --cmdline "$CMDLINE" --base $BASE --kernel zImage --ramdisk $ramdisk_dir -o boot_new.img

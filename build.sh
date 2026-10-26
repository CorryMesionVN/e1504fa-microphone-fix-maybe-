make -C /lib/modules/$(uname -r)/build M=$PWD modules
sudo cp acp_yc_mach.ko /lib/modules/$(uname -r)/kernel/sound/soc/amd/yc/
sudo depmod -a

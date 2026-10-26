#!/bin/bash
# 1. Biên dịch module từ mã nguồn hiện tại
# sudo dnf install kernel-devel-$(uname -r)
# sudo dnf install kernel-devel kernel-headers make gcc
make -C /lib/modules/$(uname -r)/build M=$PWD modules

# 2. Đổi tên file vừa build ra cho khớp với tên gốc của hệ thống (snd-soc-acp6x-mach.ko)
mv acp6x-mach.ko snd-soc-acp6x-mach.ko

# 3. Nén file lại thành dạng .ko.xz giống hệt bản mặc định của Fedora
xz -z snd-soc-acp6x-mach.ko

# 4. Copy đè file đã nén vào đúng thư mục hệ thống của âm thanh AMD
sudo cp snd-soc-acp6x-mach.ko.xz /lib/modules/$(uname -r)/kernel/sound/soc/amd/yc/

# 5. Cập nhật lại danh sách module của kernel
sudo depmod -a

echo "Hoàn tất! Hãy khởi động lại máy để nhận micro."

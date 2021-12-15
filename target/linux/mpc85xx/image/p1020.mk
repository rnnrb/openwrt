define Device/aerohive_hiveap-330
  DEVICE_VENDOR := Aerohive
  DEVICE_MODEL := HiveAP-330
  DEVICE_PACKAGES := kmod-tpm-i2c-atmel
  BLOCKSIZE := 128k
  KERNEL := kernel-bin | gzip | uImage gzip
  KERNEL_SIZE := 8m
  KERNEL_INITRAMFS := copy-file $(KDIR)/vmlinux-initramfs | uImage none
  IMAGES := fdt.bin sysupgrade.bin
  IMAGE/fdt.bin := append-dtb
  IMAGE/sysupgrade.bin := append-dtb | pad-to 256k | check-size 256k | \
	append-uImage-fakehdr ramdisk | pad-to 256k | check-size 512k | \
	append-rootfs | pad-rootfs $$(BLOCKSIZE) | pad-to 41216k | check-size 41216k | \
	append-kernel | append-metadata
endef
TARGET_DEVICES += aerohive_hiveap-330

define Device/enterasys_ws-ap3710i
  DEVICE_VENDOR := Enterasys
  DEVICE_MODEL := WS-AP3710i
  BLOCKSIZE := 128k
  KERNEL = kernel-bin | lzma | fit lzma $(KDIR)/image-$$(DEVICE_DTS).dtb
  IMAGES := sysupgrade.bin
  IMAGE/sysupgrade.bin := append-kernel | append-rootfs | pad-rootfs | append-metadata
endef
TARGET_DEVICES += enterasys_ws-ap3710i

define Device/ocedo_panda
  DEVICE_VENDOR := OCEDO
  DEVICE_MODEL := Panda
  DEVICE_PACKAGES := kmod-rtc-ds1307 uboot-envtools
  KERNEL = kernel-bin | gzip | fit gzip $(KDIR)/image-$$(DEVICE_DTS).dtb
  PAGESIZE := 2048
  SUBPAGESIZE := 512
  BLOCKSIZE := 128k
  IMAGES := fdt.bin sysupgrade.bin
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
  IMAGE/fdt.bin := append-dtb
endef
TARGET_DEVICES += ocedo_panda

define Device/watchguard_t30-w
  DEVICE_VENDOR := WatchGuard
  DEVICE_MODEL := T30-W
  DEVICE_PACKAGES := kmod-ath10k-ct ath10k-firmware-qca988x-ct \
    kmod-usb2 kmod-usb-storage block-mount kmod-fs-vfat kmod-nls-cp437 \
    kmod-nls-iso8859-1 kmod-loop losetup kmod-fs-ext4 e2fsprogs tune2fs
  KERNEL_SIZE := 8192k
  KERNEL = kernel-bin | gzip | fit gzip $(KDIR)/image-$$(DEVICE_DTS).dtb
  IMAGES := fdt.bin sysupgrade.bin sysupgrade-dtb.bin
  IMAGE/fdt.bin := append-dtb
  IMAGE/sysupgrade.bin := sysupgrade-dtb-tar \
    $(KDIR)/image-$$(DEVICE_DTS).dtb | append-metadata
endef
TARGET_DEVICES += watchguard_t30-w

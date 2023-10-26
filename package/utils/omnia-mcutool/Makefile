#
# Copyright (C) 2016-2023 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=omnia-mcutool
PKG_VERSION:=0.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://gitlab.nic.cz/turris/$(PKG_NAME)/-/archive/$(PKG_VERSION)/
PKG_HASH:=e1b823dac9f908b86ce63e7f525a70fa40c004bcfee1c4766cfcf52dfd58382d

PKG_MAINTAINER:=Marek Mojik <marek.mojik@nic.cz>
PKG_LICENSE:=GPL-2.0-or-later

include $(INCLUDE_DIR)/package.mk

define Package/omnia-mcutool
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=https://gitlab.nic.cz/turris/$(PKG_NAME)
  TITLE:=CZ.NIC Turris Omnia MCU utility
  DEPENDS:=+omnia-mcu-firmware @TARGET_mvebu_cortexa9_DEVICE_cznic_turris-omnia
endef

define Package/omnia-mcutool/description
The omnia-mcutool utility is mainly used to upgrade the firmware on the
microcontroller on the Turris Omnia router. It can also show state of MCU
settings and configure MCU options (GPIOs, LEDs, power).
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -Wall" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/omnia-mcutool/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/omnia-mcutool $(1)/usr/bin/
endef

$(eval $(call BuildPackage,omnia-mcutool))

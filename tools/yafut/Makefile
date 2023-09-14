include $(TOPDIR)/rules.mk

PKG_NAME:=yafut
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/kempniu/yafut.git
PKG_SOURCE_DATE:=2023-04-07
PKG_SOURCE_VERSION:=bdd976654b6314193c9740deb9a99dbc7646a0ee

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_INSTALL:=1

$(eval $(call HostBuild))

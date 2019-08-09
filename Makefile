include $(TOPDIR)/rules.mk

PKG_NAME:=hev-fsh
PKG_VERSION:=3.8.5
PKG_RELEASE:=1
PKG_USE_MIPS16:=0
PKG_BUILD_PARALLEL:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/heiher/hev-fsh.git
PKG_SOURCE_VERSION:=45a83a205d5aa5fe903a7891c4b650cce165e6b3
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/hev-fsh
	SECTION:=net
	CATEGORY:=Network
	TITLE:=HevFsh for OpenWrt.
	URL:=https://github.com/heiher/hev-fsh
endef

define Package/hev-fsh/description
HevFsh is a solution for connect to remote shell in local networks.
endef

define Package/hev-fsh/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/hev-fsh $(1)/usr/bin
endef

$(eval $(call BuildPackage,hev-fsh))

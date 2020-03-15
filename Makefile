include $(TOPDIR)/rules.mk

PKG_NAME:=hev-fsh
PKG_VERSION:=4.1.1
PKG_RELEASE:=1
PKG_USE_MIPS16:=0
PKG_BUILD_PARALLEL:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/heiher/hev-fsh.git
PKG_SOURCE_VERSION:=796584824c118c47d17a9e522d2a04373cfea4f3
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

define Package/hev-fsh/conffiles
/etc/config/fsh
endef

define Package/hev-fsh/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/hev-fsh $(1)/usr/bin/fsh
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) files/fsh.config $(1)/etc/config/fsh
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/fsh-srv.init $(1)/etc/init.d/fsh-srv
	$(INSTALL_BIN) files/fsh-fwd.init $(1)/etc/init.d/fsh-fwd
endef

$(eval $(call BuildPackage,hev-fsh))

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-jmusupplicant
PKG_VERSION=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-jmusupplicant
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=jmuSupplicant 802.1X Client for LuCI
	PKGARCH:=all
endef

define Package/luci-app-jmusupplicant/description
	This package contains LuCI configuration pages for jmuSupplicant.
endef

define Package/luci-app-jmusupplicant/conffiles
/etc/config/jmusupplicant
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/files/luci/i18n/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-jmusupplicant/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/jmusupplicant
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/jmusupplicant.*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_CONF) ./files/root/etc/config/jmusupplicant $(1)/etc/config/jmusupplicant
	$(INSTALL_BIN) ./files/root/etc/init.d/jmusupplicant $(1)/etc/init.d/jmusupplicant
	$(INSTALL_DATA) ./files/luci/model/cbi/jmusupplicant/general.lua $(1)/usr/lib/lua/luci/model/cbi/jmusupplicant/general.lua
	$(INSTALL_DATA) ./files/luci/model/cbi/jmusupplicant/log.lua $(1)/usr/lib/lua/luci/model/cbi/jmusupplicant/log.lua
	$(INSTALL_DATA) ./files/luci/controller/jmusupplicant.lua $(1)/usr/lib/lua/luci/controller/jmusupplicant.lua
endef

$(eval $(call BuildPackage,luci-app-jmusupplicant))

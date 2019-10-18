####
 #  File: /Makefile
 #  Project: rclone
 #  File Created: Friday, 11th October 2019 4:50:49 pm
 #  Author: ElonH[EH](elonhhuang@gmail.com)
 #  License: GNU General Public License v3.0 or later(http://www.gnu.org/licenses/gpl-3.0-standalone.html)
 #  Copyright (C) 2019 [ElonH]
####

include $(TOPDIR)/rules.mk

PKG_NAME:=rclone
PKG_VERSION:=1.49.5
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_MAINTAINER:=ElonH <elonhhuang@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=rsync for cloud storage.
	URL:=https://rclone.org
	# DEPENDS:=+fuse 
endef

define Package/$(PKG_NAME)/description
Rclone ("rsync for cloud storage") is a command line program to sync root/usr/bin and directories to and from different cloud storage providers.
Cloud storage providers:
	1Fichier, Alibaba Cloud (Aliyun) Object Storage System (OSS), Amazon Drive, Amazon S3, 
	Backblaze B2, Box, Ceph, C14, DigitalOcean Spaces, Dreamhost, Dropbox, FTP, 
	Google Cloud Storage, Google Drive, Google Photos, HTTP, Hubic, Jottacloud, 
	IBM COS S3, Koofr, Memset Memstore, Mega, Microsoft Azure Blob Storage, 
	Microsoft OneDrive, Minio, Nextcloud, OVH, OpenDrive, Openstack Swift, 
	Oracle Cloud Storage, ownCloud, pCloud, premiumize.me, put.io, QingStor, 
	Rackspace Cloud root/usr/bin, rsync.net, Scaleway, SFTP, Wasabi, WebDAV, 
	Yandex Disk, The local root/usr/binystem.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
ifeq ($(ARCH),i386)
	$(INSTALL_BIN) ./comp/amd64) $(1)/usr/bin/rclone
endif
ifeq ($(ARCH),x86_64)
	$(INSTALL_BIN) ./comp/amd64 $(1)/usr/bin/rclone
endif
ifeq ($(ARCH),arm)
ifeq ($(BOARD),bcm53xx)
	 $(INSTALL_BIN) ./comp/arm_7 $(1)/usr/bin/rclone
else
	 $(INSTALL_BIN) ./comp/arm_6 $(1)/usr/bin/rclone
endif
endif
ifeq ($(ARCH),arm64)
	$(INSTALL_BIN) ./comp/arm64 $(1)/usr/bin/rclone
endif
ifeq ($(ARCH),aarch64)
	$(INSTALL_BIN) ./comp/arm64 $(1)/usr/bin/rclone
endif
ifeq ($(ARCH),mips)
	$(INSTALL_BIN) ./comp/mips_softfloat $(1)/usr/bin/rclone
endif
ifeq ($(ARCH),mipsel)
	$(INSTALL_BIN) ./comp/mipsel_softfloat $(1)/usr/bin/rclone
endif
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
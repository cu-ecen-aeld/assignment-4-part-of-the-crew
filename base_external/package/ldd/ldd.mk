
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = 5dd3dceedc6072aa172a0af4e0c136c94381020d
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-part-of-the-crew.git

LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

AESD_ASSIGNMENTS_MODULE_SUBDIRS = misc-modules scull

AESD_ASSIGNMENTS_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define LDD_BUILD_CMDS
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules all
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull all
endef

$(eval $(kernel-module))

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/sbin/
endef

LDD_POST_BUILD_HOOKS += LDD_INSTALL_TARGET_CMDS




$(eval $(generic-package))





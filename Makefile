# ----------------------------------------------------------------------------
# Compiler and Environment Setting
# ----------------------------------------------------------------------------
CC = gcc
LINKER = gcc

CP = cp -rfv
CD = cd
RM = rm -rfv
ECHO = echo

Q = @

# ----------------------------------------------------------------------------
# Sub Makefile Setting
# ----------------------------------------------------------------------------
TOP_DIR = $(PWD)
TASK_DIR = $(TOP_DIR)/task-06


# ----------------------------------------------------------------------------
# Target List
# ----------------------------------------------------------------------------
all: task-clean task-build rootfs-copy br-build

task-build:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " TASK BUILD"
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(CD) $(TASK_DIR) && $(MAKE)

task-clean:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " TASK CLEAN"
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(CD) $(TASK_DIR) && $(MAKE) clean

rootfs-copy:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " ROOTFS BUILD"
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(RM) $(ROOTFS_DIR)/root/*
	$(CP) $(TASK_DIR)/*.ko  $(ROOTFS_DIR)/root/	

br-config:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " BUILDROOT CONFIG"
	$(Q) $(ECHO) "------------------------------------------------------------"
	sudo make -C $(BUILDROOT_DIR) O=$(BUILDROOT_BUILD) distclean
	$(CP) $(BUILDROOT_DEFCONFIG) $(BUILDROOT_DIR)/configs
	make -C $(BUILDROOT_DIR) O=$(BUILDROOT_BUILD) qemu_x86_64_debug_defconfig

br-clean:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " BUILDROOT CLEAN"
	$(Q) $(ECHO) "------------------------------------------------------------"
	make -C $(BUILDROOT_DIR) O=$(BUILDROOT_BUILD) clean

br-build:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " BUILDROOT BUILD"
	$(Q) $(ECHO) "------------------------------------------------------------"
	make -C $(BUILDROOT_DIR) O=$(BUILDROOT_BUILD)

kernel-config:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " KERNEL CONFIG"
	$(Q) $(ECHO) "------------------------------------------------------------"
	make -C $(KERNEL_DIR) O=$(KERNEL_BUILD) mrproper 
	make -C $(KERNEL_DIR) O=$(KERNEL_BUILD) x86_64_defconfig
	make -C $(KERNEL_DIR) O=$(KERNEL_BUILD) kvmconfig

kernel-clean:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " KERNEL CLEAN"
	$(Q) $(ECHO) "------------------------------------------------------------"
	make -C $(KERNEL_DIR) O=$(KERNEL_BUILD) clean 

kernel-build:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " KERNEL BUILD"
	$(Q) $(ECHO) "------------------------------------------------------------"
	make -C $(KERNEL_DIR) O=$(KERNEL_BUILD) -j2 bzImage

kernel-modules:
	$(Q) $(ECHO) "------------------------------------------------------------"
	$(Q) $(ECHO) " KERNEL MODULES"
	$(Q) $(ECHO) "------------------------------------------------------------"
	make -C $(KERNEL_DIR) O=$(KERNEL_BUILD) -j2 modules




obj-m += hello.o

all:
	make -C $(KERNEL_DIR) M=$(PWD) ARCH=$(TARGET_ARCH) modules

clean:
	make -C $(KERNEL_DIR) M=$(PWD) ARCH=$(TARGET_ARCH) clean

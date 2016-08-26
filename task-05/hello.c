#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/usb.h>
#include <linux/usb/input.h>
#include <linux/hid.h>

/******** USB configuration ********/
static const struct usb_device_id hello_id_table[] = {
	{ USB_INTERFACE_INFO(
		  USB_INTERFACE_CLASS_HID, 
		  USB_INTERFACE_SUBCLASS_BOOT,
		  USB_INTERFACE_PROTOCOL_KEYBOARD) },
	{ },
};
MODULE_DEVICE_TABLE(usb, hello_id_table);
/**********/

static int __init hello_init(void)
{
	pr_err("Hello World!\n");
	return 0;
}

static void __exit hello_exit(void)
{
	pr_err("Quit hello-module\n");
}

module_init(hello_init);
module_exit(hello_exit);
MODULE_LICENSE("GPL");

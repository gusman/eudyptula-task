#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/usb.h>
#include <linux/usb/input.h>
#include <linux/hid.h>

/******** USB configuration ********/
static int hello_probe(
	struct usb_interface *intf, const struct usb_device_id *id);

static void hello_disconnect(struct usb_interface *intf);

static const struct usb_device_id hello_id_table[] = {
	{ USB_INTERFACE_INFO(
		  USB_INTERFACE_CLASS_HID, 
		  USB_INTERFACE_SUBCLASS_BOOT,
		  USB_INTERFACE_PROTOCOL_KEYBOARD) },
	{ },
};
MODULE_DEVICE_TABLE(usb, hello_id_table);

static struct usb_driver hello = {
	.name		= "hello",
	.id_table	= hello_id_table,
	.probe		= hello_probe,
	.disconnect	= hello_disconnect,
};

static int hello_probe(
	struct usb_interface *intf, const struct usb_device_id *id)
{
	printk(KERN_DEBUG "HELLO PROBE!\n");
	return 0;
}

/**********/

static void hello_disconnect(struct usb_interface *intf) 
{
	printk(KERN_DEBUG "HELLO DISCONNECT!\n");
}


static int __init hello_init(void)
{
	printk(KERN_DEBUG "Hello World!\n");
	return 0;
}

static void __exit hello_exit(void)
{
	printk(KERN_DEBUG "Quit hello-module\n");
}

module_init(hello_init);
module_exit(hello_exit);
MODULE_LICENSE("GPL");

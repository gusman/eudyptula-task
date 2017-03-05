#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/errno.h>
#include <linux/uaccess.h>

static struct miscdevice dev_eudyptula;
static struct file_operations const fops_eudyptula;

static char *STR_ID = "94ca80363b82";
static int  ID_LEN = 13;

static int __init hello_init(void)
{
	return misc_register(&dev_eudyptula);
}

static ssize_t hello_read(struct file *filp, char *data,
		size_t len, loff_t *ppos)
{
	return simple_read_from_buffer(data, len, ppos, STR_ID, ID_LEN);
}

static ssize_t hello_write(struct file *filp, const char *data,
		size_t len, loff_t *ppos)
{
	char tmp[ID_LEN];

	len = simple_write_to_buffer(tmp, ID_LEN, ppos, data, len);

	if (len < 0)
		return len;

	if (strncmp(tmp, STR_ID, ID_LEN - 1) != 0)
		return -EINVAL;

	return len;
}

static void __exit hello_exit(void)
{
	pr_debug("Quit hello-module\n");
	misc_deregister(&dev_eudyptula);
}

static struct file_operations const fops_eudyptula = {
	.owner = THIS_MODULE,
	.write = hello_write,
	.read  = hello_read,
};

static struct miscdevice dev_eudyptula = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = "eudyptula",
	.fops = &fops_eudyptula,
};

module_init(hello_init);
module_exit(hello_exit);
MODULE_LICENSE("GPL");

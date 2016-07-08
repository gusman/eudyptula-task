#!/bin/sh

PROJECT_DIR=`pwd`

BUILDROOT_DIR=$PROJECT_DIR/buildroot
ROOTFS_DIR=$PROJECT_DIR/rootfs
KERNEL_DIR=$BUILDROOT_DIR/output/build/linux-4.3
TARGET_ARCH=i386

export BUILDROOT_DIR
export KERNEL_DIR
export ROOTFS_DIR
export TARGET_ARCH

echo "PROJECT_DIR = $PROJECT_DIR"
echo "KERNEL_DIR = $KERNEL_DIR"
echo "BUILDROOT_DIR = $BUILDROOT_DIR" 
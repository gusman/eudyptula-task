#!/bin/sh

PROJECT_DIR=`pwd`

BUILDROOT_DIR=$PROJECT_DIR/buildroot
BUILDROOT_BUILD=$PROJECT_DIR/build/bldrt
BUILDROOT_DEFCONFIG=$PROJECT_DIR/qemu_x86_64_debug_defconfig

ROOTFS_DIR=$PROJECT_DIR/rootfs

KERNEL_DIR=$PROJECT_DIR/linux
KERNEL_BUILD=$PROJECT_DIR/build/linux
KERNEL_VERSION=v4.13.9
ARCH=x86_64

export PROJECT_DIR
export BUILDROOT_DIR
export BUILDROOT_BUILD
export BUILDROOT_DEFCONFIG
export KERNEL_DIR
export KERNEL_BUILD
export KERNEL_VERSION
export ROOTFS_DIR
export ARCH



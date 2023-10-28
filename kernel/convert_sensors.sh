#!/bin/sh

TEMPLATE='
MODULE_NAME := sensor_xxx_t31
OUT := $(MODULE_NAME)

DIR=sensors/$(SOC)

SRCS := $(DIR)/xxx/xxx.c

OBJS := $(SRCS:%.c=%.o) $(ASM_SRCS:%.S=%.o)

$(OUT)-objs := $(OBJS)

obj-m += $(OUT).o
'

for i in */; do
	cd $i;
	echo "$TEMPLATE" > ./Kbuild;
	sed -i "s/xxx/$(basename $(pwd))/g" Kbuild;
	[ -f Makefile ] && rm Makefile;
	cd ..;
done

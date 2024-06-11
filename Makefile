IMAGE_NAME := homelab-node-base

include ./.bootstrap/makesystem.mk

ifeq ($(MAKESYSTEM_FOUND),1)
include $(MAKESYSTEM_BASE_DIR)/dockerfile.mk
endif

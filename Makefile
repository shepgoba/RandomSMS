INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e
export TARGET = iphone:clang:11.2:11.0


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RandomSMS

RandomSMS = RandomSMS.xm
RandomSMS_CFLAGS = -fobjc-arc
RandomSMS_FRAMEWORKS = AVFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

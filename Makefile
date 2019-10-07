INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = randtexttone

randtexttone_FILES = Tweak.xm
randtexttone_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

# Board specific SELinux policy variable definitions
SEPOLICY_PATH:= device/xiaomi/vince/sepolicy

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS := \
    $(SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS) \
    $(SEPOLICY_PATH)/generic/public \
    $(SEPOLICY_PATH)/generic/public/attribute \
    $(SEPOLICY_PATH)/qva/public \
    $(SEPOLICY_PATH)/qva/public/attribute

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS := \
    $(SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS) \
    $(SEPOLICY_PATH)/generic/private \
    $(SEPOLICY_PATH)/qva/private \
    $(SEPOLICY_PATH)/private

#once all the services are moved to Product /ODM above lines will be removed.
# sepolicy rules for product images
PRODUCT_PUBLIC_SEPOLICY_DIRS := \
    $(PRODUCT_PUBLIC_SEPOLICY_DIRS) \
    $(SEPOLICY_PATH)/generic/product/public \
    $(SEPOLICY_PATH)/qva/product/public

PRODUCT_PRIVATE_SEPOLICY_DIRS := \
    $(PRODUCT_PRIVATE_SEPOLICY_DIRS) \
    $(SEPOLICY_PATH)/generic/product/private \
    $(SEPOLICY_PATH)/qva/product/private

BOARD_VENDOR_SEPOLICY_DIRS := \
                 $(BOARD_VENDOR_SEPOLICY_DIRS) \
                 $(SEPOLICY_PATH) \
                 $(SEPOLICY_PATH)/legacy/vendor/common/sysmonapp \
                 $(SEPOLICY_PATH)/legacy/vendor/ssg \
                 $(SEPOLICY_PATH)/legacy/vendor/common \
		 $(SEPOLICY_PATH)/legacy/vendor/msm8953 \
		 $(SEPOLICY_PATH)/vendor

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    BOARD_VENDOR_SEPOLICY_DIRS += $(SEPOLICY_PATH)/legacy/vendor/test
endif

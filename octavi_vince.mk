#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# Inherit from vince device
$(call inherit-product, device/xiaomi/vince/device.mk)

# Inherit some common Octavi stuff.
$(call inherit-product, vendor/octavi/config/common_full_phone.mk)

# Include Octavi specific sepolicy
-include device/octavi/sepolicy/qcom/sepolicy.mk

# Bootanimation Resolution
TARGET_BOOT_ANIMATION_RES := 1080

# Custom stuff
TARGET_FACE_UNLOCK_SUPPORTED := true
USE_PIXEL_CHARGER := true

# Build Status
OCTAVI_BUILD_TYPE := Official

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := xiaomi
PRODUCT_DEVICE := vince
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Redmi 5 Plus
PRODUCT_NAME := octavi_vince
PRODUCT_SYSTEM_NAME := vince

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vince-user $(PLATFORM_VERSION) $(BUILD_ID) $(shell date -u +%s) release-keys" \
    TARGET_BUILD_FLAVOR=vince-$(TARGET_BUILD_VARIANT) \
    TARGET_PRODUCT=vince

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "xiaomi/vince/vince:$(PLATFORM_VERSION)/$(BUILD_ID)/$(shell date -u +%s):user/release-keys"

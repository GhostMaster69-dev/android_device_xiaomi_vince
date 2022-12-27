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

# Inherit from vince device
$(call inherit-product, device/xiaomi/vince/device.mk)

# Inherit some common DerpFest stuff.
$(call inherit-product, vendor/derp/config/common_full_phone.mk)

# Include DerpFest specific sepolicy
-include device/derp/sepolicy/qcom/sepolicy.mk

# Boot Animation
USE_LEGACY_BOOTANIMATION := true

# Remove Gapps
ifneq ($(WITH_GMS), false)
PRODUCT_PACKAGES += RemovePackages
endif

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := xiaomi
PRODUCT_DEVICE := vince
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Redmi 5 Plus
PRODUCT_NAME := derp_vince
PRODUCT_SYSTEM_NAME := vince

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_VERSION_TAGS=release-keys \
    PRIVATE_BUILD_DESC="vince-user $(PLATFORM_VERSION) $(BUILD_ID) $(shell date -u +%s) release-keys" \
    TARGET_BUILD_FLAVOR=vince-user \
    TARGET_BUILD_TYPE=user \
    TARGET_PRODUCT=vince

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "xiaomi/vince/vince:$(PLATFORM_VERSION)/$(BUILD_ID)/$(shell date -u +%s):user/release-keys"

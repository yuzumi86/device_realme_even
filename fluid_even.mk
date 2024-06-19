#
# Copyright (C) 2020 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit some common fluid stuff
$(call inherit-product, vendor/fluid/config/common_full_phone.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# $(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)


# Inherit from device makefile
$(call inherit-product, device/realme/even/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := fluid_even
PRODUCT_DEVICE := even
PRODUCT_BRAND := realme
PRODUCT_MODEL := realme C25
PRODUCT_MANUFACTURER := realme
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_LIVE_WALLPAPERS := false

TARGET_BOOT_ANIMATION_RES := 720

# Fluid flags
FLUID_BUILD_TYPE := UNOFFICIAL
PRODUCT_PRODUCT_PROPERTIES += \
	ro.fluid.maintainer=ismasrull 
	

# Build info
BUILD_FINGERPRINT := "google/raven/raven:12/SQ1D.220105.007/8030436:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=even \
    PRODUCT_NAME=even \
    PRIVATE_BUILD_DESC="sys_oplus_mssi_64_cn-user-11-RP1A.200720.011-1647614838132-release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-realme

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

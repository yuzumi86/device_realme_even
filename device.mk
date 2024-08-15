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

DEVICE_PATH := device/realme/even

# Call proprietary blob setup
$(call inherit-product, vendor/realme/even/even-vendor.mk)

# $(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# IMS
$(call inherit-product, vendor/realme/even-ims/even-ims.mk)

# RealmeParts
$(call inherit-product, packages/apps/RealmeParts/parts.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Extra VNDK Versions
# PRODUCT_EXTRA_VNDK_VERSIONS := 30

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0.vendor \
    android.hardware.audio.service \
    android.hardware.audio@6.0-impl:32 \
    android.hardware.audio.effect@6.0-impl:32 \
    android.hardware.audio.common@6.0-util \
    android.hardware.audio@6.0-util \
    android.hardware.soundtrigger@2.3.vendor 
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.stub
PRODUCT_PACKAGES += \
    libaudiofoundation.vendor \
    libaudiopreprocessing \
    libbundlewrapper \
    libdownmix \
    libtinycompress \
    libtinyxml \
    libalsautils \
    libnbaio_mono
# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_device.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml \
    $(DEVICE_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/configs/audio/audio_em.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_em.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

TARGET_EXCLUDES_AUDIOFX := true

# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_audio_session \
    android.hardware.bluetooth.a2dp@1.0 \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth.a2dp@1.0.vendor


PRODUCT_PACKAGES += \
    libbtconfigstore
    
    # DRM
PRODUCT_PACKAGES += \
    libmockdrmcryptoplugin 

PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm@1.4-service.clearkey
    
    # DT2W
PRODUCT_PACKAGES += \
    DT2W-Service-even

# Camera
PRODUCT_PACKAGES += \
    GoogleCameraGo

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd
    
    # APN
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml
    
    # Public Libraries
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt
    
    # Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat
    
    # Radio
PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.1.vendor \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor
PRODUCT_PACKAGES += \
    MtkInCallService

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6768:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6768

# Rootdir
PRODUCT_PACKAGES += \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6768.rc \
    init.mt6768.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    fstab.mt6768 \
    fstab.ramdisk \
    ueventd.mtk.rc \
    perf_profile.sh


# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.even
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml
    
    # GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss@2.1.vendor
# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.0-impl-2.1
# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0 \
    android.hidl.allocator@1.0.vendor \
    libhidltransport \
    libhwbinder \
    libhwbinder.vendor \
    libhidltransport.vendor
# Keymaster
PRODUCT_PACKAGES += \
    libkeymaster4.vendor:64 \
    libkeymaster4support.vendor:64 \
    libkeymaster_portable.vendor:64 \
    libkeymaster_messages.vendor:64 \
    libsoft_attestation_cert.vendor:64 \
    libpuresoftkeymasterdevice.vendor:64
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# Init
PRODUCT_PACKAGES += \
    init.mt6768.rc \
    fstab.mt6768 \
    perf_profile.sh

# Keylayouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/idc/mtk-kpd.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/mtk-kpd.idc \
    $(DEVICE_PATH)/keylayout/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl \
    $(DEVICE_PATH)/keylayout/touchpanel.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/touchpanel.kl

# KPOC
PRODUCT_PACKAGES += \
    libsuspend \
    android.hardware.health@2.0
    
# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.even

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc  \
    NfcNci \
    SecureElement \
    Tag
    
    # Neutral Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.4.vendor

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay
PRODUCT_PACKAGES += \
    NotchBarKiller
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.controls.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.controls.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.3.vendor
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/power/powercontable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powercontable.xml \
    $(DEVICE_PATH)/configs/power/powerscntbl.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerscntbl.xml \
	$(LOCAL_PATH)/configs/power/power_app_cfg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/power_app_cfg.xml

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_ffmpeg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_ffmpeg.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_audio.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_video.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_oppo.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_oppo_performance.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(DEVICE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail_vendor \
    libavservices_minijail.vendor

# Media Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# Properties
-include $(DEVICE_PATH)/configs/props/product.prop
-include $(DEVICE_PATH)/configs/props/system.prop
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

	
# RemovePackages
PRODUCT_PACKAGES += \
    RemovePackages

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v30/arm64/arch-arm-armv8-a/shared/vndk-core/libmedia_helper.so:$(TARGET_COPY_OUT_VENDOR)/lib/libmedia_helper-v30.so \
    prebuilts/vndk/v30/arm64/arch-arm-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib/libutils-v30.so \
    prebuilts/vndk/v30/arm64/arch-arm64-armv8-a/shared/vndk-sp/libunwindstack.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libunwindstack-v30.so \
    prebuilts/vndk/v30/arm64/arch-arm64-armv8-a/shared/vndk-core/libmedia_helper.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmedia_helper-v30.so \
    prebuilts/vndk/v30/arm64/arch-arm64-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libutils-v30.so

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt6768.rc

# RcsService
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# Screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Screen Recorder
PRODUCT_PACKAGES += \
    ScreenRecorder
	
	# Secure element
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.0.vendor

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0.vendor \
    android.hardware.sensors@2.0-impl \
    android.hardware.sensors@2.0-service 

PRODUCT_PACKAGES += \
    libsensorndkbridge
	
# Speed up
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    Settings \
    SystemUI

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service-lazy
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.4.vendor \
    android.hardware.wifi.supplicant@1.4.vendor \
    android.hardware.wifi.hostapd@1.2.vendor \
    android.hardware.wifi@1.4-impl

PRODUCT_PACKAGES += \
    libkeystore-engine-wifi-hidl \
    libkeystore-wifi-hidl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf

#
# Copyright (C) 2018 The LineageOS Project
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

LOCAL_PATH := device/samsung/a7xelte

# Inherit from those products. Most specific first.
$(call inherit-product, $(LOCAL_PATH)/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_l_mr1.mk)

# Inherit common Lineage phone.
$(call inherit-product, vendor/fluid/config/common.mk)
# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := fluid_a7xelte
PRODUCT_DEVICE := a7xelte
PRODUCT_MODEL := SM-A710F
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung
DEVICE_MAINTAINER := clownless


ifeq ($(WITH_GAPPS),true)
TARGET_INCLUDE_GAPPS := true
TARGET_GAPPS_ARCH := arm64
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_AOSP_REPLACEMENTS := true
else
TARGET_INCLUDE_GAPPS := false
PRODUCT_PACKAGES += \
    Dialer \
    Messaging \
    ViaBrowser \
    Gallery2
endif

# FLUID STUFF
FLUID_BUILD_TYPE := CXCKRXMS
PRODUCT_PRODUCT_PROPERTIES += \
    ro.fluid.maintainer=clownless \
    ro.fluid.cpu=Exynos7580


# APNs
PRODUCT_COPY_FILES += \
    vendor/fluid/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

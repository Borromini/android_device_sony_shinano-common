# Copyright (C) 2013 The CyanogenMod Project
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

# inherit from msm8974-common
include device/sony/msm8974-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/shinano-common/include

BOARD_PATH := device/sony/shinano-common

# Board
BOARD_VENDOR_PLATFORM := shinano
PRODUCT_PLATFORM:= shinano

# Kernel information
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y
BOARD_KERNEL_CMDLINE  += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
BOARD_KERNEL_SEPARATED_DT := true
TARGET_DTB_EXTRA_FLAGS := --force-v2

# Defines for HW subsystems
-include $(BOARD_PATH)/hardware/*/BoardConfig.mk

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# FM
BOARD_HAVE_ALTERNATE_FM := true
BOARD_HAVE_BCM_FM := true
BOARD_HAVE_FM_RADIO := true
BOARD_DISABLE_FMRADIO_LIBJNI := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/shinano-common/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/sony/shinano-common/bluetooth/vnd_shinano.txt

# BT/FM (Broadcom): Adjust the sysfs patch for 3.4 kernel
BOARD_HAVE_BCM_FM_SYSFS := "/sys/bus/platform/drivers/bcm_ldisc/bcm_ldisc/"
BOARD_BRCM_HCI_NUM := 26

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Camera
TARGET_USES_MEDIA_EXTENSIONS := true

# GPS
TARGET_PROVIDES_GPS_LOC_API := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_shinano

# Keystore
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# SELinux
#BOARD_SEPOLICY_DIRS += \
#    device/sony/shinano-common/sepolicy
    
# Props for hotplugging
TARGET_SYSTEM_PROP += device/sony/shinano-common/system.prop

#Sensors
USE_SENSOR_MULTI_HAL := true

# KCAL
SUPPORTS_KCAL_COLORCONTROL := true

# Wifi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"

# NFC
BOARD_NFC_CHIPSET := pn547
BOARD_NFC_DEVICE := /dev/pn547
BOARD_NFC_HAL_SUFFIX := pn54x.default
NXP_CHIP_TYPE := 1

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Partition information
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2671771648

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/shinano-common/rootdir/fstab.full
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

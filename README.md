# Device Tree for Realme C25 and Realme C25s 

The Realme C25 and Realme C25s are budget smartphones from Realme. These are announced and released in March 2021 and June 2021.

## Device Specifications
Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (2x2.0 GHz Cortex-A75 & 6x1.7 GHz Cortex-A55)
Chipset | MediaTek Helio G70 (12 nm)
GPU     | Mali-G52 2EEMC2
Memory  | 4 GB
Shipped Android Version | Android 11, realme UI 2.0 (Upgradable to Android 12, realme UI 3.0)
Storage | 64/128 GB (eMMC type)
MicroSD | Up to 512 GB 
Battery | Li-Po 6000 mAh, non-removable
Dimensions | 164.4 x 75 x 9 mm (6.47 x 2.95 x 0.35 in)
Display | 720 x 1560 pixels, 6.50" IPS LCD, 20:9 ratio (~270 ppi density)
Rear Camera  | Triple : 48MP(Global)/13 MP(India); 2MP(depth); 2MP(Macro)
Front Camera | Single: 8 MP
Release Month | 2021, March 27

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)
Chipset | MediaTek Helio G85 (12 nm)
GPU     | Mali-G52 2EEMC2
Memory  | 4 GB
Shipped Android Version | Android 11, realme UI 2.0 (Upgradable to Android 12, realme UI 3.0)
Storage | 64/128 GB (eMMC type)
MicroSD | Up to 512 GB 
Battery | Li-Po 6000 mAh, non-removable
Dimensions | 164.4 x 75 x 9 mm (6.47 x 2.95 x 0.35 in)
Display | 720 x 1560 pixels, 6.50" IPS LCD, 20:9 ratio (~270 ppi density)
Rear Camera  | Triple : 48MP(Global)/13 MP(India); 2MP(depth); 2MP(Macro)
Front Camera | Single: 8 MP
Release Month | 2021, June 9

# Patches

## Encryption Keystore2 patch (must for booting)

* cd system/security && git fetch https://github.com/AOSP-12-RMX2020/android_system_security && git cherry-pick d2bf978444da8d80a71b34c37f1c1853a405935c && cd ../..

## VOLTE Patches

* cd frameworks/opt/net/ims && git fetch https://github.com/AOSP-12-RMX2020/frameworks_opt_net_ims && git cherry-pick 4f35ccb8bf0362c31bf5f074bcb7070da660412a^..3fe1cb7b6b2673adfce2b9232dfaf81375398efb && cd ../../../.. 
* cd packages/modules/Wifi && git fetch https://github.com/AOSP-12-RMX2020/packages_modules_Wifi && git cherry-pick c6e404695bc451a9667f4893501ef8fe78e1a0b7^..90fc3f6781171dc27fed16b60575f9ea62f02e7a && cd ../../.. 
* cd frameworks/opt/telephony && git fetch https://github.com/phhusson/platform_frameworks_opt_telephony android-12.0.0_r26-phh && git cherry-pick 6f116d4cdb716072261ecfe532da527182f6dad6 && cd ../../..

Copyright (C) 2022 Lineage OS
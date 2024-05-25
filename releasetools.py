# Copyright (C) 2009 The Android Open Source Project
# Copyright (C) 2019 The Mokee Open Source Project
# Copyright (C) 2019 The LineageOS Open Source Project
#
# SPDX-License-Identifier: Apache-2.0

import common
import re


def FullOTA_InstallBegin(info):
  data = info.input_zip.read("RADIO/dynamic-remove-oppo")
  common.ZipWriteStr(info.output_zip, "dynamic-remove-oppo", data)
  info.script.AppendExtra('update_dynamic_partitions(package_extract_file("dynamic-remove-oppo"));')
  return
  
def FullOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def AddImage(info, basename, dest):
  name = basename
  data = info.input_zip.read("IMAGES/" + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def OTA_InstallEnd(info):
  info.script.Print("Patching firmware images...")
  AddImage(info, "vbmeta.img", "/dev/block/by-name/vbmeta")
  AddImage(info, "vbmeta_system.img", "/dev/block/by-name/vbmeta_system")
  AddImage(info, "vbmeta_vendor.img", "/dev/block/by-name/vbmeta_vendor")
  return

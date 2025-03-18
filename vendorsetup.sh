echo "Cloning Dependencies"
rm -rf ./prebuilts/clang/host/linux-x86/mylittleclang
rm -rf ./kernel/realme/even
git clone --depth=1 https://github.com/Realme-C25-Series-Development/kernel_realme_even.git -b even-rmui2 ./kernel/realme/even
git clone --depth=1 https://github.com/crdroidandroid/android_prebuilts_clang_host_linux-x86_clang-6573524.git -b 10.0 ./prebuilts/clang/host/linux-x86/mylittleclang
echo "Done!"

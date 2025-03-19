echo "Cloning Dependencies"
rm -rf ./prebuilts/clang/host/linux-x86/mylittleclang
rm -rf ./kernel/realme/even
git clone --depth=1 https://github.com/Realme-C25-Series-Development/kernel_realme_even.git -b even-rmui2 ./kernel/realme/even
git clone --depth=1 https://github.com/kdrag0n/proton-clang.git -b master ./prebuilts/clang/host/linux-x86/mylittleclang
echo "Done!"

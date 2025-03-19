echo "Cloning Dependencies"
rm -rf ./prebuilts/clang/host/linux-x86/mylittleclang
rm -rf ./kernel/realme/even
git clone --depth=1  --recurse-submodules https://github.com/liquidprjkt/liquid_kernel_realme_even.git -b OSS-RUI2 ./kernel/realme/even
git clone --depth=1 --recurse-submodules https://gitlab.com/clangsantoni/zyc_clang.git -b 14 ./prebuilts/clang/host/linux-x86/mylittleclang
echo "Done!"

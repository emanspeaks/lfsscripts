try mkdir -v ../binutils-build1
cd ../binutils-build1
try ../binutils-2.25/configure     \
    --prefix=/tools            \
    --with-sysroot=$LFS        \
    --with-lib-path=/tools/lib \
    --target=$LFS_TGT          \
    --disable-nls              \
    --disable-werror
try make
try make install
cd ..
try rm -vrf binutils-build1
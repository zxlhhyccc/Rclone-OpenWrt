#!/bin/sh
# Reference: https://medium.com/@diogok/on-golang-static-binaries-cross-compiling-and-plugins-1aed33499671
# Reference: https://golang.org/doc/install/source#environment
export GOPATH=${PWD}/GOPATH
export CGO_ENABLED=0
export GOOS=linux
# GOARCH=amd64 go build -a -ldflags '-s -w' -o mmm

## workflow: https://github.com/rclone/rclone/blob/master/CONTRIBUTING.md
code_source=${PWD}/src/rclone
git clone https://github.com/rclone/rclone ${code_source}
main_file=${code_source}/rclone.go
build_dir=${PWD}/build
comp_dir=${PWD}/comp


cd ${code_source}
go mod download

[ ! -d ${build_dir} ] && mkdir ${build_dir}
[ ! -d ${comp_dir} ] && mkdir ${comp_dir}

rm ${build_dir}/* -rf
rm ${comp_dir}/* -rf

cd ${code_source}
echo "build target..."
GOARCH=amd64 go build -a -ldflags '-s -w' -o ${build_dir}/amd64 $main_file
upx --lzma -o ${comp_dir}/amd64 ${build_dir}/amd64

GOARCH=386 GO386=387 go build -a -ldflags '-s -w' -o ${build_dir}/i386_387 $main_file
upx --lzma -o ${comp_dir}/i386_387 ${build_dir}/i386_387

# GOARCH=386 GO386=sse2 go build -a -ldflags '-s -w' -o ${build_dir}/i386_sse2 $main_file
# upx --lzma -o ${comp_dir}/i386_sse2 ${build_dir}/i386_sse2

# GOARCH=arm GOARM=5 go build -a -ldflags '-s -w' -o ${build_dir}/arm_5 $main_file
# upx --lzma -o ${comp_dir}/arm_5 ${build_dir}/arm_5

GOARCH=arm GOARM=6 go build -a -ldflags '-s -w' -o ${build_dir}/arm_6 $main_file
upx --lzma -o ${comp_dir}/arm_6 ${build_dir}/arm_6

GOARCH=arm GOARM=7 go build -a -ldflags '-s -w' -o ${build_dir}/arm_7 $main_file
upx --lzma -o ${comp_dir}/arm_7 ${build_dir}/arm_7

GOARCH=arm64 go build -a -ldflags '-s -w' -o ${build_dir}/arm64 $main_file
upx --lzma -o ${comp_dir}/arm64 ${build_dir}/arm64

# GOARCH=ppc64 GOPPC64=power8 go build -a -ldflags '-s -w' -o ${build_dir}/ppc64_power8 $main_file
# # upx --lzma -o ${comp_dir}/ppc64_power8 ${build_dir}/ppc64_power8
# cp ${build_dir}/ppc64_power8 ${comp_dir}/ppc64_power8

# GOARCH=ppc64 GOPPC64=power9 go build -a -ldflags '-s -w' -o ${build_dir}/ppc64_power9 $main_file
# # upx --lzma -o ${comp_dir}/ppc64_power9 ${build_dir}/ppc64_power9
# cp ${build_dir}/ppc64_power9 ${comp_dir}/ppc64_power9

# GOARCH=ppc64le GOPPC64=power8 go build -a -ldflags '-s -w' -o ${build_dir}/ppc64le_power8 $main_file
# upx --lzma -o ${comp_dir}/ppc64le_power8 ${build_dir}/ppc64le_power8

# GOARCH=ppc64le GOPPC64=power9 go build -a -ldflags '-s -w' -o ${build_dir}/ppc64le_power9 $main_file
# upx --lzma -o ${comp_dir}/ppc64le_power9 ${build_dir}/ppc64le_power9

GOARCH=mips GOMIPS=hardfloat go build -a -ldflags '-s -w' -o ${build_dir}/mips_hardfloat $main_file
upx --lzma -o ${comp_dir}/mips_hardfloat ${build_dir}/mips_hardfloat

GOARCH=mips GOMIPS=softfloat go build -a -ldflags '-s -w' -o ${build_dir}/mips_softfloat $main_file
upx --lzma -o ${comp_dir}/mips_softfloat ${build_dir}/mips_softfloat

GOARCH=mipsle GOMIPS=hardfloat go build -a -ldflags '-s -w' -o ${build_dir}/mipsel_hardfloat $main_file
upx --lzma -o ${comp_dir}/mipsel_hardfloat ${build_dir}/mipsel_hardfloat

GOARCH=mipsle GOMIPS=softfloat go build -a -ldflags '-s -w' -o ${build_dir}/mipsel_softfloat $main_file
upx --lzma -o ${comp_dir}/mipsel_softfloat ${build_dir}/mipsel_softfloat

# GOARCH=mips64 GOMIPS64=hardfloat go build -a -ldflags '-s -w' -o ${build_dir}/mips64_hardfloat $main_file
# # upx --lzma -o ${comp_dir}/mips64_hardfloat ${build_dir}/mips64_hardfloat
# cp ${build_dir}/mips64_hardfloat ${comp_dir}/mips64_hardfloat

# GOARCH=mips64 GOMIPS64=softfloat go build -a -ldflags '-s -w' -o ${build_dir}/mips64_softfloat $main_file
# # upx --lzma -o ${comp_dir}/mips64_softfloat ${build_dir}/mips64_softfloat
# cp ${build_dir}/mips64_softfloat ${comp_dir}/mips64_softfloat

# GOARCH=mips64le GOMIPS64=hardfloat go build -a -ldflags '-s -w' -o ${build_dir}/mips64el_hardfloat $main_file
# # upx --lzma -o ${comp_dir}/mips64el_hardfloat ${build_dir}/mips64el_hardfloat
# cp ${build_dir}/mips64el_hardfloat ${comp_dir}/mips64el_hardfloat

# GOARCH=mips64le GOMIPS64=softfloat go build -a -ldflags '-s -w' -o ${build_dir}/mips64el_softfloat $main_file
# # upx --lzma -o ${comp_dir}/mips64el_softfloat ${build_dir}/mips64el_softfloat
# cp ${build_dir}/mips64el_softfloat ${comp_dir}/mips64el_softfloat

# GOARCH=s390x go build -a -ldflags '-s -w' -o ${build_dir}/s390x $main_file
# # upx --lzma -o ${comp_dir}/s390x ${build_dir}/s390x
# cp ${build_dir}/s390x ${comp_dir}/s390x

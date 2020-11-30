# HevFsh for OpenWrt

## 简介

本项目是 [hev-fsh](https://github.com/heiher/hev-fsh) 在 OpenWrt 上的移植。

## 编译

从 OpenWrt 的 [SDK](https://openwrt.org/docs/guide-developer/obtain.firmware.sdk) 编译

```bash
cd openwrt-sdk

# 获取源码
git clone https://github.com/heiher/openwrt-hev-fsh.git package/hev-fsh

# 选中 Network -> hev-fsh
make menuconfig

# 编译 hev-fsh
make package/hev-fsh/{clean,compile} V=s
```

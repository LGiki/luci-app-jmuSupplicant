OpenWrt/LEDE LuCI for jmuSupplicant
===

简介
---

本软件包是 jmuSupplicant 的 LuCI 控制界面，修改自 [luci-app-mentohust](https://github.com/BoringCat/luci-app-mentohust) 。

软件包文件结构:
```
/
├── etc/
│   ├── config/
│   │   └── jmuSupplicant                               // UCI 配置文件
│   └── init.d/
│       └── jmuSupplicant                               // init 脚本
└── usr/
    └── lib/
        └── lua/
            └── luci/                                   // LuCI 部分
                ├── controller/
                │   └── jmuSupplicant.lua               // LuCI 菜单配置
                ├── i18n/                               // LuCI 语言文件目录
                │   └── jmuSupplicant.zh-cn.lmo
                └── model/
                    └── cbi/
                        └── jmuSupplicant/
                            ├── general.lua             // LuCI 基本设置
                            └── log.lua                 // LuCI 日志读取
```

依赖
---

软件包不显式依赖二进制文件 `jmuSupplicant`.
可通过编译 [jmuSupplicant](https://github.com/ShanQincheng/jmuSupplicant) 获得.  
只有当文件存在时, 相应的功能才可被使用, 并显示相应的 LuCI 设置界面.  
**请注意：jmuSupplicant 二进制文件必须支持所有参数。如：-u -p -s -n --interface_card --ip --mask**  

 可执行文件  | 可选 | 功能        
 ------------|------|-------------
 `jmuSupplicant` | 否   | 进行802.11x验证

注: 可执行文件需要在 `$PATH` 环境变量所表示的搜索路径中, 可被正常调用，否则不会出现LUCI界面.

配置
---

软件包的配置文件路径: `/etc/config/jmusupplicant`  
此文件为 UCI 配置文件, 配置方式可参考 [OpenWrt Wiki][uci]  

编译
---

从 OpenWrt/LEDE 的 [SDK][openwrt-sdk] 编译  
```bash
# 解压下载好的 SDK
tar xJf lede-sdk-17.01.4-ar71xx-generic_gcc-5.4.0_musl-1.1.16.Linux-x86_64.tar.xz
cd lede-sdk-*
# Clone 项目
git clone https://github.com/LGiki/luci-app-jmuSupplicant package/luci-app-jmuSupplicant
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-jmuSupplicant/tools/po2lmo
make && sudo make install
popd
# 选择要编译的包 LuCI -> 3. Applications
make menuconfig
# 开始编译
make package/luci-app-jmuSupplicant/compile V=99
```

[openwrt-sdk]: https://wiki.openwrt.org/doc/howto/obtain.firmware.sdk
[uci]: https://wiki.openwrt.org/doc/uci


OpenWrt/LEDE LuCI for jmuSupplicant
===

简介
---

本软件包是 jmuSupplicant的 LuCI 控制界面,

软件包文件结构:
```
# TODO
```

依赖
---

软件包不显式依赖二进制文件 `jmuSupplicant`.
可通过编译安装 [jmuSupplicant](https://github.com/ShanQincheng/jmuSupplicant) 获得.  
只有当文件存在时, 相应的功能才可被使用, 并显示相应的 LuCI 设置界面.  
**请注意：jmuSupplicant 二进制文件必须支持所有参数。如：-u -p -n -i -m -g -s -o -t -e -r -a -d -b -y -f -c -w** 

| 可执行文件    | 可选 | 功能            |
| ------------- | ---- | --------------- |
| jmuSupplicant | 否   | 进行802.11x验证 |


注: 可执行文件需要在 `$PATH` 环境变量所表示的搜索路径中, 可被正常调用，否则不会出现LUCI界面.

配置
---

软件包的配置文件路径: `/etc/config/jmuSupplicant`  
此文件为 UCI 配置文件, 配置方式可参考 [OpenWrt Wiki][uci]  

编译
---

从 OpenWrt/LEDE 的 [SDK][openwrt-sdk] 编译

TODO...
# MoYuM Nvim Config

基于 [NvChad](https://nvchad.com/docs/config/mappings#manually_load_mappings) 的配置。


## Why

完全由自己维护一个 nvim 配置的成本有点太过昂贵了，远不如 NvChad、SpaceVim 这种成熟的社区维护的 base config 稳定。如果有足够的时间和耐心的话，自己搞一个配置还是挺有趣的，但我并没有那些时间和耐心😊。


## 如何使用

克隆之后，利用 `ln` 将配置文件软链接到 nvchad 的 custom 目录。

```
ln -s $YOUR_CUSTOM_DIR/* ~/.config/nvim/lua/custom/
```


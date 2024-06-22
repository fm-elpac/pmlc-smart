# pmlc-smart

<https://github.com/fm-elpac/pmlc-smart>

![CI](https://github.com/fm-elpac/pmlc-smart/actions/workflows/ci.yml/badge.svg)

镜像: TODO

## 概述

胖喵好聪明: 硬盘健康持续监测 (S.M.A.R.T.) Monitor harddisk health.

基于 smartmontools <https://www.smartmontools.org/> powered by smartmontools.

### 默认行为

- (1) 默认不会监测任何硬盘, 需要手动启用对每个硬盘的监测, 比如命令:

  ```sh
  systemctl enable pmlc-smart@sda.target
  ```

  这将监测 `/dev/sda` 硬盘.

- (2) 每小时查询一次硬盘详细信息 (`smartctl -x` 命令).

- (3) 每天一次硬盘快速自检 (`smartctl -t short` 命令) (不适用于 NVMe).

  每天上午 10:00 (北京时间 UTC+0800, CST) 执行. 快速自检很快就能完成, 通常不超过
  5 分钟.

- (4) 每周一次硬盘全面自检 (`smartctl -t long` 命令) (不适用于 NVMe).

  全面自检比较慢, 一块硬盘可能需要 8 至 10 个小时才能完成. 每周四下午 15:00
  (北京时间 UTC+0800, CST) 执行.

- (5) 自动删除旧数据.

  每天下午 17:00 (北京时间 UTC+0800, CST) 执行.

### 架构设计

- (1) **特权部分** (systemd+bash): 以系统服务 (root 权限) 运行.

  调用 `smartctl` 命令收集硬盘数据, 写入 `/var/lib/pmlc-smart/` 目录.
  此处的数据只保留 28 天, 旧数据会自动删除.

  尽量减少这一部分的代码量, 并严格控制权限 (使用 systemd service sandbox).
  为了尽量减少依赖, 使用系统自带的 `bash` 编写代码,
  而不使用更重量级的脚本运行环境 (比如 python 或 deno).

  主要为了适配 Fedora CoreOS (rpm-ostree), 这部分制作成 RPM 软件包方便安装.

- (2) **普通部分** (deno/fresh): 以容器镜像的方式运行 (podman).

  以普通用户 (systemd --user linger) 权限运行, 只读访问 `/var/lib/pmlc-smart/`
  目录. 收集特权部分获得的数据, 并长期保存 (数据库 deno-kv). 提供 web 页面
  (TCP 52416) 用来显示硬盘状态信息 (只读, 无需登录).

  TODO 硬盘异常状态监测, 并发出警告 (推送通知消息) ?

TODO

## LICENSE

GNU General Public License v3.0 or later (SPDX Identifier: `GPL-3.0-or-later`)

<https://spdx.org/licenses/GPL-3.0-or-later.html>

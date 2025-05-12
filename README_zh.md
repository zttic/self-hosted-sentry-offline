[中文](./README_zh.md)
[English](./README.md)
# self-hosted-sentry-offline
在离线环境中部署自托管Sentry

## 前置条件
- 一台可以访问互联网的电脑（用于初始设置）
- 一台离线电脑（目标部署环境）

## 安装步骤

### 构建镜像
在有网络连接的机器上，按照[官方教程](https://develop.sentry.dev/self-hosted/#getting-started)构建Docker镜像

### 导出镜像
```bash
./export_sentry_images.sh <docker_compose文件路径> <导出目录>
```

### 导入镜像
```bash
./import-images.sh <镜像目录>
```

### 在离线环境中初始化Sentry
```bash
./init <sentry_self_hosted文件夹路径>
```

### 启动Sentry服务
```bash
docker compose up --wait
```
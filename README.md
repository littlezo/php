# https://github.com/littlezo/php/pkgs/container/php

## ghcr
```sh
docker pull ghcr.io/littlezo/php:swoole-alpine
```

## Aliyun ACR
```sh
docker pull registry.cn-beijing.aliyuncs.com/forlong/php:version-tag
```

### hyper swow 一键启动配置

`依赖配置` 包含 `mysql` `redis` `pgsql` `rabbitmq`

`httpserver` 包含  `caddy` `swoole`

#### 环境启动
 - 修改 env_file
 - 启动依赖环境
  
  ```shell
  docker compose -f docker-compose-deps.yml up -d
  ```

 - 启动服务
  ```shell
  docker compose -f docker-compose.yml up -d
  ```

- 查看调试日志
  ```shell
  docker compose -f docker-compose.yml -f --tail 100
  ```

## 维护者: [@长久同学](https://github.com/littlezo/php)

fork 自 [Docker "Official Image"](https://github.com/docker-library/php) 

## 说明
这是[littlezo/php of forlong/php]的 Git 存储库（不要与上游提供的php任何官方镜像混淆）。请参阅Docker Hub 页面，了解有关如何使用此 Docker 映像的完整自述文件以及有关贡献和问题的信息。`php`

不定期同步[Docker "Official Image"](https://github.com/docker-library/php)

### 移除
  - php-fpm
  - apache
  
### 新增
  - swoole
  - swow
 
### 特性
  - 基于官方镜像构建
  - 镜像体积小
  - 镜像安全
  - 镜像稳定
  - 提供国内镜像源[Aliyun ACR](https://cr.console.aliyun.com/cn-beijing/instances/repositories)
  - 内置 `composer`
  - 镜像更新及时
  - 不定期同步[Docker "Official Image"](https://github.com/docker-library/php)


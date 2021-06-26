# developer 虚机应用开发指导

## 环境准备

### edgegallery 安装v1.2版本 openstack安装 W版本

1. developer 安装注意事项：
v1.2新增文件管理系统，用于上传和下载虚机镜像，当前支持qcow2、img、iso格式
fileSystemAddress：配置文件管理系统的地址
username：配置虚机镜像用户名
password：配置虚机镜像登录密码
2. openstack初始化配置：
参考文档：Developer_OpenStack_Pre-configure.md

## 配置沙箱环境：developer新增openstack沙箱环境

1. develoepr平台用管理员用户admin登录 打开系统-沙箱环境管理-新增沙箱环境

2.lcmIp为lcmcontroller的IP地址 ，mecHost为openstack的IP地址，端口号为lcmcontroller对外暴露的端口号

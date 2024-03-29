# OpenStack（简称OS） 参数预配置
## 预置步骤
- 推荐安装OpenStack Wallaby (5.5.0) 版本;
- 配置网络
- 配置示例类型

### 版本介绍
OpenStack社区正式发布第23个版本 – Wallaby， OpenStack专注于开源基础设施软件的广泛开发与部署，作为全球三大活跃的开源项目之一（包括Linux kernel与Chromium），始终注重激发全球社区活力，提升社区开发者的参与度。

最新版Wallaby增强了安全性能，实现了与其他开源技术的进一步集成，进而强化了开源基础设施在云原生领域的应用。来自45个国家140家组织/机构的800多位贡献者所提交的17,000代码修改已成功合并至Wallaby版本。

### OS接口列表
| 方法 | 服务 | 路径 | 说明 |
| --- | --- | --- | --- |
| POST | orchestration | /v1/{tenant_id}/stacks | 创建stack |
| DELETE| orchestration | /v1/{tenant_id}/stacks/{stack_name}/{stack_id} | 销毁stack |
| GET | orchestration | /v1/{tenant_id}/stacks/{stack_name}/{stack_id}/resources | stack resource列表 |
| GET | compute | /servers/{server_id} | 获取虚拟机信息 |
| POST | compute | /servers/{server_id}/action | 操作虚拟机, 用于停止，创建快照 |
| POST | compute | /servers/{server_id}/remote-consoles | 控制台 |
| GET | image | /v2/images/{image_id}/file | 下载镜像 |
|POST|image|/v2/images/{imageId}/import|导入镜像|
|PUT|Image| /v2/images/{imageId}/file|上传镜像文件|
|POST|image|/v2/images|创建镜像|
|GET|image|/v2/images|展示镜像列表|
|GET|Image|/v2/images/{imageId}|获取镜像信息|


## 配置网络(Network)：

创建三个网络
MEC_APP_Public, MEC_APP_Private, MEC_APP_MP1;
![输入图片说明](../../uploads/images/2021/developer/image.png)

## 实例类型(Flavors):
创建以下几个规格示例类型，配置与实际的规格对应1c（CPU1核）、1024m（内存1024M）、40g（硬盘40G）
1c-1024m-40g、2c-4096m-40g
![](/uploads/images/2021/v1.2/Developer/OSPreconfigred_Flavor.png "实例类型.png")

## 配置路由

openstack 自身就有一条public网络是和主机之间是能通信的
![输入图片说明](../../uploads/images/2021/developer/image-openstack-01.png)
创建的虚拟机MEC_APP_Private网络需要通过这个public网络才能进行外部访问,所以需要新建路由：
![输入图片说明](../../uploads/images/2021/developer/image-openstack-02.png)
配置后虚拟机就能访问安装openstack的主机了。

主机需要访问openstack的虚机也需要添加类似的路由：

route add -net 192.168.220.0 netmask 255.255.255.0 gw 172.24.4.60

![输入图片说明](../../uploads/images/2021/developer/image-openstack-03.png)

部署EdgeGalley的主机需要和OpenStack网络打通

developer平台跟虚机的网络是通过MEC_APP_Private进行打通，需配置developer与openstack的路由：

developer后台通往openstack路由配置，参考如下：

route add -net 192.168.220.0 netmask 255.255.255.0 gw 192.168.1.156  其中，192.168.220.0为MEC_APP_Private 子网ip, 192.168.1.156为openstack ip

通过以上配置developer后台就与openstack之间网络就配置通了。




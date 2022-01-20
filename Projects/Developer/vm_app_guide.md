# developer 虚机应用开发指导

## 环境准备

### edgegallery 安装v1.5版本 文件管理系统的安装 openstack安装 W版本 
                                                                         
1. **openstack初始化配置**
[参考文档](/Projects/Developer/Developer_OpenStack_Pre-configure.md)

## 配置沙箱环境：developer新增openstack沙箱环境

1. develoepr平台用管理员用户admin登录 打开系统-沙箱环境管理-新增沙箱环境
![](/uploads/images/2021/developer/config-sandbox.png "config-sandbox.png")
参数填写规范如下：
名称：沙箱名称，不限
lcmIp: 如果是单机部署edgegallery，即为edgegallery本机ip，如果多机部署为边缘节点ip
端口号：默认31252
mecHost: openstack环境的ip值
mecPort: openstack环境拉起虚机后用于VNC远程登录的端口，当前openstack环境VNC端口是6080
系统：选择OpenStack
资源配置：用于展示OpenStack环境相关的资源信息，格式如下：
{"VCPU数量":"20","内存资源":"50G","存储资源":"1000G","网络":"不支持5G","GPU算力":"NA","AI加速":"1*Atlas300C(16G)","终端":"NA"}
根据实际情况可以新增或修改相关信息
网络配置：用于部署调测配置相关网络信息，详情如下：
APP_Plane01_Network=MEC_APP_MP1;APP_Plane02_Network=MEC_APP_Public;APP_Plane03_Network=MEC_APP_Private;VDU1_APP_Plane01_IP=192.168.221.0/24;VDU1_APP_Plane02_IP=192.168.222.0/24;VDU1_APP_Plane03_IP=192.168.220.0/24
  
其他参数及含义如下
DC_ID=FS_M:Manager_VPC; 使用默认值或者不传即可

az_dc=nova;  默认值为az1.dc1，与openstack的zones值保持一致

APP_Plane02_GW=192.168.222.1， APP_Plane01_GW=192.168.221.1， APP_Plane03_GW=192.168.220.1 gw默认取1

3.上传配置文件为openstack config， 该配置文件为openstack对应的用户名、密码、项目、url等信息参数如下：

export OS_USERNAME=admin    
export OS_PASSWORD=*****    
export OS_PROJECT_NAME=admin    
export OS_AUTH_URL=http://ip/identity     
export OS_IDENTITY_API_VERSION=3     
export OS_PROJECT_DOMAIN_NAME=default      
export OS_USER_DOMAIN_NAME=default     

4.添加路由：developer环境与openstack环境的路由配置

developer与openstack后台添加路由，例如
route add -net 192.168.225.0 netmask 255.255.255.0 gw openstack_ip

## 上传基础镜像
1.新建系统镜像

系统 - 系统镜像管理 - 新建系统镜像
![](/uploads/images/2021/developer/vm-image-new.png "vm-image-new.png")
镜像名唯一 ，磁盘大小必须大于该镜像所需的最小磁盘大小
填写镜像的基本信息后点击确认
2.上传镜像文件

目前支持的镜像格式为qcow2和iso
![](/uploads/images/2021/developer/flavor-list.png "flavor-list.png")

## 虚机应用开发
1. 新建项目：点击工作空间-新建项目，选择应用集成。

![](/uploads/images/2021/developer/vm-app-new.png "vm-app-new.png")

填写项目的基本信息。对于虚机应用，类型选择虚机，架构支持X86和ARM

2.选择沙箱：选择沙箱，新建虚机，填写虚机应用的基本信息、资源配置、基础镜像选择、选择网络配置、以及其他主机组、注入脚本等配置。
![](/uploads/images/2021/developer/vm-new.png "vm-new.png")

点击保存后，点击启动
![](/uploads/images/2021/developer/deploy-vm.png "deploy-vm.png")

3.部署调测可选：部署调测过程会从openstack拉起虚机镜像，用于开发者应用开发和调测。需提前安装和配置好openstack，由于资源有限，有可能部署调测失败
部署调测成功后，我们可以通过VNC远程登录和SSH，登录到申请的虚拟机中，也可以通过上传文件将APP应用包上传至虚拟机中，安装调测应用

4.制作镜像： 查看应用的基本信息，并打包预览
![](/uploads/images/2021/developer/new-vm-image.png "new-vm-image.png")

5.测试认证： 点击开始测试，选择测试场景-点击开始，该步骤会对developer生成的应用包进行相关的遵从性、生命周期、安全等测试，测试通过后可发布到appstore

![](/uploads/images/2021/developer/atp-test.png "atp-test.png")

最后将应用发布到appstore中



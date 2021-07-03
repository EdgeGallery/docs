# developer 虚机应用开发指导

## 环境准备

### edgegallery 安装v1.2版本 文件管理系统的安装 openstack安装 W版本 
1. **文件管理系统的安装**
文件管理系统目前没有集成到一键安装脚本里，需要手动安装
在gitee上下载file-system对应版本的helmchart：https://gitee.com/edgegallery/helm-charts/tree/master/file-system
在环境中执行以下命令：helm install file-system ./file-system -- set postgres.password=te9Fmv%qaq
2. **developer 安装注意事项** v1.2新增文件管理系统，用于上传和下载虚机镜像，当前支持qcow2、img、iso格式,安装相关的参数配置如下：   
**fileSystemAddress** 配置文件管理系统的地址                                                       
**username** 配置虚机镜像用户名                                                                   
**password** 配置虚机镜像登录密码 

默认文件管理系统的地址为空，需要修改为http://ip:30090 ,虚机镜像用户名为ubuntu ，虚机密码为123456，根据虚机镜像配置，通过kubectl edit 修改参数
例如：
修改文件管理系统
kubectl edit deployment developer-be 
![输入图片说明](https://images.gitee.com/uploads/images/2021/0703/100831_be9fd9ab_7625288.png "屏幕截图.png")
修改虚机用户名密码：
kubectl edit secret developer-be-secret 
![输入图片说明](https://images.gitee.com/uploads/images/2021/0703/101036_0bbb64db_7625288.png "屏幕截图.png")
secret 里面显示的base64编码，所以先讲修改的参数进行base64编写在修改对应的值
                                                                              
3. **openstack初始化配置**
[参考文档](../../Projects/Developer/Developer_OpenStack_Pre-configure.md)

## 配置沙箱环境：developer新增openstack沙箱环境

1. develoepr平台用管理员用户admin登录 打开系统-沙箱环境管理-新增沙箱环境
![输入图片说明](https://images.gitee.com/uploads/images/2021/0628/163538_c2d7c8b4_7625288.png "屏幕截图.png")

2. lcmIp为lcmcontroller的IP地址 ，mecHost为openstack的IP地址，端口号为lcmcontroller对外暴露的端口号, 协议选择https.   

其他参数配置openstack相关的网络配置：参数设置如下：
![输入图片说明](https://images.gitee.com/uploads/images/2021/0628/163330_baff108f_7625288.png "屏幕截图.png")

DC_ID=FS_M:Manager_VPC; 使用默认值或者不传即可

az_dc=nova;  默认值为az1.dc1，与openstack的zones值保持一致

mep_certificate=YHXGFTWU!@$%@&%#(DH(122479+_); 使用默认值或者不传即可

app_mp1_ip=192.168.226.201;app_mp1_mask=255.255.255.0;app_mp1_gw=192.168.226.1;  app_n6网络配置：ip取openstack对应n6网络范围内的值，mask默认255.255.255.0， gw最后以为取1

app_n6_ip=192.168.225.202;app_n6_mask=255.255.255.0;app_n6_gw=192.168.225.1; 同app_n6

app_internet_ip=192.168.227.203;app_internet_mask=255.255.255.0;app_internet_gw=192.168.227.1;  同 app_n6

mep_ip=;mep_port=8443; 配置mep的ip和端口，不涉及mep可不用配置该参数

network_name_mep=mec_network_mep;network_mep_physnet=physnet2;network_mep_vlanid=2653; 网络名与openstack网络名称保持一致

network_name_n6=mec_network_n6;network_n6_physnet=physnet2;network_n6_vlanid=2652; 网络名与openstack网络名称保持一致

network_name_internet=mec_network_internet;network_internet_physnet=physnet2;network_internet_vlanid=2651; 网络名与openstack网络名称保持一致

ue_ip_segment=0.0.0.0/0; ue使用默认值即可

mec_internet_ip=0.0.0.0  默认值或者不传即可

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
系统 - 镜像管理 - 新建系统镜像

填写镜像的基本信息后点击上传

上传镜像为zip压缩包，目前支持的镜像格式为qcow2和iso，上传镜像包目录格式为：filename.zip/filename/filename.qcow2

## 虚机应用开发
todo 开发指导


## mepagent的集成
mepagent支持虚机方式部署，参考文档如下：

https://gitee.com/edgegallery/docs/blob/master/Projects/MEP/mep-agent%E4%BD%BF%E7%94%A8%E8%99%9A%E6%8B%9F%E6%9C%BA%E6%96%B9%E5%BC%8F%E9%83%A8%E7%BD%B2.md


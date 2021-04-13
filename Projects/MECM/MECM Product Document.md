MECM Product Document
=====================


## MECM管理面
### MECM管理面主要提供边缘节点、APPLCM注册以及应用的分发部署功能。  
#### V1.1版本新增特性如下：
1.新增游客、租户及管理员角色，管理员可以进行注册和删除操作，租户可以进行应用同步，分发，部署操作，游客只有浏览权限  
2.新增应用商店注册功能，支持管理员新增注册应用商店  
3.新增应用同步功能，支持应用从应用商店到APM同步  

### 用户指南 
！！！注意事项：目前由于客户端和服务端协议问题，用户访问可能存在证书异常，如存在数据获取异常问题，建议先在浏览器访问[https://mecm.edgegallery.org:30202](https://mecm.edgegallery.org:30202)，然后同意继续访问，然后回到MECM界面刷新即可，此问题会在下个版本解决。
![](/uploads/images/2021/mecm/1.png) 
![](/uploads/images/2021/mecm/2.png) 

#### 1. 概述：地图区域&详情展示（节点以及KPI、MEP能力以及硬件能力），MEP详情
##### 1.1 地图&详情：点击地图上的节点，可显示节点以及KPI、MEP能力以及硬件能力详情
![](/uploads/images/2021/mecm/3.png)
![](/uploads/images/2021/mecm/5.png)  
##### 1.2 MEP详情：点击管理按钮，跳转至MEP详情界面 
![](/uploads/images/2021/mecm/7.png) 
#### 2. 应用管理：应用包管理，应用实例管理
##### 2.1 应用包管理 
集成应用同步，下发以及部署功能。  
![](/uploads/images/2021/mecm/8.png)
![](/uploads/images/2021/mecm/9.png)
![](/uploads/images/2021/mecm/10.png)
![](/uploads/images/2021/mecm/11.png)
##### 2.2 应用实例管理
集成应用实例列表，此处可以查看当前实例的部署状态以及详情，并且进行规则配置，以及失败原因查看等功能
![](/uploads/images/2021/mecm/12.png)
![](/uploads/images/2021/mecm/13.png)
规则配置->DNS规则配置 
![](/uploads/images/2021/mecm/14.png)
![](/uploads/images/2021/mecm/15.png)
 规则配置->分流规则配置
![](/uploads/images/2021/mecm/16.png)
![](/uploads/images/2021/mecm/17.png)
规则配置->分流规则配置->过滤规则配置 
![](/uploads/images/2021/mecm/18.png)
规则配置-分流规则配置-接口信息配置 
![](/uploads/images/2021/mecm/19.png)
#### 3. 边缘节点：边缘节点列表，边缘节点注册，上传k8s config文件
![](/uploads/images/2021/mecm/20.png) 
![](/uploads/images/2021/mecm/21.png) 
![](/uploads/images/2021/mecm/22.png) 
#### 4.系统管理：APPLCM注册、APP Rule MGR注册、应用仓库注册
##### 4.1 APPLCM注册
![](/uploads/images/2021/mecm/23.png) 
##### 4.2 APP Rule MGR注册
![](/uploads/images/2021/mecm/24.png) 
##### 4.4 应用仓库注册
![](/uploads/images/2021/mecm/25.png) 
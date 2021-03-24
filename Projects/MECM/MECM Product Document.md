MECM Product Document
=====================


## MECM管理面
### MECM管理面主要提供边缘节点、APPLCM注册以及应用的分发部署功能。  
#### V1.1版本新增特性如下：
1.新增游客、租户及管理员角色，管理员可以进行注册和删除操作，租户可以进行应用同步，分发，部署操作，游客只有浏览权限 
2.新增应用商店注册功能，支持管理员新增注册应用商店 
3.新增应用同步功能，支持应用从应用商店到APM同步 
#### ！！！注意事项：目前由于客户端和服务端协议问题，用户访问可能存在证书异常，如存在数据获取异常问题，建议先在浏览器访问[https://mecm.edgegallery.org:30202](https://mecm.edgegallery.org:30202)，然后同意继续访问，然后回到MECM界面刷新即可，此问题会在下个版本解决。
![输入图片说明](https://images.gitee.com/uploads/images/2021/0324/165149_82744ed3_7625361.png) 
![输入图片说明](https://images.gitee.com/uploads/images/2021/0324/165225_95ca2c91_7625361.png) 

#### 1. 概述  
##### 1.1概述界面主要分为三个功能区，右边点击地图区域可以进行不同地域Node节点的切换展示地域节点信息，同时支持江苏和广东省份下钻  
![首页-overview](https://images.gitee.com/uploads/images/2020/1226/142007_7994b117_7625361.png)  
![首页-地图下钻到市](https://images.gitee.com/uploads/images/2020/1226/142044_7574ce1b_7625361.png) 
![街道地图](https://images.gitee.com/uploads/images/2020/1226/142208_2c659e39_7625361.png)<br>
##### 1.2显示具体街道信息左边根据当前选择的节点，进行KPI、MEP能力以及应用能力详情展示  
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/142301_beff3647_7625361.png) 
##### 1.3点击管理按钮，显示应用具体信息 
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/142320_1bfa5e5f_7625361.png) 
#### 2. 应用管理  
##### 应用管理界面主要分为两部分：应用包管理，应用实例管理。  
###### 应用包管理：显示的是从应用商城同步过来的应用，在这个界面可以进行应用下发，部署能力。 
###### 应用实例管理：展示的已经部署或者正在部署的应用实例列表，此处可以查看当前实例的部署状态以及详情，并且进行规则配置，以及失败原因查看。  
##### 2.1 应用包管理 
###### 集成下发、部署和详情查看功能。  
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/143045_71c05602_7625361.png)
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/143113_f6cfee45_7625361.png)
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145009_6bd32c65_7625361.png)
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145025_3c520ce1_7625361.png)
##### 2.2 应用实例管理 
###### 集成详情、删除、规则配置和操作信息功能。
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145049_1872bbf7_7625361.png)
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145149_cde11690_7625361.png)
###### 规则配置->DNS规则配置 
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145226_9c4453fc_7625361.png)
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145258_0349b939_7625361.png)
###### 规则配置->分流规则配置
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145313_1fa40729_7625361.png)
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145329_53255c08_7625361.png)
###### 规则配置->分流规则配置->过滤规则配置 
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145344_cd8d1dea_7625361.png)
###### 规则配置-分流规则配置-接口信息配置 
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145438_a753b694_7625361.png)
#### 3. 边缘节点  
##### 3.1展示边缘节点列表以及节点监控信息 
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/145533_a4ba8487_7625361.png)
##### 3.2边缘节点注册
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/150556_e75c2d7c_7625361.png) 
##### 3.3上传k8s config文件
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/150617_51890e07_7625361.png)
#### 4.系统管理
##### 包含：APPLCM注册、APP Rule MGR注册、边缘节点注册和应用仓库注册
##### 4.1 APPLCM注册
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/150449_a2f3edb9_7625361.png) 
##### 4.2 APP Rule MGR注册
![输入图片说明](https://images.gitee.com/uploads/images/2020/1226/150512_8d96e99b_7625361.png) 
##### 4.4 应用仓库注册
![输入图片说明](https://images.gitee.com/uploads/images/2021/0324/162715_deb5a6ad_7625361.png) 
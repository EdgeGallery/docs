Getting Started
===============

EdgeGallery界面一览
---------------------
###### 开发者平台
![](/uploads/images/2021/v1.2/developer.png "developer.png")<br>

###### 应用商城
![](/uploads/images/2021/v1.2/appstore.png "appstore.png")<br>

###### MEC管理平台
![](/uploads/images/2021/v1.2/mecm.png "mecm.png")<br>

###### 应用测试认证平台
![](/uploads/images/2021/v1.2/atp.png "atp.png")<br>

###### 边缘节点管理平台
![](/uploads/images/2021/v1.2/mepm.png "mepm.png")<br>

APP开发流程
------------
![](/uploads/images/2021/v1.1/FlowChart.png "FlowChart.png")<br>

Demo介绍
----------
基于EdgeGallery的定位服务开发，展示如何基于EdgeGallery开发者平台进行边缘应用开发<br>
* 定位服务应用作为服务消费者依赖EdgeGallery平台的“人脸识别服务”<br>
* 定位服务应用作为服务供应者发布“定位服务”，对外提供生态API，其他服务可以消费“定位服务”<br>

开发者平台容器部署流程介绍
------------------------
![](/uploads/images/2021/v1.2/dev_development.png "dev_development.png")

###### 开发准备
* 新建一个项目

![](/uploads/images/2021/v1.2/createproject.png "createproject.png")

* 选择依赖的平台能力，勾选“服务发现”

![](/uploads/images/2021/v1.2/capability.png "capability.png")

###### 部署调测

 **第一步** 上传App镜像

![](/uploads/images/2021/v1.2/uploadimage.png "uploadimage.png")

 **第二步** 上传yaml文档

![](/uploads/images/2021/v1.2/uploadyaml.png "uploadyaml.png")

 **第三步** 部署调测

![](/uploads/images/2021/v1.2/startdeploy.png "startdeploy.png")


######  应用发布 

**第一步** ATP测试

![](/uploads/images/2021/v1.2/starttest.png "starttest.png")

**第二步** 应用发布

![](/uploads/images/2021/v1.2/publish.png "publish.png")


开发者平台虚机部署流程介绍
----------------------

![](/uploads/images/2021/v1.2/dev_integrate.png "dev_integrate.png")

###### 开发准备
 新建一个项目

![](/uploads/images/2021/v1.2/createVMproject.png "createVMproject.png")

###### 资源配置

 **第一步** 基本信息配置

![](/uploads/images/2021/v1.2/basicinformation.png "basicinformation.png")

 **第二步** 规格设置

![](/uploads/images/2021/v1.2/specificationsetting.png "specificationsetting.png")

 **第三步** 网络设置

![](/uploads/images/2021/v1.2/networksetting.png "networksetting.png")

 **第四步** 其他设置

![](/uploads/images/2021/v1.2/othersetting.png "othersetting.png")

###### 部署调测

 **第一步** 开始部署

![](/uploads/images/2021/v1.2/VMdeploy.png "VMdeploy.png")

部署成功后，可上传应用代码文件，使用VNC功能进行运维操作

 **第二步** 生成镜像

![](/uploads/images/2021/v1.2/createimage.png "createimage.png")

生成镜像成功后，可下载镜像文件

###### 应用发布 

**第一步** ATP测试

![](/uploads/images/2021/v1.2/starttest.png "starttest.png")

**第二步** 应用发布

![](/uploads/images/2021/v1.2/publish.png "publish.png")


###### 本地开发
* 下载依赖的插件-BashSupport，并导入到本地IDE

![](/uploads/images/2020/v1.0/Plug-in.png "Plug-in.png")    

* 执行插件，会自动生成示例代码    

![](/uploads/images/2021/cor2020/execute_plugin.png "执行插件生成示例代码.png")    

* 编写APP代码    

* 构建docker image  

# EdgeGallery界面一览
-------------------
开发者平台：<br>
![](/uploads/images/2020/v1.0/Developer.png "Developer.png")<br>

应用商城：<br>
![](/uploads/images/2020/v1.0/AppStore.png "AppStore.png")<br>

MEC管理平台：<br>
![](/uploads/images/2020/v1.0/Mecm.png "Mecm.png")<br>

# APP开发流程
-------------------
![](/uploads/images/2020/v1.0/FlowChart.png "FlowChart.png")<br>

# Demo介绍
-------------------
基于EdgeGallery的定位服务开发，展示如何基于EdgeGallery开发者平台进行边缘应用开发<br>
* 定位服务应用作为服务消费者依赖EdgeGallery平台的“人脸识别服务”<br>
* 定位服务应用作为服务供应者发布“定位服务”，对外提供生态API，其他服务可以消费“定位服务”<br>

## 登录EdgeGallery开发者平台
https://developer.edgegallery.org/<br><br>
## 开发准备
* 新建一个项目<br>
![](/uploads/images/2020/v1.0/CreateProject.png "CreateProject.png")
* 选择依赖的平台能力，勾选“Service Discovery”<br>
![](/uploads/images/2020/v1.0/AbilitySelection.png "AbilitySelection.png")

## 本地开发
* 下载依赖的插件-BashSupport，并导入到本地IDE<br>
![](/uploads/images/2020/v1.0/Plug-in.png "Plug-in.png")
* 执行插件，会自动生成示例代码<br>
![](/uploads/images/2020/0927/execute_plugin.png "执行插件生成示例代码.png")
* 编写APP代码<br>
* 构建docker image<br><br>
## 部署调测
* 部署调测页面可进行应用的部署测试

 第一步：上传App镜像，此页面提供了集中上传App镜像的方式，目前未实现。目前版本实现的是通过上传Yaml方式来部署镜像，或通过用户使用公网连接边缘节点进行部署
![](/uploads/images/2020/v1.0/DeploymentTest-UploadImage.png "DeploymentTest-UploadImage.png")

 第二步：配置部署文件，此页面提供Yaml文件上传入口，以及可视化配置（此版本未实现）。并对上传的Yaml文件进行可用性校验，校验通过后可选择下一步进行部署测试
![](/uploads/images/2020/v1.0/DeploymentTest-ConfigurationFile.png "DeploymentTest-ConfigurationFile.png")

 第三步：部署调测
![](/uploads/images/2020/v1.0/DeploymentTest.png "DeploymentTest.png")


##  应用发布
* 应用发布页面可进行应用配置、应用认证测试，测试通过后可将应用发布至应用仓库。

![](/uploads/images/2020/v1.0/ApplicationRelease-1.png "ApplicationRelease-1.png")

![](/uploads/images/2020/v1.0/ApplicationRelease-2.png "ApplicationRelease-2.png")

![](/uploads/images/2020/v1.0/ApplicationRelease-3.png "ApplicationRelease-3.png")


详细信息可参考：
[视频](https://gitee.com/edgegallery/community/blob/master/TSC/Release/v0.9/EdgeGallery%20Demo%20Recording.mp4)



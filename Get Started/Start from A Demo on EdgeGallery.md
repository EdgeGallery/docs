# EdgeGallery界面一览
-------------------
###### 开发者平台
![](/uploads/images/2021/v1.1/Developer.png "Developer.png")<br>

###### 应用商城
![](/uploads/images/2021/v1.1/AppStore.png "AppStore.png")<br>

###### MEC管理平台
![](/uploads/images/2020/v1.0/Mecm.png "Mecm.png")<br>

# APP开发流程
-------------------
![](/uploads/images/2021/v1.1/FlowChart.png "FlowChart.png")<br>

# Demo介绍
-------------------
基于EdgeGallery的定位服务开发，展示如何基于EdgeGallery开发者平台进行边缘应用开发<br>
* 定位服务应用作为服务消费者依赖EdgeGallery平台的“人脸识别服务”<br>
* 定位服务应用作为服务供应者发布“定位服务”，对外提供生态API，其他服务可以消费“定位服务”<br>

## 开发准备
* **新建一个项目**
![](/uploads/images/2021/v1.1/CreateProject.png "CreateProject.png")
* **选择依赖的平台能力，勾选“服务发现”**
![](/uploads/images/2021/v1.1/AbilitySelection.png "AbilitySelection.png")

## 本地开发
* **下载依赖的插件-BashSupport，并导入到本地IDE**
![](/uploads/images/2020/v1.0/Plug-in.png "Plug-in.png")
* **执行插件，会自动生成示例代码**
![](/uploads/images/2021/cor2020/execute_plugin.png "执行插件生成示例代码.png")
* 编写APP代码<br>
* 构建docker image<br><br>
## 部署调测
* 部署调测页面可进行应用的部署测试

 第一步：上传App镜像。
![](/uploads/images/2021/developer/deploy-one.PNG "deploy-one.PNG")

 第二步：配置部署文件。
![](/uploads/images/2021/developer/deploy-two-config.PNG "deploy-two-config.PNG")

 第三步：部署调测。
![](/uploads/images/2020/v1.0/DeploymentTest.png "DeploymentTest.png")


##  应用发布
* 应用发布页面可进行应用配置、应用认证测试，测试通过后可将应用发布至应用仓库。

Step 1: Application Configuration
![](/uploads/images/2020/v1.0/ApplicationRelease-1.png "ApplicationRelease-1.png")

Step 2: Certification testing
![](/uploads/images/2020/v1.0/ApplicationRelease-2.png "ApplicationRelease-2.png")

Step 3: Publishing application 
![](/uploads/images/2020/v1.0/ApplicationRelease-3.png "ApplicationRelease-3.png")





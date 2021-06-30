# EdgeGallery界面一览
-------------------
###### 开发者平台-Developer Platform
![](/uploads/images/2021/v1.2/developer.png "developer.png")<br>
![](/uploads/images/2021/v1.2/developer-en.png "developer-en.png")<br>

###### 应用商城-AppStore Platform
![](/uploads/images/2021/v1.2/appstore.png "appstore.png")<br>
![](/uploads/images/2021/v1.2/appstore-en.png "appstore-en.png")<br>

###### MEC管理平台-Mecm Platform
![](/uploads/images/2021/v1.2/mecm.png "mecm.png")<br>
![](/uploads/images/2021/v1.2/mecm-en.png "mecm-en.png")<br>

###### 应用测试认证平台-Application Testing Platform
![](/uploads/images/2021/v1.2/atp.png "atp.png")<br>
![](/uploads/images/2021/v1.2/atp-en.png "atp-en.png")<br>

###### 边缘节点管理平台-Edge Node Management Platform
![](/uploads/images/2021/v1.2/mepm.png "mepm.png")<br>
![](/uploads/images/2021/v1.2/mepm-en.png "mepm-en.png")<br>

# APP开发流程-APP Development Process
-------------------
![](/uploads/images/2021/v1.1/FlowChart.png "FlowChart.png")<br>

# Demo介绍-Demo Introduction
-------------------
基于EdgeGallery的定位服务开发，展示如何基于EdgeGallery开发者平台进行边缘应用开发<br>
* 定位服务应用作为服务消费者依赖EdgeGallery平台的“人脸识别服务”<br>
* 定位服务应用作为服务供应者发布“定位服务”，对外提供生态API，其他服务可以消费“定位服务”<br>

Development of location services based on EdgeGallery, showing how to develop edge applications based on EdgeGallery developer platform<br>
* Location service applications as service consumers rely on the "face recognition service" of the EdgeGallery platform<br>
* Location service application as a service provider releases "location service", provides ecological API externally, and other services can consume "location service"<br>

# 开发者平台容器部署流程介绍-Introduction to the developer platform container deployment process
![](/uploads/images/2021/v1.2/dev_development.png "dev_development.png")
![](/uploads/images/2021/v1.2/dev_development-en.png "dev_development-en.png")

## 开发准备-Development Preparation
* 新建一个项目-Create a new project 
![](/uploads/images/2021/v1.2/createproject.png "createproject.png")
![](/uploads/images/2021/v1.2/createproject-en.png "createproject-en.png")

* 选择依赖的平台能力，勾选“服务发现”-Select the platform capabilities to rely on, and check "Service Discovery"
![](/uploads/images/2021/v1.2/capability.png "capability.png")
![](/uploads/images/2021/v1.2/capability-en.png "capability-en.png")

## 部署调测-Deployment and commissioning

 第一步：上传App镜像-Step 1: Upload App image
![](/uploads/images/2021/v1.2/uploadimage.png "uploadimage.png")
![](/uploads/images/2021/v1.2/uploadimage-en.png "uploadimage-en.png")    

 第二步：上传yaml文档-Step 2: Upload the yaml file  
![](/uploads/images/2021/v1.2/uploadyaml.png "uploadyaml.png")
![](/uploads/images/2021/v1.2/uploadyaml-en.png "uploadyaml-en.png")        

 第三步：部署调测-Step 3: Deployment test   
![](/uploads/images/2021/v1.2/startdeploy.png "startdeploy.png")
![](/uploads/images/2021/v1.2/startdeploy-en.png "startdeploy-en.png")           


##  应用发布-Application release  

第一步：ATP测试-Step 1: Application Testing     
![](/uploads/images/2021/v1.2/starttest.png "starttest.png")
![](/uploads/images/2021/v1.2/starttest-en.png "starttest-en.png")   

第二步：应用发布-Step 2: Publishing application    
![](/uploads/images/2021/v1.2/publish.png "publish.png")
![](/uploads/images/2021/v1.2/publish-en.png "publish-en.png")  


# 开发者平台虚机部署流程介绍-Introduction to the developer platform VM deployment process
![](/uploads/images/2021/v1.2/dev_integrate.png "dev_integrate.png")
![](/uploads/images/2021/v1.2/dev_integrate-en.png "dev_integrate-en.png")

## 开发准备-Development Preparation
* 新建一个项目-Create a new project 
![](/uploads/images/2021/v1.2/createVMproject.png "createVMproject.png")
![](/uploads/images/2021/v1.2/createVMproject-en.png "createVMproject-en.png")

## 资源配置-Resource allocation

 第一步：基本信息配置-Step 1: Basic information configuration
![](/uploads/images/2021/v1.2/basicinformation.png "basicinformation.png")
![](/uploads/images/2021/v1.2/basicinformation-en.png "basicinformation-en.png")    

 第二步：规格设置-Step 2: Specification setting
![](/uploads/images/2021/v1.2/specificationsetting.png "specificationsetting.png")
![](/uploads/images/2021/v1.2/specificationsetting-en.png "specificationsetting-en.png")        

 第三步：网络设置-Step 3: Network settings
![](/uploads/images/2021/v1.2/networksetting.png "networksetting.png")
![](/uploads/images/2021/v1.2/networksetting-en.png "networksetting-en.png")           

 第四步：其他设置-Step 3: Other settings
![](/uploads/images/2021/v1.2/othersetting.png "othersetting.png")
![](/uploads/images/2021/v1.2/othersetting-en.png "othersetting-en.png")

##  部署调测-Deployment Test

 第一步：开始部署-Step 1: Start deployment
![](/uploads/images/2021/v1.2/VMdeploy.png "VMdeploy.png")
![](/uploads/images/2021/v1.2/VMdeploy-en.png "VMdeploy-en.png")

部署成功后，可上传应用代码文件，使用VNC功能进行运维操作
After the deployment is successful, you can upload the application code file and use the VNC function for operation and maintenance operations

 第二步：生成镜像-Step 2: Create image
![](/uploads/images/2021/v1.2/createimage.png "createimage.png")
![](/uploads/images/2021/v1.2/createimage-en.png "createimage-en.png")

生成镜像成功后，可下载镜像文件
After the image is successfully generated, the image file can be downloaded

##  应用发布-Application release  

第一步：ATP测试-Step 1: Application Testing     
![](/uploads/images/2021/v1.2/starttest.png "starttest.png")
![](/uploads/images/2021/v1.2/starttest-en.png "starttest-en.png")   

第二步：应用发布-Step 2: Publishing application    
![](/uploads/images/2021/v1.2/publish.png "publish.png")
![](/uploads/images/2021/v1.2/publish-en.png "publish-en.png") 


## 本地开发-Local development
* 下载依赖的插件-BashSupport，并导入到本地IDE
  Download the dependent plug-in-BashSupport, and import it to the local IDE  
![](/uploads/images/2021/v1.2/plugin.png "plugin.png")    
![](/uploads/images/2021/v1.2/plugin-en.png "plugin-en.png")  

* 执行插件，会自动生成示例代码    
  Executing the plug-in will automatically generate sample code
![](/uploads/images/2021/cor2020/execute_plugin.png "执行插件生成示例代码.png")    

* 编写APP代码    
  Write APP code

* 构建docker image  
  Build docker image    




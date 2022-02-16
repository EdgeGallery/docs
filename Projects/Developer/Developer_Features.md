Developer 特性清单
----
|**特性名称**|**特性描述**|**设计约束**|
|---|---|---|
|工具箱|提供给开发者使用的App开发工具，开发者可以下载使用，也可以将自研的工具分享给社区开发者使用。||
|能力中心|展示所有开发者平台提供的能力，包括平台自身提供，开发者共享到此平台的能力，供开发者开发部署项目使用。||
|应用孵化|应用孵化是给开发者提供的项目管理平台，开发者可以通过创建项目，完成App的开发-测试-发布的整个流程。支持容器和虚机应用的部署调测||
|系统管理|系统菜单是给管理员提供的管理菜单。主要负责测试沙箱和能力中心（服务）的管理||



#### 文档
文档菜单包含平台的简介，开发工具，以及介绍如何将能力发布到开发者平台。   

![](/uploads/images/2021/developer/docu.PNG "docu.PNG")

### 能力中心
能力中心展示的是开发者平台所有的能力（开发者共享的能力和平台自身提供的能力）。包含详细的API描述文档，供开发者在线查看，模拟，体验。

![](/uploads/images/2021/developer/capability-center-index.png "capability-center-index.png")


### 应用孵化

开发者在这里通过创建项目的方式，管理自己的APP开发过程，有两种开发模式：

1.  **新建应用** 在开发集成平台进行部署测试，最终发布到应用仓库上
    
2.  **选择场景** 支持profile应用场景，集成profile相关基础能力。

开发集成平台提供的端到端开发流程如下：

![](/uploads/images/2021/developer/app-incubation.png "app-incubation.png")

#### 创建项目
创建项目时，需要输入项目基本信息。当前版本支持容器应用和虚机应用。
![](/uploads/images/2021/developer/create-app.png "create-app.png")


#### 能力中心-可选
创建项目时选择的能力，这里会展示对应能力的详细API，帮助开发者理解如何调用能力服务，并在后台提供API模拟器，可以测试API的请求和返回值。
![](/uploads/images/2021/developer/capability-center-optional.png "capability-center-optional.png")


#### 选择沙箱
选择相应的沙箱环境进行部署调测
![](/uploads/images/2021/developer/select-sandbox.png "select-sandbox.png")

#### 部署调测
容器应用部署调测分为三个部署：
- 上传APP镜像
    
    集成开发-系统管理-系统镜像管理-容器镜像
    - 将镜像文件上传至容器镜像管理中。

![](/uploads/images/2021/developer/upload-container-image.png "upload-container-image.png")

- 配置部署文件

    提供两种配置部署文件方式，支持在线编辑修改：
    - 支持k8s deployment yaml文件上传，平台提供基本的校验功能；有关配置文件的格式，可以参考界面提供的demo样例，该样例可以直接上传使用。   
    
    - 支持helmchart文件上传。   

    ![](/uploads/images/2021/developer/upload-k8s-yaml.png "upload-k8s-yaml.png")
    

- 部署调测

    - **Step1** 启动部署，开始 生成部署文件 -> 获取测试节点 -> 实例化应用 -> 获取部署状态
    - **Step2** 部署成功后，会展示已经部署完成POD信息
    - **Step3** 应用开发者暴露的端口号对应用进行测试
    - **Step4** 可以通过远程登录，查看应用的部署详细信息以及日志
    - **Step5** 测试完成后，通过【删除】按钮释放测试环境，如需修改，请在完成镜像修改后，循环以上Step1->Step2->Step3->Step4操作，对应用进行反复测试

![](/uploads/images/2021/developer/container-deploy-test.png "container-deploy-test.png")

虚机应用部署调测分为以下三个步骤：
- 选择虚机沙箱  

![](/uploads/images/2021/developer/select-vm-sandbox.png "select-vm-sandbox.png") 

配置虚机的规格、镜像、网络等信息
- 输入虚机名称    

![](/uploads/images/2021/developer/input-vm-name.png "input-vm-name.png")

- 配置虚机镜像源    

![](/uploads/images/2021/developer/select-vm-image.png "select-vm-image.png")

- 配置虚机资源规格

![](/uploads/images/2021/developer/select-vm-flavor.png "select-vm-flavor.png")

- 设置虚机网络类型，默认全选 

![](/uploads/images/2021/developer/config-vm-network.png "config-vm-network.png")

- 启动虚机    

![](/uploads/images/2021/developer/start-vm.png "start-vm.png")

申请到的虚机可以远程登录和SSH到虚机进行应用开发调测：   

![](/uploads/images/2021/developer/vm-ssh.png "vm-ssh.png")

- 导出镜像

    - 将镜像下载到镜像管理中   

![](/uploads/images/2021/developer/export-vm-image.png "export-vm-image.png")

#### 制作镜像
根据项目的基本信息，将应用进行打包：
![](/uploads/images/2021/developer/make-vm-image.png "make-vm-image.png")   

#### 测试认证

对接认证测试平台，所有完成开发的应用都需要通过认证测试平台的认证后才能发布到AppStore平台，生成的认证测试报告会附带发送给你AppStore平台。
	
- 选择测试场景    
![](/uploads/images/2021/developer/select-test-scence.png "select-test-scence.png")
    
- 执行测试用例    
![](/uploads/images/2021/developer/execute-test-case.png "execute-test-case.png")
	

- 应用发布

认证通过的应用，通过这里可以直接发布到EdgeGallery的AppStore平台，同时如果在【应用配置】时填写了应用服务发布配置，该应用同样会做为能力服务，被收录到能力中心里，可以被其他应用开发者使用。    

![](/uploads/images/2021/developer/release-app.png "release-app.png")


### 系统
系统菜单主要对管理员权限的用户开放，提供沙箱节点、镜像管理以及平台能力的管理。

#### 沙箱管理
- 沙箱节点列表       

![](/uploads/images/2021/developer/sandbox-list.png "sandbox-list.png")    

- 新增沙箱节点    

![](/uploads/images/2021/developer/sandbox-new.png "saxbox-new.png")

#### 能力中心管理
- 能力中心列表    

![](/uploads/images/2021/developer/capability-list.png "capability-list.png")

- 新增能力    

![](/uploads/images/2021/developer/capability-new.png "capability-new.png")

Developer 特性清单
----

|**特性名称**|**特性描述**|**设计约束**|
|---|---|---|
|开发工具管理|提供给开发者使用的App开发工具，开发者可以下载使用，也可以将自研的工具分享给社区开发者使用。||
|能力中心|展示所有开发者平台提供的能力，包括平台自身提供，开发者共享到此平台的能力，供开发者开发部署项目使用。||
|工作空间|工作空间是给开发者提供的项目管理平台，开发者可以通过创建项目，完成App的开发-测试-发布的整个流程。支持容器和虚机应用的部署调测||
|系统|系统菜单是给管理员提供的管理菜单。主要负责测试沙箱和能力中心（服务）的管理||


### 开发工具管理
目前开发工具管理提供生成API调用的样例代码和生成csar包格式的插件，该插件目前支持java和python。

#### 插件列表

![](/uploads/images/2021/developer/plugin-list.PNG "plugin-list.PNG")


#### 插件上传

![](/uploads/images/2021/developer/pluginupload.PNG "pluginupload.PNG")


#### 工具链
工具链是开发者平台提供给开发者分析源代码，定位出需要修改的地方，以便于在不同平台部署。
![](/uploads/images/2021/developer/toolchain.PNG "toolchain.PNG")


#### 文档
文档菜单包含平台的简介，开发工具，以及介绍如何将能力发布到开发者平台，以及常见问题集锦。
![](/uploads/images/2021/developer/docu.PNG "docu.PNG")

### 能力中心
能力中心展示的是开发者平台所有的能力（开发者共享的能力和平台自身提供的能力）。包含详细的API描述文档，供开发者在线查看，模拟，体验。

![](/uploads/images/2021/developer/abilitycenter.PNG "abilitycenter.PNG")


### 工作空间

开发者在这里通过创建project的方式，管理自己的APP开发过程，有两种开发模式：

1.  应用开发：从编码开始，开发一个全新的应用
    
2.  应用集成：已有应用，需要将应用打包成镜像，在开发集成平台进行部署测试，最终发布到应用仓库上。

开发集成平台提供的端到端开发流程如下：

![](/uploads/images/2020/v1.0/ApplicationDevelopmentProcess.PNG "ApplicationDevelopmentProcess.PNG")

#### 创建项目
创建项目时，需要输入项目基本信息和选择需要依赖的生态能力，当前版本支持容器应用和虚机应用。


#### 能力详情
创建项目时选择的能力，这里会展示对应能力的详细API，帮助开发者理解如何调用能力服务，并在后台提供API模拟器，可以测试API的请求和返回值。

针对每个能力服务，还提供SDK下载功能，开发者可以将SDK直接集成到代码中。

![](/uploads/images/2020/v1.0/CapabilityDetails.png "CapabilityDetails.png")


#### 应用开发
针对选择依赖的能力API，提供调用的样例代码，帮助开发者将依赖API快速集成到自己的代码中。
![](/uploads/images/2020/v1.0/ApplicationDevelopment.png "ApplicationDevelopment.png")

#### 部署调测
容器应用部署调测分为三个部署：
- 上传APP镜像
    
    支持三种镜像上传方式
    - 用户上传镜像打包文件。
    - 上传到EdgeGallery的镜像仓库。

![](/uploads/images/2021/developer/deploy-one.PNG "deploy-one.PNG")

- 配置部署文件

    提供两种配置部署文件方式：
    - 用户在本地编辑好后直接上传，平台提供基本的校验功能；有关配置文件的格式，可以参考界面提供的demo样例，该样例可以直接上传使用。
    ![](/uploads/images/2021/developer/deploy-two-file.PNG "deploy-two-file.PNG")
    
    - 可视化配置文件，目前版本支持的部署类型为Pod和Service。
    ![](/uploads/images/2021/developer/deploy-two-config.PNG "deploy-two-config.PNG")
    

- 部署调测

    - Step1 部署调测前可以根据需要选择部署环境，EdgeGallery提供‘模拟环境’和‘5G真实’两种测试环境（v1.1版本只实现模拟环境分配）；
    - Step2 启动部署，开始 生成部署文件 -> 分配测试节点 -> 实例化应用 -> 获取部署状态
    - Step3 部署成功后，会返回部署后台的测试链接，并且展示已经部署完成POD信息
    - Step4 应用开发者通过链接对应用进行测试
    - Step5 测试完成后，通过【资源回收】按钮释放测试环境，如需修改，请在完成镜像修改后，循环以上Step1->Step2->Step3->Step4操作，对应用进行反复测试

![](/uploads/images/2020/v1.0/DeploymentTest.png "DeploymentTest.png")

![](/uploads/images/2020/v1.0/DeploymentTest-DeploySuccess.png "DeploymentTest-DeploySuccess.png")

虚机应用部署调测分为以下三个步骤：
- 选择虚机资源
    
    配置虚机的规格、镜像、网络等信息
    - 输入虚机名称
    - 配置虚机资源大小，镜像源
    - 设置虚机网络类型，默认勾选N6网络

- 申请虚机

    申请到的虚机可以远程登录进行应用开发调测：

- 导出镜像

    - 将镜像分片下载并打包在csar包中

#### 应用发布
应用发布分为三个步骤：
- 应用配置
    - 【可选】流规则配置
    - 【可选】应用服务发布配置：如果该应用需要成为生态能力服务，需要进行该配置。需要上传对应的API接口文档和MD说明文档，具体配置如下
![](/uploads/images/2020/v1.0/ApplicationRelease-RuleConfiguration.png "ApplicationRelease-RuleConfiguration.png")

- 应用认证

对接认证测试平台，所有完成开发的应用都需要通过认证测试平台的认证后才能发布到AppStore平台，生成的认证测试报告会附带发送给你AppStore平台。

    - 选择测试场景
    
    ![](/uploads/images/2021/developer/atp-1.PNG "atp-1.PNG")
    
    - 执行测试用例
    
    ![](/uploads/images/2021/developer/atp-2.PNG "atp-2.PNG")

- 应用发布

认证通过的应用，通过这里可以直接发布到EdgeGallery的AppStore平台，同时如果在【应用配置】时填写了应用服务发布配置，该应用同样会做为能力服务，被收录到能力中心里，可以被其他应用开发者使用。
![](/uploads/images/2020/v1.0/ApplicationRelease.png "ApplicationRelease.png")


### 系统
系统菜单主要对管理员权限的用户开放，提供沙箱节点以及平台能力的管理。

#### 沙箱管理
- 沙箱节点列表
![](/uploads/images/2021/developer/sys-saxbox.PNG "sys-saxbox.PNG")
- 新增沙箱节点
![](/uploads/images/2021/developer/sys-saxbox-new.PNG "sys-saxbox-new.PNG")

#### 能力中心管理
- 能力中心列表
![](/uploads/images/2021/developer/sys-ability.PNG "sys-ability.PNG")
- 新增能力中心
![](/uploads/images/2021/developer/sys-ability-new.PNG "sys-ability-new.PNG")
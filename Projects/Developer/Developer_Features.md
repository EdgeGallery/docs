Developer 特性清单
----

|**特性名称**|**特性描述**|**设计约束**|
|---|---|---|
|开发工具管理|提供给开发者使用的App开发工具，开发者可以下载使用，也可以将自研的工具分享给社区开发者使用。||
|能力中心|展示所有开发者平台提供的能力，包括平台自身提供，开发者共享到此平台的能力，供开发者开发部署项目使用。||
|工作空间|工作空间是给开发者提供的项目管理平台，开发者可以通过创建项目，完成App的开发-测试-发布的整个流程。||
|社区实验室|社区实验室是给开发者提供的资源管理平台，开发者可以通过查看已有资源，申请新资源等。||
|系统|系统菜单是给管理员提供的管理菜单。主要负责测试沙箱和能力中心（服务）的管理||


### 开发工具管理
目前开发工具管理提供生成API调用的样例代码和生成csar包格式的插件，该插件目前支持java和python。

#### 插件列表

![](/uploads/images/2020/v1.0/Plug-inList.PNG "Plug-inList.PNG")


#### 插件上传

![](/uploads/images/2020/v1.0/UploadPlug-in.PNG "UploadPlug-in.PNG")


### 能力中心
能力中心包含MEP API和MEP-ECO生态服务介绍。包含详细的API描述文档，供开发者查看。
MEP API 是edgegallery平台自身提供的API能力，例如Service Discovery，Location service，Bandwidth service等能力。MEC-ECO（MEC Ecosystem）是MEC生态能力App的简称，开发者在完成一个MEC APP开发的时候，
如果需要将这个APP的能力开放给其他用户使用，可以通过上传到MEC-ECO实现。EdgeGallery会将该APP的对外接口提供给其他开发人员使用，并且将该服务通过MECM部署在需要的边缘侧，供其他APP能够使用。

![能力中心](/uploads/images/2020/v1.0/CompetenceCenter.PNG "CompetenceCenter.PNG")


### 工作空间

开发者在这里通过创建project的方式，管理自己的APP开发过程，有两种开发模式：

1.  应用开发：从编码开始，开发一个全新的应用
    
2.  应用集成：已有应用，需要将应用打包成镜像，在开发集成平台进行部署测试，最终发布到应用仓库上。

开发集成平台提供的端到端开发流程如下：

![](/uploads/images/2020/v1.0/ApplicationDevelopmentProcess.PNG "ApplicationDevelopmentProcess.PNG")

#### 创建项目
创建项目时，需要输入项目基本信息和选择需要依赖的生态能力。


#### 能力详情
创建项目时选择的能力，这里会展示对应能力的详细API，帮助开发者理解如何调用能力服务，并在后台提供API模拟器，可以测试API的请求和返回值。

针对每个能力服务，还提供SDK下载功能，开发者可以将SDK直接集成到代码中。

![](/uploads/images/2020/v1.0/CapabilityDetails.png "CapabilityDetails.png")


#### 应用开发
针对选择依赖的能力API，提供调用的样例代码，帮助开发者将依赖API快速集成到自己的代码中。
![](/uploads/images/2020/v1.0/ApplicationDevelopment.png "ApplicationDevelopment.png")

#### 部署调测
部署调测分为三个部署：
- 上传APP镜像
    
    支持三种镜像上传方式
    - 用户上传到公共的镜像仓库，例如DockerHub 或 SWR镜像仓库，在部署时会自动从这些镜像仓库下载镜像包完成部署。
    - 上传到EdgeGallery的镜像仓库（v1.0版本暂未提供）
    - 如果您不想开放自己的应用镜像，可以自己搭建一个EdgeGallery边缘节点，需要安装的软件和安装指导，请参考：

![](/uploads/images/2020/v1.0/DeploymentTest-UploadImage.png "DeploymentTest-UploadImage.png")

- 配置部署文件

    提供两种配置部署文件方式：
    - 用户在本地编辑好后直接上传，平台提供基本的校验功能；有关配置文件的格式，可以参考界面提供的demo样例，该样例可以直接上传使用。
    - 可视化配置文件（v1.0版本暂未提供）

![](/uploads/images/2020/v1.0/DeploymentTest-ConfigurationFile.png "DeploymentTest-ConfigurationFile.png")

- 部署调测

    - Step1 部署调测前可以根据需要选择部署环境，EdgeGallery提供‘模拟环境’和‘5G真实’两种测试环境（v1.0版本只实现模拟环境分配）；
    - Step2 启动部署，开始 生成部署文件 -> 分配测试节点 -> 实例化应用 -> 获取部署状态
    - Step3 部署成功后，会返回部署后台的测试链接，并且展示已经部署完成POD信息
    - Step4 应用开发者通过链接对应用进行测试，修改镜像后，循环以上Step1->Step2->Step3操作，对应用进行反复测试
    - Step5 测试完成后，通过【资源回收】按钮释放测试环境

![](/uploads/images/2020/v1.0/DeploymentTest.png "DeploymentTest.png")

![](/uploads/images/2020/v1.0/DeploymentTest-DeploySuccess.png "DeploymentTest-DeploySuccess.png")


#### 应用发布
应用发布分为三个步骤：
- 应用配置
    - 【可选】流规则配置
    - 【可选】应用服务发布配置：如果该应用需要成为生态能力服务，需要进行该配置。需要上传对应的API接口文档和MD说明文档，具体配置如下
![](/uploads/images/2020/v1.0/ApplicationRelease-RuleConfiguration.png "ApplicationRelease-RuleConfiguration.png")

- 应用认证

对接认证测试平台，所有完成开发的应用都需要通过认证测试平台的认证后才能发布到AppStore平台，生成的认证测试报告会附带发送给你AppStore平台。
![](/uploads/images/2020/v1.0/ApplicationRelease-AuthenticationTest.png "ApplicationRelease-AuthenticationTest.png")

- 应用发布

认证通过的应用，通过这里可以直接发布到EdgeGallery的AppStore平台，同时如果在【应用配置】时填写了应用服务发布配置，该应用同样会做为能力服务，被收录到能力中心里，可以被其他应用开发者使用。
![](/uploads/images/2020/v1.0/ApplicationRelease.png "ApplicationRelease.png")


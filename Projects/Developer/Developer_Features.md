Developer 特性清单
----
|**特性名称**|**特性描述**|**设计约束**|
|---|---|---|
|开发工具管理|提供给开发者使用的App开发工具，开发者可以在这里下载使用工具，同时可以通过将自研的工具通过上传分享给社区开发者使用。||
|API管理|分为MEPAPI，MEP-ECOAPI，开发者平台API。包含详细的API描述文档，供开发者查看。||
|APP测试|开发者平台提供共用的测试环境，开发人员完成App开发后，可以在平台上创建测试任务对App功能进行测试。||
|工作空间|工作空间是给开发者提供的项目管理平台，开发者可以通过创建项目，完成App的开发-测试-发布的整个流程。||


### 开发工具管理
目前开发工具管理提供生成API调用的样例代码和生成csar包格式的插件，该插件目前支持java和python。

#### 插件列表

![](/uploads/images/2020/0915/102647_b152d7a0_7625288.png "屏幕截图.png")

#### 插件上传

![](/uploads/images/2020/0915/102728_cf6461eb_7625288.png "屏幕截图.png")


### API管理
API管理分为MEP API，MEP-ECO，开发者平台API。包含详细的API描述文档，供开发者查看。
MEP API 是edgegallery平台自身提供的API能力，例如Service Discovery，Location service，Bandwidth service等能力。MEC-ECO（MEC Ecosystem）是MEC生态能力App的简称，开发者在完成一个MEC APP开发的时候，
如果需要将这个APP的能力开放给其他用户使用，可以通过上传到MEC-ECO实现。EdgeGallery会将该APP的对外接口提供给其他开发人员使用，并且将该服务通过MECM部署在需要的边缘侧，供其他APP能够使用。

#### MEP API
![](/uploads/images/2020/0915/104859_37db27fd_7625288.png "屏幕截图.png")

#### MEC-ECO

![](/uploads/images/2020/0915/104956_583ee8c1_7625288.png "屏幕截图.png")

### APP测试

因为MEC的APP测试涉及到特定的虚拟环境和硬件环境，为了让开发者更好的关注功能实现，开发者平台提供沙箱环境，供开发者完成APP开发后的测试工作。开发者通过上传APP到开发者平台，然后平台将APP部署到沙箱环境，模拟真实场景进行功能测试。

![](/uploads/images/2020/0709/151550_b85ad7aa_5504908.png "Upload and Test APP.png")

### 工作空间

开发者在这里通过创建project的方式，管理自己的APP开发过程，有两种开发模式：

1.  新建项目
    
2.  迁移项目
    
3.  E2E项目开发&测试
    

#### 新建项目

![](/uploads/images/2020/0709/151620_bba2e06c_5504908.png "create new project.png")

#### 迁移项目

![](/uploads/images/2020/0709/151705_5f70f0aa_5504908.png "Migration project.png")

#### E2E项目开发&测试

![](/uploads/images/2020/0709/151718_06af66ac_5504908.png "E2E Create Project Copy.png")
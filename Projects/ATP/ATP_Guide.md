ATP Guide
========================

### 概述
- 应用测试认证服务目前分为管理面功能和用户面功能。
- 在管理面，管理员可以管理测试场景、测试套、测试用例、测试任务、贡献的测试用例以及配置项，其中贡献管理的菜单仅管理员可见。平台内置了社区场景以及3个样例运营商场景。对于社区场景，平台内置了通用安全性测试测试套、通用遵从性测试测试套和通用沙箱测试测试套，每个测试套下面都有对应的测试用例。平台支持一键式批量导入测试模型，方便批量测试模型的新增。对于有手工用例的测试任务，管理员可以在后台手动更改测试用例状态，完成手工测试用例状态的更新。
- 在用户面（即集成在开发者平台和应用商店中的功能），对于开发者，在开发者平台开发app以后，对生成的csar包，要经过应用测试认证服务测试通过后才可以发布到应用商店；对于已经有应用包的供应商或者厂商，在应用商店中上传应用包以后，也要经过应用测试认证服务测试通过后才可以发布到应用商店。用户可以选择要进行测试的场景，其中社区场景是必选的，然后系统会动态展示出测试用例的执行过程。当测试完成后，会生成测试报告，给出测试结果的分析，用户也可以下载测试报告，格式为pdf格式。用户面也为用户提供了贡献测试用例的入口，用户可以通过填写对测试用例的描述或者上传脚本的方式，完成对测试用例的贡献。

### 管理面首页
首页可以直接点击查看所有测试用例，首页还介绍了各菜单模块的功能，展示了过去6个月测试任务数量的统计。
![](/uploads/images/2021/atp/management-portal.png "首页.png")

### 管理面测试场景管理
测试场景页面显示平台包含的所有测试场景，管理员可以新增测试场景，编辑已有的测试场景，也可以删除已有的测试场景。
![](/uploads/images/2021/atp/testScenario.png "测试场景.png")

### 管理面测试套管理
测试套页面显示平台包含的所有测试套，一个测试套属于一个或者多个测试场景，管理员可以新增测试套、编辑已有的测试套，也可以删除已有的测试套。
![](/uploads/images/2021/atp/testSuite.png "测试套.png")

### 管理面测试用例管理
测试用例页面显示平台包含的所有测试用例，一个测试用例属于一个或者多个测试套，管理员可以新增测试用例、编辑已有的测试用例，也可以删除已有的测试用例。
![](/uploads/images/2021/atp/testCase.png "测试用例.png")

### 管理面测试模型一键式导入
为了方便管理员批量导入测试场景、测试套和测试用例，管理面提供了测试模型导入功能。管理员可以将测试场景、测试套和测试用例的描述写到excel表中，并把测试用例脚本，测试场景图标放到指定文件夹中，最终压缩成zip包，通过导入zip包的方式完成测试模型的批量导入功能。管理员可以在测试场景页面、测试套页面或者测试用例页面右上角的批量导入按钮完成测试模型批量导入功能。  
![](/uploads/images/2021/atp/batchImport.png "批量导入.png")

### 管理面测试任务管理
任务管理显示了所有的测试任务，管理员可以对测试任务进行批量删除，也可以修改手工用例的状态。
![](/uploads/images/2021/atp/task.png "测试任务.png")
![](/uploads/images/2021/atp/modifyStatus.png "修改手工用例状态.png")

### 管理面配置项管理
配置项管理显示了所有配置项信息，每个配置项可以关联一个或者多个测试用例，使测试用例参数可配置，更灵活。
![](/uploads/images/2021/atp/configMgmt.png "配置管理.png")

### 应用商店测试认证入口
在应用商店首页上传应用包以后，在我的应用中，在对应的应用包右边点击测试，进入应用测试流程。
![](/uploads/images/2021/cor2020/myApp.PNG "我的应用.PNG")

### 测试场景选择&测试用例贡献
用户可以选择想要测试的场景，社区场景是必选的，其余场景根据用户需要自行选择。
![](/uploads/images/2021/atp/selectScenario.png "选择测试场景.png")
页面右上方有贡献测试用例的入口，点击测试用例，支持用户用描述的方式或者脚本的方式贡献测试用例。
![](/uploads/images/2021/atp/contribution.png "贡献测试用例.png")

### 测试进展可视化&支持用户上传自测报告&报告查看
测试进展页面动态地展示用例的执行情况，所有自动化类型的测试用例都会自动执行，手工类型的测试用例需要管理员在管理面修改测试用例状态。
![](/uploads/images/2021/atp/process.png "测试进展.png")

用户如果有应用相关的独特的测试，可以点击上传自测报告，格式为pdf。若用户上传了自测报告，最终的测试报告会将自测报告和平台报告整合到一起展示。   

点击右上角的查看报告，会进入该测试任务的报告页面，报告页面显示测试任务的基本信息、各测试场景的测试用例通过率以及测试用例的详细信息。
![](/uploads/images/2021/atp/testReport.png "测试报告.png ")

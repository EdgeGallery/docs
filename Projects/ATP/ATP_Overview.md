## 概述

- 应用测试服务对于应用包，提供了检测的功能，只有通过了应用测试服务的测试用例，才能将应用包发布到应用商城中。
- 应用测试服务分为前后台两个部分，[atp][1]是后台部分，提供主要功能接口供前台或其他三方系统调用，[atp-fe][2]是前台部分，提供界面展示。
- 应用测试服务目前分为管理面功能和用户面功能，管理面功能包括测试场景的管理、测试套的管理、测试用例的管理和测试任务的管理。管理员可以在管理面动态的新增测试场景、测试套和测试用例，也可以修改测试任务中手工用例的状态。用户面功能包括选择要测试的场景、测试过程可视化、测试报告展示以及贡献测试用例。目前用户面的功能主要集成在开发者平台和应用商店中，对于生成的应用包进行测试。


## 整体框架说明
EdgeGallery整体框架流程如下，应用测试平台主要对应图中的认证测试部分。
![](/uploads/images/2020/v1.0/all-the-arch.png)


- atp-fe：开发者平台前台框架，使用VUE开发。

- atp：开发者平台后台框架，使用SpringBoot+ServiceComb开发。（有关ServiceComb请参考这里：https://servicecomb.apache.org/cn/）

- atp DB：后台依赖Postgres数据库。


## 测试套、测试场景和测试用例的对应关系
![](/uploads/images/2021/atp/relation.png)


[1]: https://gitee.com/edgegallery/atp "atp"
[2]: https://gitee.com/edgegallery/atp-fe "atp-fe"
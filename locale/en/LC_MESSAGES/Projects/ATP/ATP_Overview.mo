��          t               �   �   �   	   v  d   �  _   �  )   E  9   o  �   �  �   >  �   �  %  �  �  �  �   L     !	  q   -	  c   �	  .   
  E   2
  �   x
      �   %  �  �   ## 整体框架说明 EdgeGallery整体框架流程如下，应用测试平台主要对应图中的认证测试部分。 ![](/uploads/images/2020/v1.0/all-the-arch.png) ## 概述 ## 测试套、测试场景和测试用例的对应关系 ![](/uploads/images/2021/atp/relation.png) [1]: https://gitee.com/edgegallery/atp "atp" [2]: https://gitee.com/edgegallery/atp-fe "atp-fe" atp DB：后台依赖Postgres数据库。 atp-fe：开发者平台前台框架，使用VUE开发。 atp：开发者平台后台框架，使用SpringBoot+ServiceComb开发。（有关ServiceComb请参考这里：https://servicecomb.apache.org/cn/） 应用测试服务分为前后台两个部分，[atp][1]是后台部分，提供主要功能接口供前台或其他三方系统调用，[atp-fe][2]是前台部分，提供界面展示。 应用测试服务对于应用包，提供了检测的功能，只有通过了应用测试服务的测试用例，才能将应用包发布到应用商城中。 应用测试服务目前分为管理面功能和用户面功能，管理面功能包括测试场景的管理、测试套的管理、测试用例的管理和测试任务的管理。管理员可以在管理面动态的新增测试场景、测试套和测试用例，也可以修改测试任务中手工用例的状态。用户面功能包括选择要测试的场景、测试过程可视化、测试报告展示以及贡献测试用例。目前用户面的功能主要集成在开发者平台和应用商店中，对于生成的应用包进行测试。 Project-Id-Version: EdgeGallery Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-04-12 10:35+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.0
 ## The overall framework describes the EdgeGallery overall framework flow as follows, applying the authentication test part in the main map of the test platform. ! [](/uploads/images/2020/v1.0/all - the-arch.png) ## Overview ## test suites, test scenes, and test cases corresponding relationship ![](/uploads/images/2021/atp/relation.png) [1]: https://gitee.com/edgegallery/atp " atp " [2]: https://gitee.com/edgegallery/atp-fe " atp-fe " atp DB: Backstage relies on Postgres database. atp-fe: Developer Platform foreground framework, developed using VUE. atp: Developer Platform Backstage Framework, developed using SpringBot + ServiceComb.(For ServiceComb, please refer to this: //servicecomb.apache.org/cn/) The application testing service is divided into the front and back platforms, [atp] [1] is the background part, providing the main function interface for the foreground or other three-way system to call, [atp-fe] [2] is the foreground part, providing the interface display. The application test service provides a detection function for the application package, and can be published to the applied commercial city only by using the test case of the application test service. The application test service is divided into management plane function and user plane function, the management surface function comprises management of test scene, management of test sleeve, management of test case and management of test task.The administrator can add test scenarios, test suites, and test cases dynamically in the management face, and also modify the state of the manual use cases in the test task.The user plane function includes selecting the scene to be tested, the test process visualization, the test report display and the contribution test case.Currently, the function of the user side is mainly integrated in the developer platform and the application store, and the generated application package is tested. 
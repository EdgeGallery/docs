��          |               �   /   �   5        C     Y  �   o  .     >   ;  �   z    9  y   W     �  }  �  /   V  5   �     �      �  �   �  :   �  T   �  �   5  r  +	  x   �
        ![](/uploads/images/2020/v1.0/all-the-arch.png) ![](/uploads/images/2020/v1.0/appstore-code-arch.png) ## 代码架构说明 ## 整体框架说明 AppStore BE：开发者平台后台框架，使用SpringBoot+ServiceComb开发。（有关ServiceComb请参考这里：https://servicecomb.apache.org/cn/） AppStore DB：后台依赖Postgres数据库。 AppStore FE：开发者平台前台框架，使用VUE开发。 AppStore分为前后台两个部分，[AppStore BE][1]是后台部分，提供主要功能接口供前台或其他三方系统调用，[AppStore FE][2]是前台部分，提供界面展示。 AppStore是开发者发布和上线App应用的边缘应用市场，由Developer平台开发的边缘应用，经过ATP测试后可以直接发布到AppStore应用商店。 用户也可以在AppStore直接上传边缘应用，经过ATP测试后可以发布到AppStore，对外展示。 [1]: https://gitee.com/edgegallery/appstore-be "AppStore BE" [2]: https://gitee.com/edgegallery/appstore-fe "AppStore FE" 概述 Project-Id-Version: edgegallery 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-03-15 06:29+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.0
 ![](/uploads/images/2020/v1.0/all-the-arch.png) ![](/uploads/images/2020/v1.0/appstore-code-arch.png) ## Code structure description ## Overall framework description AppStore BE: Developer platform background framework, developed using SpringBoot+ServiceComb. (For ServiceComb, please refer to here: https://servicecomb.apache.org/cn/) AppStore DB: The backend depends on the Postgres database. AppStore FE: The front-end framework of the developer platform, developed using VUE. AppStore is divided into two parts: [AppStore BE][1] is the background part, providing the main function interface for the front desk or other three-party system to call, [AppStore FE][2] is the front desk part, which provides interface display. AppStore is an edge application market for developers to publish and launch App applications. Edge applications developed by the Developer platform can be directly published to the AppStore application store after being tested by ATP. Users can also upload edge applications directly in AppStore, and after ATP testing, they can publish to AppStore for external display. [1]: https://gitee.com/edgegallery/appstore-be "AppStore BE" [2]: https://gitee.com/edgegallery/appstore-fe"AppStore FE" Overview 
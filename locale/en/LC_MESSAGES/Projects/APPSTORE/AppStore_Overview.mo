��          |               �   /   �   5        C     Y  �   o  .     >   ;  �   z    9  y   W     �  �  �  2   d  8   �      �      �  �     3   �  J   �    4  ?  6	  }   v
     �
   ![](/uploads/images/2020/v1.0/all-the-arch.png) ![](/uploads/images/2020/v1.0/appstore-code-arch.png) ## 代码架构说明 ## 整体框架说明 AppStore BE：开发者平台后台框架，使用SpringBoot+ServiceComb开发。（有关ServiceComb请参考这里：https://servicecomb.apache.org/cn/） AppStore DB：后台依赖Postgres数据库。 AppStore FE：开发者平台前台框架，使用VUE开发。 AppStore分为前后台两个部分，[AppStore BE][1]是后台部分，提供主要功能接口供前台或其他三方系统调用，[AppStore FE][2]是前台部分，提供界面展示。 AppStore是开发者发布和上线App应用的边缘应用市场，由Developer平台开发的边缘应用，经过ATP测试后可以直接发布到AppStore应用商店。 用户也可以在AppStore直接上传边缘应用，经过ATP测试后可以发布到AppStore，对外展示。 [1]: https://gitee.com/edgegallery/appstore-be "AppStore BE" [2]: https://gitee.com/edgegallery/appstore-fe "AppStore FE" 概述 Project-Id-Version: EdgeGallery Documentation 
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
 ! [](/uploads/images/2020/v1.0/all - the-arch.png) ! [](/uploads/images/2020/v1.0/appstore - code-arch.png) ## Code Architecture Description ## Overall Framework Description AppStore BE: Developer Platform Backstage Framework, developed using SpringBot + ServiceComb.(For ServiceComb, please refer to this: //servicecomb.apache.org/cn/) AppStore DB: Backstage relies on Postgres database. AppStore FE: Developer Platform foreground framework, developed using VUE. The AppStore is divided into two parts, and the [AppStore BE] [1] is a backstage part that provides the main functional interface for the foreground or other three-way system calls, [AppStore FE] [2] is the foreground part and provides an interface display. The App Store is an edge application marketplace for developers publishing and onboarding apps, developed by Developer Platform, and can be published directly to the AppStore app store after an ATP test. Users can also upload edge apps directly on the AppStore, which can be published to the AppStore after an ATP test. [1]: https://gitee.com/edgegallery/appstore-be " AppStore BE " [2]: https://gitee.com/edgegallery/appstore-fe " AppStore FE " Overview 
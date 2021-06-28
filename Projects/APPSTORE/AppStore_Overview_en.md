Overview
=================

AppStore is an edge application market for developers to release and launch App applications. Edge applications developed by the Developer platform can be directly published to the AppStore application store after ATP testing. Users can also upload edge applications directly in the AppStore, and after ATP testing, they can be published to the AppStore for external display.

AppStore is divided into two parts: the front and back parts. [AppStore BE][1]is the back-end part, which provides the main functional interface for the front desk or other three-party systems to call, and the [AppStore FE][2] is the front-end part and provides interface display.


## Code architecture

![](/uploads/images/2021/appstore/app_structure.png)

1. AppStore FE: The front-end framework of the developer platform, developed using VUE.
2. AppStore BE: Developer platform background framework, developed using SpringBoot+ServiceComb. (For ServiceComb, please refer to here: https://servicecomb.apache.org/cn/)
3. AppStore DB: The background depends on the Postgres database.

[1]: https://gitee.com/edgegallery/appstore-be "AppStore BE"
[2]: https://gitee.com/edgegallery/appstore-fe "AppStore FE"


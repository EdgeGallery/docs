# MEPM User Interface document

## Overview

It is mainly divided into three sections. Application statistics, Application list and EdgeNodes List

![](https://images.gitee.com/uploads/images/2021/0402/162039_bcb71c24_7639205.png "dashboard.png")

Application statistics shows number of packages available currently, number of packages distributed and number of packages deployed.

Application List displays list of applications deployed.

Edgenodes List displays number of edgenodes available in system. User can also view edge node details by clicking on **node details** button and **application details** button will redirect to mep portal to view application details.

## Application Management

Application management has two sections.  Application **package management** and **instance management**

![](https://images.gitee.com/uploads/images/2021/0402/162405_4c39ed6c_7639205.png "pkg1.png")

### Application Package Management

- Displays the list of applications available

![](https://images.gitee.com/uploads/images/2021/0402/162457_7cdb15aa_7639205.png "pkg4.png")

- User can upload new application package by clicking **New Package** button

![](https://images.gitee.com/uploads/images/2021/0402/162520_ce672a82_7639205.png "pkg2.png")

![](https://images.gitee.com/uploads/images/2021/0402/162537_9e7a6bd9_7639205.png "pkg3.png")

- User can distribute the application to edge nodes by clicking **distribute** button

![](https://images.gitee.com/uploads/images/2021/0402/162600_39fae6b9_7639205.png "pkg_distribute.png")

- User can click on **detail** button to view status of distribution

![](https://images.gitee.com/uploads/images/2021/0402/162626_3681a485_7639205.png "pkg_detail.png")

![](https://images.gitee.com/uploads/images/2021/0402/162721_b459a773_7639205.png "pkg_list.png")

- Once the application is distributed to edge, User can deploy application using **deploy** button

![](https://images.gitee.com/uploads/images/2021/0402/162647_21807129_7639205.png "pkg_deploy.png")

### Application Instance Management
- User can view status application deployed in this page

![](https://images.gitee.com/uploads/images/2021/0402/163234_05080a4b_7639205.png "list.png")

- User can delete the application instantiated by clicking on **delete** button

![](https://images.gitee.com/uploads/images/2021/0402/163253_a0482ba1_7639205.png "delete.png")

- User can view the application pod status by clicking on **detail** button

![](https://images.gitee.com/uploads/images/2021/0402/163312_cc245a21_7639205.png "detail.png")

![](https://images.gitee.com/uploads/images/2021/0402/163326_5ef8be11_7639205.png "detail2.png")

- User can configure DNS and traffic rule for the application by clicking on **rule configuration** button

![](https://images.gitee.com/uploads/images/2021/0402/163341_20560adc_7639205.png "rule1.png")

![](https://images.gitee.com/uploads/images/2021/0402/163401_561700ce_7639205.png "rule2.png")

## Edge Node

- Displays the list of edge nodes and node monitoring information

![](https://images.gitee.com/uploads/images/2021/0402/164410_7e391ac5_7639205.png "list.png")

- User can configure new edge node by clicking **New Edge** button

![](https://images.gitee.com/uploads/images/2021/0402/163856_c8d007ba_7639205.png "newedge1.png")

![](https://images.gitee.com/uploads/images/2021/0402/163909_6fe615c8_7639205.png "newedge2.png")

- User must upload k8s config file by clicking **upload config file** button before distributing application 

![](https://images.gitee.com/uploads/images/2021/0402/163926_b03cb198_7639205.png "configfile1.png")

![](https://images.gitee.com/uploads/images/2021/0402/163938_03e89734_7639205.png "configfile2.png")

- User can monitor the edgenode by clicking on **monitor** button

![](https://images.gitee.com/uploads/images/2021/0402/163954_922d8d32_7639205.png "monitor1.png")

![](https://images.gitee.com/uploads/images/2021/0402/164007_7e0ad751_7639205.png "monitor2.png")

- User can view the details of edge node by clicking on **detail** button

![](https://images.gitee.com/uploads/images/2021/0402/164020_4e206a56_7639205.png "detail1.png")

![](https://images.gitee.com/uploads/images/2021/0402/164032_2acc8264_7639205.png "detail2.png")

## About
About page will redirect to edgegallery website to view more information on edge gallery platform


> Note: At present, due to client and server protocol issues, there may be certificate abnormalities in user access. If there is an abnormal data acquisition problem, it is recommended to visit [https://mepm.edgegallery.org:30204  in the browser first , and then agree to continue access. Then return to the MEPM portal to refresh, this problem will be resolved in the next version.

![](https://images.gitee.com/uploads/images/2021/0402/170843_7b706467_7639205.png "certificate_issue.png")

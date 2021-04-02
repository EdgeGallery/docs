# MEPM User Interface document

! ! ! Note: At present, due to client and server protocol issues, there may be certificate abnormalities in user access. If there is an abnormal data acquisition problem, it is recommended to visit [https://mepm.edgegallery.org:30206  in the browser first , and then agree to continue access. Then return to the MEPM portal to refresh, this problem will be resolved in the next version.

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

- User can upload new application package by clicking ** New Package ** button
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
- User can delete the application instantiated by clicking on **delete** button
- User can view the application pod status by clicking on **detail** button
- User can configure DNS and traffic rule for the application by clicking on **rule configuration** button
## Edge Node

- Displays the list of edge nodes and node monitoring information
- User can configure new edge node by clicking **New Edge** button
- User must upload k8s config file by clicking **upload config file** button before distributing application 
- User can monitor the edgenode by clicking on **monitor** button
- User can view the details of edge node by clicking on **detail** button

## About
About page will redirect to edgegallery website to view more information on edge gallery platform

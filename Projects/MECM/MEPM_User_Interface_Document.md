# MEPM User Interface document

! ! ! Note: At present, due to client and server protocol issues, there may be certificate abnormalities in user access. If there is an abnormal data acquisition problem, it is recommended to visit [https://mepm.edgegallery.org:30206  in the browser first , and then agree to continue access. Then return to the MEPM portal to refresh, this problem will be resolved in the next version.

## Overview

It is mainly divided into three sections. Application statistics, Application list and EdgeNodes List

Application statistics shows number of packages available currently, number of packages distributed and number of packages deployed.

Application List displays list of applications deployed.

Edgenodes List displays number of edgenodes available in system. User can also view edge node details by clicking on **node details** button and **application details** button will redirect to mep portal to view application details.

## Application Management

Application management has two sections.  Application **package management** and **instance management**

### Application Package Management
- Displays the list of applications available
- User can upload new application package by clicking ** New Package ** button
- User can distribute the application to edge nodes by clicking **distribute** button
- User can click on **detail** button to view status of distribution
- Once the application is distributed to edge, User can deploy application using **deploy** button

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

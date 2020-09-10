APP Store Interfaces
==============
- [APP Store Interfaces](#appstore-interfaces)
- [AppStore-Server](#AppStore-server)
  - [1. APP](#1-app)
    - [1.1 apps](#11-apps)
      - [1.1.1 GET all by condation](#111-get-all)
      - [1.1.2 GET one](#112-get-one)
      - [1.1.3 POST](#112-post)
      - [1.1.4 DELETE one](#112-delete-one)
      - [1.1.5 GET lastest package](#112-get-latest-package)
      - [1.1.6 GET app icon](#112-get-app-icon)
  - [2. Package](#2-package)
    - [2.1 packages](#21-packages)
      - [2.1.1 GET all package by appid](#211-get-all)
      - [2.1.2 GET one](#212-get-one)
      - [2.1.3 DELETE one](#213-delete-one)
      - [2.1.4 DOWNLOAD one](#213-delete-one)
    - [2.2 files](#21-files)
      - [2.2.1 GET FILE CONTENT](#221-get-file-by-filepath)
  - [3. Comments](#3-comment)
    - [3.1 comments](#31-comments)
      - [3.1.1 GET all comments by appid](#311-get-all)
      - [3.1.2 POST one comment to app](#312-get-one)

# AppStore-Server
This section cover the AppStore-Server interfaces.

## 1. APP

APP .

### 1.1 apps

Unit of APP Server, one app with one or more packages.

#### 1.1.1 GET all

Query all apps by condation.

```
Resource URI: /mec/appstore/v1/apps
```

| Name          | Definition    | Required|
| ------------- | ------------- |------------|
| name | app name. |no|
| provider | app provider. |no|
| type | app type. |no|
| affinity | app affinity. |no|
| userId | app creater. |no|

Example response:
```
200 OK
[
  {
    "appId": "string",
    "iconUrl": "string",
    "name": "string",
    "provider": "string",
    "type": "string",
    "shortDesc": "string",
    "createTime": "string",
    "details": "string",
    "downloadCount": 0,
    "affinity": "string",
    "industry": "string",
    "contact": "string",
    "score": 0,
    "userId": "string",
    "userName": "string"
  }
]
```
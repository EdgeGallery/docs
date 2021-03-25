AppStore Interfaces
==============
The document is for the appstore-be project, there are six parts of interfaces in the project.

- [AppStore Interfaces](#appstore-interfaces)
  - [1. APP](#1-app)
    - [1.1 Get All Apps](#11-get-all-apps)
    - [1.2 Get One App](#12-get-one-app)
    - [1.3 Register App](#13-register-app)
    - [1.4 Delete One App](#14-delete-one-app)
    - [1.5 Get Latest Version Of App](#15-get-latest-version-of-app)
    - [1.6 Get Icon Of App](#16-get-icon-of-app)
	- [1.7 Upload Package by Segment](#17-upload-package-by-segment)
	- [1.8 Merge App package](#18-merge-App-package)
	- [1.9 Register Virtual Machine App](#19-register-vitual-machine-app)
	- [1.10 Get Video of App](#110-get-video-of-app)
  - [2. Package](#2-package)
    - [2.1 Get All Packages Of APP](#21-get-all-packages-of-app)
    - [2.2 Get One Package](#22-get-one-package)
    - [2.3 Delete One Package](#23-delete-one-package)
    - [2.4 Download One Package](#24-download-one-package)
    - [2.5 Get File Content](#25-get-file-content)
    - [2.6 APP Publish](#26-app-publish)
    - [2.7 APP Test](#27-app-test)
  - [3. Comment](#3-comment)
    - [3.1 Get Comments Of App](#31-get-comments-of-app)
    - [3.2 Submit Comment To App](#32-submit-comment-to-app)
  - [4. APP Push](#4-app-push)
    - [4.1 Query Push App List](#41-query-push-app-list)
    - [4.2 Get Push App Package](#42-get-push-app-package)
    - [4.3 Push App Package](#43-push-app-package)
    - [4.4 Download Push App Package](#44-download-push-app-package)
    - [4.5 Download Push App Icon](#45-download-push-app-icon)
  - [5. APPStore Manager](#5-APPStore-Manager)
    - [5.1 Add AppStore](#51-Add-AppStore)
    - [5.2 Delete AppStore](#52-Delete-AppStore)
    - [5.3 Modify AppStore](#53-Modify-AppStore)
    - [5.4 Query AppStore List](#54-Query-AppStore-List)
    - [5.5 Query AppStore](#55-Query-AppStore)
  - [6. Message](#6-Message)
    - [6.1 Add Message](#61-Add-Message)
    - [6.2 Get All Message](#62-Get-All-Message)
    - [6.3 Get Message](#63-Get-Message)
    - [6.4 Delete Message](#64-Delete-Message)
    - [6.5 Accept Message](#65-Accept-Message)
    - [6.6 Update Status](#66-Update-Status)
  - [7. APP Pull](#7-app-pull)
    - [7.1 Query Pull App List](#71-query-pull-app-list)
    - [7.2 Get Pull App Packages](#72-get-pull-app-packages-by-platfromId)
    - [7.3 Pull App Package](#73-pull-app-package)


## 1. APP

APP is the basic publishing unit of APP Store. 


### 1.1 Get All Apps

Query all apps by condation.

```
Resource URI: /mec/appstore/v1/apps
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|name|app name.|request param|yes|
|provider|app provider.|request param|yes|
|type|app type.|request param|yes|
|affinity|app affinity.|request param|yes|
|userId|app creater.|request param|yes|

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
    "userName": "string",
    "status": "string"
  }
]
```

### 1.2 Get One App
Query app by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|appId|app id|path|yes|


Example response:
```
200 OK
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
    "userName": "string",
    "status": "string"
  }
```

### 1.3 Register App 
registe a app.
```
Resource URI: /mec/appstore/v1/apps
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|userId|user id|request param|yes|
|userName|app name|request param|yes|
|file|package file|RequestPart|yes|
|icon|app icon file|RequestPart|yes|
|demoVideo|app demo video file|RequestPart|no|
|type|application type|RequestPart|yes|
|shortDesc |short desc of input|RequestPart |yes|
|affinity |affinity of app|RequestPart |yes|
|industry |industry of app|RequestPart |yes|
|testTaskId |test task id|RequestPart |no|

Example response:
```
200 OK
  {
    "appName": "string",
    "appId": "string",
    "packageId": "string",
    "provider": "string",
    "version": "string"
  }
```

### 1.4 Delete One App 
delete a app.
```
Resource URI: /mec/appstore/v1/apps/{appId}
Method: DELETE
```

|Name|Definition|type|Required|
|---|---|---|---|
|userId|user id|request param |yes|
|userName |app name|request param |yes|
|appId |app id|path |yes|

Example response:
```
200 OK
  "delete App success."
```

### 1.5 Get Latest Version Of App
get latest version package of app.
```
Resource URI: /mec/appstore/v1/apps/{appId}/action/download
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|appId |app id|path |yes|

Example response:
```
200 OK
  binary output.
```

### 1.6 Get Icon Of App
get app icon by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/icon
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|appId |app id|path |yes|

Example response:
```
200 OK
  binary output.
```

### 1.7 Upload Package by Segment
upload package by segment.
```
Resource URI: /mec/appstore/v1/apps/upload
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|id|block id|RequestPart|no|
|chunkNumber|current file block number|RequestPart|yes|
|chunkSize|block size|RequestPart|no|
|currentChunkSize|urrent file block size|RequestPart|no|
|totalSize|total size|RequestPart|no|
|identifier |file identifier|RequestPart|yes|
|filename |file name|RequestPart|no|
|relativePath |file relative path|RequestPart|no|
|totalChunks |total blocks|RequestPart|no|
|type |file type|RequestPart|no|
|file |package file|RequestPart|yes|

Example response:
```
200 OK
  {
    "upload package block success"
  }
```

### 1.8 Merge App Package
merge app package.
```
Resource URI: /mec/appstore/v1/apps/merge
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|fileName|file name|request param|yes|
|guid|file identifier|request param|yes|

Example response:
```
200 OK
  {
    "file address",
  }
```

### 1.9 Register Virtual Machine APP 
register vitual machine app.
```
Resource URI: /mec/appstore/v1/apps/vm-register
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|userId|user id|request param|yes|
|userName|app name|request param|yes|
|fileAddress|package file relative path|RequestPart|yes|
|icon|app icon file|RequestPart|yes|
|demoVideo|app demo video file|RequestPart|no|
|type|application type|RequestPart|yes|
|shortDesc |short desc of input|RequestPart |yes|
|affinity |affinity of app|RequestPart |yes|
|industry |industry of app|RequestPart |yes|
|testTaskId |test task id|RequestPart |no|

Example response:
```
200 OK
  {
    "appName": "string",
    "appId": "string",
    "packageId": "string",
    "provider": "string",
    "version": "string"
  }
```

### 1.10 GET APP Video
get app video by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/demoVideo
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|appId |app id|path |yes|

Example response:
```
200 OK
  binary output.

## 2. Package

Package belong to App, etch App have at least one Package. 


### 2.1 Get All Packages Of APP

Query all packages by app id.

```
Resource URI: /mec/appstore/v1/apps/{appId}/packages
Method: GET
```


|Name|Definition|type|Required|
|---|---|---|---|
|appId |app id |type|yes|
|userId|user id|request param|yes|
|request|request|request param|yes|

Example response:
```
200 OK
[
  {
    "packageId": "string",
    "userName": "string",
    "status": "string",
    "shortDesc": "string",
    "provider": "string",
    "testTaskId": "string",
    "size": "string",
    "format": "string",
    "createTime": "string",
    "name": "string",
    "version": "string",
    "type": "string",
    "details": "string",
    "affinity": "string",
    "industry": "string",
    "contact": "string",
    "appId": "string",
    "userId": "string"
  }
]
```

### 2.2 Get One Package
Query app by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|appId |app id|path |yes|
|packageId |package id|path |yes|

Example response:
```
200 OK
  {
    "packageId": "string",
    "userName": "string",
    "status": "string",
    "shortDesc": "string",
    "provider": "string",
    "testTaskId": "string",
    "size": "string",
    "format": "string",
    "createTime": "string",
    "name": "string",
    "version": "string",
    "type": "string",
    "details": "string",
    "affinity": "string",
    "industry": "string",
    "contact": "string",
    "appId": "string",
    "userId": "string"
  }
```

### 2.3 Delete One Package
delete a package of app.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
Method: DELETE
```

|Name|Definition|type|Required|
|---|---|---|---|
|userId |user id|request param|yes|
|userName |user name|request param|yes|
|appId |app id|path |yes|
|packageId |package id|path |yes|

Example response:
```
200 OK
   delete package success.
```

### 2.4 Download One Package 
download one package by appId and packageId.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/download
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|appId |app id|path |yes|
|packageId |package id|path |yes|

Example response:
```
200 OK
  binary output.
```

### 2.5 Get File Content
Get file content by app id package id and file path.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/files
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|packageId |package id|path |yes|
|filePath |file path|FormParam |yes|
|appId |app id|path |yes|

Example response:
```
200 OK
  file content output.
```

### 2.6 APP Publish
Publish APP by app id and package id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/publish
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|appId |app id|path |yes|
|packageId |package id|path |yes|

Example response:
```

200 OK
  Publish Success.
```

### 2.7 APP Test
Test APP by app id and package id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/test
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|appId |app id|path |yes|
|packageId |package id|path |yes|
|request |request|request param |yes|

Example response:
```

200 OK
  {
  "atpTaskId": "string",
  "status": "string"
  }
```

## 3. Comment

User can submit comments to an app. 


### 3.1 Get Comments Of App
Get comments by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/comments
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|appId |app id|path |yes|


Example response:
```
200 OK
[
  {
    "commentId": 0,
    "user": {
      "userId": "string",
      "userName": "string",
      "permissions": [
        {
          "platform": "string",
          "role": "string",
          "pageIds": [
            "string"
          ]
        }
      ],
      "company": "string",
      "gender": "string",
      "telephone": "string"
    },
    "appId": "string",
    "body": "string",
    "score": 0,
    "commentTime": "string"
  }
]
```

### 3.2 Submit Comment To App
User submit comment to app by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/comments
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|userId |user id|request param |yes|
|userName |app name|request param |yes|
|appId |app id|path |yes|
|entity |comment entity|RequestBody |yes|

Example request body:
```
{
  "body": "string",
  "score": 0
}

```


Example response:
```
200 OK
 "comments success."
```

## 4. APP Push

User can push an app to other. 


### 4.1 Query Push App List
Query the app list which can push
```
URI： /mec/appstore/v1/packages/pushable
Method: GET
```

Example response:
```
200 OK
[
  {
    "appId": "string",
    "packageId": "string",
    "name": "string",
    "provider": "string",
    "version": "string",
    "atpTestStatus": "string",
    "atpTestTaskId": "string",
    "atpTestReportUrl": "string",
    "latestPushTime": "string",
    "pushTimes": "string",
    "targetPlatform": "string",
    "affinity": "string",
    "shortDesc": "string",
    "industry": "string",
    "type": "string",
    "createTime": "string"
  }
]
```

### 4.2 Get Push App Package
Get push app package by packageId.
```
URI： /mec/appstore/v1/packages/{packageId}/pushable
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|packageId |package id|path |yes|

Example response:
```
200 OK
[
  {
    "appId": "string",
    "packageId": "string",
    "name": "string",
    "provider": "string",
    "version": "string",
    "atpTestStatus": "string",
    "atpTestTaskId": "string",
    "atpTestReportUrl": "string",
    "latestPushTime": "string",
    "pushTimes": "string",
    "targetPlatform": "string",
    "affinity": "string",
    "shortDesc": "string",
    "industry": "string",
    "type": "string",
    "createTime": "string"
  }
]
```

### 4.3 Push App Package
Push app package by packageId
```
URI： /mec/appstore/v1/packages/{packageId}/action/push
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|packageId |package id|path |yes|
|dto |provider list|request param |yes|

Example response:
```
200 OK
  [true, false, true]
```

### 4.4 Download Push App Package
Download push appp package by packageId
```
URI： /mec/appstore/v1/packages/{packageId}/action/download-package
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|packageId |package id|path |yes|

Example response:
```
200 OK
  binary output.
```

### 4.5 Download Push App Icon
Download push app icon by packageId.
```
URI： /mec/appstore/v1/packages/{packageId}/action/download-icon
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|packageId |package id|path |yes|

Example response:
```
200 OK
  binary output.
```

## 5. APPStore Manager

Add, delete, modify and query the APPStore. 


### 5.1 Add AppStore
add external AppStore.
```
URI： /mec/appstore/v1/appstores
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|appStoreName |appStore name|request param |yes|
|appStoreVersion |appStore version|request param |yes|
|company |company name|request param |yes|
|url |url addr|request param |yes|
|schema |schema|request param |no|
|appPushIntf |appPush type|request param |no|
|appdTransId |appdTrans id|request param |yes|
|description |description information|request param |no|

Example response:
```
200 OK
  {
    "appStoreId": "string",
    "appStoreName": "string",
    "appStoreVersion": "string",
    "company": "string",
    "url": "string",
    "schema": "string",
    "appPushIntf": "string",
    "appdTransId": "string",
    "description": "string",
    "addedTime": "string",
    "modifiedTime": "string"
  }
```

### 5.2 Delete AppStore
Delete external AppStore.
```
URI： /mec/appstore/v1/appstores/{appStoreId}
Method: DELETE
```

|Name|Definition|type|Required|
|---|---|---|---|
|appStoreId |appStore id|path |yes|

Example response:
```
200 OK
  delete success
```

### 5.3 Modify AppStore
Modify external AppStore.
```
URI： /mec/appstore/v1/appstores/{appStoreId}
Method: PUT
```

|Name|Definition|type|Required|
|---|---|---|---|
|appStoreId |appStore id|path |yes|
|appStoreName |appStore name|request param |yes|
|appStoreVersion |appStore version|request param |yes|
|company |company name|request param |yes|
|url |url addr|request param |yes|
|schema |schema|request param |no|
|appPushIntf |appPush type|request param |no|
|appdTransId |appdTrans id|request param |yes|
|description |description information|request param |no|

Example response:
```
200 OK
  {
    "appStoreId": "string",
    "appStoreName": "string",
    "appStoreVersion": "string",
    "company": "string",
    "url": "string",
    "schema": "string",
    "appPushIntf": "string",
    "appdTransId": "string",
    "description": "string",
    "addedTime": "string",
    "modifiedTime": "string"
  }
```

### 5.4 Query AppStore List
Query external appStore list.
```
URI： /mec/appstore/v1/appstores
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|appStoreName |appStore name|request param |yes|
|company |company name|request param |yes|

Example response:
```
200 OK
[
  {
    "appStoreId": "string",
    "appStoreName": "string",
    "appStoreVersion": "string",
    "company": "string",
    "url": "string",
    "schema": "string",
    "appPushIntf": "string",
    "appdTransId": "string",
    "description": "string",
    "addedTime": "string",
    "modifiedTime": "string"
  }
]
```

### 5.5 Query AppStore
Query external appStore.
```
URI： /mec/appstore/v1/appstores/{appStoreId}
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|appStoreId |appStore id|path |yes|

Example response:
```
200 OK
  {
    "appStoreId": "string",
    "appStoreName": "string",
    "appStoreVersion": "string",
    "company": "string",
    "url": "string",
    "schema": "string",
    "appPushIntf": "string",
    "appdTransId": "string",
    "description": "string",
    "addedTime": "string",
    "modifiedTime": "string"
  }
```

## 6. Message

The message contains information such as APP push, download, notice, pull. 


### 6.1 Add Message
Add a APP operation message.
```
URI： /mec/appstore/v1/messages
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|basicInfo |basic information|request param |yes|
|sourceAppStore |source AppStore|request param |yes|
|targetAppStore |target AppStore|request param |yes|
|atpTestStatus |ATP test result|request param |yes|
|atpTestTaskId |ATP test taskId|request param |yes|
|atpTestReportUrl |ATP test reportUrl|request param |yes|
|packageDownloadUrl |package download url|request param |yes|
|iconDownloadUrl |app icon download url|request param |yes|

Example response:
```
200 OK
  add a message success
```

### 6.2 Get All Message
Get messages by message type.
```
URI： /mec/appstore/v1/messages
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|messageType |message type|request param |no|

Example response:
```
200 OK
[
  {
    "messageId": "string",
    "basicInfo": {
      "name": "string",
      "provider": "string",
      "version": "string",
      "affinity": "string",
      "shortDesc": "string",
      "industry": "string",
      "type": "string"
    },
    "messageType": "string",
    "sourceAppStore": "string",
    "targetAppStore": "string",
    "time": "string",
    "description": "string",
    "atpTestStatus": "string",
    "atpTestTaskId": "string",
    "atpTestReportUrl": "string",
    "iconDownloadUrl": "string",
    "readed": true
  }
]
```

### 6.3 Get Message
Get message by message id.
```
URI： /mec/appstore/v1/messages/{messageId}
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|messageId |message id|request param |yes|

Example response:
```
200 OK
  {
    "messageId": "string",
    "basicInfo": {
      "name": "string",
      "provider": "string",
      "version": "string",
      "affinity": "string",
      "shortDesc": "string",
      "industry": "string",
      "type": "string"
    },
    "messageType": "string",
    "sourceAppStore": "string",
    "targetAppStore": "string",
    "time": "string",
    "description": "string",
    "atpTestStatus": "string",
    "atpTestTaskId": "string",
    "atpTestReportUrl": "string",
    "iconDownloadUrl": "string",
    "readed": true
  }
```

### 6.4 Delete Message
Delete message by message id.
```
URI： /mec/appstore/v1/messages/{messageId}
Method: DELETE
```

|Name|Definition|type|Required|
|---|---|---|---|
|messageId |message id|request param |yes|

Example response:
```
200 OK
  delete success
```

### 6.5 Accept Message
download message by message id.
```
URI： /mec/appstore/v1/messages/{messageId}/action/download
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|messageId |message id|request param |yes|
|request |request body|request param |yes|

Example response:
```
200 OK
  success
```

### 6.6 Update Status
Update message status by message id.
```
URI： /mec/appstore/v1/messages/{messageId}/action/readed
Method: PUT
```

|Name|Definition|type|Required|
|---|---|---|---|
|messageId |message id|request param |yes|

Example response:
```
200 OK
  success
```

## 7. APP Push

User can pull an app from other appstore. 


### 7.1 Query Pull App List
Query the app list which can pull
```
URI： /mec/appstore/v1/packages/pullable
Method: GET
```

Example response:
```
200 OK
[
  {
    "appId": "string",
    "packageId": "string",
    "name": "string",
    "provider": "string",
    "version": "string",
    "atpTestStatus": "string",
    "atpTestTaskId": "string",
    "atpTestReportUrl": "string",
    "latestPushTime": "string",
    "pushTimes": "string",
    "targetPlatform": "string",
    "affinity": "string",
    "shortDesc": "string",
    "industry": "string",
    "type": "string",
    "createTime": "string"
  }
]
```

### 7.2 Get Pull App Packages
Get pull app packages by platfromId.
```
URI： /mec/appstore/v1/packages/{platfromId}/pullable
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|platfromId |external appstore id|path |yes|

Example response:
```
200 OK
[
  {
    "appId": "string",
    "packageId": "string",
    "name": "string",
    "provider": "string",
    "version": "string",
    "atpTestStatus": "string",
    "atpTestTaskId": "string",
    "atpTestReportUrl": "string",
    "latestPushTime": "string",
    "pushTimes": "string",
    "targetPlatform": "string",
    "affinity": "string",
    "shortDesc": "string",
    "industry": "string",
    "type": "string",
    "createTime": "string"
  }
]
```

### 7.3 Pull App Package
Pull app package by packageId
```
URI： /mec/appstore/v1/packages/{packageId}/action/pull
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|packageId |package id|path |yes|
|dto |pull request dto|request param |yes|

Example response:
```
200 OK
  true
```
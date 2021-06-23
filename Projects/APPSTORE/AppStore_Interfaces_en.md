AppStore Interfaces
==============
The document is for the appstore-be project, there are six parts of interfaces in the project.

- [AppStore Interfaces](#appstore-interfaces)
  - [1. APP](#1-APP)
    - [1.1 Get all apps](#11-Get-All-Apps)
    - [1.2 Get one app](#12-Get-One-App)
    - [1.3 Register app](#13-Register App)
    - [1.4 Delete one app](#14-Delete One App)
    - [1.5 Get icon of app](#id7)
    - [1.6 Upload package by segment](#id8)
    - [1.7 Merge app package](#id9)
    - [1.8 Register virtual machine app](#id10)
    - [1.9 Get video of app](#id11)
    - [1.10 Modify hot apps](#id12)
    - [1.11 Get all apps-v2](#id13)
    - [1.12 Get one app-v2](#id14)
    - [1.13 Register app-v2](#id15)
  - [2. Package](#id16)
    - [2.1 Get all packages of app](#id17)
    - [2.2 Get one package](#id18)
    - [2.3 Delete one package](#id19)
    - [2.4 Download one package](#id20)
    - [2.5 Get file content](#id21)
    - [2.6 APP publish](#id22)
    - [2.7 APP test](#id23)
    - [2.8 Get all packages of user](#id24)
    - [2.9 Update app](#id25)
    - [2.10 APP publish-v2](#id26)
    - [2.11 Get all packages of app-v2](#id27)
    - [2.12 Get one package-v2](#id28)
    - [2.13 Get all packages of user-v2](#id29)
  - [3. Comment](#id30)
    - [3.1 Get comments of app](#id31)
    - [3.2 Submit comment to app](#id32)
    - [3.3 Get comments of app-v2](#id33)
  - [4. APP push](#id34)
    - [4.1 Query push app list](#id35)
    - [4.2 Get push app package](#id36)
    - [4.3 Push app package](#id37)
    - [4.4 Download push app package](#id38)
    - [4.5 Download push app icon](#id39)
    - [4.6 Query push app list-v2](#id40)
  - [5. APPStore manager](#id41)
    - [5.1 Add appStore](#id42)
    - [5.2 Delete appStore](#id43)
    - [5.3 Modify appStore](#id44)
    - [5.4 Query appStore List](#id45)
    - [5.5 Query appStore](#id46)
    - [5.6 Query appStore List-v2](#id47)
  - [6. Message](#id48)
    - [6.1 Add message](#id49)
    - [6.2 Get all message](#id50)
    - [6.3 Get message](#id51)
    - [6.4 Delete message](#id52)
    - [6.5 Accept message](#id53)
    - [6.6 Update status](#id54)
    - [6.7 Add message-v2](#id55)
    - [6.8 Get all message-v2](#id56)
  - [7. APP pull](#id457)
    - [7.1 Query pull app list](#id58)
    - [7.2 Get pull app packages](#id59)
    - [7.3 Pull app package](#id60)
    - [7.4 Query pull app lis-v2](#id61)
    - [7.5 Get pull app packages-v2](#id62)


## 1. App

Application is the basic publishing unit of AppStore. 


### 1.1 Get All Apps

Query all application by condition.

```
Resource URI: /mec/appstore/v1/apps
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|name|application name.|request param|yes|
|provider|application provider.|request param|yes|
|type|application type.|request param|yes|
|affinity|application affinity.|request param|yes|
|userId|application creator.|request param|yes|

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
    "status": "string",
    "showType": "string",
    "deployMode": "string",
    "hotApp": false
  }
]
```

### 1.2 Get One App
Query application by application id.
```
Resource URI: /mec/appstore/v1/apps/{appId}
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appId|application id|path|yes|


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
    "userName": "string"
    "status": "string",
    "showType": "string",
    "deployMode": "string",
    "hotApp": false
  }
```

### 1.3 Register App 
Register a application.
```
Resource URI: /mec/appstore/v1/apps
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|userId|user id|request param|yes|
|userName|user name|request param|yes|
|file|package file|request body form|yes|
|icon|application icon file|request body form|yes|
|demoVideo|application demo video file|request body form|no|
|type|application type|request body form|yes|
|shortDesc |short description of input|request body form |yes|
|affinity |application architecture|request body form |yes|
|industry |application industry|request body form |yes|
|testTaskId |test task id|request body form |no|
|showType |show type: public、inner-public、private|request body form |no|
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
Delete a application.
```
Resource URI: /mec/appstore/v1/apps/{appId}
Method: DELETE
```
|Name|Definition|Type|Required|
|---|---|---|---|
|userId|user id|request param |yes|
|userName |application name|request param |yes|
|appId |application id|path |yes|

Example response:
```
200 OK
  "delete App success."
```

### 1.5 Get Icon Of App
Get application icon by application id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/icon
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appId |application id|path |yes|

Example response:
```
200 OK
  binary output.
```

### 1.6 Upload Package by Segment
Upload package by segment.
```
Resource URI: /mec/appstore/v1/apps/upload
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|id|block id|request body form|no|
|chunkNumber|current file block number|request body form|yes|
|chunkSize|block size|request body form|no|
|currentChunkSize|current file block size|request body form|no|
|totalSize|total size|request body form|no|
|identifier |file identifier|request body form|yes|
|filename |file name|request body form|no|
|relativePath |file relative path|request body form|no|
|totalChunks |total blocks|request body form|no|
|type |file type|request body form|no|
|file |package file|request body form|yes|

Example response:
```
200 OK
  {
    "upload package block success"
  }
```

### 1.7 Merge App Package
Merge application package.

```
Resource URI: /mec/appstore/v1/apps/merge
Method: GET
```
|Name|Definition|Type|Required|
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

### 1.8 Register Virtual Machine App 
Register virtual machine application.
```
Resource URI: /mec/appstore/v1/apps/vm-register
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|userId|user id|request param|yes|
|userName|user name|request param|yes|
|fileAddress|package file relative path|request body form|yes|
|icon|application icon file|request body form|yes|
|demoVideo|application demo video file|request body form|no|
|type|application type|request body form|yes|
|shortDesc |short description of input|request body form |yes|
|affinity |application architecture|request body form |yes|
|industry |application industry|request body form |yes|
|testTaskId |test task id|request body form |no|
|showType   |show type: public、inner-public、private | request body form | no |

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

### 1.9 Get App Video
Get application video by application id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/demoVideo
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appId |application id|path |yes|

Example response:
```
200 OK
  binary output.
```

### 1.10 Modify Hot Apps 

Modify if hot application by application ids.

```
Resource URI： /mec/appstore/v2/apps/hotapps
METHOD: PUT
```

| Name  | Definition     | Type | Required |
| ----- | -------------- | ---- | -------- |
| appId | application id | path | yes      |

Example response:

```
200 OK
  "set hot apps success."
```

### 1.11 Get All Apps-v2

Pagination query all applications by condition.

```
Resource URI： /mec/appstore/v2/query/apps
METHOD: POST
```

Request parameters:

| Name           | Definition                  | Type         | Required |
| -------------- | --------------------------- | ------------ | -------- |
| QueryAppReqDto | query application condition | request body | yes      |

QueryAppReqDto

| Name         | Definition                 | Type            | Required |
| ------------ | -------------------------- | --------------- | -------- |
| types        | application types          | List<String>    | no       |
| showType     | application show types     | List<String>    | no       |
| affinity     | application architectures  | List<String>    | no       |
| industry     | application industries     | List<String>    | no       |
| workloadType | application workload types | List<String>    | no       |
| userId       | user id                    | String          | no       |
| status       | application status         | String          | no       |
| appName      | application name           | String          | no       |
| queryCtrl    | query condition            | QueryAppCtrlDto | yes      |

QueryAppCtrlDto

| Name     | Definition                               | Type   | Required |
| -------- | ---------------------------------------- | ------ | -------- |
| limit    | number of queries per page, [1,500]      | int    | yes      |
| offset   | paging query start page, starting from 0 | int    | yes      |
| sortItem | query sort field                         | String | no       |
| sortType | query sorting method, ASC/DESC           | String | no       |

Example response:

```
200 OK
{
    "results": [
        {
            "appId": "string",
            "iconUrl": "string",
            "name": "string",
            "provider": "string",
            "type": "string",
            "shortDesc": "string",
            "showType": "string",
            "createTime": "string",
            "details": "string",
            "downloadCount": int,
            "affinity": "string",
            "industry": "string",
            "contact": "string",
            "score": 5.0,
            "userId": "string",
            "userName": "string",
            "status": "string",
            "deployMode": "string",
            "hotApp": false
        }
    ],
    "limit": 1,
    "offset": 0,
    "total": 9
}
```

### 1.12 Get One App-v2

Query application by application id.

```
Resource URI： /mec/appstore/v2/apps/{appId}
METHOD: GET
```

| Name  | Definition     | Type | Required |
| ----- | -------------- | ---- | -------- |
| appId | application id | path | yes      |


Example response:

```
200 OK
  {
    "data": [
        {
            "appId": "string",
            "iconUrl": "string",
            "name": "string",
            "provider": "string",
            "type": "string",
            "shortDesc": "string",
            "showType": "string",
            "createTime": "string",
            "details": "string",
            "downloadCount": int,
            "affinity": "string",
            "industry": "string",
            "contact": "string",
            "score": 5.0,
            "userId": "string",
            "userName": "string",
            "status": "string",
            "deployMode": "string",
            "hotApp": false
        }
    ],
    "retCode": 0,
    "params": "[string]",
    "message": "string"
}
```

### 1.13 Register App-v2 

Register a application.

```
Resource URI： /mec/appstore/v2/apps
METHOD: POST
```

| Name       | Definition                               | Type              | Required |
| ---------- | ---------------------------------------- | ----------------- | -------- |
| userId     | user id                                  | request param     | yes      |
| userName   | user name                                | request param     | yes      |
| file       | package file                             | request body form | yes      |
| icon       | application icon file                    | request body form | yes      |
| demoVideo  | application demo video file              | request body form | no       |
| type       | application type                         | request body form | yes      |
| shortDesc  | short description of input               | request body form | yes      |
| affinity   | application architecture                 | request body form | yes      |
| industry   | application industry                     | request body form | yes      |
| testTaskId | test task id                             | request body form | no       |
| showType   | show type: public、inner-public、private | request body form | no       |

Example response:

```
200 OK
  {
    "data": {
        "appName": "string",
        "appId": "string",
        "packageId": "string",
        "provider": "string",
        "version": "string"
    },
    "retCode": 0,
    "params": "[string]",
    "message": "string"
  }
```

## 2. Package

Package belong to application, etch application have at least one Package. 


### 2.1 Get All Packages Of App

Query all packages by application id.

```
Resource URI: /mec/appstore/v1/apps/{appId}/packages
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appId |application id |type|yes|
|userId|user id|request param|yes|
|access_token|request token|request header|yes|

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
    "userId": "string",
    "showType": "string",
    "deployMode": "string"
  }
]
```

### 2.2 Get One Package
Query application by application id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appId |application id|path |yes|
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
    "userId": "string",
    "showType": "string",
    "deployMode": "string"
  }
```

### 2.3 Delete One Package
Delete a package of application.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
Method: DELETE
```
|Name|Definition|Type|Required|
|---|---|---|---|
|userId |user id|request param|yes|
|userName |user name|request param|yes|
|appId |application id|path |yes|
|packageId |package id|path |yes|

Example response:
```
200 OK
   delete package success.
```

### 2.4 Download One Package 
Download one package by application id and package id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/download
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appId |application id|path |yes|
|packageId |package id|path |yes|

Example response:
```
200 OK
  binary output.
```

### 2.5 Get File Content
Get file content by application id package id and file path.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/files
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|packageId |package id|path |yes|
|filePath |file path|request body |yes|
|appId |application id|path |yes|

Example response:
```
200 OK
  file content output.
```

### 2.6 App Publish
Publish a application by application id and package id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/publish
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appId |application id|path |yes|
|packageId |package id|path |yes|

Example response:
```

200 OK
  Publish Success.
```

### 2.7 App Test
Test a application by application id and package id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/test
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appId |application id|path |yes|
|packageId |package id|path |yes|
|access_token |request token|request header |yes|

Example response:
```

200 OK
  {
  "atpTaskId": "string",
  "status": "string"
  }
```

### 2.8 Get All Packages of User

Get all packages of user.

```
Resource URI： /mec/appstore/v1/packages
METHOD: GET
```

| Name         | Definition    | Type           | Required |
| ------------ | ------------- | -------------- | -------- |
| ueserId      | user id       | request param  | yes      |
| access_token | request token | request header | yes      |

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
    "userId": "string",
    "showType": "string",
    "deployMode": "string"
  }
]
```

### 2.9 Update App

Update a application by application  id and package id.

```
Resource URI： /mec/appstore/v1/apps/{appId}/package/{packageId}
METHOD: PUT
```

| Name      | Definition                    | Type              | Required |
| --------- | ----------------------------- | ----------------- | -------- |
| appId     | application id                | path              | yes      |
| packageId | package id                    | path              | yes      |
| industry  | application industry          | request body form | no       |
| type      | application type              | request body form | no       |
| icon      | application icon file         | request body form | no       |
| video     | application demo video file   | request body form | no       |
| affinity  | application architecture      | request body form | no       |
| shortDesc | application short description | request body form | no       |
| showType  | application show type         | request body form | no       |

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
    "userId": "string",
    "showType": "string",
    "deployMode": "string"
  }
```

### 2.10 App Publish-v2

Publish a application by application id and package id.

```
Resource URI： /mec/appstore/v2/apps/{appId}/packages/{packageId}/action/publish
METHOD: POST
```

| Name      | Definition     | Type | Required |
| --------- | -------------- | ---- | -------- |
| appId     | application id | path | yes      |
| packageId | package id     | path | yes      |

Example response:

```
200 OK
  Publish Success.
  {
    "data": "Publish Success",
    "retCode": 0,
    "params": "[string]",
    "message": "string"
  }
```

### 2.11 Get Packages of App-v2

Pagination query packages by application id.

```
Resource URI： /mec/appstore/v2/apps/{appId}/packages
METHOD: GET
```

| Name         | Definition                                                   | Type           | Required |
| ------------ | ------------------------------------------------------------ | -------------- | -------- |
| appId        | application id                                               | path           | yes      |
| userId       | user id                                                      | request param  | yes      |
| access_token | request token                                                | request header | yes      |
| limit        | number of queries per page, It is recommended to set a larger value to query all application packages of the application at one time. | request param  | yes      |
| offset       | paging query start page, starting from 0.                    | request param  | yes      |

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
    "userId": "string",
    "showType": "string",
    "deployMode": "string"
  }
]
```

### 2.12 Get One Package-v2

Get one package by application id and package id.

```
Resource URI： /mec/appstore/v2/apps/{appId}/packages/{packageId}
METHOD: GET
```

| Name      | Definition     | Type | Required |
| --------- | -------------- | ---- | -------- |
| appId     | application id | path | yes      |
| packageId | package id     | path | yes      |

Example response:

```
200 OK
  {
    "data":
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
        "userId": "string",
        "showType": "string",
        "deployMode": "string"
    },
    "retCode": 0,
    "params": "[string]",
    "message": "string"
  }
```

### 2.13 Get All Packages of User-v2

Pagination query all packages of user.

```
Resource URI： /mec/appstore/v2/packages
METHOD: GET
```

| Name         | Definition                                | Type           | Required |
| ------------ | ----------------------------------------- | -------------- | -------- |
| ueserId      | user id                                   | request param  | yes      |
| access_token | request token                             | request header | yes      |
| offset       | paging query start page, starting from 0. | request param  | yes      |
| limit        | number of queries per page, [1,500]       | request param  | yes      |
| appName      | application name                          | request param  | no       |
| status       | application status                        | request param  | no       |
| sortType     | query sorting method, ASC/DESC            | request param  | no       |
| sortItem     | query sort field                          | request param  | no       |

Example response:

```
200 OK
{
    "results": [
        {
            "packageId": "string",
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
            "userId": "string",
            "userName": "string",
            "status": "string",
            "shortDesc": "string",
            "showType": "string",
            "testTaskId": "string",
            "provider": "string",
            "demoVideoName": "string",
            "deployMode": "string"
        }
    ],
    "limit": 1,
    "offset": 0,
    "total": 12
}
```

## 3. Comment

User can submit comments to an application. 


### 3.1 Get Comments of App
Get comments by application id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/comments
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appId |application id|path |yes|


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
User submit comment to application by application id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/comments
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|userId |user id|request param |yes|
|userName |user name|request param |yes|
|appId |application id|path |yes|
|entity |comment entity|request body |yes|

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
### 3.3 Get Comments of App-v2

Pagination query comments of application by application id.

```
Resource URI： /mec/appstore/v2/apps/{appId}/comments
METHOD: GET
```

| Name   | Definition                  | Type          | Required |
| ------ | ----------------------- | ------------- | ---- |
| appId  | appliction id      | path          | yes  |
| offset | paging query start page, starting from 0. | request param | yes      |
| limit  | number of queries per page, [1,500]       | request param | yes      |


Example response:

```
200 OK
{
    "results": [
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
    ],
    "limit": 1,
    "offset": 0,
    "total": 1
}
```

## 4. App Push

User can push a application to other. 


### 4.1 Query Push App List
Query the application list which can be pushed.
```
Resource URI： /mec/appstore/v1/packages/pushable
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
Get push application package by package id.
```
Resource URI： /mec/appstore/v1/packages/{packageId}/pushable
Method: GET
```
|Name|Definition|Type|Required|
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
Push a application package by package id
```
Resource URI： /mec/appstore/v1/packages/{packageId}/action/push
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|packageId |package id|path |yes|
|dto |provider list|request param |yes|

Example response:
```
200 OK
  [true, false, true]
```

### 4.4 Download Push App Package
Download push application package by package id
```
Resource URI： /mec/appstore/v1/packages/{packageId}/action/download-package
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|packageId |package id|path |yes|

Example response:
```
200 OK
  binary output.
```

### 4.5 Download Push App Icon
Download push application icon by package id.
```
Resource URI： /mec/appstore/v1/packages/{packageId}/action/download-icon
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|packageId |package id|path |yes|

Example response:
```
200 OK
  binary output.
```

### 4.6 Query Push App List-v2

Pagination query pushable applications.

```
Resource URI： /mec/appstore/v2/packages/pushable
METHOD: GET
```

| Name     | Definition                               | Type          | Required |
| -------- | ---------------------------------------- | ------------- | -------- |
| limit    | number of queries per page, [1,500]      | int           | yes      |
| offset   | paging query start page, starting from 0 | int           | yes      |
| sortItem | query sort field                         | String        | no       |
| sortType | query sorting method, ASC/DESC           | String        | no       |
| appName  | application name                         | request param | no       |

Example response:

```
200 OK
{
    "results": [
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
            "pushTimes": 2,
            "sourcePlatform": "string",
            "targetPlatform": "string",
            "affinity": "string",
            "shortDesc": "string",
            "industry": "string",
            "type": "string",
            "createTime": "string",
            "deployMode": "string"
        }
    ],
    "limit": 1,
    "offset": 0,
    "total": 9
}
```

## 5. AppStore Manager

Add, delete, modify and query the AppStore. 


### 5.1 Add AppStore
Add external AppStore.
```
Resource URI： /mec/appstore/v1/appstores
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appStoreName |appStore name|request param |yes|
|appStoreVersion |appStore version|request param |yes|
|company |company name|request param |yes|
|url |url address|request param |yes|
|schema |schema|request param |no|
|appPushIntf |application push type|request param |no|
|appdTransId |appd trans id|request param |yes|
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
Resource URI： /mec/appstore/v1/appstores/{appStoreId}
Method: DELETE
```
|Name|Definition|Type|Required|
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
Resource URI： /mec/appstore/v1/appstores/{appStoreId}
Method: PUT
```
|Name|Definition|Type|Required|
|---|---|---|---|
|appStoreId |appStore id|path |yes|
|appStoreName |appStore name|request param |yes|
|appStoreVersion |appStore version|request param |yes|
|company |company name|request param |yes|
|url |url address|request param |yes|
|schema |schema|request param |no|
|appPushIntf |application push type|request param |no|
|appdTransId |appd trans id|request param |yes|
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
Resource URI： /mec/appstore/v1/appstores
Method: GET
```
|Name|Definition|Type|Required|
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
Resource URI： /mec/appstore/v1/appstores/{appStoreId}
Method: GET
```
|Name|Definition|Type|Required|
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

### 5.6 Query AppStore List-v2

Pagination query external appStores.

```
Resource URI： /mec/appstore/v2/appstores
METHOD: GET
```

| Name         | Definition                               | Type          | Required |
| ------------ | ---------------------------------------- | ------------- | -------- |
| appStoreName | appStore name                            | request param | yes      |
| company      | company name                             | request param | yes      |
| limit        | number of queries per page, [1,500]      | request param | yes      |
| offset       | paging query start page, starting from 0 | request param | yes      |

Example response:

```
200 OK
{
    "results": [
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
    ],
    "limit": 1,
    "offset": 0,
    "total": 2
}
```

## 6. Message

The message contains information such as application push, download, notice, pull. 


### 6.1 Add Message
Add a application operation message.
```
Resource URI： /mec/appstore/v1/messages
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|basicInfo |basic information|request param |yes|
|sourceAppStore |source appStore|request param |yes|
|targetAppStore |target appStore|request param |yes|
|atpTestStatus |ATP test result|request param |yes|
|atpTestTaskId |ATP test task id|request param |yes|
|atpTestReportUrl |ATP test report url|request param |yes|
|packageDownloadUrl |package download url|request param |yes|
|iconDownloadUrl |application icon download url|request param |yes|

Example response:
```
200 OK
  add a message success
```

### 6.2 Get All Message
Get messages by message type.
```
Resource URI： /mec/appstore/v1/messages
Method: GET
```
|Name|Definition|Type|Required|
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
Resource URI： /mec/appstore/v1/messages/{messageId}
Method: GET
```
|Name|Definition|Type|Required|
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
Resource URI： /mec/appstore/v1/messages/{messageId}
Method: DELETE
```
|Name|Definition|Type|Required|
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
Resource URI： /mec/appstore/v1/messages/{messageId}/action/download
Method: GET
```
|Name|Definition|Type|Required|
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
Resource URI： /mec/appstore/v1/messages/{messageId}/action/readed
Method: PUT
```
|Name|Definition|Type|Required|
|---|---|---|---|
|messageId |message id|request param |yes|

Example response:
```
200 OK
  success
```

### 6.7 Add Message-v2

Add a application operation message.

```
Resource URI： /mec/appstore/v2/messages
METHOD: POST
```

| Name               | Definition                    | Type          | Required |
| ------------------ | ----------------------------- | ------------- | -------- |
| basicInfo          | basic information             | request param | yes      |
| sourceAppStore     | source appStore               | request param | yes      |
| targetAppStore     | target appStore               | request param | yes      |
| atpTestStatus      | ATP test result               | request param | yes      |
| atpTestTaskId      | ATP test task id              | request param | yes      |
| atpTestReportUrl   | ATP test report url           | request param | yes      |
| packageDownloadUrl | package download url          | request param | yes      |
| iconDownloadUrl    | application icon download url | request param | yes      |

Example response:

```
200 OK
  add a message success
  {
    "data": "add a message success",
    "retCode": 0,
    "params": "[string]",
    "message": "string"
  }
```

### 6.8 Get All Message-v2

Get all messages by message type.

```
Resource URI： /mec/appstore/v2/messages
METHOD: GET
```

| Name        | Definition                               | Type          | Required |
| ----------- | ---------------------------------------- | ------------- | -------- |
| messageType | message type                             | request param | no       |
| limit       | number of queries per page, [1,500]      | int           | yes      |
| offset      | paging query start page, starting from 0 | int           | yes      |
| sortItem    | query sort field                         | String        | no       |
| sortType    | query sorting method, ASC/DESC           | String        | no       |
| appName     | application name                         | request param | no       |

Example response:

```
200 OK
{
    "results": [
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
    ],
    "limit": 8,
    "offset": 0,
    "total": 2
}
```

## 7. App Push

User can pull a application from other appstore. 


### 7.1 Query Pull App List
Query the application list which can pull
```
Resource URI： /mec/appstore/v1/packages/pullable
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
Get pull application packages by platform id.
```
Resource URI： /mec/appstore/v1/packages/{platformId}/pullable
Method: GET
```
|Name|Definition|Type|Required|
|---|---|---|---|
|platformId |external appstore id|path |yes|

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
Resource URI： /mec/appstore/v1/packages/{packageId}/action/pull
Method: POST
```
|Name|Definition|Type|Required|
|---|---|---|---|
|packageId |package id|path |yes|
|PullAppReqDto |pull request dto|request param |yes|

PullAppReqDto:

| 字段            | 描述                          | 类型   | 必选 |
| --------------- | ----------------------------- | ------ | ---- |
| sourceStoreId   | source appStore id            | string | yes  |
| sourceStoreName | source appStore name          | string | yes  |
| name            | application name              | string | yes  |
| provider        | application provider          | string | yes  |
| version         | application version           | string | yes  |
| atpTestStatus   | application ATP test status   | string | yes  |
| affinity        | application architecture      | string | yes  |
| shortDesc       | application short description | string | yes  |
| showType        | application show type         | string | yes  |
| industry        | application industry          | string | yes  |
| type            | application type              | string | yes  |
| userId          | user id                       | string | yes  |
| userName        | user name                     | string | yes  |



Example response:

```
200 OK
  true
```

### 7.4 Query Pull App List-v2

Pagination query pullable applications.

```
Resource URI： /mec/appstore/v2/packages/pullable
METHOD: GET
```

| Name     | Definition                               | Type          | Required |
| -------- | ---------------------------------------- | ------------- | -------- |
| limit    | number of queries per page, [1,500]      | int           | yes      |
| offset   | paging query start page, starting from 0 | int           | yes      |
| sortItem | query sort field                         | String        | no       |
| sortType | query sorting method, ASC/DESC           | String        | no       |
| appName  | application name                         | request param | no       |

Example response:

```
200 OK
{
    "results": [
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
    ],
    "limit": 1,
    "offset": 0,
    "total": 2
}
```

### 7.5 Get Pull App Packages-v2

Get pullable application packages by external platform id.

```
Resource URI： /mec/appstore/v2/packages/{platfromId}/pullable
METHOD: GET
```

| Name       | Definition                               | Type          | Required |
| ---------- | ---------------------------------------- | ------------- | -------- |
| platformId | external appStore id                     | path          | yes      |
| limit      | number of queries per page, [1,500]      | int           | yes      |
| offset     | paging query start page, starting from 0 | int           | yes      |
| sortItem   | query sort field                         | String        | no       |
| sortType   | query sorting method, ASC/DESC           | String        | no       |
| appName    | application name                         | request param | no       |

Example response:

```
200 OK
{
    "results": [
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
    ],
    "limit": 1,
    "offset": 0,
    "total": 2
}
```


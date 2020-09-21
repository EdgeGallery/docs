接口设计
==============
文档中介绍了appstore-be模块的接口设计详情，共有三个部分，分别对应于app管理、包管理、评论管理。

- [AppStore 接口列表](#appstore-interfaces)
  - [1. 应用(APP)](#1-app)
    - [1.1 查询应用(APP)列表](#11-get-all-apps)
    - [1.2 获取应用(APP)](#12-get-one-app)
    - [1.3 注册应用(APP)](#13-register-app)
    - [1.4 删除应用(APP)](#14-delete-one-app)
    - [1.5 获取应用(APP)最新版本](#15-get-latest-version-of-app)
    - [1.6 获取应用(APP)图标](#16-get-icon-of-app)
  - [2. 应用包](#2-package)
    - [2.1获取应用(APP)包列表](#21-get-all-packages-of-app)
    - [2.2 获取应用包(Package)](#22-get-one-package)
    - [2.3 删除应用包(Package)](#23-delete-one-package)
    - [2.4 下载应用包(Package)](#24-download-one-package)
    - [2.5 获取文件内容](#25-get-file-content)
  - [3. 评论](#3-comment)
    - [3.1 获取评论列表](#31-get-comments-of-app)
    - [3.2 提交评论](#32-submit-comment-to-app)


## 1. 应用(APP)

应用是应用商店基本的发布单位。


### 1.1 根据条件查询应用(APP)列表

根据入参查询应用(APP)列表。

```
接口URI: /mec/appstore/v1/apps
方法类型: GET
```
请求参数：
|参数名|描述|类型|是否必须|
|---|---|---|---|
|name|应用名|request param|no|
|provider|应用提供商|request param|no|
|type|应用类型|request param|no|
|affinity|亲和性|request param|no|
|userId|应用创建人|request param|no|

响应示例:
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

### 1.2 获取应用(APP)
根据应用ID获取应用详细信息。
```
接口URI: /mec/appstore/v1/apps/{appId}
方法类型: GET
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|appId|应用名|path|yes|


响应示例:
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
  }
```

### 1.3 注册应用(APP) 
注册应用。
```
接口URI: /mec/appstore/v1/apps
方法类型: POST
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|userId|用户ID|request param|yes|
|userName|应用名|request param|yes|
|file|应用包文件|RequestPart|yes|
|icon|应用图标文件|RequestPart|yes|
|type|应用类型|RequestPart|yes|
|shortDesc |应用简述|RequestPart |yes|
|affinity |应用亲和性|RequestPart |yes|
|industry |应用所属行业|RequestPart |yes|

响应示例:
```
200 OK
  "add app and upload package success."
```

### 1.4 删除应用(APP) 
根据应用ID删除应用(APP) 。
```
接口URI: /mec/appstore/v1/apps/{appId}
方法类型: DELETE
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|userId|用户ID|request param |yes|
|userName |应用名|request param |yes|
|appId |应用ID|path |yes|

响应示例:
```
200 OK
  "delete App success."
```

### 1.5 获取应用(APP)最新版本
应用ID获取应用(APP)最新版本包文件。
```
接口URI: /mec/appstore/v1/apps/{appId}/action/download
方法类型: GET
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|userId |用户ID|request param |yes|
|userName |应用名|request param |yes|
|appId |应用ID|path |yes|

响应示例:
```
200 OK
  binary output.
```

### 1.6 获取应用(APP)图标
应用ID获取应用(APP)图标。
```
接口URI: /mec/appstore/v1/apps/{appId}/icon
方法类型: GET
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|userId |用户ID|request param |yes|
|userName |应用名|request param |yes|
|appId |应用ID|path |yes|

响应示例:
```
200 OK
  binary output.
```

## 2. 应用包(Package)

应用包(Package)属于应用(APP)，每个应用(APP)包含至少一个应用包(Package)。


### 2.1获取应用(APP)包列表

通过应用ID获取应用包(Package)列表。
```
接口URI: /mec/appstore/v1/apps/{appId}/packages
方法类型: GET
```


|参数名|描述|类型|是否必须|
|---|---|---|---|
|appId |应用ID |path|yes|

响应示例:
```
200 OK
[
  {
    "csarId": "string",
    "downloadUrl": "string",
    "iconUrl": "string",
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
    "appId": "string"
  }
]
```

### 2.2 获取应用包(Package)
通过应用ID和应用包ID获取应用包。
```
接口URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
方法类型: GET
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|appId |应用ID|path |yes|
|packageId |应用包ID|path |yes|

响应示例:
```
200 OK
  {
    "csarId": "string",
    "downloadUrl": "string",
    "iconUrl": "string",
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
    "appId": "string"
  }
```

### 2.3 删除应用包(Package)
通过应用ID和应用包ID删除应用包。
```
接口URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
方法类型: DELETE
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|appId |应用ID|path |yes|
|packageId |应用包ID|path |yes|

响应示例:
```
200 OK
   delete package success.
```

### 2.4 下载应用包(Package) 
通过应用ID和应用包ID下载应用包。
```
接口URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/download
方法类型: GET
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|appId |应用ID|path |yes|
|packageId |应用包ID|path |yes|

响应示例:
```
200 OK
  binary output.
```

### 2.5 获取文件内容
通过应用ID和应用包ID以及文件路径获取应用包中文件内容。
```
接口URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/files
方法类型: GET
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|userId |用户ID|request param |yes|
|userName |应用名|request param |yes|
|appId |应用ID|path |yes|
|filePath |file path|FormParam |yes|

响应示例:
```
200 OK
  file content output.
```
## 3. 评论

User can submit comments to an app. 


### 3.1 获取评论列表
根据应用ID获取应用(APP)的评论列表。
```
接口URI: /mec/appstore/v1/apps/{appId}/comments
方法类型: GET
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|appId |应用ID|path |yes|


响应示例:
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

### 3.2 提交评论
用户根据应用ID提交应用评分及评论。
```
接口URI: /mec/appstore/v1/apps/{appId}/comments
方法类型: POST
```

|参数名|描述|类型|是否必须|
|---|---|---|---|
|userId |用户ID|request param |yes|
|userName |应用名|request param |yes|
|appId |应用ID|path |yes|
|entity |评论对象|RequestBody |yes|

Example request body:
```
{
  "body": "string",
  "score": 0
}

```


响应示例:
```
200 OK
 "comments success."
```
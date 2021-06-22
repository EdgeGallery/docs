接口设计
==============
文档中介绍了appstore-be模块的接口设计详情，共有六个部分，分别对应于app管理、包管理、评论管理、应用推送、仓库管理、消息中心。

- [AppStore 接口列表](#接口列表)
  - [1. 应用](#1-应用)
    - [1.1 获取应用列表](#11-获取应用列表)
    - [1.2 获取应用](#12-获取应用)
    - [1.3 注册应用](#13-注册应用)
    - [1.4 删除应用](#14-删除应用)
    - [1.5 获取应用图标](#15-获取应用图标)
    - [1.6 分片上传应用包](#16-分片上传应用包)
    - [1.7 合并应用包](#17-合并应用包)
    - [1.8 注册虚机应用](#18-注册虚机应用)
    - [1.9 获取应用视频](#19-获取应用视频)
    - [1.10 修改热门应用](#110-修改热门应用)
    - [1.11 获取应用列表-v2](#111-获取应用列表-v2)
    - [1.12 获取应用-v2](#112-获取应用-v2)
    - [1.13 注册应用-v2](#113-注册应用-v2)
  - [2. 应用包](#2-应用包)
    - [2.1 通过应用ID获取应用包列表](#21-通过应用ID获取应用包列表)
    - [2.2 获取应用包](#22-获取应用包)
    - [2.3 删除应用包](#23-删除应用包)
    - [2.4 下载应用包](#24-下载应用包)
    - [2.5 获取文件内容](#25-获取文件内容)
    - [2.6 应用发布](#26-应用发布)
    - [2.7 应用测试](#27-应用测试)
    - [2.8 获取应用包列表](#28-获取应用包列表)
    - [2.9 修改应用](#29-修改应用)
    - [2.10 应用发布-v2](#210-应用发布-v2)
    - [2.11 通过应用ID获取应用包列表-v2](#211-通过应用ID获取应用包列表-v2)
    - [2.12 获取应用包-v2](#212-获取应用包-v2)
    - [2.13 获取应用包列表-v2](#213-获取应用包列表-v2)
  - [3. 评论](#3-评论)
    - [3.1 获取评论列表](#31-获取评论列表)
    - [3.2 提交评论](#32-提交评论)
    - [3.3 获取评论列表-v2](#33-获取评论列表-v2)
  - [4. 应用推送](#4-应用推送)
    - [4.1 查询可推送应用列表](#41-查询可推送应用列表)
    - [4.2 获取推送应用包](#42-获取推送应用包)
    - [4.3 推送应用包](#43-推送应用包)
    - [4.4 下载推送应用包](#44-下载推送应用包)
    - [4.5 下载推送应用图标](#45-下载推送应用图标)
    - [4.6 查询可推送应用列表-v2](#46-查询可推送应用列表-v2)
  - [5. 仓库管理](#5-仓库管理)
    - [5.1 添加仓库](#51-添加仓库)
    - [5.2 删除仓库](#52-删除仓库)
    - [5.3 修改仓库](#53-修改仓库)
    - [5.4 查询仓库列表](#54-查询仓库列表])
    - [5.5 查询仓库](#55-查询仓库)
    - [5.6 分页查询仓库列表-v2](#56-分页查询仓库列表-v2])
  - [6. 消息](#6-消息)
    - [6.1 添加消息](#61-添加消息)
    - [6.2 获取所有消息](#62-获取所有消息)
    - [6.3 获取消息](#63-获取消息)
    - [6.4 删除消息](#64-删除消息)
    - [6.5 接收消息](#65-接收消息)
    - [6.6 更新状态](#66-更新状态)
    - [6.7 添加消息-v2](#67-添加消息v2)
    - [6.8 获取所有消息-v2](#68-获取所有消息-v2)
  - [7. 应用拉取](#7-应用拉取)
    - [7.1 查询可拉取应用列表](#71-查询可推送应用列表)
    - [7.2 获取外部仓库可拉取应用列表](#72-根据仓库id获取该仓库可拉取应用列表)
    - [7.3 拉取应用包](#73-拉取应用包)
    - [7.4 分页查询可拉取应用列表-v2](#74-分页查询可推送应用列表-v2)
    - [7.5 获取外部仓库可拉取应用列表-v2](#75-根据仓库id获取该仓库可拉取应用列表-v2)



## 1. 应用

应用是应用商店基本的发布单位。


### 1.1 获取应用列表

根据入参查询应用列表。

```
URI： /mec/appstore/v1/apps
METHOD: GET
```
请求参数：
|名称|描述|IN|必选|
|---|---|---|---|
|name|应用名|request param|yes|
|provider|应用提供商|request param|yes|
|type|应用类型|request param|yes|
|affinity|架构|request param|yes|
|userId|应用创建人|request param|yes|

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
    "userName": "string",
    "status": "string",
    "showType": "string",
    "deployMode": "string",
    "hotApp": false
  }
]
```

### 1.2 获取应用
根据应用ID获取应用详细信息。
```
URI： /mec/appstore/v1/apps/{appId}
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|appId|app id|path|yes|


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
    "status": "string",
    "showType": "string",
    "deployMode": "string",
    "hotApp": false
  }
```

### 1.3 注册应用 
注册应用。
```
URI： /mec/appstore/v1/apps
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|userId|用户ID|request param|yes|
|userName|用户名|request param|yes|
|file|应用包文件|request body form|yes|
|icon|应用图标文件|request body form|yes|
|demoVideo|应用视频文件|request body form|no|
|type|应用类型|request body form|yes|
|shortDesc |应用简述|request body form |yes|
|affinity |架构|request body form |yes|
|industry |应用所属行业|request body form |yes|
|testTaskId |测试任务id|request body form |no|
|showType |显示类型：public、inner-public、private|request body form |no|

响应示例:
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

### 1.4 删除应用 
根据应用ID删除应用。
```
URI： /mec/appstore/v1/apps/{appId}
METHOD: DELETE
```
|名称|描述|IN|必选|
|---|---|---|---|
|userId|用户ID|request param |yes|
|userName |应用名|request param |yes|
|appId |应用ID|path |yes|

响应示例:
```
200 OK
  "delete App success."
```

### 1.5 获取应用图标

根据应用ID获取应用图标。
```
URI： /mec/appstore/v1/apps/{appId}/icon
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|appId |应用ID|path |yes|

响应示例:
```
200 OK
  binary output.
```

### 1.6 分片上传应用包
分片上传应用包。
```
URI： /mec/appstore/v1/apps/upload
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|id|分包ID|request body form|no|
|chunkNumber|当前文件块编号|request body form|yes|
|chunkSize|分块大小|request body form|no|
|currentChunkSize|当前分块大小|request body form|no|
|totalSize|总大小|request body form|no|
|identifier |文件表示|request body form|yes|
|filename |文件名|request body form|no|
|relativePath |文件相对路径|request body form|no|
|totalChunks |总块数|request body form|no|
|type |文件类型|request body form|no|
|file |文件|request body form|yes|

响应示例:
```
200 OK
  {
    "upload package block success"
  }
```

### 1.7 合并应用包
合并应用包。
```
URI： /mec/appstore/v1/apps/merge
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|fileName|文件名|request param|yes|
|guid|文件标识|request param|yes|

响应示例:
```
200 OK
  {
    "file address"
  }
```

### 1.8 注册虚机应用 
注册虚机应用。
```
URI： /mec/appstore/v1/apps/vm-register
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|userId|用户ID|request param|yes|
|userName|应用名|request param|yes|
|fileAddress|应用包文件相对路径|request body form|yes|
|icon|应用图标文件|request body form|yes|
|demoVideo|应用视频文件|request body form|no|
|type|应用类型|request body form|yes|
|shortDesc |应用简述|request body form |yes|
|affinity |架构|request body form |yes|
|industry |应用所属行业|request body form |yes|
|testTaskId |测试任务id|request body form |no|
|showType   |显示类型：public、inner-public、private | request body form | no |

响应示例:
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

### 1.9 获取应用视频
根据应用ID获取应用视频。
```
URI： /mec/appstore/v1/apps/{appId}/demoVideo
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|appId |应用ID|path |yes|

响应示例:
```
200 OK
  binary output.
```

### 1.10 修改热门应用 

根据应用ID更改应用是否为热门应用。

```
URI： /mec/appstore/v2/apps/hotapps
METHOD: PUT
```

| 名称  | 描述   | IN   | 必选 |
| ----- | ------ | ---- | ---- |
| appId | 应用ID | path | yes  |

响应示例:

```
200 OK
  "set hot apps success."
```

### 1.11 获取应用列表-v2

分页查询应用列表。

```
URI： /mec/appstore/v2/query/apps
METHOD: POST
```

请求参数：

| 名称           | 描述         | IN           | 必选 |
| -------------- | ------------ | ------------ | ---- |
| QueryAppReqDto | 查询应用条件 | request body | yes  |

QueryAppReqDto

| 字段名       | 描述         | 字段类型        | 必选 |
| ------------ | ------------ | --------------- | ---- |
| types        | 应用类型     | List<String>    | no   |
| showType     | 应用显示类型 | List<String>    | no   |
| affinity     | 应用架构     | List<String>    | no   |
| industry     | 应用行业     | List<String>    | no   |
| workloadType | 应用负载类型 | List<String>    | no   |
| userId       | 用户Id       | String          | no   |
| status       | 应用状态     | String          | no   |
| appName      | 应用名称     | String          | no   |
| queryCtrl    | 查询条件     | QueryAppCtrlDto | yes  |

QueryAppCtrlDto

| 字段名   | 描述                        | 字段类型 | 必选 |
| -------- | --------------------------- | -------- | ---- |
| limit    | 分页查询每页查询数量[1,500] | int      | yes  |
| offset   | 分页查询起始页，从0开始     | int      | yes  |
| sortItem | 查询排序字段                | String   | no   |
| sortType | 查询排序方式，升序/降序     | String   | no   |

响应示例:

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

### 1.12 获取应用-v2

根据应用ID获取应用详细信息。

```
URI： /mec/appstore/v2/apps/{appId}
METHOD: GET
```

| 名称  | 描述   | IN   | 必选 |
| ----- | ------ | ---- | ---- |
| appId | app id | path | yes  |


响应示例:

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

### 1.13 注册应用-v2 

注册应用。

```
URI： /mec/appstore/v2/apps
METHOD: POST
```

| 名称       | 描述                                    | IN                | 必选 |
| ---------- | --------------------------------------- | ----------------- | ---- |
| userId     | 用户ID                                  | request param     | yes  |
| userName   | 应用名                                  | request param     | yes  |
| file       | 应用包文件                              | request body form | yes  |
| icon       | 应用图标文件                            | request body form | yes  |
| demoVideo  | 应用视频文件                            | request body form | no   |
| type       | 应用类型                                | request body form | yes  |
| shortDesc  | 应用简述                                | request body form | yes  |
| affinity   | 架构                                    | request body form | yes  |
| industry   | 应用所属行业                            | request body form | yes  |
| testTaskId | 测试任务id                              | request body form | no   |
| showType   | 显示类型：public、inner-public、private | request body form | no   |

响应示例:

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

## 2. 应用包

应用包属于应用，每个应用包含至少一个应用包。


### 2.1 通过应用ID获取应用包列表

通过应用ID获取应用包列表。
```
URI： /mec/appstore/v1/apps/{appId}/packages
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|appId |应用ID |path|yes|
|userId|用户ID|request param|yes|
|access_token|请求token|request header|yes|

响应示例:
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

### 2.2 获取应用包
通过应用ID和应用包ID获取应用包。
```
URI： /mec/appstore/v1/apps/{appId}/packages/{packageId}
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|appId |应用ID|path |yes|
|packageId |应用包ID|path |yes|

响应示例:
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

### 2.3 删除应用包
通过应用ID和应用包ID删除应用包。
```
URI： /mec/appstore/v1/apps/{appId}/packages/{packageId}
METHOD: DELETE
```
|名称|描述|IN|必选|
|---|---|---|---|
|userId |用户Id|request param|yes|
|userName |用户名|request param|yes|
|appId |应用ID|path |yes|
|packageId |应用包ID|path |yes|

响应示例:
```
200 OK
   delete package success.
```

### 2.4 下载应用包 
通过应用ID和应用包ID下载应用包。
```
URI： /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/download
METHOD: GET
```
|名称|描述|IN|必选|
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
URI： /mec/appstore/v1/apps/{appId}/packages/{packageId}/files
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|packageId |package id|path |yes|
|filePath |file path|request body |yes|
|appId |应用ID|path |yes|

响应示例:
```
200 OK
  file content output.
```

### 2.6 应用发布
通过应用ID和应用包ID发布应用。
```
URI： /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/publish
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|appId |应用ID|path |yes|
|packageId |应用包ID|path |yes|

响应示例:
```
200 OK
  Publish Success.
```

### 2.7 应用测试
通过应用ID和应用包ID测试应用。
```
URI： /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/test
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|appId |应用ID|path |yes|
|packageId |应用包ID|path |yes|
|access_token |请求token|request header |yes|

响应示例:
```
200 OK
  {
  "atpTaskId": "string",
  "status": "string"
  }
```

### 2.8 获取应用包列表

通过用户ID获取应用包列表。

```
URI： /mec/appstore/v1/packages
METHOD: GET
```

| 名称         | 描述      | IN             | 必选 |
| ------------ | --------- | -------------- | ---- |
| ueserId      | 用户id    | request param  | yes  |
| access_token | 请求token | request header | yes  |

响应示例:

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

### 2.9 修改应用

通过应用ID和应用包ID修改应用。

```
URI： /mec/appstore/v1/apps/{appId}/package/{packageId}
METHOD: PUT
```

| 名称      | 描述         | IN                | 必选 |
| --------- | ------------ | ----------------- | ---- |
| appId     | 应用ID       | path              | yes  |
| packageId | 应用包ID     | path              | yes  |
| industry  | 应用行业     | request body form | no   |
| type      | 应用类型     | request body form | no   |
| icon      | 应用图标     | request body form | no   |
| video     | 应用视频     | request body form | no   |
| affinity  | 应用架构     | request body form | no   |
| shortDesc | 应用描述     | request body form | no   |
| showType  | 应用显示类型 | request body form | no   |

响应示例:

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

### 2.10 应用发布-v2

通过应用ID和应用包ID发布应用。

```
URI： /mec/appstore/v2/apps/{appId}/packages/{packageId}/action/publish
METHOD: POST
```

| 名称      | 描述     | IN   | 必选 |
| --------- | -------- | ---- | ---- |
| appId     | 应用ID   | path | yes  |
| packageId | 应用包ID | path | yes  |

响应示例:

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

### 2.11 通过应用ID获取应用包列表-v2

通过应用ID分页查询应用包列表。

```
URI： /mec/appstore/v2/apps/{appId}/packages
METHOD: GET
```

| 名称         | 描述                                                         | IN             | 必选 |
| ------------ | ------------------------------------------------------------ | -------------- | ---- |
| appId        | 应用ID                                                       | path           | yes  |
| userId       | 用户ID                                                       | request param  | yes  |
| access_token | 请求token                                                    | request header | yes  |
| limit        | 分页查询每页查询数量，建议设置较大值，一次性查询完该应用的所有应用包 | request param  | yes  |
| offset       | 分页查询起始页，从0开始                                      | request param  | yes  |

响应示例:

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

### 2.12 获取应用包-v2

通过应用ID和应用包ID获取应用包。

```
URI： /mec/appstore/v2/apps/{appId}/packages/{packageId}
METHOD: GET
```

| 名称      | 描述     | IN   | 必选 |
| --------- | -------- | ---- | ---- |
| appId     | 应用ID   | path | yes  |
| packageId | 应用包ID | path | yes  |

响应示例:

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

### 2.13 获取应用包列表-v2

分页获取应用包列表。

```
URI： /mec/appstore/v2/packages
METHOD: GET
```

| 名称         | 描述                        | IN             | 必选 |
| ------------ | --------------------------- | -------------- | ---- |
| ueserId      | 用户id                      | request param  | yes  |
| access_token | 请求token                   | request header | yes  |
| offset       | 分页查询起始页，从0开始     | request param  | yes  |
| limit        | 分页查询每页查询数量[1,500] | request param  | yes  |
| appName      | 应用名称                    | request param  | no   |
| status       | 应用状态                    | request param  | no   |
| sortType     | 查询排序方式，升序/降序     | request param  | no   |
| sortItem     | 查询排序字段                | request param  | no   |

响应示例:

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

## 3. 评论

用户可以评论应用. 


### 3.1 获取评论列表
根据应用ID获取应用的评论列表。
```
URI： /mec/appstore/v1/apps/{appId}/comments
METHOD: GET
```
|名称|描述|IN|必选|
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
URI： /mec/appstore/v1/apps/{appId}/comments
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|userId |用户ID|request param |yes|
|userName |应用名|request param |yes|
|appId |应用ID|path |yes|
|entity |评论内容和打分| request body  |yes|

entity请求体示例:
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

### 3.3 获取评论列表-v2

根据应用ID分页获取应用的评论列表。

```
URI： /mec/appstore/v2/apps/{appId}/comments
METHOD: GET
```

| 名称   | 描述                    | IN            | 必选 |
| ------ | ----------------------- | ------------- | ---- |
| appId  | 应用ID                  | path          | yes  |
| offset | 分页查询起始页，从0开始 | request param | yes  |
| limit  | 分页查询每页查询数量[1,500]    | request param | yes  |


响应示例:

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

## 4. 应用推送

用户可以推送应用到运营商或第三方。 


### 4.1 查询可推送应用列表
查询可推送的应用列表。
```
URI： /mec/appstore/v1/packages/pushable
METHOD: GET
```

响应示例:
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

### 4.2 获取推送应用包
根据packageId获取推送应用包。
```
URI： /mec/appstore/v1/packages/{packageId}/pushable
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|packageId |应用包ID|path |yes|

响应示例:
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

### 4.3 推送应用包
根据packageId推送应用包。
```
URI： /mec/appstore/v1/packages/{packageId}/action/push
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|packageId |应用包ID|path |yes|
|dto |运营商列表|request param |yes|

响应示例:
```
200 OK
  [true, false, true]
```

### 4.4 下载推送应用包
根据packageId下载推送应用包。
```
URI： /mec/appstore/v1/packages/{packageId}/action/download-package
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|packageId |应用包ID|path |yes|

响应示例:
```
200 OK
  binary output.
```

### 4.5 下载推送应用图标
根据packageId下载推送应用图标。
```
URI： /mec/appstore/v1/packages/{packageId}/action/download-icon
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|packageId |应用包ID|path |yes|

响应示例:
```
200 OK
  binary output.
```

### 4.6 查询可推送应用列表-v2

分页查询可推送的应用列表。

```
URI： /mec/appstore/v2/packages/pushable
METHOD: GET
```

| 名称     | 描述                        | IN            | 必选 |
| -------- | --------------------------- | ------------- | ---- |
| limit    | 分页查询每页查询数量[1,500] | request param | yes  |
| offset   | 分页查询起始页，从0开始     | request param | yes  |
| sortItem | 查询排序字段                | request param | no   |
| sortType | 查询排序方式，升序/降序     | request param | no   |
| appName  | 应用名称                    | request param | no   |

响应示例:

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

## 5. 仓库管理

对应用仓库的增删改查。 


### 5.1 添加仓库
新增外部应用仓库。
```
URI： /mec/appstore/v1/appstores
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|appStoreName |仓库名称|request param |yes|
|appStoreVersion |仓库版本|request param |yes|
|company |公司名称|request param |yes|
|url |访问地址|request param |yes|
|schema |访问协议|request param |no|
|appPushIntf |推送方式|request param |no|
|appdTransId |转换器id|request param |yes|
|description |描述|request param |no|

响应示例:
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

### 5.2 删除仓库
删除外部应用仓库。
```
URI： /mec/appstore/v1/appstores/{appStoreId}
METHOD: DELETE
```
|名称|描述|IN|必选|
|---|---|---|---|
|appStoreId |仓库id|path |yes|

响应示例:
```
200 OK
  delete success
```

### 5.3 修改仓库
修改外部应用仓库。
```
URI： /mec/appstore/v1/appstores/{appStoreId}
METHOD: PUT
```
|名称|描述|IN|必选|
|---|---|---|---|
|appStoreId |仓库名称|path |yes|
|appStoreName |仓库名称|request param |yes|
|appStoreVersion |仓库版本|request param |yes|
|company |公司名称|request param |yes|
|url |访问地址|request param |yes|
|schema |访问协议|request param |no|
|appPushIntf |推送方式|request param |no|
|appdTransId |转换器id|request param |yes|
|description |描述|request param |no|

响应示例:
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

### 5.4 查询仓库列表
查询外部应用仓库列表。
```
URI： /mec/appstore/v1/appstores
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|appStoreName |仓库名称|request param |yes|
|company |公司名称|request param |yes|

响应示例:
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

### 5.5 查询仓库
查询外部应用仓库。
```
URI： /mec/appstore/v1/appstores/{appStoreId}
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|appStoreId |仓库名称|path |yes|

响应示例:
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

### 5.6 分页查询仓库列表-v2

分页查询外部应用仓库列表。

```
URI： /mec/appstore/v2/appstores
METHOD: GET
```

| 名称         | 描述                        | IN            | 必选 |
| ------------ | --------------------------- | ------------- | ---- |
| appStoreName | 仓库名称                    | request param | yes  |
| company      | 公司名称                    | request param | yes  |
| limit        | 分页查询每页查询数量[1,500] | request param | yes  |
| offset       | 分页查询起始页，从0开始     | request param | yes  |

响应示例:

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

## 6. 消息

消息包含应用推送、下载、通知等信息。 


### 6.1 添加消息
新增一条消息。
```
URI： /mec/appstore/v1/messages
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|basicInfo |基本信息|request param |yes|
|sourceAppStore |源AppStore|request param |yes|
|targetAppStore |目标AppStore|request param |yes|
|atpTestStatus |ATP测试结果|request param |yes|
|atpTestTaskId |ATP测试任务Id|request param |yes|
|atpTestReportUrl |ATP测试报告|request param |yes|
|packageDownloadUrl |应用包下载地址|request param |yes|
|iconDownloadUrl |应用图标下载地址|request param |yes|

响应示例:
```
200 OK
  add a message success
```

### 6.2 获取所有消息
根据消息类型获取消息。
```
URI： /mec/appstore/v1/messages
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|messageType |消息类型|request param |no|

响应示例:
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

### 6.3 获取消息
根据message id获取消息。
```
URI： /mec/appstore/v1/messages/{messageId}
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|messageId |消息id|request param |yes|

响应示例:
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

### 6.4 删除消息
根据message id删除消息。
```
URI： /mec/appstore/v1/messages/{messageId}
METHOD: DELETE
```
|名称|描述|IN|必选|
|---|---|---|---|
|messageId |消息id|request param |yes|

响应示例:
```
200 OK
  delete success
```

### 6.5 接收消息
根据message id下载app相关信息。
```
URI： /mec/appstore/v1/messages/{messageId}/action/download
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|messageId |消息id|request param |yes|
|request |请求体|request param |yes|

响应示例:
```
200 OK
  success
```

### 6.6 更新状态
根据message id更新消息状态。
```
URI： /mec/appstore/v1/messages/{messageId}/action/readed
METHOD: PUT
```
|名称|描述|IN|必选|
|---|---|---|---|
|messageId |消息id|request param |yes|

响应示例:
```
200 OK
  success
```

### 6.7 添加消息-v2

新增一条消息。

```
URI： /mec/appstore/v2/messages
METHOD: POST
```

| 名称               | 描述             | IN            | 必选 |
| ------------------ | ---------------- | ------------- | ---- |
| basicInfo          | 基本信息         | request param | yes  |
| sourceAppStore     | 源AppStore       | request param | yes  |
| targetAppStore     | 目标AppStore     | request param | yes  |
| atpTestStatus      | ATP测试结果      | request param | yes  |
| atpTestTaskId      | ATP测试任务Id    | request param | yes  |
| atpTestReportUrl   | ATP测试报告      | request param | yes  |
| packageDownloadUrl | 应用包下载地址   | request param | yes  |
| iconDownloadUrl    | 应用图标下载地址 | request param | yes  |

响应示例:

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

### 6.8 获取所有消息-v2

根据消息类型获取消息。

```
URI： /mec/appstore/v2/messages
METHOD: GET
```

| 名称        | 描述                        | IN            | 必选 |
| ----------- | --------------------------- | ------------- | ---- |
| messageType | 消息类型                    | request param | no   |
| limit       | 分页查询每页查询数量[1,500] | request param | yes  |
| offset      | 分页查询起始页，从0开始     | request param | yes  |
| sortItem    | 查询排序字段                | request param | no   |
| sortType    | 查询排序方式，升序/降序     | request param | no   |
| appName     | 应用名称                    | request param | no   |

响应示例:

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

## 7. 应用拉取

用户可以从运营商或第三方仓库拉取应用。 


### 7.1 查询可拉取应用列表
查询可拉取的应用列表。
```
URI： /mec/appstore/v1/packages/pullable
METHOD: GET
```

响应示例:
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

### 7.2 获取外部应用仓库可拉取应用列表
根据platfromId获取外部仓库可拉取应用列表。
```
URI： /mec/appstore/v1/packages/{platformId}/pullable
METHOD: GET
```
|名称|描述|IN|必选|
|---|---|---|---|
|platformId |外部应用仓库ID|path |yes|

响应示例:
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

### 7.3 拉取应用包
根据packageId拉取应用包。
```
URI： /mec/appstore/v1/packages/{packageId}/action/pull
METHOD: POST
```
|名称|描述|IN|必选|
|---|---|---|---|
|packageId |应用包ID|path |yes|
|PullAppReqDto |拉取请求结构|request body |yes|

PullAppReqDto：

| 字段            | 描述           | 类型   | 必选 |
| --------------- | -------------- | ------ | ---- |
| sourceStoreId   | 源仓库平台ID   | string | yes  |
| sourceStoreName | 源仓库平台名称 | string | yes  |
| name            | 应用名称       | string | yes  |
| provider        | 应用供应商     | string | yes  |
| version         | 应用版本       | string | yes  |
| atpTestStatus   | 应用测试状态   | string | yes  |
| affinity        | 应用架构       | string | yes  |
| shortDesc       | 应用描述       | string | yes  |
| showType        | 应用显示类型   | string | yes  |
| industry        | 应用行业       | string | yes  |
| type            | 应用类型       | string | yes  |
| userId          | 用户ID         | string | yes  |
| userName        | 用户名称       | string | yes  |

响应示例:

```
200 OK
  true
```

### 7.4 分页查询可拉取应用列表-v2

分页查询可拉取的应用列表。

```
URI： /mec/appstore/v2/packages/pullable
METHOD: GET
```

| 名称     | 描述                        | IN            | 必选 |
| -------- | --------------------------- | ------------- | ---- |
| limit    | 分页查询每页查询数量[1,500] | request param | yes  |
| offset   | 分页查询起始页，从0开始     | request param | yes  |
| sortItem | 查询排序字段                | request param | no   |
| sortType | 查询排序方式，升序/降序     | request param | no   |
| appName  | 应用名称                    | request param | no   |

响应示例:

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

### 7.5 获取外部应用仓库可拉取应用列表-v2

根据platfromId获取外部仓库可拉取应用列表。

```
URI： /mec/appstore/v2/packages/{platfromId}/pullable
METHOD: GET
```

| 名称       | 描述                        | IN            | 必选 |
| ---------- | --------------------------- | ------------- | ---- |
| platformId | 外部应用仓库ID              | path          | yes  |
| limit      | 分页查询每页查询数量[1,500] | request param | yes  |
| offset     | 分页查询起始页，从0开始     | request param | yes  |
| sortItem   | 查询排序字段                | request param | no   |
| sortType   | 查询排序方式，升序/降序     | request param | no   |
| appName    | 应用名称                    | request param | no   |

响应示例:

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


Developer Interfaces
==============
- [Developer Interfaces](#developer-interfaces)
- [Developer-Server](#Developer-server)
  - [1. Plugin](#1-plugin)
    - [1.1 POST upload plugin](#11-post-upload-plugin)
    - [1.2 GET all](#12-get-all)
    - [1.3 DELETE one](#13-delete-one)
	- [1.4 GET download plugin](#14-get-download-plugin)
	- [1.5 GET download logo](#15-get-download-logo)
	- [1.6 GET download plugin](#16-get-download-api)
	- [1.7 PUT update plugin](#17-put-update-plugin)
	- [1.8 PUT mark plugin](#18-put-mark-plugin)
  - [2. App](#2-app)
       - [2.1 POST upload app](#21-post-upload-app)
       - [2.2 GET all test task](#22-get-all-test-task)
       - [2.3 GET all app tags](#23-get-all-app-tags)
       - [2.4 POST upload app to store](#24-post-upload-app-to-store)
       - [2.5 GET start test](#25-get-start-test)
       - [2.6 GET subtask list](#26-get-subtask-list)

 

# Developer-Server
This section cover the Developer-Server interfaces.

## 1. Plugin

### 1.1 POST upload plugin 
Upload one plugin with some params.
```
Resource URI: /mec/developer/v1/plugins/
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| pluginFile | plugin file|request part|yes|
| logoFile | plugin logo file |request part|yes|
| apiFile | plugin api file |request part|yes|
| pluginName | plugin name |request param|yes|
| codeLanguage | language represented by the plugin |request param|yes|
| pluginType | 1 plugin 2 sdk |request param|yes|
| version | plugin version |request param|yes|
| introduction | plugin brief |request param|yes|
| userId | the author's id of upload plugin |request param|yes|
| userName | the author's name of upload plugin |request param|yes|

Example response:
```
200 OK
{
  "pluginId": "string",
  "pluginName": "string",
  "introduction": "string",
  "satisfaction": 0,
  "codeLanguage": "string",
  "pluginType": "string",
  "version": "string",
  "scoreCount": 0,
  "downloadCount": 0,
  "logoFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "name": "string",
    "size": 0
  },
  "pluginFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "name": "string",
    "size": 0
  },
  "uploadTime": "2020-09-11T03:26:42.140Z",
  "user": {
    "userId": "string",
    "userName": "string"
  },
  "apiFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "name": "string",
    "size": 0
  }
}
```

### 1.2 GET all
Query all plugin or sdk
```
Resource URI: /mec/appstore/v1/plugins/
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| pluginType | plugin type|request param | yes|
| limit | the max count of one page|request param | yes|
| offset | start index of the page|request param | yes|

Example response:
```
200 OK
 {
  "results": [
    {}
  ],
  "limit": 0,
  "offset": 0,
  "total": 0
}
```

### 1.3 DELETE one 
Delete one plugin by pluginId
```
Resource URI: /mec/appstore/v1/plugins/{pluginId}
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| pluginId | plugin id|path param | yes|

Example response:
```
200 OK
  true
```

### 1.4 GET download plugin 
download one plugin
```
Resource URI: /mec/appstore/v1/plugins/{pluginId}/action/download
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| pluginId | plugin id|path param | yes|

Example response:
```
200 OK
  binary output.
```

### 1.5 GET download logo
download plugin's logo file
```
Resource URI: /mec/appstore/v1/plugins/{pluginId}/action/get-logofile
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| pluginId | plugin id|path param | yes|

Example response:
```
200 OK
  binary output.
```
### 1.6 GET download api
download plugin's api file
```
Resource URI: /mec/appstore/v1/plugins/{pluginId}/action/get-apifile
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| pluginId | plugin id|path param | yes|

Example response:
```
200 OK
  binary output.
```
### 1.7 PUT update plugin
update api by id
```
Resource URI: /mec/appstore/v1/plugins/{pluginId}
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| pluginId | plugin id|path param | yes|
| pluginFile | plugin file|request part|no|
| logoFile | plugin logo file |request part|no|
| apiFile | plugin api file |request part|no|
| pluginName | plugin name |request part|no|
| codeLanguage | language represented by the plugin |request part|no|
| pluginType | 1 plugin 2 sdk |request part|no|
| version | plugin version |request part|no|
| introduction | plugin brief |request part|no|

Example response:
```
200 OK
 {
  "pluginId": "string",
  "pluginName": "string",
  "introduction": "string",
  "satisfaction": 0,
  "codeLanguage": "string",
  "pluginType": "string",
  "version": "string",
  "scoreCount": 0,
  "downloadCount": 0,
  "logoFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "name": "string",
    "size": 0
  },
  "pluginFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "name": "string",
    "size": 0
  },
  "uploadTime": "2020-09-11T03:40:03.789Z",
  "user": {
    "userId": "string",
    "userName": "string"
  },
  "apiFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "name": "string",
    "size": 0
  }
}
```
### 1.8 PUT mark plugin
update plugin satisfaction by pluginId
```
Resource URI: /mec/appstore/v1/plugins/{pluginId}/action/score
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| pluginId | plugin id|path param | yes|
| score|plugin satisfaction|request param|yes|
| userId | rater id |request param|yes|
| userName | rater name |request param|yes|

Example response:
```
200 OK
 {
  "pluginId": "string",
  "pluginName": "string",
  "introduction": "string",
  "satisfaction": 0,
  "codeLanguage": "string",
  "pluginType": "string",
  "version": "string",
  "scoreCount": 0,
  "downloadCount": 0,
  "logoFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "name": "string",
    "size": 0
  },
  "pluginFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "name": "string",
    "size": 0
  },
  "uploadTime": "2020-09-11T06:14:56.484Z",
  "user": {
    "userId": "string",
    "userName": "string"
  },
  "apiFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "name": "string",
    "size": 0
  }
}
```

## 2. App

### 2.1 POST upload app 
Upload app with some params.
```
Resource URI: /mec/developer/v1/apps/
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appFile | app file|request part|yes|
| logoFile | app logo file |request part|yes|
| affinity | app affinity |request param|yes|
| industry | app industry |request param|yes|
| type | app type|request param|yes|
| appDesc | app brief |request param|yes|
| userId | the author id of upload app |request param|yes|

Example response:
```
200 OK
{
  "appId": "string",
  "appName": "string",
  "appFile": "string",
  "logoFile": "string",
  "affinity": "string",
  "industry": "string",
  "appDesc": "string",
  "uploadTime": "2020-09-11T06:26:46.351Z",
  "userId": "string",
  "appVersion": "string",
  "type": "string",
  "task": {
    "taskId": "string",
    "taskNo": "string",
    "status": "string",
    "beginTime": "2020-09-11T06:26:46.351Z",
    "endTime": "2020-09-11T06:26:46.351Z",
    "appId": "string"
  }
}
```

### 2.2 GET all test task 
Query all test task by condtions
```
Resource URI: /mec/developer/v1/apps/
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appName | app name|request param|no|
| status | test task status |request param|no|
| beginTime | task begin time |request param|no|
| endTime | task end time |request param|no|
| userId | the author id of upload app |request param|yes|

Example response:
```
200 OK
{
  "tasks": [
    {
      "taskId": "string",
      "taskNo": "string",
      "status": "string",
      "beginTime": "2020-09-11T06:26:46.351Z",
      "endTime": "2020-09-11T06:26:46.351Z",
      "appId": "string"
    }
  ]
}
```

### 2.3 GET all app tags 
Query app function tags
```
Resource URI: /mec/developer/v1/apps/tags
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|


Example response:
```
200 OK
{
  "tasks": [
    {
      "taskId": "string",
      "taskNo": "string",
      "status": "string",
      "beginTime": "2020-09-11T06:26:46.351Z",
      "endTime": "2020-09-11T06:26:46.351Z",
      "appId": "string"
    }
  ]
}
```

### 2.4 POST upload app to store 
upload app to store
```
Resource URI: /mec/developer/v1/apps/{appId}/action/upload
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appId | app id|path param|yes|
| userId | the author name of upload app |request param|yes|
| userName | the author name of upload app|request param|yes|

Example response:
```
200 OK
"csar id"
```

### 2.5 GET start test 
start to test app
```
Resource URI: /mec/developer/v1/apps/{appId}/action/start-test
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appId | app id|path param|yes|
| userId | the author name of upload app |request param|yes|

Example response:
```
200 OK
true
```

### 2.6 GET subtask list 
query test subtask list
```
Resource URI: /mec/developer/v1/apps/{appId}/task/{taskId}/subtasks
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appId | app id|path param|yes|
| taskId | main task id |path param|yes|

Example response:
```
200 OK
{
  "subTasks": [
    {
      "executionid": "string",
      "taskid": "string",
      "testcaseid": 0,
      "status": "string",
      "parameters": "string"
    }
  ]
}
```
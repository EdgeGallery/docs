Developer Interfaces
==============
- [Developer Interfaces](#developer-interfaces)
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
  - [3. App Project](#3-app-project)
       - [3.1 GET all project](#31-get-all-project)
       - [3.2 GET one project](#32-get-one-project)
       - [3.3 POST create one project](#33-post-create-one-project)
       - [3.4 DELETE one project](#34-delete-one-project)
       - [3.5 PUT modify one project](#35-put-modify-one-project)
	- [3.6 POST deploy one project](#36-post-deploy-one-project)
	- [3.7 POST clean test env](#37-post-clean-test-env)
	- [3.8 POST create test config](#38-post-create-test-config)
	- [3.9 PUT modify test config](#39-put-modify-test-config)
	- [3.10 GET one test-config](#310-get-one-test-config)
	- [3.11 POST upload to store](#311-post-upload-to-store)
	- [3.12 POST open project to eco](#312-post-open-project-to-eco)
	- [3.13 POST add image to project](#313-post-add-image-to-project)
	- [3.14 DELETE image of project](#314-delete-image-of-project)
	- [3.15 GET image of project](#315-get-image-of-project)
  - [4. Host](#4-host)
    - [4.1 GET all host](#41-get-all-host)
    - [4.2 GET one host](#42-get-one-host)
	- [4.3 POST create one host](#43-post-create-one-host)
	- [4.4 DELETE one host](#44-delete-one-host)
	- [4.5 PUT modify one host](#45-put-modify-one-host)
  - [5. Capability-groups](#5-capability-groups)
     - [5.1 POST create one EdgeGalleryCapabilityGroup](#51-post-create-one-edgegallerycapabilitygroup)
    - [5.2 DELETE one EdgeGalleryCapabilityGroup](#52-delete-one-edgegallerycapabilitygroup)
	- [5.3 POST create one EdgeGalleryCapability](#53-post-create-one-edgegallerycapability)
	- [5.4 DELETE one EdgeGalleryCapability](#54-delete-one-edgegallerycapability)
	- [5.5 GET all EdgeGalleryCapability](#55-get-all-edgegallerycapability)
	- [5.6 GET all EdgeGalleryCapability by groupid](#56-get-all-edgegallerycapability-by-groupid)
	- [5.7 GET all EdgeGallery API](#57-get-all-edgegallery-api)
	- [5.8 GET all EdgeGallery ECO API](#58-get-all-edgegallery-eco-api)
  - [6. File](#6-file)
    - [6.1 GET one file](#61-get-one-file)
    - [6.2 POST upload one file](#62-post-upload-one-file)
	- [6.3 POST upload helm yaml](#63-post-upload-helm-yaml)
	- [6.4 GET helm yaml](#64-get-helm-yaml)
	- [6.5 DELETE helm yaml](#65-delete-helm-yaml)
	- [6.6 POST get sample code](#66-post-get-sample-code)
       - [6.7 GET one file return object](#67-get-one-file-return-object)
  - [7. LocalApi](#7-localapi)
    - [7.1 GET one api file](#71-get-one-api-file)
	

 


## 1. Plugin
Development environment plug-in or sdk
### 1.1 POST upload plugin 
Upload one plugin with some params.
```
Resource URI: /mec/developer/v1/plugins/
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|pluginFile|pluginfile|requestpart|yes|
|logoFile|pluginlogofile|requestpart|yes|
|apiFile|pluginapifile|requestpart|yes|
|pluginName|pluginname|requestparam|yes|
|codeLanguage|languagerepresentedbytheplugin|requestparam|yes|
|pluginType|1plugin2sdk|requestparam|yes|
|version|pluginversion|requestparam|yes|
|introduction|pluginbrief|requestparam|yes|
|userId|theauthor'sidofuploadplugin|requestparam|yes|
|userName|theauthor'snameofuploadplugin|requestparam|yes|

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

|Name|Definition|type|Required|
|-------------| -------------|------------|------------|
|pluginType|plugin type|request param|yes|
|limit|the max count of one page|request param|yes|
|offset|start index of the page|request param|yes|

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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|pluginId|plugin id|path param|yes|

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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|pluginId|plugin id|path param|yes|

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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|pluginId|plugin id|path param|yes|

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

|Name| Definition|type|Required|
|-------------|-------------|------------|------------|
|pluginId|plugin id|path param|yes|

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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|pluginId|pluginid|pathparam|yes|
|pluginFile|pluginfile|requestpart|no|
|logoFile|pluginlogofile|requestpart|no|
|apiFile|pluginapifile|requestpart|no|
|pluginName|pluginname|requestpart|no|
|codeLanguage|languagerepresentedbytheplugin|requestpart|no|
|pluginType|1plugin2sdk|requestpart|no|
|version|pluginversion|requestpart|no|
|introduction|pluginbrief|requestpart|no|

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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|pluginId|pluginid|pathparam|yes|
|score|pluginsatisfaction|requestparam|yes|
|userId|raterid|requestparam|yes|
|userName|ratername|requestparam|yes|

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
Edge applications on the car
### 2.1 POST upload app 
Upload app with some params.
```
Resource URI: /mec/developer/v1/apps/
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|appFile|appfile|requestpart|yes|
|logoFile|applogofile|requestpart|yes|
|affinity|appaffinity|requestparam|yes|
|industry|appindustry|requestparam|yes|
|type|apptype|requestparam|yes|
|appDesc|appbrief|requestparam|yes|
|userId|theauthoridofuploadapp|requestparam|yes|

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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|appName|appname|requestparam|no|
|status|testtaskstatus|requestparam|no|
|beginTime|taskbegintime|requestparam|no|
|endTime|taskendtime|requestparam|no|
|userId|theauthoridofuploadapp|requestparam|yes|

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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|


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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|appId|appid|pathparam|yes|
|userId|theauthoridofuploadapp|requestparam|yes|
|userName|theauthornameofuploadapp|requestparam|yes|

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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|appId|appid|pathparam|yes|
|userId|theauthoridofuploadapp|requestparam|yes|

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

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|appId|appid|pathparam|yes|
|taskId|maintaskid|pathparam|yes|

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
## 3. App Project
Edge application projects created by the developer platform
### 3.1 GET all project
Query all app project with userId.
```
Resource URI: /mec/developer/v1/projects/
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|userId|theauthoridofcreateprocject|requestparam|yes|

Example response:
```
200 OK
[
  {
    "id": "string",
    "projectType": "CREATE_NEW",
    "name": "string",
    "version": "string",
    "provider": "string",
    "platform": [
      "string"
    ],
    "type": "string",
    "industry": [
      "string"
    ],
    "description": "string",
    "iconFileId": "string",
    "status": "ONLINE",
    "capabilityList": [
      {
        "groupId": "string",
        "name": "string",
        "type": "OPENMEP",
        "description": "string",
        "capabilityDetailList": [
          {
            "detailId": "string",
            "groupId": "string",
            "service": "string",
            "version": "string",
            "description": "string",
            "provider": "string",
            "apiFileId": "string"
          }
        ]
      }
    ],
    "lastTestId": "string",
    "userId": "string",
    "createDate": "2020-09-14T01:38:48.361Z",
    "openCapabilityId": "string"
  }
  ]
  }
```

### 3.2 GET one project 
Query project by id
```
Resource URI:  /mec/developer/v1/projects/{projectId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|userId|theauthoridofcreateproject|requestparam|yes|

Example response:
```
200 OK
{
  "id": "string",
  "projectType": "CREATE_NEW",
  "name": "string",
  "version": "string",
  "provider": "string",
  "platform": [
    "string"
  ],
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    {
      "groupId": "string",
      "name": "string",
      "type": "OPENMEP",
      "description": "string",
      "capabilityDetailList": [
        {
          "detailId": "string",
          "groupId": "string",
          "service": "string",
          "version": "string",
          "description": "string",
          "provider": "string",
          "apiFileId": "string"
        }
      ]
    }
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "2020-09-14T01:45:11.950Z",
  "openCapabilityId": "string"
  }

```

### 3.3 POST create one project 
Create one project with some params
```
Resource URI: /mec/developer/v1/projects/
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|ApplicationProject|Entityclass|bodyparam|yes|
|userId|theauthoridofcreateproject|requestparam|yes|

```
Application
{
  "id": "string",
  "projectType": "CREATE_NEW",
  "name": "string",
  "version": "string",
  "provider": "string",
  "platform": [
    "string"
  ],
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    {
      "groupId": "string",
      "name": "string",
      "type": "OPENMEP",
      "description": "string",
      "capabilityDetailList": [
        {
          "detailId": "string",
          "groupId": "string",
          "service": "string",
          "version": "string",
          "description": "string",
          "provider": "string",
          "apiFileId": "string"
        }
      ]
    }
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "2020-09-14T01:48:09.468Z",
  "openCapabilityId": "string"
  }
```
Example response:
```
200 OK
{
  "id": "string",
  "projectType": "CREATE_NEW",
  "name": "string",
  "version": "string",
  "provider": "string",
  "platform": [
    "string"
  ],
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    {
      "groupId": "string",
      "name": "string",
      "type": "OPENMEP",
      "description": "string",
      "capabilityDetailList": [
        {
          "detailId": "string",
          "groupId": "string",
          "service": "string",
          "version": "string",
          "description": "string",
          "provider": "string",
          "apiFileId": "string"
        }
      ]
    }
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "2020-09-14T01:48:09.468Z",
  "openCapabilityId": "string"
  }
  }
```

### 3.4 Delete one project
Delete one project by id
```
Resource URI: /mec/developer/v1/projects/{projectId}
```

| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| projectId | project id|path param|yes|
| userId | the author id of create project |request param|yes|

Example response:
```
200 OK
true
```

### 3.5 PUT modify one project 
modify one project by id
```
Resource URI: /mec/developer/v1/projects/{projectId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|userId|theauthornameofuploadapp|requestparam|yes|
|ApplicationProject|entityclass|bodyparam|yes|

```
ApplicationProject
{
  "id": "string",
  "projectType": "CREATE_NEW",
  "name": "string",
  "version": "string",
  "provider": "string",
  "platform": [
    "string"
  ],
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    {
      "groupId": "string",
      "name": "string",
      "type": "OPENMEP",
      "description": "string",
      "capabilityDetailList": [
        {
          "detailId": "string",
          "groupId": "string",
          "service": "string",
          "version": "string",
          "description": "string",
          "provider": "string",
          "apiFileId": "string"
        }
      ]
    }
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "2020-09-14T01:48:09.468Z",
  "openCapabilityId": "string"
  }
```
Example response:
```
200 OK
{
  "id": "string",
  "projectType": "CREATE_NEW",
  "name": "string",
  "version": "string",
  "provider": "string",
  "platform": [
    "string"
  ],
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    {
      "groupId": "string",
      "name": "string",
      "type": "OPENMEP",
      "description": "string",
      "capabilityDetailList": [
        {
          "detailId": "string",
          "groupId": "string",
          "service": "string",
          "version": "string",
          "description": "string",
          "provider": "string",
          "apiFileId": "string"
        }
      ]
    }
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "2020-09-14T01:48:09.468Z",
  "openCapabilityId": "string"
  }
```

### 3.6 POST deploy one project 
Deploy one project by id
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/deploy
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|userId|theauthoridofcreateproject|requestparam|yes|

Example response:
```
200 OK
{
  "id": "string",
  "projectType": "CREATE_NEW",
  "name": "string",
  "version": "string",
  "provider": "string",
  "platform": [
    "string"
  ],
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    {
      "groupId": "string",
      "name": "string",
      "type": "OPENMEP",
      "description": "string",
      "capabilityDetailList": [
        {
          "detailId": "string",
          "groupId": "string",
          "service": "string",
          "version": "string",
          "description": "string",
          "provider": "string",
          "apiFileId": "string"
        }
      ]
    }
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "2020-09-14T01:48:09.468Z",
  "openCapabilityId": "string"
  }
```

### 3.7 POST clean test env 
clean test env
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/clean
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|userId|theauthoridofcreateproject|requestparam|yes|
|completed|teststatus|requestparam|yes|

Example response:
```
200 OK
true
```

### 3.8 POST create test config 
create test config of one project
```
Resource URI: /mec/developer/v1/projects/{projectId}/test-config
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|userId|theauthoridofcreateproject|requestparam|yes|
|ProjectTestConfig|entityclass|bodyparam|yes|

```
ProjectTestConfig
{
  "testId": "string",
  "projectId": "string",
  "agentConfig": {
    "serviceName": "string",
    "href": "string",
    "port": 0
  },
  "imageFileIds": [
    "string"
  ],
  "appImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ]
    }
  ],
  "otherImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ]
    }
  ],
  "hosts": [
    {
      "hostId": "string",
      "name": "string",
      "address": "string",
      "architecture": "string",
      "status": "NORMAL",
      "ip": "string",
      "protocol": "string",
      "port": 0,
      "os": "string",
      "portRangeMin": 0,
      "portRangeMax": 0
    }
  ],
  "appApiFileId": "string",
  "status": "NETWORK_ERROR",
  "accessUrl": "string",
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2020-09-14T01:48:09.469Z"
  }
```
Example response:
```
200 OK
{
  "testId": "string",
  "projectId": "string",
  "agentConfig": {
    "serviceName": "string",
    "href": "string",
    "port": 0
  },
  "imageFileIds": [
    "string"
  ],
  "appImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ]
    }
  ],
  "otherImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ]
    }
  ],
  "hosts": [
    {
      "hostId": "string",
      "name": "string",
      "address": "string",
      "architecture": "string",
      "status": "NORMAL",
      "ip": "string",
      "protocol": "string",
      "port": 0,
      "os": "string",
      "portRangeMin": 0,
      "portRangeMax": 0
    }
  ],
  "appApiFileId": "string",
  "status": "NETWORK_ERROR",
  "accessUrl": "string",
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2020-09-14T01:48:09.469Z"
  }
```

### 3.9 PUT modify test config 
modify test config of one project
```
Resource URI: /mec/developer/v1/projects/{projectId}/test-config
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|ProjectTestConfig|entityclass|bodyparam|yes|

```
ProjectTestConfig
{
  "testId": "string",
  "projectId": "string",
  "agentConfig": {
    "serviceName": "string",
    "href": "string",
    "port": 0
  },
  "imageFileIds": [
    "string"
  ],
  "appImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ]
    }
  ],
  "otherImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ]
    }
  ],
  "hosts": [
    {
      "hostId": "string",
      "name": "string",
      "address": "string",
      "architecture": "string",
      "status": "NORMAL",
      "ip": "string",
      "protocol": "string",
      "port": 0,
      "os": "string",
      "portRangeMin": 0,
      "portRangeMax": 0
    }
  ],
  "appApiFileId": "string",
  "status": "NETWORK_ERROR",
  "accessUrl": "string",
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2020-09-14T01:48:09.469Z"
  }
```
Example response:
```
200 OK
{
  "testId": "string",
  "projectId": "string",
  "agentConfig": {
    "serviceName": "string",
    "href": "string",
    "port": 0
  },
  "imageFileIds": [
    "string"
  ],
  "appImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ]
    }
  ],
  "otherImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ]
    }
  ],
  "hosts": [
    {
      "hostId": "string",
      "name": "string",
      "address": "string",
      "architecture": "string",
      "status": "NORMAL",
      "ip": "string",
      "protocol": "string",
      "port": 0,
      "os": "string",
      "portRangeMin": 0,
      "portRangeMax": 0
    }
  ],
  "appApiFileId": "string",
  "status": "NETWORK_ERROR",
  "accessUrl": "string",
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2020-09-14T01:48:09.469Z"
  }
```

### 3.10 GET one test-config 
Query one test config by projectId
```
Resource URI: /mec/developer/v1/projects/{projectId}/test-config
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|

Example response:
```
200 OK
{
  "testId": "string",
  "projectId": "string",
  "agentConfig": {
    "serviceName": "string",
    "href": "string",
    "port": 0
  },
  "imageFileIds": [
    "string"
  ],
  "appImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ]
    }
  ],
  "otherImages": [
    {
      "imageId": "string",
      "serviceName": "string",
      "imageName": "string",
      "version": "string",
      "env": [
        {
          "name": "string",
          "value": "string"
        }
      ],
      "ports": [
        {
          "containerPort": 0,
          "protocol": "string",
          "nodePort": 0
        }
      ],
      "imagePullPolicy": "IF_NOT_PRESENT",
      "volumeMounts": [
        {
          "name": "string",
          "mountPath": "string"
        }
      ],
    }
  ],
  "hosts": [
    {
      "hostId": "string",
      "name": "string",
      "address": "string",
      "architecture": "string",
      "status": "NORMAL",
      "ip": "string",
      "protocol": "string",
      "port": 0,
      "os": "string",
      "portRangeMin": 0,
      "portRangeMax": 0
    }
  ],
  "appApiFileId": "string",
  "status": "NETWORK_ERROR",
  "accessUrl": "string",
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2020-09-14T01:48:09.469Z"
  }
```

### 3.11 POST upload to store 
upload app project to appstore
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/upload
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|userId|theauthoridofcreateproject|requestparam|yes|
|userName|theauthornameofcreateproject|requestparam|yes|

Example response:
```
200 OK
"csarId"
```

### 3.12 POST open project to eco 
Open project to eco
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/open-api
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|userId|theauthoridofcreateproject|requestparam|yes|

Example response:
```
200 OK
{
  "groupId": "string",
  "name": "string",
  "type": "OPENMEP",
  "description": "string",
  "capabilityDetailList": [
    {
      "detailId": "string",
      "groupId": "string",
      "service": "string",
      "version": "string",
      "description": "string",
      "provider": "string",
      "apiFileId": "string"
    }
  ]
  }
```

### 3.13 POST add image to project 
Add image to project
```
Resource URI: /mec/developer/v1/projects/{projectId}/image
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|ProjectImageConfig|entityclass|bodyparam|yes|

```
ProjectImageConfig
{
  "id": "string",
  "name": "string",
  "port": 0,
  "version": "string",
  "projectId": "string",
  "type": "PLATFORM",
  "nodePort": 0
  }
```
Example response:
```
200 OK
{
  "id": "string",
  "name": "string",
  "port": 0,
  "version": "string",
  "projectId": "string",
  "type": "PLATFORM",
  "nodePort": 0
  }
```

### 3.14 DELETE image of project 
DELETE image of project
```
Resource URI: /mec/developer/v1/projects/{projectId}/image/{imageId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|
|imageId|imageId|pathparam|yes|

Example response:
```
200 OK
true
```

### 3.15 GET image of project 
GET image of project 
```
Resource URI: /mec/developer/v1/projects/{projectId}/image
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|

Example response:
```
200 OK
{
  "images": [
    {
      "id": "string",
      "name": "string",
      "port": 0,
      "version": "string",
      "projectId": "string",
      "type": "PLATFORM",
      "nodePort": 0
    }
  ]
  }
```

## 4. Host
Server of build and test or deploy app
### 4.1 GET all host
Query all host.
```
Resource URI: /mec/developer/v1/hosts
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|

Example response:
```
200 OK
[
  {
    "hostId": "string",
    "name": "string",
    "address": "string",
    "architecture": "string",
    "status": "NORMAL",
    "ip": "string",
    "protocol": "string",
    "port": 0,
    "os": "string",
    "portRangeMin": 0,
    "portRangeMax": 0
  }
  ]
```

### 4.2 GET one host
Query  host by id.
```
Resource URI: /mec/developer/v1/hosts/{hostId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|hostId|hostid|pathparam|yes|

Example response:
```
200 OK
[
  {
    "hostId": "string",
    "name": "string",
    "address": "string",
    "architecture": "string",
    "status": "NORMAL",
    "ip": "string",
    "protocol": "string",
    "port": 0,
    "os": "string",
    "portRangeMin": 0,
    "portRangeMax": 0
  }
  ]
```

### 4.3 POST create one host
Create one host.
```
Resource URI: /mec/developer/v1/hosts/
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|MepHost|entityclass|bodyparam|yes|

```
MepHost
{
  "hostId": "string",
  "name": "string",
  "address": "string",
  "architecture": "string",
  "status": "NORMAL",
  "ip": "string",
  "protocol": "string",
  "port": 0,
  "os": "string",
  "portRangeMin": 0,
  "portRangeMax": 0
  }
```

Example response:
```
200 OK
{
  "hostId": "string",
  "name": "string",
  "address": "string",
  "architecture": "string",
  "status": "NORMAL",
  "ip": "string",
  "protocol": "string",
  "port": 0,
  "os": "string",
  "portRangeMin": 0,
  "portRangeMax": 0
  }
```

### 4.4 DELETE one host
Delete one host.
```
Resource URI: /mec/developer/v1/hosts/{hostId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|hostId|hostid|pathparam|yes|

Example response:
```
200 OK
true
```

### 4.5 PUT modify one host
Create one host.
```
Resource URI: /mec/developer/v1/hosts/{hostId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|hostId|hostid|pathparam|yes|
|MepHost|entityclass|bodyparam|yes|

```
MepHost
{
  "hostId": "string",
  "name": "string",
  "address": "string",
  "architecture": "string",
  "status": "NORMAL",
  "ip": "string",
  "protocol": "string",
  "port": 0,
  "os": "string",
  "portRangeMin": 0,
  "portRangeMax": 0
  }
```
Example response:
```
200 OK
{
  "hostId": "string",
  "name": "string",
  "address": "string",
  "architecture": "string",
  "status": "NORMAL",
  "ip": "string",
  "protocol": "string",
  "port": 0,
  "os": "string",
  "portRangeMin": 0,
  "portRangeMax": 0
  }
```

## 5. Capability-groups
Services or capabilities of edge applications
### 5.1 POST create one EdgeGalleryCapabilityGroup
Create one Capability group.
```
Resource URI: /mec/developer/v1/capability-groups/
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|OpenMepCapabilityGroup|entityclass|bodyparam|yes|

```
OpenMepCapabilityGroup
{
  "groupId": "string",
  "name": "string",
  "type": "OPENMEP",
  "description": "string",
  "capabilityDetailList": [
    {
      "detailId": "string",
      "groupId": "string",
      "service": "string",
      "version": "string",
      "description": "string",
      "provider": "string",
      "apiFileId": "string"
    }
  ]
  }
```
Example response:
```
200 OK
{
  "groupId": "string",
  "name": "string",
  "type": "OPENMEP",
  "description": "string",
  "capabilityDetailList": [
    {
      "detailId": "string",
      "groupId": "string",
      "service": "string",
      "version": "string",
      "description": "string",
      "provider": "string",
      "apiFileId": "string"
    }
  ]
  }
```

### 5.2 DELETE one EdgeGalleryCapabilityGroup
Delete one Capability group by id.
```
Resource URI: /mec/developer/v1/capability-groups/{groupId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|groupId|groupid|pathparam|yes|

Example response:
```
200 OK
true
```

### 5.3 POST create one EdgeGalleryCapability
Create one EdgeGalleryCapability
```
Resource URI: /mec/developer/v1/capability-groups/{groupId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|OpenMepCapabilityDetail|entityclass|bodyparam|yes|
|groupId|groupid|pathparam|yes|

```
OpenMepCapabilityDetail
{
  "detailId": "string",
  "groupId": "string",
  "service": "string",
  "version": "string",
  "description": "string",
  "provider": "string",
  "apiFileId": "string"
  }
```

Example response:
```
200 OK
{
  "detailId": "string",
  "groupId": "string",
  "service": "string",
  "version": "string",
  "description": "string",
  "provider": "string",
  "apiFileId": "string"
  }
```

### 5.4 DELETE one EdgeGalleryCapability
Delete one EdgeGalleryCapability by id
```
Resource URI: /mec/developer/v1/capability-groups/capabilities/{capabilityId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|capabilityId|capabilityid|pathparam|yes|

Example response:
```
200 OK
true
```

### 5.5 GET all EdgeGalleryCapability
Gey all EdgeGalleryCapability 
```
Resource URI: /mec/developer/v1/capability-groups
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|capabilityId|capabilityid|pathparam|yes|

Example response:
```
200 OK
[
  {
    "groupId": "string",
    "name": "string",
    "type": "OPENMEP",
    "description": "string",
    "capabilityDetailList": [
      {
        "detailId": "string",
        "groupId": "string",
        "service": "string",
        "version": "string",
        "description": "string",
        "provider": "string",
        "apiFileId": "string"
      }
    ]
  }
  ]
```

### 5.6 GET all EdgeGalleryCapability by groupid
Gey all EdgeGalleryCapability by  groupid
```
Resource URI: /mec/developer/v1/capability-groups/{groupId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|groupId|capabilitygroupid|pathparam|yes|

Example response:
```
200 OK
{
  "groupId": "string",
  "name": "string",
  "type": "OPENMEP",
  "description": "string",
  "capabilityDetailList": [
    {
      "detailId": "string",
      "groupId": "string",
      "service": "string",
      "version": "string",
      "description": "string",
      "provider": "string",
      "apiFileId": "string"
    }
  ]
  }
```

### 5.7 GET all EdgeGallery API
Gey all EdgeGallery  API
```
Resource URI: /mec/developer/v1/capability-groups/openmep-api
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|

Example response:
```
200 OK
{
  "openMeps": [
    {
      "name": "string",
      "service": "string",
      "description": "string",
      "apiFileId": "string"
    }
  ]
  }
```

### 5.8 GET all EdgeGallery ECO API
Gey all EdgeGallery ECO API
```
Resource URI: /mec/developer/v1/capability-groups/openmepeco-api
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|

Example response:
```
200 OK
{
  "openMepEcos": [
    {
      "name": "string",
      "service": "string",
      "description": "string",
      "apiFileId": "string"
    }
  ]
  }
```



## 6. File
This part is to configure the app, perform app deployment, and test the api for file operations
### 6.1 GET one file
Get one file
```
Resource URI: /mec/developer/v1/files/{fileId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileId|fileid|pathparam|yes|
|userId|theauthoridofuploadfile|requestparam|yes|

Example response:
```
200 OK
binary output
```

### 6.2 POST upload one file
Upload  file
```
Resource URI: /mec/developer/v1/files
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|file|MultipartFileclass|requestpart|yes|
|userId|theauthoridofuploadfile|requestparam|yes|

Example response:
```
200 OK
{
  "fileId": "string",
  "fileName": "string",
  "url": "string",
  "userId": "string",
  "uploadDate": "2020-09-14T09:03:17.084Z",
  "filePath": "string",
  "temp": false
  }
```

### 6.3 POST upload helm yaml
Upload helm template yaml.
```
Resource URI: /mec/developer/v1/files/helm-template-yaml
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|file|MultipartFileclass|requestpart|yes|
|userId|theauthoridofuploadfile|requestparam|yes|
|projectId|projectid|requestparam|yes|

Example response:
```
200 OK
{
  "fileId": "string",
  "fileName": "string"
  }
```

### 6.4 GET helm yaml
Query helm template yaml.
```
Resource URI: /mec/developer/v1/files/helm-template-yaml
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|userId|theauthoridofuploadfile|requestparam|yes|
|projectId|projectid|requestparam|yes|

Example response:
```
200 OK
[
  {}
  ]
```

### 6.5 DELETE helm yaml
Delete helm template yaml.
```
Resource URI: /mec/developer/v1/files/helm-template-yaml
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileId|fileid|requestparam|yes||

Example response:
```
200 OK
"string"
```

### 6.6 POST get sample code
Get sample code.
```
Resource URI: /mec/developer/v1/files/samplecode
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|apiFileIds|apifileid list|body param|yes||

```
List<String>
[
  "string"
  ]
```
Example response:
```
200 OK
byte array output
```
### 6.7 GET one file return object
Get file return one object
```
Resource URI: /mec/developer/v1/files/api-info/{fileId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileId|file id|path param |yes|
|userId|the author id of upload file|request param |yes|


Example response:
```
200 OK
{
    fileId:"xxx",
    fileName:"xxx",
    url:"xxx",
    userId:"xxx",
    isTemp:false,
    uploadDate:xxxx-xx-xx,
    filePath:"xxx"
}
```


## 7. LocalApi
Get the APIs of all functional modules of developer platform
### 7.1 GET one api file
Get one api file
```
Resource URI: /mec/developer/v1/localapi/{fileName}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileName|apifilename|pathparam|yes|

```
filename: "plugin", "testapp", "hosts", "files", "capability-groups", "projects"
```
Example response:
```
200 OK
binary output
```

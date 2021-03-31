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
    - [3.16 POST open project api](#316-post-open-project-api)
    - [3.17 GET project atp task](#317-get-project-atp-task)
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
	- [5.7 GET all EdgeGallery API by fileId](#57-get-all-edgegallery-api-by-fileid)
	- [5.8 GET all EdgeGallery ECO API](#58-get-all-edgegallery-eco-api)
    - [5.9 GET all EdgeGallery API](#59-get-all-edgegallery-api)
  - [6. File](#6-file)
    - [6.1 GET one file](#61-get-one-file)
    - [6.2 POST upload one file](#62-post-upload-one-file)
    - [6.3 POST upload helm yaml](#63-post-upload-helm-yaml)
    - [6.4 GET helm yaml](#64-get-helm-yaml)
    - [6.5 DELETE helm yaml](#65-delete-helm-yaml)
    - [6.6 POST get sample code](#66-post-get-sample-code)
    - [6.7 GET one file return object](#67-get-one-file-return-object)
    - [6.8 GET sdk code](#68-get-sdk-code)
    - [6.9 GET file content](#69-get-file-content)
    - [6.10 POST pkg structure](#610-post-pkg-structure)
  - [7. LocalApi](#7-localapi)
    - [7.1 GET one api file](#71-get-one-api-file)
  - [8. Health](#8-health)
    - [8.1 GET health](#81-get-health)
  - [9. AppRelease](#9-apprelease)
    - [9.1 GET pkg structure](#91-get-pkg-structure)
    - [9.2 GET file content](#92-get-file-content)
  - [10. ReleaseConfig](#10-releaseconfig)
    - [10.1 GET release config](#101-get-release-config)
    - [10.2 POST release config](#102-post-release-config)
    - [10.3 PUT release config](#103-put-release-config)
  - [11. DeployConfig](#11-deployconfig)
    - [11.1 GET deploy platform](#111-get-deploy-platform)
    - [11.2 PUT deploy platform](#112-put-deploy-platform)
  - [12. Deploy](#12-deploy)
    - [12.1 GET deploy yaml](#121-get-deploy-yaml)
    - [12.2 PUT deploy yaml](#122-put-deploy-yaml)
    - [12.3 GET deploy json](#123-get-deploy-json)
    - [12.4 POST deploy yaml](#124-post-deploy-yaml)
  - [13. System](#13-system)
    - [13.1 GET all capability](#131-get-all-capability)
    - [13.2 POST one capability](#132-post-one-capability)
    - [13.3 DELETE one capability](#133-delete-one-capability)
    - [13.4 GET all host](#134-get-all-host)
    - [13.5 POST one host](#135-post-one-host)
    - [13.6 GET one host](#136-get-one-host)
    - [13.7 PUT one host](#137-put-one-host)
    - [13.8 DELETE one host](#138-delete-one-host)
    - [13.9 GET capability detail](#139-get-capability-detail)
    - [13.10 GET host log](#1310-get-host-log)
  - [14. VirtualMachine](#14-virtualvachine)
    - [14.1 POST one vm](#141-post-one-vm)
    - [14.2 DELETE vm config](#142-delete-vm-config)
    - [14.3 GET image config](#143-get-image-config)
    - [14.4 POST image config](#144-post-image-config)
    - [14.5 DELETE image config](#145-delete-image-config)
    - [14.6 GET image config By ProjectId](#146-get-image-config-by-projectid)
    - [14.7 GET csar pkg](#147-get-csar-pkg)
    - [14.8 GET vm resources](#148-get-vm-resources)
    - [14.9 POST vm file](#149-post-vm-file)

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
    "fileSize": 0,
    "hashCode": "string",
    "name": "string",
    "size": 0
  },
  "pluginFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "fileSize": 0,
    "hashCode": "string",
    "name": "string",
    "size": 0
  },
  "uploadTime": "2020-12-29T01:38:05.596Z",
  "user": {
    "userId": "string",
    "userName": "string"
  },
  "apiFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "fileSize": 0,
    "hashCode": "string",
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
    "fileSize": 0,
    "hashCode": "string",
    "name": "string",
    "size": 0
  },
  "pluginFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "fileSize": 0,
    "hashCode": "string",
    "name": "string",
    "size": 0
  },
  "uploadTime": "2020-12-29T01:38:05.596Z",
  "user": {
    "userId": "string",
    "userName": "string"
  },
  "apiFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "fileSize": 0,
    "hashCode": "string",
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
    "fileSize": 0,
    "hashCode": "string",
    "name": "string",
    "size": 0
  },
  "pluginFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "fileSize": 0,
    "hashCode": "string",
    "name": "string",
    "size": 0
  },
  "uploadTime": "2020-12-29T01:38:05.596Z",
  "user": {
    "userId": "string",
    "userName": "string"
  },
  "apiFile": {
    "originalFileName": "string",
    "storageAddress": "string",
    "fileSize": 0,
    "hashCode": "string",
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
   "string"
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

### 3.16 POST open project api 
POST open project api
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/open-api
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|
|userId|user id|request param|yes|
|AbilityOpenConfig|entity class|body param|yes|

```
AbilityOpenConfig:
{
  "detailId": "string",
  "groupId": "string",
  "service": "string",
  "version": "string",
  "description": "string",
  "provider": "string",
  "apiFileId": "string",
  "guideFileId": "string",
  "uploadTime": "2020-12-29T01:51:11.028Z",
  "port": 0,
  "host": "string",
  "protocol": "string",
  "appId": "string",
  "packageId": "string",
  "userId": "string"
}
```

Example response:
```
200 OK
{
  "groupId": "string",
  "oneLevelName": "string",
  "twoLevelName": "string",
  "threeLevelName": "string",
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
      "apiFileId": "string",
      "guideFileId": "string",
      "uploadTime": "2020-12-29T01:51:11.028Z",
      "port": 0,
      "host": "string",
      "protocol": "string",
      "appId": "string",
      "packageId": "string",
      "userId": "string"
    }
  ]
}
```

### 3.17 GET project atp task 
GET project atp task
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/atp
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|pathparam|yes|

Example response:
```
200 OK
true
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
  "apiFileId": "string",
  "guideFileId": "string",
  "uploadTime": "2020-12-29T02:12:28.030Z",
  "port": 0,
  "host": "string",
  "protocol": "string",
  "appId": "string",
  "packageId": "string",
  "userId": "string"
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
  "apiFileId": "string",
  "guideFileId": "string",
  "uploadTime": "2020-12-29T02:12:28.030Z",
  "port": 0,
  "host": "string",
  "protocol": "string",
  "appId": "string",
  "packageId": "string",
  "userId": "string"
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
|userId|userId|requestparam|yes|

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
    "oneLevelName": "string",
    "twoLevelName": "string",
    "threeLevelName": "string",
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
        "apiFileId": "string",
        "guideFileId": "string",
        "uploadTime": "2020-12-29T02:12:28.030Z",
        "port": 0,
        "host": "string",
        "protocol": "string",
        "appId": "string",
        "packageId": "string",
        "userId": "string"
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
  "oneLevelName": "string",
  "twoLevelName": "string",
  "threeLevelName": "string",
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
      "apiFileId": "string",
      "guideFileId": "string",
      "uploadTime": "2020-12-29T02:12:28.030Z",
      "port": 0,
      "host": "string",
      "protocol": "string",
      "appId": "string",
      "packageId": "string",
      "userId": "string"
    }
  ]
}
```

### 5.7 GET all EdgeGallery API by fileId
Gey all EdgeGallery  API
```
Resource URI: /mec/developer/v1/capability-groups/openmep-api/{fileId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileId|file id|pathparam|yes|

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
  "apiFileId": "string",
  "guideFileId": "string",
  "uploadTime": "2020-12-29T02:12:28.030Z",
  "port": 0,
  "host": "string",
  "protocol": "string",
  "appId": "string",
  "packageId": "string",
  "userId": "string"
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

### 5.9 GET all EdgeGallery API
Gey all EdgeGallery ECO API
```
Resource URI: /mec/developer/v1/capability-groups/open-api/{type}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|type|api type|pathparam|yes|

Example response:
```
200 OK
{
  "openCapability": [
    {
      "groupId": "string",
      "oneLevelName": "string",
      "twoLevelName": "string",
      "threeLevelName": "string",
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
          "apiFileId": "string",
          "guideFileId": "string",
          "uploadTime": "2020-12-29T02:12:28.030Z",
          "port": 0,
          "host": "string",
          "protocol": "string",
          "appId": "string",
          "packageId": "string",
          "userId": "string"
        }
      ]
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
|type|file type|requestparam|yes|

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
  "fileName": "string",
  "fileContent": "string",
  "formatSuccess": false,
  "imageSuccess": false,
  "serviceSuccess": false,
  "mepAgentSuccess": false
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

### 6.8 GET sdk code
GET sdk code
```
Resource URI: /mec/developer/v1/files/sdk/{fileId}/download/{lan}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileId|file id|path param |yes|
|lan|sdk codeLanguage|path param |yes|


Example response:
```
200 OK
binary output
```

### 6.9 GET file content
GET file content
```
Resource URI: /mec/developer/v1/files/samplecode/get-file-content
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileName|file name|request param |yes|

Example response:
```
200 OK
String output
```


### 6.10 POST pkg structure
POST pkg structure
```
Resource URI: /mec/developer/v1/files/samplecode/get-pkg-structure
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|apiFileIds|file id arrays|body param |yes|

Example response:
```
200 OK
{
  "name": "string",
  "id": "string",
  "children": [
    {}
  ],
  "parent": false
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


## 8. Health
Get health
### 8.1 GET health
Get health
```
Resource URI: /mec/developer/v1/health
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|

Example response:
```
200 OK
string output
```

## 9. AppRelease
Get pkg structure and file content
### 9.1 GET pkg structure
Get pkg structure
```
Resource URI: /mec/developer/v1/apprelease/{projectId}/{csarId}/action/get-pkg-structure
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|project id|pathparam|yes|
|csarId|csar id|pathparam|yes|

Example response:
```
200 OK
{
  "name": "string",
  "id": "string",
  "children": [
    {}
  ],
  "parent": false
}
```

### 9.2 GET file content
Get file content
```
Resource URI: /mec/developer/v1/apprelease/{projectId}/action/get-pkg-content
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|project id|pathparam|yes|
|fileName|pkg file name|requestparam|yes|

Example response:
```
200 OK
string output
```


## 10. ReleaseConfig
Do some configuration before release app 
### 10.1 GET release config
Get release config
```
Resource URI: /mec/developer/v1/releaseconfig/{projectId}/action/release-config
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|project id|pathparam|yes|


Example response:
```
200 OK
{
  "releaseId": "string",
  "projectId": "string",
  "guideFileId": "string",
  "appInstanceId": "string",
  "capabilitiesDetail": {
    "appTrafficRule": [
      {
        "trafficRuleId": "string",
        "action": "string",
        "priority": "string",
        "filterType": "string",
        "trafficFilter": [
          {
            "protocal": [
              "string"
            ],
            "srcAddress": [
              "string"
            ],
            "srcPort": [
              "string"
            ],
            "dstAddress": [
              "string"
            ],
            "dstPort": [
              "string"
            ],
            "tag": [
              "string"
            ],
            "srcTunnelAddress": [
              "string"
            ],
            "tgtTunnelAddress": [
              "string"
            ],
            "srcTunnelPort": [
              "string"
            ],
            "dstTunnelPort": [
              "string"
            ],
            "qci": 0,
            "dscp": 0,
            "tc": 0
          }
        ],
        "dstInterface": [
          {
            "interfaceType": "string",
            "srcMacAddress": "string",
            "dstMacAddress": "string",
            "dstIpAddress": "string",
            "tunnelInfo": {
              "tunnelType": "string",
              "tunnelDstAddress": "string",
              "tunnelSrcAddress": "string",
              "tunnelSpecificData": "string"
            }
          }
        ]
      }
    ],
    "appDNSRule": [
      {
        "dnsRuleId": "string",
        "domainName": "string",
        "ipAddressType": "string",
        "ipAddress": "string",
        "ttl": "string"
      }
    ],
    "serviceDetails": [
      {
        "groupId": "string",
        "serviceName": "string",
        "internalPort": 0,
        "version": "string",
        "protocol": "string",
        "apiJson": "string",
        "apiMd": "string",
        "dnsRulesList": [
          "string"
        ],
        "trafficRulesList": [
          "string"
        ]
      }
    ]
  },
  "atpTest": {
    "id": "string",
    "appName": "string",
    "status": "string",
    "createTime": "string"
  },
  "testStatus": "string",
  "createTime": "2020-12-29T03:31:13.204Z"
}
```

### 10.2 POST release config
POST release config
```
Resource URI: /mec/developer/v1/releaseconfig/{projectId}/action/release-config
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|project id|pathparam|yes|
|ReleaseConfig|entityclass|bodyparam|yes|

```
ReleaseConfig:
{
  "releaseId": "string",
  "projectId": "string",
  "guideFileId": "string",
  "appInstanceId": "string",
  "capabilitiesDetail": {
    "appTrafficRule": [
      {
        "trafficRuleId": "string",
        "action": "string",
        "priority": "string",
        "filterType": "string",
        "trafficFilter": [
          {
            "protocal": [
              "string"
            ],
            "srcAddress": [
              "string"
            ],
            "srcPort": [
              "string"
            ],
            "dstAddress": [
              "string"
            ],
            "dstPort": [
              "string"
            ],
            "tag": [
              "string"
            ],
            "srcTunnelAddress": [
              "string"
            ],
            "tgtTunnelAddress": [
              "string"
            ],
            "srcTunnelPort": [
              "string"
            ],
            "dstTunnelPort": [
              "string"
            ],
            "qci": 0,
            "dscp": 0,
            "tc": 0
          }
        ],
        "dstInterface": [
          {
            "interfaceType": "string",
            "srcMacAddress": "string",
            "dstMacAddress": "string",
            "dstIpAddress": "string",
            "tunnelInfo": {
              "tunnelType": "string",
              "tunnelDstAddress": "string",
              "tunnelSrcAddress": "string",
              "tunnelSpecificData": "string"
            }
          }
        ]
      }
    ],
    "appDNSRule": [
      {
        "dnsRuleId": "string",
        "domainName": "string",
        "ipAddressType": "string",
        "ipAddress": "string",
        "ttl": "string"
      }
    ],
    "serviceDetails": [
      {
        "groupId": "string",
        "serviceName": "string",
        "internalPort": 0,
        "version": "string",
        "protocol": "string",
        "apiJson": "string",
        "apiMd": "string",
        "dnsRulesList": [
          "string"
        ],
        "trafficRulesList": [
          "string"
        ]
      }
    ]
  },
  "atpTest": {
    "id": "string",
    "appName": "string",
    "status": "string",
    "createTime": "string"
  },
  "testStatus": "string",
  "createTime": "2020-12-29T03:31:13.204Z"
}
```
Example response:
```
200 OK
{
  "releaseId": "string",
  "projectId": "string",
  "guideFileId": "string",
  "appInstanceId": "string",
  "capabilitiesDetail": {
    "appTrafficRule": [
      {
        "trafficRuleId": "string",
        "action": "string",
        "priority": "string",
        "filterType": "string",
        "trafficFilter": [
          {
            "protocal": [
              "string"
            ],
            "srcAddress": [
              "string"
            ],
            "srcPort": [
              "string"
            ],
            "dstAddress": [
              "string"
            ],
            "dstPort": [
              "string"
            ],
            "tag": [
              "string"
            ],
            "srcTunnelAddress": [
              "string"
            ],
            "tgtTunnelAddress": [
              "string"
            ],
            "srcTunnelPort": [
              "string"
            ],
            "dstTunnelPort": [
              "string"
            ],
            "qci": 0,
            "dscp": 0,
            "tc": 0
          }
        ],
        "dstInterface": [
          {
            "interfaceType": "string",
            "srcMacAddress": "string",
            "dstMacAddress": "string",
            "dstIpAddress": "string",
            "tunnelInfo": {
              "tunnelType": "string",
              "tunnelDstAddress": "string",
              "tunnelSrcAddress": "string",
              "tunnelSpecificData": "string"
            }
          }
        ]
      }
    ],
    "appDNSRule": [
      {
        "dnsRuleId": "string",
        "domainName": "string",
        "ipAddressType": "string",
        "ipAddress": "string",
        "ttl": "string"
      }
    ],
    "serviceDetails": [
      {
        "groupId": "string",
        "serviceName": "string",
        "internalPort": 0,
        "version": "string",
        "protocol": "string",
        "apiJson": "string",
        "apiMd": "string",
        "dnsRulesList": [
          "string"
        ],
        "trafficRulesList": [
          "string"
        ]
      }
    ]
  },
  "atpTest": {
    "id": "string",
    "appName": "string",
    "status": "string",
    "createTime": "string"
  },
  "testStatus": "string",
  "createTime": "2020-12-29T03:31:13.204Z"
}
```

### 10.3 PUT release config
PUT release config
```
Resource URI: /mec/developer/v1/releaseconfig/{projectId}/action/release-config
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|project id|pathparam|yes|
|ReleaseConfig|entityclass|bodyparam|yes|

```
ReleaseConfig:
{
  "releaseId": "string",
  "projectId": "string",
  "guideFileId": "string",
  "appInstanceId": "string",
  "capabilitiesDetail": {
    "appTrafficRule": [
      {
        "trafficRuleId": "string",
        "action": "string",
        "priority": "string",
        "filterType": "string",
        "trafficFilter": [
          {
            "protocal": [
              "string"
            ],
            "srcAddress": [
              "string"
            ],
            "srcPort": [
              "string"
            ],
            "dstAddress": [
              "string"
            ],
            "dstPort": [
              "string"
            ],
            "tag": [
              "string"
            ],
            "srcTunnelAddress": [
              "string"
            ],
            "tgtTunnelAddress": [
              "string"
            ],
            "srcTunnelPort": [
              "string"
            ],
            "dstTunnelPort": [
              "string"
            ],
            "qci": 0,
            "dscp": 0,
            "tc": 0
          }
        ],
        "dstInterface": [
          {
            "interfaceType": "string",
            "srcMacAddress": "string",
            "dstMacAddress": "string",
            "dstIpAddress": "string",
            "tunnelInfo": {
              "tunnelType": "string",
              "tunnelDstAddress": "string",
              "tunnelSrcAddress": "string",
              "tunnelSpecificData": "string"
            }
          }
        ]
      }
    ],
    "appDNSRule": [
      {
        "dnsRuleId": "string",
        "domainName": "string",
        "ipAddressType": "string",
        "ipAddress": "string",
        "ttl": "string"
      }
    ],
    "serviceDetails": [
      {
        "groupId": "string",
        "serviceName": "string",
        "internalPort": 0,
        "version": "string",
        "protocol": "string",
        "apiJson": "string",
        "apiMd": "string",
        "dnsRulesList": [
          "string"
        ],
        "trafficRulesList": [
          "string"
        ]
      }
    ]
  },
  "atpTest": {
    "id": "string",
    "appName": "string",
    "status": "string",
    "createTime": "string"
  },
  "testStatus": "string",
  "createTime": "2020-12-29T03:31:13.204Z"
}
```
Example response:
```
200 OK
{
  "releaseId": "string",
  "projectId": "string",
  "guideFileId": "string",
  "appInstanceId": "string",
  "capabilitiesDetail": {
    "appTrafficRule": [
      {
        "trafficRuleId": "string",
        "action": "string",
        "priority": "string",
        "filterType": "string",
        "trafficFilter": [
          {
            "protocal": [
              "string"
            ],
            "srcAddress": [
              "string"
            ],
            "srcPort": [
              "string"
            ],
            "dstAddress": [
              "string"
            ],
            "dstPort": [
              "string"
            ],
            "tag": [
              "string"
            ],
            "srcTunnelAddress": [
              "string"
            ],
            "tgtTunnelAddress": [
              "string"
            ],
            "srcTunnelPort": [
              "string"
            ],
            "dstTunnelPort": [
              "string"
            ],
            "qci": 0,
            "dscp": 0,
            "tc": 0
          }
        ],
        "dstInterface": [
          {
            "interfaceType": "string",
            "srcMacAddress": "string",
            "dstMacAddress": "string",
            "dstIpAddress": "string",
            "tunnelInfo": {
              "tunnelType": "string",
              "tunnelDstAddress": "string",
              "tunnelSrcAddress": "string",
              "tunnelSpecificData": "string"
            }
          }
        ]
      }
    ],
    "appDNSRule": [
      {
        "dnsRuleId": "string",
        "domainName": "string",
        "ipAddressType": "string",
        "ipAddress": "string",
        "ttl": "string"
      }
    ],
    "serviceDetails": [
      {
        "groupId": "string",
        "serviceName": "string",
        "internalPort": 0,
        "version": "string",
        "protocol": "string",
        "apiJson": "string",
        "apiMd": "string",
        "dnsRulesList": [
          "string"
        ],
        "trafficRulesList": [
          "string"
        ]
      }
    ]
  },
  "atpTest": {
    "id": "string",
    "appName": "string",
    "status": "string",
    "createTime": "string"
  },
  "testStatus": "string",
  "createTime": "2020-12-29T03:31:13.204Z"
}
```


## 11. DeployConfig
Get some config about deploy platform
### 11.1 GET deploy platform
Get deploy platform
```
Resource URI: /mec/developer/v1/config/deploy-platform
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|

Example response:
```
200 OK
{
  "isVirtualMachine": false,
  "virtualMachineUrl": "string"
}
```

### 11.2 PUT deploy platform
PUT deploy platform
```
Resource URI: /mec/developer/v1/config/deploy-platform
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|DeployPlatformConfig|entityclass|bodyparam|yes|

```
DeployPlatformConfig:
{
  "isVirtualMachine": false,
  "virtualMachineUrl": "string"
}
```
Example response:
```
200 OK
{
  "isVirtualMachine": false,
  "virtualMachineUrl": "string"
}
```

## 12. Deploy
API to manipulate deployment files
### 12.1 GET deploy yaml
get deploy yaml
```
Resource URI: /mec/developer/v1/deploy/{fileId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileId|fileId|path param|yes|

Example response:
```
200 OK
{
  "fileId": "string",
  "fileName": "string",
  "userId": "string",
  "projectId": "string",
  "content": "string",
  "uploadTimeStamp": 0,
  "configType": "string"
}
```

### 12.2 PUT deploy yaml
modify deploy yaml by file id
```
Resource URI: /mec/developer/v1/deploy/{fileId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileId|fileId|path param|yes|
|fileContent|file content|body param|yes|

Example response:
```
200 OK
{
  "fileId": "string",
  "fileName": "string",
  "userId": "string",
  "projectId": "string",
  "content": "string",
  "uploadTimeStamp": 0,
  "configType": "string"
}
```

### 12.3 GET deploy json
Get file content with json format
```
Resource URI: /mec/developer/v1/deploy/{fileId}/action/get-json
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|fileId|fileId|path param|yes|

Example response:
```
200 OK
[
  {}
]
```

### 12.4 POST deploy yaml
upload deploy yaml
```
Resource URI: /mec/developer/v1/deploy/{projectId}/action/save-yaml
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|jsonStr|deploy yaml content|body param|yes|
|userId|userId|request param|yes|
|projectId|projectId|path param|yes|
|configType|Fields that distinguish deployment types|request param|yes|

Example response:
```
200 OK
{
  "fileId": "string",
  "fileName": "string",
  "userId": "string",
  "projectId": "string",
  "content": "string",
  "uploadTimeStamp": 0,
  "configType": "string"
}
```

## 13. System
About the api with system functions on the developer platform
### 13.1 GET all capability
GET all capability
```
Resource URI: /mec/developer/v1/system/capability
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|userId|userId|request param|no|
|twoLevelName|the name of two level name|request param|no|
|twoLevelNameEn|the name of two level english name|request param|no|
|limit|the max count of one page|request param|yes|
|offset|start index of the page|request param|yes|

Example response:
```
200 OK
[
  {
    "groupId": "string",
    "oneLevelName": "string",
    "oneLevelNameEn": "string",
    "twoLevelName": "string",
    "twoLevelNameEn": "string",
    "type": "OPENMEP",
    "description": "string",
    "descriptionEn": "string",
    "capabilityDetailList": [
      {
        "detailId": "string",
        "groupId": "string",
        "service": "string",
        "serviceEn": "string",
        "version": "string",
        "description": "string",
        "descriptionEn": "string",
        "provider": "string",
        "apiFileId": "string",
        "guideFileId": "string",
        "guideFileIdEn": "string",
        "uploadTime": "string",
        "port": 0,
        "host": "string",
        "protocol": "string",
        "appId": "string",
        "packageId": "string",
        "userId": "string"
      }
    ]
  }
]
```

### 13.2 POST one capability
create one capability
```
Resource URI: /mec/developer/v1/system/capability
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|group|CapabilityGroup|body param|yes|

```
CapabilityGroup
{
  "groupId": "string",
  "oneLevelName": "string",
  "oneLevelNameEn": "string",
  "twoLevelName": "string",
  "twoLevelNameEn": "string",
  "type": "OPENMEP",
  "description": "string",
  "descriptionEn": "string",
  "capabilityDetailList": [
    {
      "detailId": "string",
      "groupId": "string",
      "service": "string",
      "serviceEn": "string",
      "version": "string",
      "description": "string",
      "descriptionEn": "string",
      "provider": "string",
      "apiFileId": "string",
      "guideFileId": "string",
      "guideFileIdEn": "string",
      "uploadTime": "string",
      "port": 0,
      "host": "string",
      "protocol": "string",
      "appId": "string",
      "packageId": "string",
      "userId": "string"
    }
  ]
}

```

Example response:
```
200 OK
{
  "groupId": "string",
  "oneLevelName": "string",
  "oneLevelNameEn": "string",
  "twoLevelName": "string",
  "twoLevelNameEn": "string",
  "type": "OPENMEP",
  "description": "string",
  "descriptionEn": "string",
  "capabilityDetailList": [
    {
      "detailId": "string",
      "groupId": "string",
      "service": "string",
      "serviceEn": "string",
      "version": "string",
      "description": "string",
      "descriptionEn": "string",
      "provider": "string",
      "apiFileId": "string",
      "guideFileId": "string",
      "guideFileIdEn": "string",
      "uploadTime": "string",
      "port": 0,
      "host": "string",
      "protocol": "string",
      "appId": "string",
      "packageId": "string",
      "userId": "string"
    }
  ]
}
]
```

### 13.3 DELETE one capability
DELETE one capability
```
Resource URI: /mec/developer/v1/system/capability
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|groupId|groupId|request param|yes|


Example response:
```
200 OK
boolean output
```

### 13.4 GET all host
GET all host
```
Resource URI: /mec/developer/v1/system/hosts
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|userId|userId|request param|no|
|name|the name of host|request param|no|
|ip|the ip of host|request param|no|
|limit|the max count of one page|request param|yes|
|offset|start index of the page|request param|yes|


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
    "lcmIp": "string",
    "mecHost": "string",
    "protocol": "string",
    "port": 0,
    "os": "string",
    "portRangeMin": 0,
    "portRangeMax": 0,
    "userId": "string",
    "configId": "string",
    "userName": "string"
  }
]
```

### 13.5 POST one host
create one host
```
Resource URI: /mec/developer/v1/system/hosts
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|host|Entity class|body param|yes|

```
MepHost
{
  "hostId": "string",
  "name": "string",
  "address": "string",
  "architecture": "string",
  "status": "NORMAL",
  "lcmIp": "string",
  "mecHost": "string",
  "protocol": "string",
  "port": 0,
  "os": "string",
  "portRangeMin": 0,
  "portRangeMax": 0,
  "userId": "string",
  "configId": "string",
  "userName": "string",
  "password": "string"
}
```


Example response:
```
200 OK
boolean output
```

### 13.6 GET one host
GET one host
```
Resource URI: /mec/developer/v1/system/hosts/{hostId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|hostId|hostId|path param|yes|

Example response:
```
200 OK
{
  "hostId": "string",
  "name": "string",
  "address": "string",
  "architecture": "string",
  "status": "NORMAL",
  "lcmIp": "string",
  "mecHost": "string",
  "protocol": "string",
  "port": 0,
  "os": "string",
  "portRangeMin": 0,
  "portRangeMax": 0,
  "userId": "string",
  "configId": "string",
  "userName": "string"
}
```

### 13.7 PUT one host
modify one host
```
Resource URI: /mec/developer/v1/system/hosts/{hostId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|hostId|hostId|path param|yes|
|host|Entity class|body param|yes|

```
host
{
  "hostId": "string",
  "name": "string",
  "address": "string",
  "architecture": "string",
  "status": "NORMAL",
  "lcmIp": "string",
  "mecHost": "string",
  "protocol": "string",
  "port": 0,
  "os": "string",
  "portRangeMin": 0,
  "portRangeMax": 0,
  "userId": "string",
  "configId": "string",
  "userName": "string"
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
  "lcmIp": "string",
  "mecHost": "string",
  "protocol": "string",
  "port": 0,
  "os": "string",
  "portRangeMin": 0,
  "portRangeMax": 0,
  "userId": "string",
  "configId": "string",
  "userName": "string"
}
```

### 13.8 DELETE one host
DELETE one host
```
Resource URI: /mec/developer/v1/system/hosts/{hostId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|hostId|hostId|path param|yes|

Example response:
```
200 OK
boolean output
```

### 13.9 GET capability detail
GET capability detail
```
Resource URI: /mec/developer/v1/system/capability/{groupId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|groupId|groupId|path param|yes|

Example response:
```
200 OK
{
  "groupId": "string",
  "oneLevelName": "string",
  "oneLevelNameEn": "string",
  "twoLevelName": "string",
  "twoLevelNameEn": "string",
  "type": "OPENMEP",
  "description": "string",
  "descriptionEn": "string",
  "capabilityDetailList": [
    {
      "detailId": "string",
      "groupId": "string",
      "service": "string",
      "serviceEn": "string",
      "version": "string",
      "description": "string",
      "descriptionEn": "string",
      "provider": "string",
      "apiFileId": "string",
      "guideFileId": "string",
      "guideFileIdEn": "string",
      "uploadTime": "string",
      "port": 0,
      "host": "string",
      "protocol": "string",
      "appId": "string",
      "packageId": "string",
      "userId": "string"
    }
  ]
}
```

### 13.10 GET host log
GET host log
```
Resource URI: /mec/developer/v1/system/hosts/{hostId}/log
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|hostId|hostId|path param|yes|

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
    "lcmIp": "string",
    "mecHost": "string",
    "protocol": "string",
    "port": 0,
    "os": "string",
    "portRangeMin": 0,
    "portRangeMax": 0,
    "userId": "string",
    "configId": "string",
    "userName": "string"
  }
]
```

## 14. VirtualMachine
This part is about the api for virtual machine deployment
### 14.1 POST one vm
create one vm
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm-create
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|userId|query param|yes|
|vmCreateConfig|entity class|body param|yes|

```
vmCreateConfig:
{
  "vmId": "string",
  "projectId": "string",
  "vmRegulation": {
    "regulationId": 0,
    "architecture": "string",
    "nameZh": "string",
    "nameEn": "string",
    "sceneZh": "string",
    "sceneEn": "string",
    "memory": 0,
    "cpu": 0,
    "systemDisk": 0,
    "dataDisk": 0,
    "gpu": "string",
    "otherAbility": "string"
  },
  "vmSystem": {
    "systemId": 0,
    "type": "string",
    "operateSystem": "string",
    "version": "string",
    "systemBit": "string",
    "systemDisk": 0
  },
  "vmNetwork": [
    "string"
  ],
  "vmName": "string",
  "status": "NOTCREATE",
  "stageStatus": {
    "hostInfo": "Success",
    "csar": "Success",
    "instantiateInfo": "Success",
    "workStatus": "Success"
  },
  "host": {
    "hostId": "string",
    "name": "string",
    "address": "string",
    "architecture": "string",
    "status": "NORMAL",
    "lcmIp": "string",
    "mecHost": "string",
    "protocol": "string",
    "port": 0,
    "os": "string",
    "portRangeMin": 0,
    "portRangeMax": 0,
    "userId": "string",
    "configId": "string",
    "userName": "string"
  },
  "lcmToken": "string",
  "vmInfo": [
    {
      "vmId": "string",
      "vncUrl": "string",
      "networks": [
        {
          "ip": "string",
          "name": "string"
        }
      ]
    }
  ],
  "appInstanceId": "string",
  "packageId": "string",
  "createTime": "2021-03-31T06:11:11.495Z",
  "log": "string",
  "nextStage": "string"
}
```

Example response:
```
200 OK
{
  "vmId": "string",
  "projectId": "string",
  "vmRegulation": {
    "regulationId": 0,
    "architecture": "string",
    "nameZh": "string",
    "nameEn": "string",
    "sceneZh": "string",
    "sceneEn": "string",
    "memory": 0,
    "cpu": 0,
    "systemDisk": 0,
    "dataDisk": 0,
    "gpu": "string",
    "otherAbility": "string"
  },
  "vmSystem": {
    "systemId": 0,
    "type": "string",
    "operateSystem": "string",
    "version": "string",
    "systemBit": "string",
    "systemDisk": 0
  },
  "vmNetwork": [
    "string"
  ],
  "vmName": "string",
  "status": "NOTCREATE",
  "stageStatus": {
    "hostInfo": "Success",
    "csar": "Success",
    "instantiateInfo": "Success",
    "workStatus": "Success"
  },
  "host": {
    "hostId": "string",
    "name": "string",
    "address": "string",
    "architecture": "string",
    "status": "NORMAL",
    "lcmIp": "string",
    "mecHost": "string",
    "protocol": "string",
    "port": 0,
    "os": "string",
    "portRangeMin": 0,
    "portRangeMax": 0,
    "userId": "string",
    "configId": "string",
    "userName": "string"
  },
  "lcmToken": "string",
  "vmInfo": [
    {
      "vmId": "string",
      "vncUrl": "string",
      "networks": [
        {
          "ip": "string",
          "name": "string"
        }
      ]
    }
  ],
  "appInstanceId": "string",
  "packageId": "string",
  "createTime": "2021-03-31T06:11:11.495Z",
  "log": "string",
  "nextStage": "string"
}
```

### 14.2 DELETE vm config
DELETE vm config
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/{vmId}
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|vmId|vmId|path param|yes|
|userId|user id|query param|yes|

Example response:
```
200 OK
boolean output
```


### 14.3 GET image config
GET image config
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/image
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|user id|query param|yes|

Example response:
```
200 OK
{
  "vmId": "string",
  "imageId": "string",
  "projectId": "string",
  "vmName": "string",
  "imageName": "string",
  "appInstanceId": "string",
  "hostIp": "string",
  "sumChunkNum": 0,
  "chunkSize": 0,
  "stageStatus": {
    "createImageInfo": "Success",
    "imageStatus": "Success",
    "downloadImageInfo": "Success"
  },
  "status": "NOTCREATE",
  "lcmToken": "string",
  "createTime": "2021-03-31T06:11:11.497Z",
  "log": "string",
  "nextStage": "string"
}
```

### 14.4 POST image config
create image config
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/image
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|user id|query param|yes|

Example response:
```
200 OK
boolean output
```

### 14.5 DELETE image config
delete image config
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/image
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|user id|query param|yes|

Example response:
```
200 OK
boolean output
```

### 14.6 GET image config By ProjectId
GET image config By ProjectId
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|user id|query param|yes|

Example response:
```
200 OK
[
  {
    "vmId": "string",
    "projectId": "string",
    "vmRegulation": {
      "regulationId": 0,
      "architecture": "string",
      "nameZh": "string",
      "nameEn": "string",
      "sceneZh": "string",
      "sceneEn": "string",
      "memory": 0,
      "cpu": 0,
      "systemDisk": 0,
      "dataDisk": 0,
      "gpu": "string",
      "otherAbility": "string"
    },
    "vmSystem": {
      "systemId": 0,
      "type": "string",
      "operateSystem": "string",
      "version": "string",
      "systemBit": "string",
      "systemDisk": 0
    },
    "vmNetwork": [
      "string"
    ],
    "vmName": "string",
    "status": "NOTCREATE",
    "stageStatus": {
      "hostInfo": "Success",
      "csar": "Success",
      "instantiateInfo": "Success",
      "workStatus": "Success"
    },
    "host": {
      "hostId": "string",
      "name": "string",
      "address": "string",
      "architecture": "string",
      "status": "NORMAL",
      "lcmIp": "string",
      "mecHost": "string",
      "protocol": "string",
      "port": 0,
      "os": "string",
      "portRangeMin": 0,
      "portRangeMax": 0,
      "userId": "string",
      "configId": "string",
      "userName": "string"
    },
    "lcmToken": "string",
    "vmInfo": [
      {
        "vmId": "string",
        "vncUrl": "string",
        "networks": [
          {
            "ip": "string",
            "name": "string"
          }
        ]
      }
    ],
    "appInstanceId": "string",
    "packageId": "string",
    "createTime": "2021-03-31T06:11:11.495Z",
    "log": "string",
    "nextStage": "string"
  }
]
```

### 14.7 GET csar pkg
GET csar pkg
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/{vmId}/package
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|user id|query param|yes|
|vmId|vmId|path param|yes|

Example response:
```
200 OK
binary output
```

### 14.8 GET vm resources
GET vm resources
```
Resource URI: /mec/developer/v1/vmconfig
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|


Example response:
```
200 OK
{
  "vmRegulationList": [
    {
      "regulationId": 0,
      "architecture": "string",
      "nameZh": "string",
      "nameEn": "string",
      "sceneZh": "string",
      "sceneEn": "string",
      "memory": 0,
      "cpu": 0,
      "systemDisk": 0,
      "dataDisk": 0,
      "gpu": "string",
      "otherAbility": "string"
    }
  ],
  "vmSystemList": [
    {
      "systemId": 0,
      "type": "string",
      "operateSystem": "string",
      "version": "string",
      "systemBit": "string",
      "systemDisk": 0
    }
  ],
  "vmNetworkList": [
    {
      "networkType": "string",
      "descriptionZh": "string",
      "descriptionEn": "string",
      "networkName": "string"
    }
  ]
}
```

### 14.9 POST vm file
GET csar pkg
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/{vmId}/files
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|user id|query param|yes|
|vmId|vmId|path param|yes|
|file|File |formdate param|yes|

Example response:
```
200 OK
boolean output
```
Developer Interfaces
==============
- [Developer Interfaces](#developer-interfaces)
  - [1. Plugin](#plugin)
    - [1.1 POST upload plugin](#post-upload-plugin)
    - [1.2 GET all](#get-all)
    - [1.3 DELETE one](#delete-one)
	- [1.4 GET download plugin](#get-download-plugin)
	- [1.5 GET download logo](#get-download-logo)
	- [1.6 GET download plugin](#get-download-api)
	- [1.7 PUT update plugin](#put-update-plugin)
	- [1.8 PUT mark plugin](#put-mark-plugin)
  - [2. App](#app)
       - [2.1 POST upload app](#post-upload-app)
       - [2.2 GET all test task](#get-all-test-task)
       - [2.3 GET all app tags](#get-all-app-tags)
       - [2.4 POST upload app to store](#post-upload-app-to-store)
       - [2.5 GET start test](#get-start-test)
       - [2.6 GET subtask list](#get-subtask-list)
  - [3. App Project](#app-project)
       - [3.1 GET all project](#get-all-project)
       - [3.2 GET one project](#get-one-project)
       - [3.3 POST create one project](#post-create-one-project)
       - [3.4 DELETE one project](#delete-one-project)
       - [3.5 PUT modify one project](#put-modify-one-project)
	- [3.6 POST deploy one project](#post-deploy-one-project)
	- [3.7 POST clean test env](#post-clean-test-env)
	- [3.8 POST create test config](#post-create-test-config)
	- [3.9 PUT modify test config](#put-modify-test-config)
	- [3.10 GET one test-config](#get-one-test-config)
	- [3.11 POST upload to store](#post-upload-to-store)
	- [3.12 POST open project to eco](#post-open-project-to-eco)
	- [3.13 POST add image to project](#post-add-image-to-project)
	- [3.14 DELETE image of project](#delete-image-of-project)
	- [3.15 GET image of project](#get-image-of-project)
    - [3.16 POST open project api](#post-open-project-api)
    - [3.17 GET project atp task](#get-project-atp-task)
  - [4. Host](#host)
    - [4.1 GET all host](#get-all-host)
    - [4.2 GET one host](#get-one-host)
	- [4.3 POST create one host](#post-create-one-host)
	- [4.4 DELETE one host](#delete-one-host)
	- [4.5 PUT modify one host](#put-modify-one-host)
  - [5. Capability-groups](#capability-groups)
     - [5.1 POST create one EdgeGalleryCapabilityGroup](#post-create-one-edgegallerycapabilitygroup)
    - [5.2 DELETE one EdgeGalleryCapabilityGroup](#delete-one-edgegallerycapabilitygroup)
	- [5.3 POST create one EdgeGalleryCapability](#post-create-one-edgegallerycapability)
	- [5.4 DELETE one EdgeGalleryCapability](#delete-one-edgegallerycapability)
	- [5.5 GET all EdgeGalleryCapability](#get-all-edgegallerycapability)
	- [5.6 GET all EdgeGalleryCapability by groupid](#get-all-edgegallerycapability-by-groupid)
	- [5.7 GET all EdgeGallery API by fileId](#get-all-edgegallery-api-by-fileid)
	- [5.8 GET all EdgeGallery ECO API](#get-all-edgegallery-eco-api)
    - [5.9 GET all EdgeGallery API](#get-all-edgegallery-api)
  - [6. File](#file)
    - [6.1 GET one file](#get-one-file)
    - [6.2 POST upload one file](#post-upload-one-file)
    - [6.3 POST upload helm yaml](#post-upload-helm-yaml)
    - [6.4 GET helm yaml](#get-helm-yaml)
    - [6.5 DELETE helm yaml](#delete-helm-yaml)
    - [6.6 POST get sample code](#post-get-sample-code)
    - [6.7 GET one file return object](#get-one-file-return-object)
    - [6.8 GET sdk code](#get-sdk-code)
    - [6.9 GET file content](#get-file-content)
    - [6.10 POST pkg structure](#post-pkg-structure)
  - [7. LocalApi](#localapi)
    - [7.1 GET one api file](#get-one-api-file)
  - [8. Health](#health)
    - [8.1 GET health](#get-health)
  - [9. AppRelease](#apprelease)
    - [9.1 GET pkg structure](#get-pkg-structure)
    - [9.2 GET file content](#get-file-content)
  - [10. ReleaseConfig](#releaseconfig)
    - [10.1 GET release config](#get-release-config)
    - [10.2 POST release config](#post-release-config)
    - [10.3 PUT release config](#put-release-config)
  - [11. DeployConfig](#deployconfig)
    - [11.1 GET deploy platform](#get-deploy-platform)
    - [11.2 PUT deploy platform](#put-deploy-platform)
  - [12. Deploy](#deploy)
    - [12.1 GET deploy yaml](#get-deploy-yaml)
    - [12.2 PUT deploy yaml](#put-deploy-yaml)
    - [12.3 GET deploy json](#get-deploy-json)
    - [12.4 POST deploy yaml](#post-deploy-yaml)
  - [13. System](#system)
    - [13.1 GET all capability](#get-all-capability)
    - [13.2 POST one capability](#post-one-capability)
    - [13.3 DELETE one capability](#delete-one-capability)
    - [13.4 GET all system host](#get-all-system-host)
    - [13.5 POST one system host](#post-one-system-host)
    - [13.6 GET one system host](#get-one-system-host)
    - [13.7 PUT one system host](#put-one-system-host)
    - [13.8 DELETE one system host](#delete-one-system-host)
    - [13.9 GET capability detail](#get-capability-detail)
    - [13.10 GET host log](#get-host-log)
  - [14. VirtualMachine](#virtualmachine)
    - [14.1 POST one vm](#post-one-vm)
    - [14.2 DELETE vm config](#delete-vm-config)
    - [14.3 GET image config](#get-image-config)
    - [14.4 POST image config](#post-image-config)
    - [14.5 DELETE image config](#delete-image-config)
    - [14.6 GET image config By ProjectId](#get-image-config-by-projectid)
    - [14.7 GET csar pkg](#get-csar-pkg)
    - [14.8 GET vm resources](#get-vm-resources)
    - [14.9 POST vm file](#post-vm-file)
  - [15. Image](#image)
    - [15.1 POST upload image](#post-upload-image)
    - [15.2 GET merge image](#get-merge-image)

## 1. Plugin
Development environment plug-in or sdk
### 1.1 POST upload plugin 
Upload one plugin with some params.
```
Resource URI: /mec/developer/v1/plugins/
```
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name| Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|userId|theauthoridofcreateprocject|requestparam|yes|

Example response:
```
200 OK

{[
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
]}
```

### 3.2 GET one project 
Query project by id
```
Resource URI:  /mec/developer/v1/projects/{projectId}
```
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
| Name          | Definition |Type   | Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
| | | | |

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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
| | | | |

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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|groupId|groupId|request param|yes|


Example response:
```
200 OK
boolean output
```

### 13.4 GET all system host
GET all host
```
Resource URI: /mec/developer/v1/system/hosts
```
|Name|Definition|Type|Required|
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

### 13.5 POST one system host
create one host
```
Resource URI: /mec/developer/v1/system/hosts
```
|Name|Definition|Type|Required|
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

### 13.6 GET one system host
GET one host
```
Resource URI: /mec/developer/v1/system/hosts/{hostId}
```
|Name|Definition|Type|Required|
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

### 13.7 PUT one system host
modify one host
```
Resource URI: /mec/developer/v1/system/hosts/{hostId}
```
|Name|Definition|Type|Required|
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

### 13.8 DELETE one system host
DELETE one host
```
Resource URI: /mec/developer/v1/system/hosts/{hostId}
```
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
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
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
| | | | |

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
|Name|Definition|Type|Required|
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

## 15. Image
This part is about the api for deploying APP image
### 15.1 POST upload image 
POST upload image
```
Resource URI: /mec/appstore/v1/image/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|id|image chunk id|query param|yes|
|chunkNumber|file chunk Number|query param|yes|
|chunkSize|the size of every chunk|query param|yes|
|currentChunkSize|the length of current file chunk|query param|yes|
|totalSize|the totalSize of file|query param|yes|
|identifier|file identifier|query param|yes|
|filename|fil ename|query param|yes|
|relativePath|the relative Path of file|query param|yes|
|totalChunks|Total number of file blocks|query param|yes|
|type|file type|query param|yes|
|file|the file to upload|query param|yes|

Example response:
```
200 OK
  {
  "headers": {
    "string": [
      "string"
    ]
  },
  "body": {},
  "statusCode": "CONTINUE",
  "statusCodeValue": 0
}
```

### 15.2 GET merge image 
after every file chunk uploaded, then merge to a file with same as you uploaded
```
Resource URI: /mec/appstore/v1/image/merge
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|guid|the file id of need to merge|query param|yes|
|fileName|file name|query param|yes|

Example response:
```
200 OK
 {
  "headers": {
    "string": [
      "string"
    ]
  },
  "body": {},
  "statusCode": "CONTINUE",
  "statusCodeValue": 0
}
```

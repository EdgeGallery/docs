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
    - [1.9 GET api content](#get-api-content)
  - [2. Container Image](#container-image)
    - [2.1 POST upload image](#post-upload-image)
    - [2.2 DELETE upload image](#delete-upload-image)
    - [2.3 POST create image](#post-create-image)
    - [2.4 PUT modify image](#put-modify-image)
    - [2.5 DELETE image](#delete-image)
    - [2.6 GET download image](#get-download-image)
    - [2.7 POST query all image](#post-query-all-image)
    - [2.8 GET merge image](#get-merge-image)
    - [2.9 GET synchronize image](#get-synchronize-image)
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
    - [3.12 GET project atp task](#get-project-atp-task)
    - [3.13 GET project workstatus](#get-project-workstatus)
    - [3.14 POST terminate project](#post-terminate-project)
  - [4. Host](#host)
    - [4.1 GET all host](#get-all-host)
    - [4.2 GET one host](#get-one-host)
    - [4.3 POST create one host](#post-create-one-host)
    - [4.4 DELETE one host](#delete-one-host)
    - [4.5 PUT modify one host](#put-modify-one-host)
    - [4.6 GET host list](#get-host-list)
    - [4.7 GET host logs](#get-host-logs)
  - [5. Capability-groups](#capability-groups)
    - [5.1 POST create group](#post-create-group)
    - [5.2 GET all group](#get-all-group)
    - [5.3 GET one group](#get-one-group)
    - [5.4 DELETE one group](#delete-one-group)
  - [6. File](#file)
    - [6.1 GET one file](#get-one-file)
    - [6.2 POST upload one file](#post-upload-one-file)
    - [6.3 POST upload helm yaml](#post-upload-helm-yaml)
    - [6.4 DELETE helm yaml](#delete-helm-yaml)
    - [6.5 POST get sample code](#post-get-sample-code)
    - [6.6 GET one file return object](#get-one-file-return-object)
    - [6.7 GET sdk code](#get-sdk-code)
    - [6.8 GET file content](#get-file-content)
    - [6.9 POST pkg structure](#post-pkg-structure)
  - [7. Capabilities](#capabilities)
    - [7.1 POST create capability](#post-create-capability)
    - [7.2 GET all capability](#get-all-capability)
    - [7.3 GET one capability](#get-one-capability)
    - [7.4 DELETE one capability](#delete-one-capability)
    - [7.5 PUT one capability](#put-one-capability)
  - [8. Capability-Groups Query](#capability-groups-query)
   - [8.1 GET group by type](#get-group-by-type)
  - [9. AppRelease](#apprelease)
    - [9.1 GET pkg structure](#get-pkg-structure)
    - [9.2 GET file content](#get-file-content)
  - [10. ReleaseConfig](#releaseconfig)
    - [10.1 GET release config](#get-release-config)
    - [10.2 POST release config](#post-release-config)
    - [10.3 PUT release config](#put-release-config)
  - [11. Health](#health)
    - [11.1 GET health check](#get-health-check)
  - [12. Deploy](#deploy)
    - [12.1 GET deploy yaml](#get-deploy-yaml)
    - [12.2 PUT deploy yaml](#put-deploy-yaml)
    - [12.3 GET deploy json](#get-deploy-json)
    - [12.4 POST deploy yaml](#post-deploy-yaml)
 - [13. Capability-group stats](#capability-group-stats)
    - [13.1 GET group stats](#get-group-stats) 
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
  - [14.10 GET merge image](#get-merge-image)
    - [14.11 POST clean vm](#post-clean-vm)
    - [14.12 GET vm pkg](#get-vm-pkg)
    - [14.13 POST vm pkg](#post-vm-pkg)
    - [14.14 DELETE vm pkg](#delete-vm-pkg)
 - [15. Capability-group stats query](#capability-group-stats-query)
    - [15.1 GET stats by type](#get-stats-by-type) 
 - [16. SystemImage](#systemImage)
    - [16.1 POST one system image](#post-one-system-image)
    - [16.2 DELETE system image](#delete-system-image)
    - [16.3 POST system image](#post-system-image)
    - [16.4 PUT system image](#put-system-image)
    - [16.5 PUT publish system image](#put-publish-system-image)
    - [16.6 POST system image to upload file](#post-system-image-to-upload-file)
    - [16.7 GET system image to merge](#get-system-image-to-merge)
    - [16.8 GET system image to download](#get-system-image-to-download)
  - [16.9 POST slim image](#post-slim-image)
    - [16.10 PUT reset image status](#put-reset-image-status)
    - [16.11 POST upload image](#post-upload-image)
    - [16.12 DELETE upload image](#delete-upload-image)
 - [17. Capability query](#capability-query)
    - [17.1 GET capability by groupid](#get-capability-by-groupid) 
    - [17.2 GET capability by en name](#get-capability-by-en-name)  
    - [17.3 GET capability by name](#get-capability-by-name)
    - [17.4 GET capability by projectid](#get-capability-by-projectid)
    - [17.5 GET capability by type](#get-capability-by-type)

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

**Example response**
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
Resource URI: /mec/developer/v1/plugins/
```
|Name|Definition|Type|Required|
|-------------| -------------|------------|------------|
|pluginType|plugin type|request param|yes|
|limit|the max count of one page|request param|yes|
|offset|start index of the page|request param|yes|

**Example response**
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
Resource URI: /mec/developer/v1/plugins/{pluginId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|pluginId|plugin id|path param|yes|

**Example response**
```
200 OK
  true
```

### 1.4 GET download plugin 
Download one plugin
```
Resource URI: /mec/developer/v1/plugins/{pluginId}/action/download
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|pluginId|plugin id|path param|yes|

**Example response**
```
200 OK
  binary output.
```

### 1.5 GET download logo
Download plugin's logo file
```
Resource URI: /mec/developer/v1/plugins/{pluginId}/action/get-logofile
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|pluginId|plugin id|path param|yes|

**Example response**
```
200 OK
  binary output.
```
### 1.6 GET download api
Download plugin's api file
```
Resource URI: /mec/developer/v1/plugins/{pluginId}/action/get-apifile
```
|Name| Definition|Type|Required|
|-------------|-------------|------------|------------|
|pluginId|plugin id|path param|yes|

**Example response**
```
200 OK
  binary output.
```
### 1.7 PUT update plugin
Update api by id
```
Resource URI: /mec/developer/v1/plugins/{pluginId}
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

**Example response**
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
Update plugin satisfaction by pluginId
```
Resource URI: /mec/developer/v1/plugins/{pluginId}/action/score
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|pluginId|pluginid|pathparam|yes|
|score|pluginsatisfaction|requestparam|yes|
|userId|raterid|requestparam|yes|
|userName|ratername|requestparam|yes|

**Example response**
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
### 1.9 GET api content
Get plugin api content by pluginId
```
Resource URI: /mec/developer/v1/plugins/{pluginId}/action/content
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|pluginId|pluginid|pathparam|yes|

**Example response**
```
200 OK
 string output.
```

## 2. Container Image
operate about container app image
### 2.1 POST upload image 
Upload image with some params.
```
Resource URI: /mec/developer/v2/containerimages/{imageId}/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|
|id|id|query param|yes|
|chunkNumber|chunkNumber|path param|yes|
|chunkSize|chunkSize|query param|yes|
|currentChunkSize|currentChunkSize|query param|yes|
|totalSize|totalSize|query param|yes|
|identifier|identifier|query param|yes|
|filename|filename|query param|yes|
|relativePath|relativePath|query param|yes|
|totalChunks|totalChunks|query param|yes|
|type|type|query param|yes|
|file|file|query param|yes|


**Example response**
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

### 2.2 Delete upload image 
cancel upload image
```
Resource URI: /mec/developer/v2/containerimages/{imageId}/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
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

### 2.3 POST create image
create image record
```
Resource URI: /mec/developer/v2/containerimages/
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ContainerImage|ContainerImage|request body param|yes|

**Example request body**
```
{
  "imageId": "string",
  "imageName": "string",
  "imageVersion": "string",
  "userId": "string",
  "userName": "string",
  "uploadTime": "2021-10-12T08:37:38.000+0000",
  "createTime": "2021-10-12T08:37:38.000+0000",
  "imageStatus": "UPLOAD_SUCCEED",
  "imageType": "string",
  "imagePath": "string",
  "fileName": "string"
}
```

**Example response**
```
200 OK
{
  "imageId": "string",
  "imageName": "string",
  "imageVersion": "string",
  "userId": "string",
  "userName": "string",
  "uploadTime": "2021-10-12T08:37:38.000+0000",
  "createTime": "2021-10-12T08:37:38.000+0000",
  "imageStatus": "UPLOAD_SUCCEED",
  "imageType": "string",
  "imagePath": "string",
  "fileName": "string"
}
```

### 2.4 POST modify image
modify image record
```
Resource URI: /mec/developer/v2/containerimages/{imageId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ContainerImage|ContainerImage|request body param|yes|
|imageId|imageId|path param|yes|

**Example request body**
```
{
  "imageId": "string",
  "imageName": "string",
  "imageVersion": "string",
  "userId": "string",
  "userName": "string",
  "uploadTime": "2021-10-12T08:37:38.000+0000",
  "createTime": "2021-10-12T08:37:38.000+0000",
  "imageStatus": "UPLOAD_SUCCEED",
  "imageType": "string",
  "imagePath": "string",
  "fileName": "string"
}
```

**Example response**
```
200 OK
{
  "imageId": "string",
  "imageName": "string",
  "imageVersion": "string",
  "userId": "string",
  "userName": "string",
  "uploadTime": "2021-10-12T08:37:38.000+0000",
  "createTime": "2021-10-12T08:37:38.000+0000",
  "imageStatus": "UPLOAD_SUCCEED",
  "imageType": "string",
  "imagePath": "string",
  "fileName": "string"
}
```

### 2.5 DELETE image
delete image
```
Resource URI: /mec/developer/v2/containerimages/{imageId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
```
200 OK
true
```

### 2.6 GET download image 
download container image 
```
Resource URI: /mec/developer/v2/containerimages/{imageId}/download
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
```
200 OK
binary output.
```
### 2.7 POST query all image 
query all container image 
```
Resource URI: /mec/developer/v2/containerimages/list
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ContainerImageReq|ContainerImageReq|request body param|yes|

**Example request body**
```
{
  "imageName": "string",
  "userId": "string",
  "uploadTimeBegin": "string",
  "uploadTimeEnd": "string",
  "limit": 0,
  "offset": 0,
  "sortBy": "string",
  "sortOrder": "string"
}
```

**Example response**
```
200 OK
{
  "imageId": "string",
  "imageName": "string",
  "imageVersion": "string",
  "userId": "string",
  "userName": "string",
  "uploadTime": "2021-10-12T08:17:01.000Z",
  "createTime": "2021-10-12T08:17:01.000Z",
  "imageStatus": "UPLOAD_WAIT",
  "imageType": "string",
  "imagePath": "string",
  "fileName": "string"
}
```
### 2.8 GET merge image 
merge container image 
```
Resource URI: /mec/developer/v2/containerimages/{imageId}/merge
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|
|fileName|fileName|query param|yes|
|guid|guid|query param|yes|

**Example response**
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
### 2.9 GET synchronize image 
synchronize container image 
```
Resource URI: /mec/developer/v2/containerimages/synchronize
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|


**Example response**
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
## 3. App Project
Edge application projects created by the developer platform
### 3.1 GET all project
Query all app project with userId.
```
Resource URI: /mec/developer/v1/projects/
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|userId|userId|query param|yes|
|projectName|projectName|query param|yes|
|limit|limit|query param|yes|
|offset|offset|query param|yes|

**Example response**
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
    "deployPlatform": "KUBERNETES",
    "type": "string",
    "industry": [
      "string"
    ],
    "description": "string",
    "iconFileId": "string",
    "status": "ONLINE",
    "capabilityList": [
      "string"
    ],
    "lastTestId": "string",
    "userId": "string",
    "createDate": "string",
    "openCapabilityId": "string",
    "applicationProjectCapabilities": [
      {
        "projectId": "string",
        "capabilityId": "string"
      }
    ]
  }
]
```

### 3.2 GET one project 
Query project by id
```
Resource URI:  /mec/developer/v1/projects/{projectId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|
|userId|userId|query param|yes|

**Example response**
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
  "deployPlatform": "KUBERNETES",
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    "string"
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "string",
  "openCapabilityId": "string",
  "applicationProjectCapabilities": [
    {
      "projectId": "string",
      "capabilityId": "string"
    }
  ]
}

```

### 3.3 POST create one project 
Create one project with some params
```
Resource URI: /mec/developer/v1/projects/
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ApplicationProject|Entityclass|body param|yes|
|userId|userId|query param|yes|

**Example request**
```
{
  "id": "string",
  "projectType": "CREATE_NEW",
  "name": "string",
  "version": "string",
  "provider": "string",
  "platform": [
    "string"
  ],
  "deployPlatform": "KUBERNETES",
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    "string"
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "string",
  "openCapabilityId": "string",
  "applicationProjectCapabilities": [
    {
      "projectId": "string",
      "capabilityId": "string"
    }
  ]
}
```
**Example response**
```
{
  "id": "string",
  "projectType": "CREATE_NEW",
  "name": "string",
  "version": "string",
  "provider": "string",
  "platform": [
    "string"
  ],
  "deployPlatform": "KUBERNETES",
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    "string"
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "string",
  "openCapabilityId": "string",
  "applicationProjectCapabilities": [
    {
      "projectId": "string",
      "capabilityId": "string"
    }
  ]
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

**Example response**
```
200 OK
true
```

### 3.5 PUT modify one project 
Modify one project by id
```
Resource URI: /mec/developer/v1/projects/{projectId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|
|userId|userId|request param|yes|
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
  "deployPlatform": "KUBERNETES",
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    "string"
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "string",
  "openCapabilityId": "string",
  "applicationProjectCapabilities": [
    {
      "projectId": "string",
      "capabilityId": "string"
    }
  ]
}
```
**Example response**
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
  "deployPlatform": "KUBERNETES",
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    "string"
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "string",
  "openCapabilityId": "string",
  "applicationProjectCapabilities": [
    {
      "projectId": "string",
      "capabilityId": "string"
    }
  ]
}
```

### 3.6 POST deploy one project 
Deploy one project by id
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/deploy
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|
|userId|userId|request param|yes|

**Example response**
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
  "deployPlatform": "KUBERNETES",
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    "string"
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "string",
  "openCapabilityId": "string",
  "applicationProjectCapabilities": [
    {
      "projectId": "string",
      "capabilityId": "string"
    }
  ]
}
```

### 3.7 POST clean test env 
Clean test env
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/clean
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|
|userId|userId|request param|yes|

**Example response**
```
200 OK
true
```

### 3.8 POST create test config 
Create test config of one project
```
Resource URI: /mec/developer/v1/projects/{projectId}/test-config
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|
|userId|userId|request param|yes|
|ProjectTestConfig|entityclass|bodyparam|yes|

```
ProjectTestConfig
{
  "testId": "string",
  "projectId": "string",
  "platform": "KUBERNETES",
  "deployFileId": "string",
  "privateHost": false,
  "pods": "string",
  "deployStatus": "NOTDEPLOY",
  "stageStatus": {
    "csar": "Success",
    "hostInfo": "Success",
    "instantiateInfo": "Success",
    "workStatus": "Success"
  },
  "hosts": [
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
      "password": "string",
      "vncPort": 0,
      "parameter": "string",
      "resource": "string"
    }
  ],
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2021-10-12T08:56:43.051Z",
  "lcmToken": "string",
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
  "appApiFileId": "string",
  "accessUrl": "string",
  "packageId": "string",
  "nextStage": "string"
}
```
**Example response**
```
200 OK
{
  "testId": "string",
  "projectId": "string",
  "platform": "KUBERNETES",
  "deployFileId": "string",
  "privateHost": false,
  "pods": "string",
  "deployStatus": "NOTDEPLOY",
  "stageStatus": {
    "csar": "Success",
    "hostInfo": "Success",
    "instantiateInfo": "Success",
    "workStatus": "Success"
  },
  "hosts": [
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
      "password": "string",
      "vncPort": 0,
      "parameter": "string",
      "resource": "string"
    }
  ],
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2021-10-12T08:56:43.051Z",
  "lcmToken": "string",
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
  "appApiFileId": "string",
  "accessUrl": "string",
  "packageId": "string",
  "nextStage": "string"
}
```

### 3.9 PUT modify test config 
Modify test config of one project
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
  "platform": "KUBERNETES",
  "deployFileId": "string",
  "privateHost": false,
  "pods": "string",
  "deployStatus": "NOTDEPLOY",
  "stageStatus": {
    "csar": "Success",
    "hostInfo": "Success",
    "instantiateInfo": "Success",
    "workStatus": "Success"
  },
  "hosts": [
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
      "password": "string",
      "vncPort": 0,
      "parameter": "string",
      "resource": "string"
    }
  ],
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2021-10-12T08:56:43.051Z",
  "lcmToken": "string",
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
  "appApiFileId": "string",
  "accessUrl": "string",
  "packageId": "string",
  "nextStage": "string"
}
```
**Example response**
```
200 OK
{
  "testId": "string",
  "projectId": "string",
  "platform": "KUBERNETES",
  "deployFileId": "string",
  "privateHost": false,
  "pods": "string",
  "deployStatus": "NOTDEPLOY",
  "stageStatus": {
    "csar": "Success",
    "hostInfo": "Success",
    "instantiateInfo": "Success",
    "workStatus": "Success"
  },
  "hosts": [
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
      "password": "string",
      "vncPort": 0,
      "parameter": "string",
      "resource": "string"
    }
  ],
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2021-10-12T08:56:43.051Z",
  "lcmToken": "string",
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
  "appApiFileId": "string",
  "accessUrl": "string",
  "packageId": "string",
  "nextStage": "string"
}
```

### 3.10 GET one test-config 
Query one test config by projectId
```
Resource URI: /mec/developer/v1/projects/{projectId}/test-config
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|

**Example response**
```
200 OK
{
  "testId": "string",
  "projectId": "string",
  "platform": "KUBERNETES",
  "deployFileId": "string",
  "privateHost": false,
  "pods": "string",
  "deployStatus": "NOTDEPLOY",
  "stageStatus": {
    "csar": "Success",
    "hostInfo": "Success",
    "instantiateInfo": "Success",
    "workStatus": "Success"
  },
  "hosts": [
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
      "password": "string",
      "vncPort": 0,
      "parameter": "string",
      "resource": "string"
    }
  ],
  "errorLog": "string",
  "workLoadId": "string",
  "appInstanceId": "string",
  "deployDate": "2021-10-12T08:56:43.051Z",
  "lcmToken": "string",
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
  "appApiFileId": "string",
  "accessUrl": "string",
  "packageId": "string",
  "nextStage": "string"
}
```

### 3.11 POST upload to store 
Upload app project to developer
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|
|userId|userId|request param|yes|
|userName|userName|request param|yes|

**Example response**
```
200 OK
"csarId"
```

### 3.12 GET project atp task 
GET project atp task
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/atp
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|

**Example response**
```
200 OK
true
```
### 3.13 GET project workstatus 
GET project workstatus 
```
Resource URI: /mec/developer/v1/projects/{projectId}/container/workStatus
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|

**Example response**
```
200 OK
true
```
### 3.14 POST terminate project
GET project atp task
```
Resource URI: /mec/developer/v1/projects/{projectId}/action/terminate
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectid|path param|yes|
|userId|userId|query param|yes|

**Example response**
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
  "deployPlatform": "KUBERNETES",
  "type": "string",
  "industry": [
    "string"
  ],
  "description": "string",
  "iconFileId": "string",
  "status": "ONLINE",
  "capabilityList": [
    "string"
  ],
  "lastTestId": "string",
  "userId": "string",
  "createDate": "string",
  "openCapabilityId": "string",
  "applicationProjectCapabilities": [
    {
      "projectId": "string",
      "capabilityId": "string"
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
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|userId|userId|query param|yes|
|name|name|query param|yes|
|ip|ip|query param|yes|
|limit|limit|query param|yes|
|offset|offset|query param|yes|

**Example response**
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
    "userName": "string",
    "password": "string",
    "vncPort": 0,
    "parameter": "string",
    "resource": "string"
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
|hostId|hostid|path param|yes|

**Example response**
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
  "userName": "string",
  "password": "string",
  "vncPort": 0,
  "parameter": "string",
  "resource": "string"
}
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
  "password": "string",
  "vncPort": 0,
  "parameter": "string",
  "resource": "string"
}
```

**Example response**
```
200 OK
true
```

### 4.4 DELETE one host
Delete one host.
```
Resource URI: /mec/developer/v1/hosts/{hostId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|hostId|hostid|pathparam|yes|

**Example response**
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
  "password": "string",
  "vncPort": 0,
  "parameter": "string",
  "resource": "string"
}
```
**Example response**
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
  "userName": "string",
  "password": "string",
  "vncPort": 0,
  "parameter": "string",
  "resource": "string"
}
```
### 4.6 GET host list
get host list
```
Resource URI: /mec/developer/v1/hosts/list
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|os|os|query param|yes|
|architecture|architecture|query param|yes|
|limit|limit|query param|yes|
|offset|offset|query param|yes|

**Example response**
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
    "userName": "string",
    "password": "string",
    "vncPort": 0,
    "parameter": "string",
    "resource": "string"
  }
]
```
### 4.7 GET host logs
get host logs.
```
Resource URI: /mec/developer/v1/hosts/{hostId}/logs
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|hostId|hostid|pathparam|yes|

**Example response**
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
    "userName": "string",
    "password": "string",
    "vncPort": 0,
    "parameter": "string",
    "resource": "string"
  }
]
Parameters
```
## 5. Capability-groups
capability group of edge applications
### 5.1 POST create group
Create one Capability group.
```
Resource URI: /mec/developer/v2/capability-groups
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|CapabilityGroup|entityclass|body param|yes|

```
{
  "id": "string",
  "name": "string",
  "description": "string",
  "nameEn": "string",
  "descriptionEn": "string",
  "type": "string",
  "iconFileId": "string",
  "author": "string",
  "createTime": 0,
  "updateTime": 0,
  "parent": {},
  "parentId": "string"
}
```
**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "nameEn": "string",
  "descriptionEn": "string",
  "type": "string",
  "iconFileId": "string",
  "author": "string",
  "createTime": 0,
  "updateTime": 0,
  "parent": {},
  "parentId": "string"
}
```

### 5.2 GET all group
GET all group.
```
Resource URI: /mec/developer/v2/capability-groups/
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|


**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "description": "string",
    "nameEn": "string",
    "descriptionEn": "string",
    "type": "string",
    "iconFileId": "string",
    "author": "string",
    "createTime": 0,
    "updateTime": 0,
    "parent": {},
    "parentId": "string"
  }
]
```

### 5.3 GET one group
GET one group
```
Resource URI: /mec/developer/v2/capability-groups/{id}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|id|group id|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "nameEn": "string",
  "descriptionEn": "string",
  "type": "string",
  "iconFileId": "string",
  "author": "string",
  "createTime": 0,
  "updateTime": 0,
  "parent": {},
  "parentId": "string"
}
```

### 5.4 DELETE one groupy
DELETE one group by id
```
Resource URI: /mec/developer/v2/capability-groups/{id}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|id|group id|path param|yes|

**Example response**
```
200 OK
string output.
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
|fileId|fileid|path param|yes|
|userId|userId|request param|yes|
|type|file type|request param|yes|

**Example response**
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
|file|MultipartFileclass|request part|yes|
|userId|userId|request param|yes|

**Example response**
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
|file|MultipartFileclass|request part|yes|
|userId|userId|reques tparam|yes|
|projectId|projectid|request param|yes|
|configType|configType|request param|yes|

**Example response**
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

### 6.4 DELETE helm yaml
Delete helm template yaml.
```
Resource URI: /mec/developer/v1/files/helm-template-yaml
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|fileId|fileid|request param|yes||

**Example response**
```
200 OK
"string"
```

### 6.5 POST get sample code
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
**Example response**
```
200 OK
byte array output
```
### 6.6 GET one file return object
Get file return one object
```
Resource URI: /mec/developer/v1/files/api-info/{fileId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|fileId|file id|path param |yes|
|userId|the author id of upload file|request param |yes|


**Example response**
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

### 6.7 GET sdk code
GET sdk code
```
Resource URI: /mec/developer/v1/files/sdk/{fileId}/download/{lan}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|fileId|file id|path param |yes|
|lan|sdk codeLanguage|path param |yes|


**Example response**
```
200 OK
binary output
```

### 6.8 GET file content
GET file content
```
Resource URI: /mec/developer/v1/files/samplecode/get-file-content
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|fileName|file name|request param |yes|

**Example response**
```
200 OK
String output
```


### 6.9 POST pkg structure
POST pkg structure
```
Resource URI: /mec/developer/v1/files/samplecode/get-pkg-structure
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|apiFileIds|file id arrays|body param |yes|

**Example response**
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

## 7. Capabilities
capability of edge applications
### 7.1 POST create capability
POST create capability
```
Resource URI: /mec/developer/v2/capabilities/
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|Capability|Capability|body param|yes|

```
Capability:
{
  "id": "string",
  "name": "string",
  "nameEn": "string",
  "version": "string",
  "description": "string",
  "descriptionEn": "string",
  "provider": "string",
  "apiFileId": "string",
  "guideFileId": "string",
  "guideFileIdEn": "string",
  "uploadTime": 0,
  "port": 0,
  "host": "string",
  "protocol": "string",
  "appId": "string",
  "packageId": "string",
  "userId": "string",
  "selectCount": 0,
  "iconFileId": "string",
  "author": "string",
  "experienceUrl": "string",
  "group": {
    "id": "string",
    "name": "string",
    "description": "string",
    "nameEn": "string",
    "descriptionEn": "string",
    "type": "string",
    "iconFileId": "string",
    "author": "string",
    "createTime": 0,
    "updateTime": 0,
    "parent": {},
    "parentId": "string"
  },
  "groupId": "string"
}
```
**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "nameEn": "string",
  "version": "string",
  "description": "string",
  "descriptionEn": "string",
  "provider": "string",
  "apiFileId": "string",
  "guideFileId": "string",
  "guideFileIdEn": "string",
  "uploadTime": 0,
  "port": 0,
  "host": "string",
  "protocol": "string",
  "appId": "string",
  "packageId": "string",
  "userId": "string",
  "selectCount": 0,
  "iconFileId": "string",
  "author": "string",
  "experienceUrl": "string",
  "group": {
    "id": "string",
    "name": "string",
    "description": "string",
    "nameEn": "string",
    "descriptionEn": "string",
    "type": "string",
    "iconFileId": "string",
    "author": "string",
    "createTime": 0,
    "updateTime": 0,
    "parent": {},
    "parentId": "string"
  },
  "groupId": "string"
}
```
### 7.2 GET all capability
GET all capability
```
Resource URI: /mec/developer/v2/capabilities/
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|filterType|filterType|query param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
]
```
### 7.3 GET one capability
GET one capability
```
Resource URI: /mec/developer/v2/capabilities/{id}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
]
```
### 7.4 DELETE one capability
DELETE one capability
```
Resource URI: /mec/developer/v2/capabilities/{id}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

**Example response**
```
200 OK
{
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
```
### 7.5 PUT one capability
PUT one capability
```
Resource URI: /mec/developer/v2/capabilities/{id}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|
|capability|capability|body param|yes|

```
capability:
{
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
```
**Example response**
```
200 OK
{
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
```
## 8. Capability-Groups Query
Capability-Groups Queryh
### 8.1 GET group by type
GET group by type
```
Resource URI: /mec/developer/v2/query/capability-groups/type/{type}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|type|group type|path param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "description": "string",
    "nameEn": "string",
    "descriptionEn": "string",
    "type": "string",
    "iconFileId": "string",
    "author": "string",
    "createTime": 0,
    "updateTime": 0,
    "parent": {},
    "parentId": "string"
  }
]
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

**Example response**
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

**Example response**
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


**Example response**
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
**Example response**
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
**Example response**
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


## 11. Health
Health Check
### 11.1 GET health check
GET health checkm
```
Resource URI: /health
```

**Example response**
```
200 OK
'ok'.
```

## 12. Deploy
API to manipulate deployment files
### 12.1 GET deploy yaml
Get deploy yaml
```
Resource URI: /mec/developer/v1/deploy/{fileId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|fileId|fileId|path param|yes|

**Example response**
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
Modify deploy yaml by file id
```
Resource URI: /mec/developer/v1/deploy/{fileId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|fileId|fileId|path param|yes|
|fileContent|file content|body param|yes|

**Example response**
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

**Example response**
```
200 OK
[
  {}
]
```

### 12.4 POST deploy yaml
Upload deploy yaml
```
Resource URI: /mec/developer/v1/deploy/{projectId}/action/save-yaml
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|jsonStr|deploy yaml content|body param|yes|
|userId|userId|request param|yes|
|projectId|projectId|path param|yes|
|configType|Fields that distinguish deployment types|request param|yes|

**Example response**
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

## 13. Capability-group stats
query group stats
### 13.1 GET group stats
GET group stats
```
Resource URI: /mec/developer/v2/capability-group-stats/
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|


**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "description": "string",
    "nameEn": "string",
    "descriptionEn": "string",
    "type": "string",
    "iconFileId": "string",
    "author": "string",
    "createTime": 0,
    "updateTime": 0,
    "parent": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "capabilityCount": 0,
    "parentId": "string"
  }
]
```

## 14. VirtualMachine
This part is about the api for virtual machine deployment
### 14.1 POST one vm
Create one vm
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm-create
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|userId|query param|yes|

**Example response**
```
200 OK
{
  "vmId": "string",
  "projectId": "string",
  "vmName": "string",
  "status": "NOTCREATE",
  "stageStatus": {
    "hostInfo": "Success",
    "distributeInfo": "Success",
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
    "userName": "string",
    "password": "string",
    "vncPort": 0,
    "parameter": "string",
    "resource": "string"
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
  "createTime": "2021-10-13T01:47:57.447Z",
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

**Example response**
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

**Example response**
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
  "checksum": "string",
  "stageStatus": {
    "createImageInfo": "Success",
    "imageStatus": "Success",
    "downloadImageInfo": "Success"
  },
  "status": "NOTCREATE",
  "lcmToken": "string",
  "createTime": "2021-10-13T01:47:57.448Z",
  "log": "string",
  "nextStage": "string"
}
```

### 14.4 POST image config
Create image config
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/image
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|user id|query param|yes|

**Example response**
```
200 OK
boolean output
```

### 14.5 DELETE image config
Delete image config
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/image
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|user id|query param|yes|

**Example response**
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

**Example response**
```
200 OK
[
  {
    "vmId": "string",
    "projectId": "string",
    "vmName": "string",
    "status": "NOTCREATE",
    "stageStatus": {
      "hostInfo": "Success",
      "distributeInfo": "Success",
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
      "userName": "string",
      "password": "string",
      "vncPort": 0,
      "parameter": "string",
      "resource": "string"
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
    "createTime": "2021-10-13T01:47:57.447Z",
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

**Example response**
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

**Example response**
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
      "type": "public",
      "operateSystem": "ubuntu",
      "version": "string",
      "systemBit": "string",
      "systemDisk": 0,
      "systemName": "string",
      "fileName": "string",
      "createTime": "string",
      "modifyTime": "string",
      "systemFormat": "string",
      "systemSize": 0,
      "systemSlim": "SLIM_WAIT",
      "uploadTime": "string",
      "systemPath": "string",
      "status": "UPLOAD_WAIT",
      "userId": "string",
      "userName": "string",
      "fileMd5": "string",
      "fileIdentifier": "string",
      "errorType": "string"
    }
  ],
  "vmNetworkList": [
    {
      "networkType": "string",
      "descriptionZh": "string",
      "descriptionEn": "string",
      "networkName": "string"
    }
  ],
  "vmUserDataList": [
    {
      "operateSystem": "string",
      "flavorExtraSpecs": "string",
      "contents": "string",
      "params": "string",
      "temp": false
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
|file|File |query param|yes|
|id|id|query param|yes|
|chunkNumber|chunkNumber|path param|yes|
|chunkSize|chunkSize|query param|yes|
|currentChunkSize|currentChunkSize|query param|yes|
|totalSize|totalSize|query param|yes|
|identifier|identifier|query param|yes|
|filename|filename|query param|yes|
|relativePath|relativePath|query param|yes|
|totalChunks|totalChunks|query param|yes|
|type|type|query param|yes|

**Example response**
```
200 OK
boolean output
```
### 14.10 GET merge image
merge vm image
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/{vmId}/merge
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|user id|query param|yes|
|vmId|vmId|path param|yes|
|fileName|fileName |query param|yes|
|identifier|identifier |query param|yes|

**Example response**
```
200 OK
{
  "headers": {
    "string": [
      "string"
    ]
  },
  "body": {},
  "statusCodeValue": 0,
  "statusCode": "CONTINUE"
}
```
### 14.11 POST clean vm
clean vm 
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm/clean
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|


**Example response**
```
200 OK
true.
```
### 14.12 GET vm pkg
query vm package info
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm-package
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|userId|query param|yes|


**Example response**
```
200 OK
{
  "id": "string",
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
    "type": "public",
    "operateSystem": "ubuntu",
    "version": "string",
    "systemBit": "string",
    "systemDisk": 0,
    "systemName": "string",
    "fileName": "string",
    "createTime": "string",
    "modifyTime": "string",
    "systemFormat": "string",
    "systemSize": 0,
    "systemSlim": "SLIM_WAIT",
    "uploadTime": "string",
    "systemPath": "string",
    "status": "UPLOAD_WAIT",
    "userId": "string",
    "userName": "string",
    "fileMd5": "string",
    "fileIdentifier": "string",
    "errorType": "string"
  },
  "vmNetwork": [
    "string"
  ],
  "vmUserData": {
    "operateSystem": "string",
    "flavorExtraSpecs": "string",
    "contents": "string",
    "params": "string",
    "temp": false
  },
  "vmName": "string",
  "ak": "string",
  "sk": "string",
  "appInstanceId": "string",
  "createTime": "2021-10-13T01:47:57.448Z"
}
```
### 14.13 POST vm pkg
create vm package config info
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm-package
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|userId|query param|yes|
|vmPackageConfig|vmPackageConfig|body param|yes|

```
{
  "id": "string",
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
    "type": "public",
    "operateSystem": "ubuntu",
    "version": "string",
    "systemBit": "string",
    "systemDisk": 0,
    "systemName": "string",
    "fileName": "string",
    "createTime": "string",
    "modifyTime": "string",
    "systemFormat": "string",
    "systemSize": 0,
    "systemSlim": "SLIM_WAIT",
    "uploadTime": "string",
    "systemPath": "string",
    "status": "UPLOAD_WAIT",
    "userId": "string",
    "userName": "string",
    "fileMd5": "string",
    "fileIdentifier": "string",
    "errorType": "string"
  },
  "vmNetwork": [
    "string"
  ],
  "vmUserData": {
    "operateSystem": "string",
    "flavorExtraSpecs": "string",
    "contents": "string",
    "params": "string",
    "temp": false
  },
  "vmName": "string",
  "ak": "string",
  "sk": "string",
  "appInstanceId": "string",
  "createTime": "2021-10-13T01:47:57.448Z"
}
```

**Example response**
```
200 OK
{
  "id": "string",
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
    "type": "public",
    "operateSystem": "ubuntu",
    "version": "string",
    "systemBit": "string",
    "systemDisk": 0,
    "systemName": "string",
    "fileName": "string",
    "createTime": "string",
    "modifyTime": "string",
    "systemFormat": "string",
    "systemSize": 0,
    "systemSlim": "SLIM_WAIT",
    "uploadTime": "string",
    "systemPath": "string",
    "status": "UPLOAD_WAIT",
    "userId": "string",
    "userName": "string",
    "fileMd5": "string",
    "fileIdentifier": "string",
    "errorType": "string"
  },
  "vmNetwork": [
    "string"
  ],
  "vmUserData": {
    "operateSystem": "string",
    "flavorExtraSpecs": "string",
    "contents": "string",
    "params": "string",
    "temp": false
  },
  "vmName": "string",
  "ak": "string",
  "sk": "string",
  "appInstanceId": "string",
  "createTime": "2021-10-13T01:47:57.448Z"
}
```
### 14.14 DELETE vm pkg
delete vm package config info
```
Resource URI: /mec/developer/v1/projects/{projectId}/vm-package
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|
|userId|userId|query param|yes|

**Example response**
```
200 OK
true.
```

## 15. Capability-group stats query
This part is about the api for Capability-group stats
### 15.1 GET stats by type 
GET group stats by typge
```
Resource URI: /mec/developer/v2/query/capability-group-stats/type/{type}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|type|type|path param|yes|

**Example response**
```
200 OK
 [
  {
    "id": "string",
    "name": "string",
    "description": "string",
    "nameEn": "string",
    "descriptionEn": "string",
    "type": "string",
    "iconFileId": "string",
    "author": "string",
    "createTime": 0,
    "updateTime": 0,
    "parent": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "capabilityCount": 0,
    "parentId": "string"
  }
]
```
## 16. SystemImage
This part is about the api for system image deployment
### 16.1 POST one system image
Create one system image
```
Resource URI: /mec/developer/v1/system/images
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|VmImage|VmImage|body param|yes|

```
VmImage:
{
  "systemId": 0,
  "type": "public",
  "operateSystem": "ubuntu",
  "version": "string",
  "systemBit": "string",
  "systemDisk": 0,
  "systemName": "string",
  "fileName": "string",
  "createTime": "string",
  "modifyTime": "string",
  "systemFormat": "string",
  "systemSize": 0,
  "systemSlim": "SLIM_WAIT",
  "uploadTime": "string",
  "systemPath": "string",
  "status": "UPLOAD_WAIT",
  "userId": "string",
  "userName": "string",
  "fileMd5": "string",
  "fileIdentifier": "string",
  "errorType": "string"
}
```

**Example response**
```
200 OK
boolean output
```

### 16.2 DELETE system image
DELETE system image
```
Resource URI: /mec/developer/v1/system/images/{systemId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|

**Example response**
```
200 OK
boolean output
```


### 16.3 POST system image
GET system image
```
Resource URI: /mec/developer/v1/system/images/list
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|userId|userId|query param|no|
|quemepGetSystemImageReqryCtrl|mepGetSystemImageReq|body param|yes|

```
mepGetSystemImageReq:
{
  "systemName": "string",
  "type": "public",
  "userId": "string",
  "operateSystem": "string",
  "status": "UPLOAD_WAIT",
  "uploadTimeBegin": "string",
  "uploadTimeEnd": "string",
  "queryCtrl": {
    "offset": 0,
    "limit": 0,
    "sortBy": "userName",
    "sortOrder": "ASC"
  }
}
```

**Example response**
```
200 OK
{
  "totalCount": 0,
  "imageList": [
    {
      "systemId": 0,
      "type": "public",
      "operateSystem": "ubuntu",
      "version": "string",
      "systemBit": "string",
      "systemDisk": 0,
      "systemName": "string",
      "fileName": "string",
      "createTime": "string",
      "modifyTime": "string",
      "systemFormat": "string",
      "systemSize": 0,
      "systemSlim": "SLIM_WAIT",
      "uploadTime": "string",
      "systemPath": "string",
      "status": "UPLOAD_WAIT",
      "userId": "string",
      "userName": "string",
      "fileMd5": "string",
      "fileIdentifier": "string",
      "errorType": "string"
    }
  ]
}
```

### 16.4 PUT system image
update system image
```
Resource URI: /mec/developer/v1/system/images/{systemId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|
|vmImage|vmImage|body param|yes|

```
vmImage:
{
  "systemId": 0,
  "type": "public",
  "operateSystem": "ubuntu",
  "version": "string",
  "systemBit": "string",
  "systemDisk": 0,
  "systemName": "string",
  "fileName": "string",
  "createTime": "string",
  "modifyTime": "string",
  "systemFormat": "string",
  "systemSize": 0,
  "systemSlim": "SLIM_WAIT",
  "uploadTime": "string",
  "systemPath": "string",
  "status": "UPLOAD_WAIT",
  "userId": "string",
  "userName": "string",
  "fileMd5": "string",
  "fileIdentifier": "string",
  "errorType": "string"
}
```

**Example response**
```
200 OK
boolean output
```

### 16.5 PUT publish system image
publish system image 
```
Resource URI: /mec/developer/v1/system/images/{systemId}/publish
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|

**Example response**
```
200 OK
boolean output
```

### 16.6 POST system image to upload file
upload system image
```
Resource URI: /mec/developer/v1/system/images/{systemId}/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|
|identifier|identifier|query param|yes|

**Example response**
```
200 OK
{
  "headers": {
    "string": [
      "string"
    ]
  },
  "body": {},
  "statusCodeValue": 0,
  "statusCode": "CONTINUE"
}
```

### 16.7 GET system image to merge
merge system image
```
Resource URI: /mec/developer/v1/system/images/{systemId}/merge
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|
|fileName|fileName|request param|yes|
|identifier|identifier|request param|yes|

**Example response**
```
200 OK
{
  "headers": {
    "string": [
      "string"
    ]
  },
  "body": {},
  "statusCodeValue": 0,
  "statusCode": "CONTINUE"
}
```

### 16.8 GET system image to download
download system image
```
Resource URI: /mec/developer/v1/system/images/{systemId}/download
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|

**Example response**
```
200 OK
binary output.
```

### 16.9 POST slim image 
slim system image
```
Resource URI: /mec/developer/v1/system/images/{systemId}/slim
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|

**Example response**
```
200 OK
true
```
### 16.10 PUT reset image status
slim system image
```
Resource URI: /mec/developer/v1/system/images/{systemId}/reset
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|

**Example response**
```
200 OK
true
```

### 16.11 POST upload image
upload system image
```
Resource URI: /mec/developer/v1/system/images/{systemId}/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|
|id|id|query param|yes|
|chunkNumber|chunkNumber|path param|yes|
|chunkSize|chunkSize|query param|yes|
|currentChunkSize|currentChunkSize|query param|yes|
|totalSize|totalSize|query param|yes|
|identifier|identifier|query param|yes|
|filename|filename|query param|yes|
|relativePath|relativePath|query param|yes|
|totalChunks|totalChunks|query param|yes|
|type|type|query param|yes|

**Example response**
```
200 OK
{
  "headers": {
    "string": [
      "string"
    ]
  },
  "body": {},
  "statusCodeValue": 0,
  "statusCode": "CONTINUE"
}
```

### 16.12 DELETE upload image
cancel upload system image
```
Resource URI: /mec/developer/v1/system/images/{systemId}/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|systemId|systemId|path param|yes|
|identifier|identifier|query param|yes|

**Example response**
```
200 OK
{
  "headers": {
    "string": [
      "string"
    ]
  },
  "body": {},
  "statusCodeValue": 0,
  "statusCode": "CONTINUE"
}
```
## 17. Capability query
This part is about the api for query capability
### 17.1 GET capability by groupid
GET capability by groupid
```
Resource URI: /mec/developer/v2/query/capabilities/group-id/{groupId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|groupId|groupId|path param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
]
```
### 17.2 GET capability by en name
GET capability by en name
```
Resource URI: /mec/developer/v2/query/capabilities/name-en
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|nameEn|english name|query param|yes|
|limit|limit name|query param|yes|
|offset|offset name|query param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
]
```
### 17.3 GET capability by name
GET capability by zh name
```
Resource URI: /mec/developer/v2/query/capabilities/name
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|name|chinese name|query param|yes|
|limit|limit name|query param|yes|
|offset|offset name|query param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
]
```
### 17.4 GET capability by projectid
GET capability by projectid
```
Resource URI: /mec/developer/v2/query/capabilities/project-id/{projectId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|projectId|projectId|path param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
]
```
### 17.5 GET capability by type
GET capability by type
```
Resource URI: /mec/developer/v2/query/capabilities/type/{type}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|type|type|path param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "nameEn": "string",
    "version": "string",
    "description": "string",
    "descriptionEn": "string",
    "provider": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "guideFileIdEn": "string",
    "uploadTime": 0,
    "port": 0,
    "host": "string",
    "protocol": "string",
    "appId": "string",
    "packageId": "string",
    "userId": "string",
    "selectCount": 0,
    "iconFileId": "string",
    "author": "string",
    "experienceUrl": "string",
    "group": {
      "id": "string",
      "name": "string",
      "description": "string",
      "nameEn": "string",
      "descriptionEn": "string",
      "type": "string",
      "iconFileId": "string",
      "author": "string",
      "createTime": 0,
      "updateTime": 0,
      "parent": {},
      "parentId": "string"
    },
    "groupId": "string"
  }
]
```
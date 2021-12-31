Developer Interfaces
==============
- [Developer Interfaces](#developer-interfaces)
  - [1. Plugin](#plugin)
    - [1.1 POST upload plugin](#post-upload-plugin)
    - [1.2 GET all plugin](#get-all-plugin)
    - [1.3 DELETE one plugin](#delete-one-plugin)
    - [1.4 GET download plugin](#get-download-plugin)
    - [1.5 GET download logo](#get-download-logo)
    - [1.6 GET download api](#get-download-api)
    - [1.7 PUT update plugin](#put-update-plugin)
    - [1.8 PUT mark plugin](#put-mark-plugin)
    - [1.9 GET api content](#get-api-content)
  - [2. Container Image](#container-image)
    - [2.1 POST upload container image](#post-upload-container-image)
    - [2.2 Cancel upload container image](#delete-upload-container-image)
    - [2.3 PUT modify image](#put-modify-image)
    - [2.4 DELETE container image](#delete-container-image)
    - [2.5 GET download image](#get-download-image)
    - [2.6 POST query all image](#post-query-all-image)
    - [2.7 GET merge container image](#get-merge-container-image)
    - [2.8 GET synchronize image](#get-synchronize-image)
  - [3. Application](#application)
    - [3.1 GET one page application](#get-one-page-application)
    - [3.2 GET one application](#get-one-application)
    - [3.3 POST create one application](#post-create-one-application)
    - [3.4 DELETE one application](#delete-one-application)
    - [3.5 PUT modify one application](#put-modify-one-application)
    - [3.6 GET application detail](#get-application-detail)
    - [3.7 PUT modify application detail](#put-modify-application-detail)
  - [4. Mep-hosts](#mep-hosts)
    - [4.1 GET all host](#get-all-host)
    - [4.2 GET one host](#get-one-host)
    - [4.3 POST create one host](#post-create-one-host)
    - [4.4 DELETE one host](#delete-one-host)
    - [4.5 PUT modify one host](#put-modify-one-host)
    - [4.6 GET host logs](#get-host-logs)
	- [4.7 POST upload config file](#post-upload-config-file)
  - [5. Capability-groups](#capability-groups)
    - [5.1 POST create group](#post-create-group)
    - [5.2 GET all group](#get-all-group)
    - [5.3 GET one group](#get-one-group)
    - [5.4 DELETE one group](#delete-one-group)
  - [6. Upload-files](#upload-files)
    - [6.1 GET one file](#get-one-file)
    - [6.2 POST upload one file](#post-upload-one-file)
    - [6.3 POST get sample code](#post-get-sample-code)
    - [6.4 GET file stream](#get-file-stream)
    - [6.5 GET sdk code](#get-sdk-code)
    - [6.6 POST sample content](#post-sample-content)
    - [6.7 POST sample structure](#post-sample-structure)
    - [6.8 DELETE one file](#delete-one-file)
  - [7. Capabilities](#capabilities)
    - [7.1 POST create capability](#post-create-capability)
    - [7.2 GET all capability](#get-all-capability)
    - [7.3 GET one capability](#get-one-capability)
    - [7.4 DELETE one capability](#delete-one-capability)
    - [7.5 PUT one capability](#put-one-capability)
  - [8. Capability-Groups Query](#capability-groups-query)
    - [8.1 GET group by type](#get-group-by-type)
  - [9. Flavors](#flavors)
    - [9.1 GET all flavor](#get-all-flavor)
    - [9.2 POST create one flavor](#post-create-one-flavor)
	- [9.3 GET one flavor](#get-one-flavor)
	- [9.4 DELETE one flavor](#delete-one-flavor)
  - [10. AppScript](#appscript)
    - [10.1 POST upload script file](#post-upload-script-file)
  - [11. Health](#health)
    - [11.1 GET health check](#get-health-check)
  - [12. VmApp](#vmapp)
    - [12.1 GET all vm](#get-all-vm)
    - [12.2 POST create vm](#post-create-vm)
    - [12.3 GET one vm](#get-one-vm)
    - [12.4 PUT modify vm](#put-modify-vm)
	- [12.5 DELETE one vm](#delete-one-vm)
  - [13. Capability-group stats](#capability-group-stats)
    - [13.1 GET group stats](#get-group-stats) 
  - [14. AppConfiguration](#appconfiguration) 
    - [14.1 GET app cert](#get-app-cert)
    - [14.2 POST create app cert](#post-create-app-cert)
    - [14.3 PUT app cert](#put-app-cert)
    - [14.4 DELETE app cert](#delete-app-cert)
    - [14.5 GET all dns](#get-all-dns)
    - [14.6 POST create dns](#post-create-dns)
	- [14.7 PUT modify dns](#put-modify-dns)
	- [14.8 DELETE dns](#delete-dns)
    - [14.9 GET all produced svc](#get-all-produced-svc)
    - [14.10 POST create produced svc](#post-create-produced-svc)
    - [14.11 PUT modify produced svc](#put-modify-produced-svc)
    - [14.12 DELETE produced svc](#delete-produced-svc)
    - [14.13 GET all required svc](#get-all-required-svc)
    - [14.14 POST create required svc](#post-create-required-svc)
    - [14.15 PUT modify required svc](#put-modify-required-svc)
    - [14.16 DELETE required svc](#delete-required-svc)
	- [14.17 GET all traffic rule](#get-all-traffic-rule)
	- [14.18 POST create traffic rule](#post-create-traffic-rule)
	- [14.19 PUT modify traffic rule](#put-modify-traffic-rule)
	- [14.20 DELETE traffic rule](#delete-traffic-rule)
	- [14.21 GET app configuration](#get-app-configuration)
	- [14.22 PUT app configuration](#put-app-configuration)
  - [15. Capability-group stats query](#capability-group-stats-query)
    - [15.1 GET stats by type](#get-stats-by-type) 
  - [16. Operation](#operation)
    - [16.1 GET one operation](#get-one-operation)
  - [17. Capability query](#capability-query)
    - [17.1 GET capability by groupid](#get-capability-by-groupid) 
    - [17.2 GET capability by en name](#get-capability-by-en-name)  
    - [17.3 GET capability by name](#get-capability-by-name)
    - [17.4 GET capability by projectid](#get-capability-by-projectid)
    - [17.5 GET capability by type](#get-capability-by-type)
  - [18. Profile](#profile)
    - [18.1 POST create profile](#post-create-profile)
    - [18.2 GET download file](#get-download-file)
    - [18.3 PUT update profile](#put-update-profile)
    - [18.4 GET query all profiles](#get-query-all-profiles)
    - [18.5 GET query one profile](#get-query-one-profile)
    - [18.6 DELETE delete one profile](#delete-one-profile)
    - [18.7 POST create application by profile id](#post-create-application-by-profile-id)
  - [19. VmApp-network](#vmapp-network)
    - [19.1 GET all network](#get-all-network)
    - [19.2 POST create network](#post-create-network)
    - [19.3 GET one network](#get-one-network)
    - [19.4 PUT modify network](#put-modify-network)
    - [19.5 DELETE network](#delete-network)
  - [20. UserData](#userdata)
    - [20.1 GET all userdata](#get-all-userdata)
  - [21. Pkg-specs](#pkg-specs)
    - [21.1 GET all pkg specs](#get-all-pkg-specs)
  - [22. VmApp-operation](#vmapp-operation)
    - [22.1 POST export image](#post-export-image)
	- [22.2 GET ssh url](#get-ssh-url)
	- [22.3 GET vnc url](#get-vnc-url)
	- [22.4 POST instantiate vm](#post-instantiate-vm)
	- [22.5 GET merge app file](#get-merge-app-file)
	- [22.6 POST upload file](#post-upload-file)
  - [23. ContainerApp-operation](#containerapp-operation)
	- [23.1 GET container ssh url](#get-container-ssh-url)
	- [23.2 POST instantiate container](#post-instantiate-container)
  - [24. App-operation](#app-operation)
	- [24.1 POST clean env](#post-clean-env)
	- [24.2 GET atp tests](#get-atp-tests)
	- [24.3 POST create atp tests](#post-create-atp-tests)
	- [24.4 POST generate pkg](#post-generate-pkg)
	- [24.5 GET one atp test](#get-one-atp-test)
	- [24.6 POST release app](#post-release-app)
	- [24.7 PUT select host](#put-select-host)
  - [25. AppPackage](#apppackage)
	- [25.1 GET app package](#get-app-package)
	- [25.2 POST get package content](#post-get-package-content)
	- [25.3 GET package structure](#get-package-structure)
	- [25.4 PUT modify package content](#put-modify-package-content)
	- [25.5 POST zip package](#post-zip-package)
  - [26. Helmcharts](#helmcharts)
	- [26.1 GET helm chart](#get-helm-chart)
	- [26.2 DELETE helm chart](#delete-helm-chart)
	- [26.3 POST download helmchart](#post-download-helmchart)
	- [26.4 GET helmchart content](#get-helmchart-content)
	- [26.5 GET all helmchart](#get-all-helmchart)
	- [26.6 POST upload helmchart](#post-zip-package)
	- [26.7 PUT modify helm content](#put-modify-helm-content)
  - [27. ReleasedPackage](#releasedpackage)
	- [27.1 GET all released pkg](#get-all-released-pkg)
	- [27.2 DELETE released pkg](#delete-released-pkg)
	- [27.3 POST release pkg](#post-release-pkg)
	- [27.4 POST get released content](#post-get-released-content)
	- [27.5 POST synchronize pkg](#post-synchronize-pkg)
	- [27.6 GET released pkg structure](#get-released-pkg-structure)
	- [27.7 PUT modify pkg content](#put-modify-pkg-content)
  - [28. VmImage](#vmImage)
    - [28.1 GET check upload](#get-check-upload])
    - [28.2 POST upload vm image](#postt-upload-vm-image)
    - [28.3 DELETE cancel upload vm image](#delete-cancel-upload-vm-image)
    - [28.4 POST create vm image](#post-create-vm-image)
    - [28.5 GET one vm image](#get-one-vm-image)
    - [28.6 PUT modify vm image](#put-modify-vm-image)
    - [28.7 DELETE vm image](#delete-vm-image)
    - [28.8 GET download vm image](#get-download-vm-image)
    - [28.9 POST get all vm image](#post-get-all-vm-image)
    - [28.10 POST slim vm image](#post-slim-vm-image)
    - [28.11 GET merge vm image](#get-merge-vm-image)
    - [28.12 PUT publish image](#put-publish-image)
	- [28.13 PUT reset image](#put-reset-image)


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

### 1.2 GET all plugin

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

### 1.3 DELETE one plugin
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
### 2.1 POST upload container image 
Upload image with some params.
```
Resource URI: /mec/developer/v2/containerimages/{imageId}/action/upload
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

### 2.2 Cancel upload container image 
cancel upload image
```
Resource URI: /mec/developer/v2/containerimages/{imageId}/action/upload
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

### 2.3 PUT modify image
modify image record
```
Resource URI: /mec/developer/v2/containerimages/{imageId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ContainerImage|ContainerImage|request body param|yes|
|imageId|imageId|path param|yes|

```
ContainerImage:
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

### 2.4 DELETE container image
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

### 2.5 GET download image 
download container image 
```
Resource URI: /mec/developer/v2/containerimages/{imageId}/action/download
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
```
200 OK
binary output.
```

### 2.6 POST query all image 
query all container image 
```
Resource URI: /mec/developer/v2/containerimages/action/get-all-images
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ContainerImageReq|ContainerImageReq|request body param|yes|

```
ContainerImageReq:
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

### 2.7 GET merge container image 
merge container image 
```
Resource URI: /mec/developer/v2/containerimages/{imageId}/action/merge
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

### 2.8 GET synchronize image 
synchronize container image 
```
Resource URI: /mec/developer/v2/containerimages/action/synchronize
```

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

## 3. Application
Edge application created by the developer platform
### 3.1 GET one page application
Query one page application with userId.
```
Resource URI: /mec/developer/v2/applications/
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|name|application name|query param|yes|
|limit|limit|query param|yes|
|offset|offset|query param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "description": "string",
    "version": "string",
    "provider": "string",
    "architecture": "string",
    "appClass": "CONTAINER",
    "type": "string",
    "industry": "string",
    "iconFileId": "string",
    "guideFileId": "string",
    "appCreateType": "INTEGRATED",
    "createTime": "string",
    "status": "CREATED",
    "userId": "string",
    "userName": "string",
    "mepHostId": "string",
    "pkgSpecId": "string",
    "appPackage": {
      "id": "string",
      "appId": "string",
      "packageFileName": "string",
      "packageFilePath": "string"
    },
    "atpTestTaskList": [],
    "appConfiguration": {
      "appCertificate": {
        "ak": "string",
        "sk": "string"
      },
      "appServiceProducedList": [],
      "appServiceRequiredList": [],
      "trafficRuleList": [],
      "dnsRuleList": []
    },
    "scriptList": []
  }
]
```

### 3.2 GET one application 
Query application by id
```
Resource URI:  /mec/developer/v2/applications/{applictaionId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "version": "string",
  "provider": "string",
  "architecture": "string",
  "appClass": "CONTAINER",
  "type": "string",
  "industry": "string",
  "iconFileId": "string",
  "guideFileId": "string",
  "appCreateType": "INTEGRATED",
  "createTime": "string",
  "status": "CREATED",
  "userId": "string",
  "userName": "string",
  "mepHostId": "string",
  "pkgSpecId": "string",
  "appPackage": {
    "id": "string",
    "appId": "string",
    "packageFileName": "string",
    "packageFilePath": "string"
  },
  "atpTestTaskList": [],
  "appConfiguration": {
    "appCertificate": {
      "ak": "string",
      "sk": "string"
   },
    "appServiceProducedList": [],
    "appServiceRequiredList": [],
    "trafficRuleList": [],
    "dnsRuleList": []
  },
  "scriptList": []
}
```

### 3.3 POST create one application 
Create one application with some params
```
Resource URI: /mec/developer/v2/applications
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|Application|Entityclass|body param|yes|

```
Application:
{
  "name": "string",
  "description": "string",
  "version": "string",
  "provider": "string",
  "architecture": "string",
  "appClass": "CONTAINER",
  "type": "string",
  "industry": "string",
  "iconFileId": "string",
  "guideFileId": "string",
  "appCreateType": "INTEGRATED",
  "userId": "string",
  "userName": "string",
  "pkgSpecId": "string",
  "scriptList": [
    {
      "id": "string",
      "name": "string",
      "scriptFileId": "string",
      "createTime": "2021-12-29T06:44:05.343Z"
    }
  ]
}
```
**Example response**
```
{
  "id": "string",
  "name": "string",
  "description": "string",
  "version": "string",
  "provider": "string",
  "architecture": "string",
  "appClass": "CONTAINER",
  "type": "string",
  "industry": "string",
  "iconFileId": "string",
  "guideFileId": "string",
  "appCreateType": "INTEGRATED",
  "createTime": "string",
  "status": "CREATED",
  "userId": "string",
  "userName": "string",
  "mepHostId": "string",
  "pkgSpecId": "string",
  "appPackage": {
    "id": "string",
    "appId": "string",
    "packageFileName": "string",
    "packageFilePath": "string"
  },
  "atpTestTaskList": [],
  "appConfiguration": {
    "appCertificate": {
      "ak": "string",
      "sk": "string"
   },
    "appServiceProducedList": [],
    "appServiceRequiredList": [],
    "trafficRuleList": [],
    "dnsRuleList": []
  },
  "scriptList": []
}
```

### 3.4 DELETE one application
Delete one application by id
```
Resource URI: /mec/developer/v2/applications/{applicationId}
```
| Name          | Definition |Type   | Required|
|-------------|-------------|------------|------------|
| applicationId | applicationId id|path param|yes|

**Example response**
```
200 OK
true
```

### 3.5 PUT modify one application 
Modify one application by id
```
Resource URI: /mec/developer/v2/applications/{applicationId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|application|Application|body param|yes|

```
Application
{
  "id": "string",
  "name": "string",
  "description": "string",
  "version": "string",
  "provider": "string",
  "architecture": "string",
  "appClass": "CONTAINER",
  "type": "string",
  "industry": "string",
  "iconFileId": "string",
  "guideFileId": "string",
  "appCreateType": "INTEGRATED",
  "status": "CREATED",
  "userId": "string",
  "userName": "string",
  "mepHostId": "string",
  "pkgSpecId": "string",
  "scriptList": []
}
```
**Example response**
```
200 OK
true
```

### 3.6 GET application detail
get one application detail
```
Resource URI: /mec/developer/v2/applications/{applicationId}/detail
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
{
  "vmApp": {
    "id": "string",
    "name": "string",
    "description": "string",
    "version": "string",
    "provider": "string",
    "architecture": "string",
    "appClass": "CONTAINER",
    "type": "string",
    "industry": "string",
    "iconFileId": "string",
    "guideFileId": "string",
    "appCreateType": "INTEGRATED",
    "createTime": "string",
    "status": "CREATED",
    "userId": "string",
    "userName": "string",
    "mepHostId": "string",
    "pkgSpecId": "string",
    "appPackage": {
      "id": "string",
      "appId": "string",
      "packageFileName": "string",
      "packageFilePath": "string"
    },
    "atpTestTaskList": [
      {
        "id": "string",
        "appName": "string",
        "status": "string",
        "createTime": "string"
      }
    ],
    "appConfiguration": {
      "appCertificate": {
        "ak": "string",
        "sk": "string"
      },
      "appServiceProducedList": [
        {
          "appServiceProducedId": "string",
          "oneLevelName": "string",
          "oneLevelNameEn": "string",
          "twoLevelName": "string",
          "description": "string",
          "apiFileId": "string",
          "guideFileId": "string",
          "iconFileId": "string",
          "serviceName": "string",
          "internalPort": 0,
          "version": "string",
          "protocol": "string",
          "author": "string",
          "experienceUrl": "string",
          "dnsRuleIdList": [
            "string"
          ],
          "trafficRuleIdList": [
            "string"
          ]
        }
      ],
      "appServiceRequiredList": [
        {
          "id": "string",
          "oneLevelName": "string",
          "oneLevelNameEn": "string",
          "twoLevelName": "string",
          "twoLevelNameEn": "string",
          "serName": "string",
          "version": "string",
          "requestedPermissions": false,
          "appId": "string",
          "packageId": "string"
        }
      ],
      "trafficRuleList": [
        {
          "trafficRuleId": "string",
          "filterType": "string",
          "priority": 0,
          "trafficFilter": [
            {
              "srcAddress": [
                "string"
              ],
              "dstAddress": [
                "string"
              ],
              "srcPort": [
                "string"
              ],
              "dstPort": [
                "string"
              ],
              "protocol": [
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
              "qCI": 0,
              "dSCP": 0,
              "tC": 0
            }
          ],
          "action": "string",
          "dstInterface": [
            {
              "interfaceType": "string",
              "tunnelInfo": {
                "tunnelType": "string",
                "tunnelDstAddress": "string",
                "tunnelSrcAddress": "string",
                "tunnelSpecificData": "string"
              },
              "srcMacAddress": "string",
              "dstMacAddress": "string",
              "dstIpAddress": "string"
            }
          ]
        }
      ],
      "dnsRuleList": [
        {
          "dnsRuleId": "string",
          "domainName": "string",
          "ipAddressType": "string",
          "ipAddress": "string",
          "ttl": "string"
        }
      ]
    },
    "scriptList": [
      {
        "id": "string",
        "name": "string",
        "scriptFileId": "string",
        "createTime": "2021-12-29T07:10:56.154Z"
      }
    ],
    "vmList": [
      {
        "id": "string",
        "name": "string",
        "flavorId": "string",
        "imageId": 0,
        "targetImageId": 0,
        "vmCertificate": {
          "certificateType": "string",
          "pwdCertificate": {
            "password": "string",
            "username": "string"
          },
          "keyPairCertificate": {
            "keyPairId": "string"
          }
        },
        "userData": "string",
        "portList": [
          {
            "id": "string",
            "name": "string",
            "description": "string",
            "networkName": "string"
          }
        ],
        "status": "NOT_DEPLOY",
        "areaZone": "string",
        "flavorExtraSpecs": "string",
        "vmInstantiateInfo": {
          "operationId": "string",
          "appPackageId": "string",
          "distributedMecHost": "string",
          "mepmPackageId": "string",
          "appInstanceId": "string",
          "vmInstanceId": "string",
          "status": "PACKAGE_GENERATING",
          "instantiateTime": "2021-12-29T07:10:56.162Z",
          "log": "string",
          "vncUrl": "string",
          "portInstanceList": [
            {
              "networkName": "string",
              "ipAddress": "string"
            }
          ]
        },
        "imageExportInfo": {
          "operationId": "string",
          "imageInstanceId": "string",
          "name": "string",
          "imageFileName": "string",
          "format": "string",
          "checkSum": "string",
          "status": "IMAGE_CREATING",
          "downloadUrl": "string",
          "imageSize": "string",
          "createTime": "2021-12-29T07:10:56.162Z",
          "log": "string"
        }
      }
    ],
    "networkList": [
      {
        "id": "string",
        "name": "string",
        "description": "string"
      }
    ]
  },
  "containerApp": {
    "id": "string",
    "name": "string",
    "description": "string",
    "version": "string",
    "provider": "string",
    "architecture": "string",
    "appClass": "CONTAINER",
    "type": "string",
    "industry": "string",
    "iconFileId": "string",
    "guideFileId": "string",
    "appCreateType": "INTEGRATED",
    "createTime": "string",
    "status": "CREATED",
    "userId": "string",
    "userName": "string",
    "mepHostId": "string",
    "pkgSpecId": "string",
    "appPackage": {
      "id": "string",
      "appId": "string",
      "packageFileName": "string",
      "packageFilePath": "string"
    },
    "atpTestTaskList": [
      {
        "id": "string",
        "appName": "string",
        "status": "string",
        "createTime": "string"
      }
    ],
    "appConfiguration": {
      "appCertificate": {
        "ak": "string",
        "sk": "string"
      },
      "appServiceProducedList": [
        {
          "appServiceProducedId": "string",
          "oneLevelName": "string",
          "oneLevelNameEn": "string",
          "twoLevelName": "string",
          "description": "string",
          "apiFileId": "string",
          "guideFileId": "string",
          "iconFileId": "string",
          "serviceName": "string",
          "internalPort": 0,
          "version": "string",
          "protocol": "string",
          "author": "string",
          "experienceUrl": "string",
          "dnsRuleIdList": [
            "string"
          ],
          "trafficRuleIdList": [
            "string"
          ]
        }
      ],
      "appServiceRequiredList": [
        {
          "id": "string",
          "oneLevelName": "string",
          "oneLevelNameEn": "string",
          "twoLevelName": "string",
          "twoLevelNameEn": "string",
          "serName": "string",
          "version": "string",
          "requestedPermissions": false,
          "appId": "string",
          "packageId": "string"
        }
      ],
      "trafficRuleList": [
        {
          "trafficRuleId": "string",
          "filterType": "string",
          "priority": 0,
          "trafficFilter": [
            {
              "srcAddress": [
                "string"
              ],
              "dstAddress": [
                "string"
              ],
              "srcPort": [
                "string"
              ],
              "dstPort": [
                "string"
              ],
              "protocol": [
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
              "qCI": 0,
              "dSCP": 0,
              "tC": 0
            }
          ],
          "action": "string",
          "dstInterface": [
            {
              "interfaceType": "string",
              "tunnelInfo": {
                "tunnelType": "string",
                "tunnelDstAddress": "string",
                "tunnelSrcAddress": "string",
                "tunnelSpecificData": "string"
              },
              "srcMacAddress": "string",
              "dstMacAddress": "string",
              "dstIpAddress": "string"
            }
          ]
        }
      ],
      "dnsRuleList": [
        {
          "dnsRuleId": "string",
          "domainName": "string",
          "ipAddressType": "string",
          "ipAddress": "string",
          "ttl": "string"
        }
      ]
    },
    "scriptList": [
      {
        "id": "string",
        "name": "string",
        "scriptFileId": "string",
        "createTime": "2021-12-29T07:10:56.154Z"
      }
    ],
    "helmChartList": [
      {
        "id": "string",
        "name": "string",
        "helmChartFileId": "string",
        "createTime": "2021-12-29T07:10:56.162Z",
        "applicationId": "string",
        "helmChartFileList": [
          {
            "name": "string",
            "innerPath": "string",
            "children": [
              {}
            ],
            "content": "string",
            "file": false
          }
        ]
      }
    ],
    "instantiateInfo": {
      "operationId": "string",
      "appPackageId": "string",
      "distributedMecHost": "string",
      "mepmPackageId": "string",
      "appInstanceId": "string",
      "status": "PACKAGE_GENERATING",
      "log": "string",
      "instantiateTime": "2021-12-29T07:10:56.162Z",
      "pods": [
        {
          "name": "string",
          "podStatus": "string",
          "eventsInfo": "string",
          "containerList": [
            {
              "name": "string",
              "cpuUsage": "string",
              "memUsage": "string",
              "diskUsage": "string"
            }
          ]
        }
      ],
      "serviceList": [
        {
          "name": "string",
          "type": "string",
          "servicePortList": [
            {
              "port": "string",
              "targetPort": "string",
              "nodePort": "string"
            }
          ]
        }
      ]
    }
  }
}
```

### 3.7 PUT modify application detail
Update application detail
```
Resource URI: /mec/developer/v2/applications/{applicationId}/detail
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|ApplicationDetail|applicationdetail|body param|yes|

```
ApplicationDetail:
{
  "vmApp": {
    "id": "string",
    "name": "string",
    "description": "string",
    "version": "string",
    "provider": "string",
    "architecture": "string",
    "appClass": "CONTAINER",
    "type": "string",
    "industry": "string",
    "iconFileId": "string",
    "guideFileId": "string",
    "appCreateType": "INTEGRATED",
    "createTime": "string",
    "status": "CREATED",
    "userId": "string",
    "userName": "string",
    "mepHostId": "string",
    "pkgSpecId": "string",
    "appPackage": {
      "id": "string",
      "appId": "string",
      "packageFileName": "string",
      "packageFilePath": "string"
    },
    "atpTestTaskList": [
      {
        "id": "string",
        "appName": "string",
        "status": "string",
        "createTime": "string"
      }
    ],
    "appConfiguration": {
      "appCertificate": {
        "ak": "string",
        "sk": "string"
      },
      "appServiceProducedList": [
        {
          "appServiceProducedId": "string",
          "oneLevelName": "string",
          "oneLevelNameEn": "string",
          "twoLevelName": "string",
          "description": "string",
          "apiFileId": "string",
          "guideFileId": "string",
          "iconFileId": "string",
          "serviceName": "string",
          "internalPort": 0,
          "version": "string",
          "protocol": "string",
          "author": "string",
          "experienceUrl": "string",
          "dnsRuleIdList": [
            "string"
          ],
          "trafficRuleIdList": [
            "string"
          ]
        }
      ],
      "appServiceRequiredList": [
        {
          "id": "string",
          "oneLevelName": "string",
          "oneLevelNameEn": "string",
          "twoLevelName": "string",
          "twoLevelNameEn": "string",
          "serName": "string",
          "version": "string",
          "requestedPermissions": false,
          "appId": "string",
          "packageId": "string"
        }
      ],
      "trafficRuleList": [
        {
          "trafficRuleId": "string",
          "filterType": "string",
          "priority": 0,
          "trafficFilter": [
            {
              "srcAddress": [
                "string"
              ],
              "dstAddress": [
                "string"
              ],
              "srcPort": [
                "string"
              ],
              "dstPort": [
                "string"
              ],
              "protocol": [
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
              "qCI": 0,
              "dSCP": 0,
              "tC": 0
            }
          ],
          "action": "string",
          "dstInterface": [
            {
              "interfaceType": "string",
              "tunnelInfo": {
                "tunnelType": "string",
                "tunnelDstAddress": "string",
                "tunnelSrcAddress": "string",
                "tunnelSpecificData": "string"
              },
              "srcMacAddress": "string",
              "dstMacAddress": "string",
              "dstIpAddress": "string"
            }
          ]
        }
      ],
      "dnsRuleList": [
        {
          "dnsRuleId": "string",
          "domainName": "string",
          "ipAddressType": "string",
          "ipAddress": "string",
          "ttl": "string"
        }
      ]
    },
    "scriptList": [
      {
        "id": "string",
        "name": "string",
        "scriptFileId": "string",
        "createTime": "2021-12-29T07:10:56.154Z"
      }
    ],
    "vmList": [
      {
        "id": "string",
        "name": "string",
        "flavorId": "string",
        "imageId": 0,
        "targetImageId": 0,
        "vmCertificate": {
          "certificateType": "string",
          "pwdCertificate": {
            "password": "string",
            "username": "string"
          },
          "keyPairCertificate": {
            "keyPairId": "string"
          }
        },
        "userData": "string",
        "portList": [
          {
            "id": "string",
            "name": "string",
            "description": "string",
            "networkName": "string"
          }
        ],
        "status": "NOT_DEPLOY",
        "areaZone": "string",
        "flavorExtraSpecs": "string",
        "vmInstantiateInfo": {
          "operationId": "string",
          "appPackageId": "string",
          "distributedMecHost": "string",
          "mepmPackageId": "string",
          "appInstanceId": "string",
          "vmInstanceId": "string",
          "status": "PACKAGE_GENERATING",
          "instantiateTime": "2021-12-29T07:10:56.162Z",
          "log": "string",
          "vncUrl": "string",
          "portInstanceList": [
            {
              "networkName": "string",
              "ipAddress": "string"
            }
          ]
        },
        "imageExportInfo": {
          "operationId": "string",
          "imageInstanceId": "string",
          "name": "string",
          "imageFileName": "string",
          "format": "string",
          "checkSum": "string",
          "status": "IMAGE_CREATING",
          "downloadUrl": "string",
          "imageSize": "string",
          "createTime": "2021-12-29T07:10:56.162Z",
          "log": "string"
        }
      }
    ],
    "networkList": [
      {
        "id": "string",
        "name": "string",
        "description": "string"
      }
    ]
  },
  "containerApp": {
    "id": "string",
    "name": "string",
    "description": "string",
    "version": "string",
    "provider": "string",
    "architecture": "string",
    "appClass": "CONTAINER",
    "type": "string",
    "industry": "string",
    "iconFileId": "string",
    "guideFileId": "string",
    "appCreateType": "INTEGRATED",
    "createTime": "string",
    "status": "CREATED",
    "userId": "string",
    "userName": "string",
    "mepHostId": "string",
    "pkgSpecId": "string",
    "appPackage": {
      "id": "string",
      "appId": "string",
      "packageFileName": "string",
      "packageFilePath": "string"
    },
    "atpTestTaskList": [
      {
        "id": "string",
        "appName": "string",
        "status": "string",
        "createTime": "string"
      }
    ],
    "appConfiguration": {
      "appCertificate": {
        "ak": "string",
        "sk": "string"
      },
      "appServiceProducedList": [
        {
          "appServiceProducedId": "string",
          "oneLevelName": "string",
          "oneLevelNameEn": "string",
          "twoLevelName": "string",
          "description": "string",
          "apiFileId": "string",
          "guideFileId": "string",
          "iconFileId": "string",
          "serviceName": "string",
          "internalPort": 0,
          "version": "string",
          "protocol": "string",
          "author": "string",
          "experienceUrl": "string",
          "dnsRuleIdList": [
            "string"
          ],
          "trafficRuleIdList": [
            "string"
          ]
        }
      ],
      "appServiceRequiredList": [
        {
          "id": "string",
          "oneLevelName": "string",
          "oneLevelNameEn": "string",
          "twoLevelName": "string",
          "twoLevelNameEn": "string",
          "serName": "string",
          "version": "string",
          "requestedPermissions": false,
          "appId": "string",
          "packageId": "string"
        }
      ],
      "trafficRuleList": [
        {
          "trafficRuleId": "string",
          "filterType": "string",
          "priority": 0,
          "trafficFilter": [
            {
              "srcAddress": [
                "string"
              ],
              "dstAddress": [
                "string"
              ],
              "srcPort": [
                "string"
              ],
              "dstPort": [
                "string"
              ],
              "protocol": [
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
              "qCI": 0,
              "dSCP": 0,
              "tC": 0
            }
          ],
          "action": "string",
          "dstInterface": [
            {
              "interfaceType": "string",
              "tunnelInfo": {
                "tunnelType": "string",
                "tunnelDstAddress": "string",
                "tunnelSrcAddress": "string",
                "tunnelSpecificData": "string"
              },
              "srcMacAddress": "string",
              "dstMacAddress": "string",
              "dstIpAddress": "string"
            }
          ]
        }
      ],
      "dnsRuleList": [
        {
          "dnsRuleId": "string",
          "domainName": "string",
          "ipAddressType": "string",
          "ipAddress": "string",
          "ttl": "string"
        }
      ]
    },
    "scriptList": [
      {
        "id": "string",
        "name": "string",
        "scriptFileId": "string",
        "createTime": "2021-12-29T07:10:56.154Z"
      }
    ],
    "helmChartList": [
      {
        "id": "string",
        "name": "string",
        "helmChartFileId": "string",
        "createTime": "2021-12-29T07:10:56.162Z",
        "applicationId": "string",
        "helmChartFileList": [
          {
            "name": "string",
            "innerPath": "string",
            "children": [
              {}
            ],
            "content": "string",
            "file": false
          }
        ]
      }
    ],
    "instantiateInfo": {
      "operationId": "string",
      "appPackageId": "string",
      "distributedMecHost": "string",
      "mepmPackageId": "string",
      "appInstanceId": "string",
      "status": "PACKAGE_GENERATING",
      "log": "string",
      "instantiateTime": "2021-12-29T07:10:56.162Z",
      "pods": [
        {
          "name": "string",
          "podStatus": "string",
          "eventsInfo": "string",
          "containerList": [
            {
              "name": "string",
              "cpuUsage": "string",
              "memUsage": "string",
              "diskUsage": "string"
            }
          ]
        }
      ],
      "serviceList": [
        {
          "name": "string",
          "type": "string",
          "servicePortList": [
            {
              "port": "string",
              "targetPort": "string",
              "nodePort": "string"
            }
          ]
        }
      ]
    }
  }
}
```

**Example response**
```
200 OK
true
```

## 4. Mep-hosts
Server of build and test or deploy app
### 4.1 GET all host
Query all host.
```
Resource URI: /mec/developer/v2/mephosts
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|name|name|query param|yes|
|vimType|vim type|query param|yes|
|architecture|architecture|query param|yes|
|limit|limit|query param|yes|
|offset|offset|query param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "lcmIp": "string",
    "lcmProtocol": "string",
    "lcmPort": 0,
    "architecture": "string",
    "status": "NORMAL",
    "mecHostIp": "string",
    "vimType": "OpenStack",
    "mecHostUserName": "string",
    "mecHostPassword": "string",
    "mecHostPort": 0,
    "userId": "string",
    "configId": "string",
    "networkParameter": "string",
    "resource": "string",
    "address": "string"
  }
]
```

### 4.2 GET one host
Query  host by id.
```
Resource URI: /mec/developer/v2/mephosts/{mephostId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|mephostId|hostid|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "lcmIp": "string",
  "lcmProtocol": "string",
  "lcmPort": 0,
  "architecture": "string",
  "status": "NORMAL",
  "mecHostIp": "string",
  "vimType": "OpenStack",
  "mecHostUserName": "string",
  "mecHostPassword": "string",
  "mecHostPort": 0,
  "userId": "string",
  "configId": "string",
  "networkParameter": "string",
  "resource": "string",
  "address": "string"
}
```

### 4.3 POST create one host
Create one host.
```
Resource URI: /mec/developer/v2/mephosts/
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|MepHost|entityclass|bodyparam|yes|

```
MepHost
{
  "name": "string",
  "lcmIp": "string",
  "lcmProtocol": "string",
  "lcmPort": 0,
  "architecture": "string",
  "status": "NORMAL",
  "mecHostIp": "string",
  "vimType": "OpenStack",
  "mecHostUserName": "string",
  "mecHostPassword": "string",
  "mecHostPort": 0,
  "userId": "string",
  "configId": "string",
  "networkParameter": "string",
  "resource": "string",
  "address": "string"
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
Resource URI: /mec/developer/v2/mephosts/{mephostId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|mephostId|hostid|pathparam|yes|

**Example response**
```
200 OK
true
```

### 4.5 PUT modify one host
modify one host.
```
Resource URI: /mec/developer/v2/mephosts/{mephostId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|mephostId|hostid|pathparam|yes|
|MepHost|entityclass|bodyparam|yes|

```
MepHost
{
  "id": "string",
  "name": "string",
  "lcmIp": "string",
  "lcmProtocol": "string",
  "lcmPort": 0,
  "architecture": "string",
  "status": "NORMAL",
  "mecHostIp": "string",
  "vimType": "OpenStack",
  "mecHostUserName": "string",
  "mecHostPassword": "string",
  "mecHostPort": 0,
  "userId": "string",
  "configId": "string",
  "networkParameter": "string",
  "resource": "string",
  "address": "string"
}
```
**Example response**
```
200 OK
true
```

### 4.6 GET host logs
get host logs.
```
Resource URI: /mec/developer/v2/mephosts/{mephostId}/logs
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|hostId|hostid|pathparam|yes|

**Example response**
```
200 OK
[
  {
    "logId": "string",
    "hostIp": "string",
    "userName": "string",
    "userId": "string",
    "projectId": "string",
    "projectName": "string",
    "appInstancesId": "string",
    "deployTime": "string",
    "status": "NORMAL",
    "operation": "string",
    "hostId": "string"
  }
]
```

### 4.7 POST upload config file
upload host config file
```
Resource URI: /mec/developer/v2/mephosts/action/upload-config-file
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|file|config file|form data|yes|

**Example response**
```
200 OK
{
  "fileId": "string",
  "fileName": "string",
  "url": "string",
  "userId": "string",
  "uploadDate": "2021-12-29T07:47:58.763Z",
  "filePath": "string",
  "temp": false
}
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
  "parent": {}
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
  "parent": {}
}
```

### 5.2 GET all group
get all group.
```
Resource URI: /mec/developer/v2/capability-groups/
```

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
    "parent": {}
  }
]
```

### 5.3 GET one group
get one group
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
  "parent": {}
}
```

### 5.4 DELETE one group
Delete one group by id
```
Resource URI: /mec/developer/v2/capability-groups/{id}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|id|group id|path param|yes|

**Example response**
```
200 OK
true.
```

## 6. Upload-files
This part is to configure the app, perform app deployment, and test the api for file operations
### 6.1 GET one file
Get one file
```
Resource URI: /mec/developer/v2/upload-files/{fileId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|fileId|fileid|path param|yes|

**Example response**
```
200 OK
{
  "fileId": "string",
  "fileName": "string",
  "url": "string",
  "userId": "string",
  "uploadDate": "2021-12-29T08:12:37.729Z",
  "filePath": "string",
  "temp": false
}
```

### 6.2 POST upload one file
Upload  file
```
Resource URI: /mec/developer/v2/upload-files
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|file|MultipartFileclass|request part|yes|
|flleType|file type|query param|yes|

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

### 6.3 POST get sample code
Get sample code.
```
Resource URI: /mec/developer/v2/upload-files/action/download-sample-code
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

### 6.4 GET file stream
Get file return as stream
```
Resource URI: /mec/developer/v2/upload-files/{fileId}/action/get-file-stream
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|fileId|file id|path param |yes|

**Example response**
```
200 OK
binary output.
```

### 6.5 GET sdk code
Get sdk code
```
Resource URI: /mec/developer/v2/upload-files/{fileId}/action/download-sdk
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

### 6.6 POST sample content
query file content
```
Resource URI: /mec/developer/v2/upload-files/action/get-sample-code-content
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|apiFileIds|apiFileIds|body param |yes|

**Example response**
```
200 OK
String output
```

### 6.7 POST sample structure
post pkg structure
```
Resource URI: /mec/developer/v2/upload-files/action/get-sample-code-structure
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

### 6.8 DELETE one file
post pkg structure
```
Resource URI: /mec/developer/v2/upload-files/{fileId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|fileId|file id|path param |yes|

**Example response**
```
200 OK
true
```

## 7. Capabilities
capability of edge applications
### 7.1 POST create capability
create capability
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
    "parent": {}
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
    "parent": {}
  },
  "groupId": "string"
}
```

### 7.2 GET all capability
GET all capabilities
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
      "parent": {}
    },
    "groupId": "string"
  }
]
```

### 7.3 GET one capability
query one capability
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
      "parent": {}
    },
    "groupId": "string"
  }
]
```

### 7.4 DELETE one capability
Delete one capability
```
Resource URI: /mec/developer/v2/capabilities/{id}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

**Example response**
```
200 OK
true
```

### 7.5 PUT one capability
update one capability
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
    "parent": {}
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
      "parent": {}
    },
    "groupId": "string"
  }
```

## 8. Capability-Groups Query
Capability-Groups query
### 8.1 GET group by type
query group by type
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
    "parent": {}
  }
]
```

## 9. Flavors
vm flavor configuration
### 9.1 GET all flavor
Get all flavor
```
Resource URI: /mec/developer/v2/flavor
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
    "architecture": "string",
    "cpu": 0,
    "memory": 0,
    "systemDiskSize": 0,
    "dataDiskSize": 0,
    "gpuExtraInfo": "string",
    "otherExtraInfo": "string"
  }
]
```

### 9.2 POST create one flavor
create flavor
```
Resource URI: /mec/developer/v2/flavors
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|flavor|flavor|body param|yes|

```
flavor
{
  "name": "string",
  "description": "string",
  "architecture": "string",
  "cpu": 0,
  "memory": 0,
  "systemDiskSize": 0,
  "dataDiskSize": 0,
  "gpuExtraInfo": "string",
  "otherExtraInfo": "string"
}
```

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "architecture": "string",
  "cpu": 0,
  "memory": 0,
  "systemDiskSize": 0,
  "dataDiskSize": 0,
  "gpuExtraInfo": "string",
  "otherExtraInfo": "string"
}
```

### 9.3 GET one flavor
get one flavor
```
Resource URI: /mec/developer/v2/flavors/{flavorId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|flavorId|flavorId|query param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "architecture": "string",
  "cpu": 0,
  "memory": 0,
  "systemDiskSize": 0,
  "dataDiskSize": 0,
  "gpuExtraInfo": "string",
  "otherExtraInfo": "string"
}
```

### 9.4 DELETE one flavor
delete one flavor
```
Resource URI: /mec/developer/v2/flavors/{flavorId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|flavorId|flavorId|query param|yes|

**Example response**
```
200 OK
true
```

## 10. AppScript
some script files about application
### 10.1 POST upload script file
upload script file
```
Resource URI: /mec/developer/v2/applications/{applicationId}/scripts
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|application id|pathparam|yes|
|file|file|formdata param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "scriptFileId": "string",
  "createTime": "2021-12-29T13:40:01.419Z"
}
```

## 11. Health
health Check
### 11.1 GET health check
Get health check
```
Resource URI: /health
```

**Example response**
```
200 OK
'ok'.
```

## 12. VmApp
some operation about vm app
### 12.1 GET all vm
query all vm
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "flavorId": "string",
    "imageId": 0,
    "targetImageId": 0,
    "vmCertificate": {
      "certificateType": "string",
      "pwdCertificate": {
        "password": "string",
        "username": "string"
      },
      "keyPairCertificate": {
        "keyPairId": "string"
      }
    },
    "userData": "string",
    "portList": [
      {
        "id": "string",
        "name": "string",
        "description": "string",
        "networkName": "string"
      }
    ],
    "status": "NOT_DEPLOY",
    "areaZone": "string",
    "flavorExtraSpecs": "string",
    "vmInstantiateInfo": {
      "operationId": "string",
      "appPackageId": "string",
      "distributedMecHost": "string",
      "mepmPackageId": "string",
      "appInstanceId": "string",
      "vmInstanceId": "string",
      "status": "PACKAGE_GENERATING",
      "instantiateTime": "2021-12-29T13:52:32.321Z",
      "log": "string",
      "vncUrl": "string",
      "portInstanceList": [
        {
          "networkName": "string",
          "ipAddress": "string"
        }
      ]
    },
    "imageExportInfo": {
      "operationId": "string",
      "imageInstanceId": "string",
      "name": "string",
      "imageFileName": "string",
      "format": "string",
      "checkSum": "string",
      "status": "IMAGE_CREATING",
      "downloadUrl": "string",
      "imageSize": "string",
      "createTime": "2021-12-29T13:52:32.321Z",
      "log": "string"
    }
  }
]
```

### 12.2 POST create vm
create one vm
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|virtualMachine|virtualMachine|body param|yes|

```
virtualMachine:
{
  "name": "string",
  "flavorId": "string",
  "imageId": 0,
  "targetImageId": 0,
  "vmCertificate": {
    "certificateType": "string",
    "pwdCertificate": {
      "password": "string",
      "username": "string"
    },
    "keyPairCertificate": {
      "keyPairId": "string"
    }
  },
  "userData": "string",
  "portList": [
    {
      "id": "string",
      "name": "string",
      "description": "string",
      "networkName": "string"
    }
  ],
  "flavorExtraSpecs": "string"
}
```
**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "flavorId": "string",
  "imageId": 0,
  "targetImageId": 0,
  "vmCertificate": {
    "certificateType": "string",
    "pwdCertificate": {
      "password": "string",
      "username": "string"
    },
    "keyPairCertificate": {
      "keyPairId": "string"
    }
  },
  "userData": "string",
  "portList": [
    {
      "id": "string",
      "name": "string",
      "description": "string",
      "networkName": "string"
    }
  ],
  "status": "NOT_DEPLOY",
  "areaZone": "string",
  "flavorExtraSpecs": "string",
  "vmInstantiateInfo": {
    "operationId": "string",
    "appPackageId": "string",
    "distributedMecHost": "string",
    "mepmPackageId": "string",
    "appInstanceId": "string",
    "vmInstanceId": "string",
    "status": "PACKAGE_GENERATING",
    "instantiateTime": "2021-12-29T13:52:32.321Z",
    "log": "string",
    "vncUrl": "string",
    "portInstanceList": [
      {
        "networkName": "string",
        "ipAddress": "string"
      }
    ]
  },
  "imageExportInfo": {
    "operationId": "string",
    "imageInstanceId": "string",
    "name": "string",
    "imageFileName": "string",
    "format": "string",
    "checkSum": "string",
    "status": "IMAGE_CREATING",
    "downloadUrl": "string",
    "imageSize": "string",
    "createTime": "2021-12-29T13:52:32.321Z",
    "log": "string"
  }
}
```

### 12.3 GET one vm
get one vm
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms/{vmId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|vmId|vmId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "flavorId": "string",
  "imageId": 0,
  "targetImageId": 0,
  "vmCertificate": {
    "certificateType": "string",
    "pwdCertificate": {
      "password": "string",
      "username": "string"
    },
    "keyPairCertificate": {
      "keyPairId": "string"
    }
  },
  "userData": "string",
  "portList": [
    {
      "id": "string",
      "name": "string",
      "description": "string",
      "networkName": "string"
    }
  ],
  "status": "NOT_DEPLOY",
  "areaZone": "string",
  "flavorExtraSpecs": "string",
  "vmInstantiateInfo": {
    "operationId": "string",
    "appPackageId": "string",
    "distributedMecHost": "string",
    "mepmPackageId": "string",
    "appInstanceId": "string",
    "vmInstanceId": "string",
    "status": "PACKAGE_GENERATING",
    "instantiateTime": "2021-12-29T13:52:32.321Z",
    "log": "string",
    "vncUrl": "string",
    "portInstanceList": [
      {
        "networkName": "string",
        "ipAddress": "string"
      }
    ]
  },
  "imageExportInfo": {
    "operationId": "string",
    "imageInstanceId": "string",
    "name": "string",
    "imageFileName": "string",
    "format": "string",
    "checkSum": "string",
    "status": "IMAGE_CREATING",
    "downloadUrl": "string",
    "imageSize": "string",
    "createTime": "2021-12-29T13:52:32.321Z",
    "log": "string"
  }
}
```

### 12.4 PUT modify vm
modify vm 
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms/{vmId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|vmId|vmId|path param|yes|
|virtualMachine|virtualMachine|body param|yes|

```
virtualMachine:
{
  "id": "string",
  "name": "string",
  "flavorId": "string",
  "imageId": 0,
  "targetImageId": 0,
  "vmCertificate": {
    "certificateType": "string",
    "pwdCertificate": {
      "password": "string",
      "username": "string"
    },
    "keyPairCertificate": {
      "keyPairId": "string"
    }
  },
  "userData": "string",
  "portList": [
    {
      "id": "string",
      "name": "string",
      "description": "string",
      "networkName": "string"
    }
  ],
  "status": "NOT_DEPLOY",
  "areaZone": "string",
  "flavorExtraSpecs": "string"
}
```

**Example response**
```
200 OK
true
```

### 12.5 DELETE one vm
delete vm 
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms/{vmId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|vmId|vmId|path param|yes|

**Example response**
```
200 OK
true
```

## 13. Capability-group stats
query group stats
### 13.1 GET group stats
Get group stats
```
Resource URI: /mec/developer/v2/capability-group-stats/
```

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
      "parent": {}
    },
    "capabilityCount": 0
  }
]
```

## 14. AppConfiguration
This part is about the api for application configuration
### 14.1 GET app cert
get app cert
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/appcertificate
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 Ok
{
  "ak": "string",
  "sk": "string"
}
```

### 14.2 POST create app cert
create app cert
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/appcertificate
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|AppCeriticate|AppCeriticate|body param|yes|
|applicationId|applicationId|path param|yes|

```
AppCeriticate：
{
  "ak": "string",
  "sk": "string"
}
```
**Example response**
```
200 OK
{
  "ak": "string",
  "sk": "string"
}
```

### 14.3 PUT app cert
modify app cert
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/appcertificate
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|AppCeriticate|AppCeriticate|body param|yes|

```
AppCeriticate：
{
  "ak": "string",
  "sk": "string"
}
```
**Example response**
```
200 OK
true
```

### 14.4 DELETE app cert
delete cert
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/appcertificate
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
true
```

### 14.5 GET all dns
get all dns rule
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/dnsrules
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 Ok
[
  {
    "dnsRuleId": "string",
    "domainName": "string",
    "ipAddressType": "string",
    "ipAddress": "string",
    "ttl": "string"
  }
]
```

### 14.6 POST create dns
create dns
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/dnsrules
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|DnsRule|DnsRule|body param|yes|
|applicationId|applicationId|path param|yes|

```
DnsRule：
{
    "dnsRuleId": "string",
    "domainName": "string",
    "ipAddressType": "string",
    "ipAddress": "string",
    "ttl": "string"
  }
```
**Example response**
```
200 OK
{
    "dnsRuleId": "string",
    "domainName": "string",
    "ipAddressType": "string",
    "ipAddress": "string",
    "ttl": "string"
  }
```

### 14.7 PUT modify dns
modify dns
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/dnsrules/{ruleId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|DnsRule|DnsRule|body param|yes|
|ruleId|ruleId|path param|yes|
|applicationId|applicationId|path param|yes|

```
DnsRule：
{
    "dnsRuleId": "string",
    "domainName": "string",
    "ipAddressType": "string",
    "ipAddress": "string",
    "ttl": "string"
  }
```
**Example response**
```
200 OK
true
```

### 14.8 DELETE dns
delete dns
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/dnsrules/{ruleId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|ruleId|ruleId|path param|yes|

**Example response**
```
200 OK
true
```

### 14.9 GET all produced svc
get all serviceProduced
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/serviceproduceds
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 Ok
[
  {
    "appServiceProducedId": "string",
    "oneLevelName": "string",
    "oneLevelNameEn": "string",
    "twoLevelName": "string",
    "description": "string",
    "apiFileId": "string",
    "guideFileId": "string",
    "iconFileId": "string",
    "serviceName": "string",
    "internalPort": 0,
    "version": "string",
    "protocol": "string",
    "author": "string",
    "experienceUrl": "string",
    "dnsRuleIdList": [
      "string"
    ],
    "trafficRuleIdList": [
      "string"
    ]
  }
]
```

### 14.10 POST create produced svc
create produces svc
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/serviceproduceds
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ServiceProduced|ServiceProduced|body param|yes|
|applicationId|applicationId|path param|yes|

```
ServiceProduced：
{
  "appServiceProducedId": "string",
  "oneLevelName": "string",
  "oneLevelNameEn": "string",
  "twoLevelName": "string",
  "description": "string",
  "apiFileId": "string",
  "guideFileId": "string",
  "iconFileId": "string",
  "serviceName": "string",
  "internalPort": 0,
  "version": "string",
  "protocol": "string",
  "author": "string",
  "experienceUrl": "string",
  "dnsRuleIdList": [
    "string"
  ],
  "trafficRuleIdList": [
    "string"
  ]
}
```
**Example response**
```
200 OK
{
  "appServiceProducedId": "string",
  "oneLevelName": "string",
  "oneLevelNameEn": "string",
  "twoLevelName": "string",
  "description": "string",
  "apiFileId": "string",
  "guideFileId": "string",
  "iconFileId": "string",
  "serviceName": "string",
  "internalPort": 0,
  "version": "string",
  "protocol": "string",
  "author": "string",
  "experienceUrl": "string",
  "dnsRuleIdList": [
    "string"
  ],
  "trafficRuleIdList": [
    "string"
  ]
}
```

### 14.11 PUT modify produced svc
modify produced svc
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/serviceproduceds/{appServiceProducedId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ServiceProduced|ServiceProduced|body param|yes|
|appServiceProducedId|appServiceProducedId|path param|yes|
|applicationId|applicationId|path param|yes|

```
ServiceProduced：
{
  "appServiceProducedId": "string",
  "oneLevelName": "string",
  "oneLevelNameEn": "string",
  "twoLevelName": "string",
  "description": "string",
  "apiFileId": "string",
  "guideFileId": "string",
  "iconFileId": "string",
  "serviceName": "string",
  "internalPort": 0,
  "version": "string",
  "protocol": "string",
  "author": "string",
  "experienceUrl": "string",
  "dnsRuleIdList": [
    "string"
  ],
  "trafficRuleIdList": [
    "string"
  ]
}
```
**Example response**
```
200 OK
true
```

### 14.12 DELETE produced svc
delete produced svc
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/serviceproduceds/{appServiceProducedId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|appServiceProducedId|appServiceProducedId|path param|yes|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
true
```

### 14.13 GET all required svc
get all serviceRequired
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/servicerequireds
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 Ok
[
  {
    "id": "string",
    "oneLevelName": "string",
    "oneLevelNameEn": "string",
    "twoLevelName": "string",
    "twoLevelNameEn": "string",
    "serName": "string",
    "version": "string",
    "requestedPermissions": false,
    "appId": "string",
    "packageId": "string"
  }
]
```

### 14.14 POST create required svc
create required svc
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/servicerequireds
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ServiceRequired|ServiceRequired|body param|yes|
|applicationId|applicationId|path param|yes|

```
ServiceRequired：
 {
    "id": "string",
    "oneLevelName": "string",
    "oneLevelNameEn": "string",
    "twoLevelName": "string",
    "twoLevelNameEn": "string",
    "serName": "string",
    "version": "string",
    "requestedPermissions": false,
    "appId": "string",
    "packageId": "string"
 }
```
**Example response**
```
200 OK
 {
    "id": "string",
    "oneLevelName": "string",
    "oneLevelNameEn": "string",
    "twoLevelName": "string",
    "twoLevelNameEn": "string",
    "serName": "string",
    "version": "string",
    "requestedPermissions": false,
    "appId": "string",
    "packageId": "string"
  }
```

### 14.15 PUT modify required svc
modify required svc
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/servicerequireds/{serName}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ServiceRequired|ServiceRequired|body param|yes|
|serName|serName|path param|yes|
|applicationId|applicationId|path param|yes|

```
ServiceRequired：
{
    "id": "string",
    "oneLevelName": "string",
    "oneLevelNameEn": "string",
    "twoLevelName": "string",
    "twoLevelNameEn": "string",
    "serName": "string",
    "version": "string",
    "requestedPermissions": false,
    "appId": "string",
    "packageId": "string"
}
```
**Example response**
```
200 OK
true
```

### 14.16 DELETE required svc
delete required svc
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/serviceproduceds/{serviceRequiredId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|serviceRequiredId|serviceRequiredId|path param|yes|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
true
```

### 14.17 GET all traffic rule
get all traffic rule
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/trafficrules
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 Ok
[
  {
    "trafficRuleId": "string",
    "filterType": "string",
    "priority": 0,
    "trafficFilter": [
      {
        "srcAddress": [
          "string"
        ],
        "dstAddress": [
          "string"
        ],
        "srcPort": [
          "string"
        ],
        "dstPort": [
          "string"
        ],
        "protocol": [
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
        "qCI": 0,
        "dSCP": 0,
        "tC": 0
      }
    ],
    "action": "string",
    "dstInterface": [
      {
        "interfaceType": "string",
        "tunnelInfo": {
          "tunnelType": "string",
          "tunnelDstAddress": "string",
          "tunnelSrcAddress": "string",
          "tunnelSpecificData": "string"
        },
        "srcMacAddress": "string",
        "dstMacAddress": "string",
        "dstIpAddress": "string"
      }
    ]
  }
]
```

### 14.18 POST create traffic rule
create traffic rule
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/trafficrules
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|TrafficRule|TrafficRule|body param|yes|
|applicationId|applicationId|path param|yes|

```
TrafficRule：
 {
  "trafficRuleId": "string",
  "filterType": "string",
  "priority": 0,
  "trafficFilter": [
    {
      "srcAddress": [
        "string"
      ],
      "dstAddress": [
        "string"
      ],
      "srcPort": [
        "string"
      ],
      "dstPort": [
        "string"
      ],
      "protocol": [
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
      "qCI": 0,
      "dSCP": 0,
      "tC": 0
    }
  ],
  "action": "string",
  "dstInterface": [
    {
      "interfaceType": "string",
      "tunnelInfo": {
        "tunnelType": "string",
        "tunnelDstAddress": "string",
        "tunnelSrcAddress": "string",
        "tunnelSpecificData": "string"
      },
      "srcMacAddress": "string",
      "dstMacAddress": "string",
      "dstIpAddress": "string"
    }
  ]
}
```
**Example response**
```
200 OK
 {
  "trafficRuleId": "string",
  "filterType": "string",
  "priority": 0,
  "trafficFilter": [
    {
      "srcAddress": [
        "string"
      ],
      "dstAddress": [
        "string"
      ],
      "srcPort": [
        "string"
      ],
      "dstPort": [
        "string"
      ],
      "protocol": [
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
      "qCI": 0,
      "dSCP": 0,
      "tC": 0
    }
  ],
  "action": "string",
  "dstInterface": [
    {
      "interfaceType": "string",
      "tunnelInfo": {
        "tunnelType": "string",
        "tunnelDstAddress": "string",
        "tunnelSrcAddress": "string",
        "tunnelSpecificData": "string"
      },
      "srcMacAddress": "string",
      "dstMacAddress": "string",
      "dstIpAddress": "string"
    }
  ]
}
```

### 14.19 PUT modify traffic rule
modify traffic rule
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/trafficrules/{ruleId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|TrafficRule|TrafficRule|body param|yes|
|ruleId|ruleId|path param|yes|
|applicationId|applicationId|path param|yes|

```
TrafficRule：
{
  "trafficRuleId": "string",
  "filterType": "string",
  "priority": 0,
  "trafficFilter": [
    {
      "srcAddress": [
        "string"
      ],
      "dstAddress": [
        "string"
      ],
      "srcPort": [
        "string"
      ],
      "dstPort": [
        "string"
      ],
      "protocol": [
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
      "qCI": 0,
      "dSCP": 0,
      "tC": 0
    }
  ],
  "action": "string",
  "dstInterface": [
    {
      "interfaceType": "string",
      "tunnelInfo": {
        "tunnelType": "string",
        "tunnelDstAddress": "string",
        "tunnelSrcAddress": "string",
        "tunnelSpecificData": "string"
      },
      "srcMacAddress": "string",
      "dstMacAddress": "string",
      "dstIpAddress": "string"
    }
  ]
}
```
**Example response**
```
200 OK
true
```

### 14.20 DELETE traffic rule
delete traffic rule
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration/trafficrules/{ruleId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|ruleId|ruleId|path param|yes|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
true
```

### 14.21 GET app configuration
query application configuration
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
{
  "appCertificate": {
    "ak": "string",
    "sk": "string"
  },
  "appServiceProducedList": [
    {
      "appServiceProducedId": "string",
      "oneLevelName": "string",
      "oneLevelNameEn": "string",
      "twoLevelName": "string",
      "description": "string",
      "apiFileId": "string",
      "guideFileId": "string",
      "iconFileId": "string",
      "serviceName": "string",
      "internalPort": 0,
      "version": "string",
      "protocol": "string",
      "author": "string",
      "experienceUrl": "string",
      "dnsRuleIdList": [
        "string"
      ],
      "trafficRuleIdList": [
        "string"
      ]
    }
  ],
  "appServiceRequiredList": [
    {
      "id": "string",
      "oneLevelName": "string",
      "oneLevelNameEn": "string",
      "twoLevelName": "string",
      "twoLevelNameEn": "string",
      "serName": "string",
      "version": "string",
      "requestedPermissions": false,
      "appId": "string",
      "packageId": "string"
    }
  ],
  "trafficRuleList": [
    {
      "trafficRuleId": "string",
      "filterType": "string",
      "priority": 0,
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "srcPort": [
            "string"
          ],
          "dstPort": [
            "string"
          ],
          "protocol": [
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
          "qCI": 0,
          "dSCP": 0,
          "tC": 0
        }
      ],
      "action": "string",
      "dstInterface": [
        {
          "interfaceType": "string",
          "tunnelInfo": {
            "tunnelType": "string",
            "tunnelDstAddress": "string",
            "tunnelSrcAddress": "string",
            "tunnelSpecificData": "string"
          },
          "srcMacAddress": "string",
          "dstMacAddress": "string",
          "dstIpAddress": "string"
        }
      ]
    }
  ],
  "dnsRuleList": [
    {
      "dnsRuleId": "string",
      "domainName": "string",
      "ipAddressType": "string",
      "ipAddress": "string",
      "ttl": "string"
    }
  ]
}
```

### 14.22 PUT app configuration
modify application configuration
```
Resource URI: /mec/developer/v2/applications/{applicationId}/appconfiguration
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|AppConfiguration|AppConfiguration|path param|yes|
|applicationId|applicationId|path param|yes|

```
AppConfiguration:
{
  "appCertificate": {
    "ak": "string",
    "sk": "string"
  },
  "appServiceProducedList": [
    {
      "appServiceProducedId": "string",
      "oneLevelName": "string",
      "oneLevelNameEn": "string",
      "twoLevelName": "string",
      "description": "string",
      "apiFileId": "string",
      "guideFileId": "string",
      "iconFileId": "string",
      "serviceName": "string",
      "internalPort": 0,
      "version": "string",
      "protocol": "string",
      "author": "string",
      "experienceUrl": "string",
      "dnsRuleIdList": [
        "string"
      ],
      "trafficRuleIdList": [
        "string"
      ]
    }
  ],
  "appServiceRequiredList": [
    {
      "id": "string",
      "oneLevelName": "string",
      "oneLevelNameEn": "string",
      "twoLevelName": "string",
      "twoLevelNameEn": "string",
      "serName": "string",
      "version": "string",
      "requestedPermissions": false,
      "appId": "string",
      "packageId": "string"
    }
  ],
  "trafficRuleList": [
    {
      "trafficRuleId": "string",
      "filterType": "string",
      "priority": 0,
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "srcPort": [
            "string"
          ],
          "dstPort": [
            "string"
          ],
          "protocol": [
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
          "qCI": 0,
          "dSCP": 0,
          "tC": 0
        }
      ],
      "action": "string",
      "dstInterface": [
        {
          "interfaceType": "string",
          "tunnelInfo": {
            "tunnelType": "string",
            "tunnelDstAddress": "string",
            "tunnelSrcAddress": "string",
            "tunnelSpecificData": "string"
          },
          "srcMacAddress": "string",
          "dstMacAddress": "string",
          "dstIpAddress": "string"
        }
      ]
    }
  ],
  "dnsRuleList": [
    {
      "dnsRuleId": "string",
      "domainName": "string",
      "ipAddressType": "string",
      "ipAddress": "string",
      "ttl": "string"
    }
  ]
}
```

**Example response**
```
200 OK
true
```

## 15. Capability-group stats query
This part is about the api for Capability-group stats
### 15.1 GET stats by type 
query group stats by type
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
      "parent": {}
    },
    "capabilityCount": 0
  }
]
```

## 16. Operation
This part is about the api for application launch
### 16.1 GET one operation
get one application operation
```
Resource URI: /mec/developer/v2/operations//{operationId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|operationId|operationId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "userName": "string",
  "objectType": "APPLICATION",
  "objectId": "string",
  "objectName": "string",
  "operationName": "string",
  "progress": 0,
  "status": "ONGOING",
  "errorMsg": "string",
  "actionStatusList": [
    {
      "id": "string",
      "objectType": "APPLICATION",
      "objectId": "string",
      "actionName": "string",
      "progress": 0,
      "status": "ONGOING",
      "errorMsg": "string",
      "statusLog": "string",
      "updateTime": "string"
    }
  ],
  "createTime": "string",
  "updateTime": "string"
}
```

## 17. Capability query
This part is about the api for query capability
### 17.1 GET capability by groupid
get capability by groupid
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
      "parent": {}
    },
    "groupId": "string"
  }
]
```

### 17.2 GET capability by en name
query capability by en name
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
      "parent": {}
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
      "parent": {}
    },
    "groupId": "string"
  }
]
```

### 17.4 GET capability by projectid
get capability by projectid
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
      "parent": {}
    },
    "groupId": "string"
  }
]
```

### 17.5 GET capability by type
query capability by type
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
      "parent": {}
    },
    "groupId": "string"
  }
]
```

## 18. Profile
This part is about the api for profile operation
### 18.1 POST create profile
Create one profile
```
Resource URI: /mec/developer/v2/profiles
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|file|file|request part|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "descriptionEn": "string",
  "seq": [
    "string"
  ],
  "appList": [
    "string"
  ],
  "createTime": "2021-12-30T09:19:44.092Z",
  "type": "string",
  "industry": "string",
  "topoFilePath": "string"
}
```

### 18.2 GET download file
GET download file according to file type
```
Resource URI: /mec/developer/v2/profiles/{profileId}/action/download
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|profileId|profileId|path param|yes|
|type|type|query param|no|
|name|name|query param|no|

**Example response**
```
200 OK
byte[]
```

### 18.3 PUT update profile
Update one profile
```
Resource URI: /mec/developer/v2/profiles/{profileId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|file|file|request part|yes|
|profileId|profileId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "descriptionEn": "string",
  "seq": [
    "string"
  ],
  "appList": [
    "string"
  ],
  "createTime": "2021-12-30T09:19:44.092Z",
  "type": "string",
  "industry": "string",
  "topoFilePath": "string"
}
```

### 18.4 GET query all profiles
GET query all profiles
```
Resource URI: /mec/developer/v2/profiles
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|name|name|query param|no|
|limit|limit|query param|yes|
|offset|offset|query param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "descriptionEn": "string",
  "seq": [
    "string"
  ],
  "appList": [
    "string"
  ],
  "createTime": "2021-12-30T09:19:44.092Z",
  "type": "string",
  "industry": "string",
  "topoFilePath": "string"
}
```

### 18.5 GET query one profile
GET query one profile
```
Resource URI: /mec/developer/v2/profiles/{profileId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|profileId|profileId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "descriptionEn": "string",
  "seq": [
    "string"
  ],
  "appList": [
    "string"
  ],
  "createTime": "2021-12-30T09:19:44.092Z",
  "type": "string",
  "industry": "string",
  "topoFilePath": "string"
}
```

### 18.6 DELETE delete one profile
DELETE delete one profile
```
Resource URI: /mec/developer/v2/profiles/{profileId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|profileId|profileId|path param|yes|

**Example response**
```
200 OK
true
```

### 18.7 POST create application by profile id
POST create application by profile id
```
Resource URI: /mec/developer/v2/profiles/{profileId}/create-application
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|profileId|profileId|path param|yes|
|iconFile|iconFile|request part|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "description": "string",
  "version": "string",
  "provider": "string",
  "architecture": "string",
  "appClass": "CONTAINER",
  "type": "string",
  "industry": "string",
  "iconFileId": "string",
  "guideFileId": "string",
  "appCreateType": "INTEGRATED",
  "createTime": "string",
  "status": "CREATED",
  "userId": "string",
  "userName": "string",
  "mepHostId": "string",
  "pkgSpecId": "string",
  "appPackage": {
    "id": "string",
    "appId": "string",
    "packageFileName": "string",
    "packageFilePath": "string"
  },
  "atpTestTaskList": [
    {
      "id": "string",
      "appName": "string",
      "status": "string",
      "createTime": "string"
    }
  ],
  "appConfiguration": {
    "appCertificate": {
      "ak": "string",
      "sk": "string"
    },
    "appServiceProducedList": [
      {
        "appServiceProducedId": "string",
        "oneLevelName": "string",
        "oneLevelNameEn": "string",
        "twoLevelName": "string",
        "description": "string",
        "apiFileId": "string",
        "guideFileId": "string",
        "iconFileId": "string",
        "serviceName": "string",
        "internalPort": 0,
        "version": "string",
        "protocol": "string",
        "author": "string",
        "experienceUrl": "string",
        "dnsRuleIdList": [
          "string"
        ],
        "trafficRuleIdList": [
          "string"
        ]
      }
    ],
    "appServiceRequiredList": [
      {
        "id": "string",
        "oneLevelName": "string",
        "oneLevelNameEn": "string",
        "twoLevelName": "string",
        "twoLevelNameEn": "string",
        "serName": "string",
        "version": "string",
        "requestedPermissions": false,
        "appId": "string",
        "packageId": "string"
      }
    ],
    "trafficRuleList": [
      {
        "trafficRuleId": "string",
        "filterType": "string",
        "priority": 0,
        "trafficFilter": [
          {
            "srcAddress": [
              "string"
            ],
            "dstAddress": [
              "string"
            ],
            "srcPort": [
              "string"
            ],
            "dstPort": [
              "string"
            ],
            "protocol": [
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
            "qCI": 0,
            "dSCP": 0,
            "tC": 0
          }
        ],
        "action": "string",
        "dstInterface": [
          {
            "interfaceType": "string",
            "tunnelInfo": {
              "tunnelType": "string",
              "tunnelDstAddress": "string",
              "tunnelSrcAddress": "string",
              "tunnelSpecificData": "string"
            },
            "srcMacAddress": "string",
            "dstMacAddress": "string",
            "dstIpAddress": "string"
          }
        ]
      }
    ],
    "dnsRuleList": [
      {
        "dnsRuleId": "string",
        "domainName": "string",
        "ipAddressType": "string",
        "ipAddress": "string",
        "ttl": "string"
      }
    ]
  },
  "scriptList": [
    {
      "id": "string",
      "name": "string",
      "scriptFileId": "string",
      "createTime": "2021-12-30T09:19:44.090Z"
    }
  ]
}
```

## 19. VmApp-network
This part is about the api for vm network
### 19.1 GET all network
query all networks
```
Resource URI: /mec/developer/v2/applications/{applicationId}/networks
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "description": "string"
  }
]
```

### 19.2 POST create network
create network
```
Resource URI: /mec/developer/v2/applications/{applicationId}/networks
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|network|network|body param|yes|

```
network
{
    "id": "string",
    "name": "string",
    "description": "string"
}
```

**Example response**
```
200 OK
{
    "id": "string",
    "name": "string",
    "description": "string"
}
```

### 19.3 GET one network
get one network
```
Resource URI: /mec/developer/v2/applications/{applicationId}/networks/{networkId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|networkId|networkId|path param|yes|

**Example response**
```
200 OK
{
    "id": "string",
    "name": "string",
    "description": "string"
}
```

### 19.4 PUT modify network
modify one network
```
Resource URI: /mec/developer/v2/applications/{applicationId}/networks/{networkId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|networkId|networkId|path param|yes|
|network|network|body param|yes|

```
network
{
    "id": "string",
    "name": "string",
    "description": "string"
}
```
**Example response**
```
200 OK
{
    "id": "string",
    "name": "string",
    "description": "string"
}
```

### 19.5 DELETE network
delete network
```
Resource URI: /mec/developer/v2/applications/{applicationId}/networks/{networkId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|networkId|networkId|path param|yes|

**Example response**
```
200 OK
true
```

## 20. UserData
This part is about the api for vm config(userdata)
### 20.1 GET all userdata
query all userdata
```
Resource URI: /mec/developer/v2/user-datas
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|osType|osType|query param|yes|
|pkgSpecId|pkgSpecId|query param|yes|

**Example response**
```
200 OK
string output
```

## 21. Pkg-specs
This part is about the api for vm config(pkg specs)
### 21.1 GET all pkg specs
query all pkg specs
```
Resource URI: /mec/developer/v2/pkg-specs
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "zhName": "string",
    "enName": "string",
    "specifications": {
      "appdSpecs": {
        "networkNameSpecs": {
          "networkNameN6": "string",
          "networkNameInternet": "string",
          "networkNameMep": "string"
        },
        "userDataFlag": "string",
        "flavorSpecs": "string"
      }
    }
  }
]
```

## 22. VmApp-operation
This part is about the api for vm application operation
### 22.1 POST export image
export vm image
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms/{vmId}/action/export-image
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|vmId|vmId|path param|yes|

**Example response**
```
200 OK
{
  "operationId": "string"
}
```

### 22.2 GET ssh url
query vm ssh url
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms/{vmId}/action/ssh
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|vmId|vmId|path param|yes|

**Example response**
```
200 OK
{
  "encoding": "string",
  "id": "string",
  "status": "string",
  "sshAddress": "string"
}
```

### 22.3 GET vnc url
query vm vnc url
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms/{vmId}/action/vnc
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|vmId|vmId|path param|yes|

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

### 22.4 POST instantiate vm
instantiate vm
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms/{vmId}/action/launch
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|vmId|vmId|path param|yes|

**Example response**
```
200 OK
{
  "operationId": "string"
}
```

### 22.5 GET merge app file
merge app file
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms/{vmId}/action/merge-file
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|vmId|vmId|path param|yes|
|fileName|fileName|path param|yes|
|identifier|identifier|path param|yes|

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

### 22.6 POST upload file
upload app file
```
Resource URI: /mec/developer/v2/applications/{applicationId}/vms/{vmId}/action/upload-file
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|vmId|vmId|path param|yes|
|id|id|query param|yes|
|chunkNumber|chunkNumber|query param|yes|
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
true
```

## 23. ContainerApp-operation
This part is about the api for container application operation
### 23.1 GET container ssh url
query container ssh url
```
Resource URI: /mec/developer/v2/applications/{applicationId}/containers/action/ssh
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
{
  "encoding": "string",
  "id": "string",
  "status": "string",
  "sshAddress": "string"
}
```

### 23.2 POST instantiate container
instantiate container application
```
Resource URI: /mec/developer/v2/applications/{applicationId}/containers/action/launch
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
{
  "operationId": "string"
}
```

## 24. App-operation
This part is about the api for application operation
### 24.1 POST clean env
clean test env
```
Resource URI: /mec/developer/v2/applications/{applicationId}/action/clean-env
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
true
```

### 24.2 GET atp tests
query all atp test
```
Resource URI: /mec/developer/v2/applications/{applicationId}/action/atp-tests
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "appName": "string",
  "status": "string",
  "createTime": "string"
}
```

### 24.3 POST create atp tests
create atp test
```
Resource URI: /mec/developer/v2/applications/{applicationId}/action/atp-tests
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
true
```

### 24.4 POST generate pkg
generate app pkg
```
Resource URI: /mec/developer/v2/applications/{applicationId}/action/generate-package
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "appId": "string",
  "packageFileName": "string",
  "packageFilePath": "string"
}
```

### 24.5 GET one atp test
query one atp test
```
Resource URI: /mec/developer/v2/applications/{applicationId}/atpTests/{atpTestId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|atpTestId|atpTestId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "appName": "string",
  "status": "string",
  "createTime": "string"
}
```

### 24.6 POST release app
release application
```
Resource URI: /mec/developer/v2/applications/{applicationId}/action/release
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|publishAppDto|publishAppDto|body param|yes|

```
publishAppDto
{
  "price": 0,
  "free": false
}
```

**Example response**
```
200 OK
true
```

### 24.7 PUT select host
release app,select host
```
Resource URI: /mec/developer/v2/applications/{applicationId}/action/sel-mephost
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|selectSandbox|selectSandbox|body param|yes|

```
selectSandbox
{
  "mepHostId": "string"
}
```

**Example response**
```
200 OK
true
```

## 25. AppPackage
This part is about the api for application package
### 25.1 GET app package
get app package
```
Resource URI: /mec/developer/v2/apppackages/{packageId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|packageId|packageId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "appId": "string",
  "packageFileName": "string",
  "packageFilePath": "string"
}
```

### 25.2 POST get package content
query package file content
```
Resource URI: /mec/developer/v2/apppackages/{packageId}/action/get-file-content
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|packageId|packageId|path param|yes|
|structureReqDto|structureReqDto|body param|yes|

```
structureReqDto
{
  "filePath": "string"
}
```

**Example response**
```
200 OK
{
  "filePath": "string",
  "content": "string"
}
```

### 25.3 GET package structure
query package structure
```
Resource URI: /mec/developer/v2/apppackages/{packageId}/action/get-pkg-structure
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|packageId|packageId|path param|yes|

**Example response**
```
200 OK
[
  {}
]
```

### 25.4 PUT modify package content
modify package content
```
Resource URI: /mec/developer/v2/apppackages/{packageId}/action/update-file-content
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|packageId|packageId|path param|yes|
|releasedPkgFileContent|releasedPkgFileContent|body param|yes|

```
releasedPkgFileContent
{
  "filePath": "string",
  "content": "string"
}
```

**Example response**
```
200 OK
{
  "filePath": "string",
  "content": "string"
}
```

### 25.5 POST zip package
zip app package
```
Resource URI: /mec/developer/v2/apppackages/{packageId}/action/zip-package
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|atpTestId|atpTestId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "appId": "string",
  "packageFileName": "string",
  "packageFilePath": "string"
}
```

## 26. Helmcharts
This part is about the api for application deploy yaml
### 26.1 GET helm chart
get helm chart
```
Resource URI: /mec/developer/v2/applications/{applicationId}/helmcharts/{helmchartId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|helmchartId|helmchartId|path param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "helmChartFileId": "string",
  "createTime": "2021-12-30T11:08:27.398Z",
  "applicationId": "string",
  "helmChartFileList": [
    {
      "name": "string",
      "innerPath": "string",
      "children": [
        {}
      ],
      "content": "string",
      "file": false
    }
  ]
}
```

### 26.2 DELETE helm chart
delete helm chart
```
Resource URI: /mec/developer/v2/applications/{applicationId}/helmcharts/{helmchartId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|helmchartId|helmchartId|path param|yes|

**Example response**
```
200 OK
true
```

### 26.3 POST download helmchart
download helm package
```
Resource URI: /mec/developer/v2/applications/{applicationId}/helmcharts/{helmchartId}/action/download
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|helmchartId|helmchartId|path param|yes|

**Example response**
```
200 OK
byte[]
```

### 26.4 GET helmchart content
query package content
```
Resource URI: /mec/developer/v2/applications/{applicationId}/helmcharts/{helmchartId}/action/get-inner-file
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|helmchartId|helmchartId|path param|yes|
|filePath|filePath|query param|yes|

**Example response**
```
200 OK
string output
```

### 26.5 GET all helmchart
get all helmcharts
```
Resource URI: /mec/developer/v2/applications/{applicationId}/helmcharts
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|

**Example response**
```
200 OK
[
  {
    "id": "string",
    "name": "string",
    "helmChartFileId": "string",
    "createTime": "2021-12-30T11:08:27.398Z",
    "applicationId": "string",
    "helmChartFileList": [
      {
        "name": "string",
        "innerPath": "string",
        "children": [
          {}
        ],
        "content": "string",
        "file": false
      }
    ]
  }
]
```

### 26.6 POST upload helmchart
upload deploy file
```
Resource URI: /mec/developer/v2/applications/{applicationId}/helmcharts
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|file|file|format param|yes|

**Example response**
```
200 OK
{
  "id": "string",
  "name": "string",
  "helmChartFileId": "string",
  "createTime": "2021-12-30T11:08:27.398Z",
  "applicationId": "string",
  "helmChartFileList": [
    {
      "name": "string",
      "innerPath": "string",
      "children": [
        {}
      ],
      "content": "string",
      "file": false
    }
  ]
}
```

### 26.7 PUT modify helm content
modify helm content
```
Resource URI: /mec/developer/v2/applications/{applicationId}/helmcharts/{helmchartId}/action/modify-inner-file
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|applicationId|applicationId|path param|yes|
|helmchartId|helmchartId|path param|yes|
|content|content|body param|yes|

```
content
{
  "innerFilePath": "string",
  "content": "string"
}
```

**Example response**
```
200 OK
true
```

## 27. ReleasedPackage
This part is about the api for synchronized pkg
### 27.1 GET all released pkg
query all released pkg
```
Resource URI: /mec/developer/v2/released-packages
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|name|name|query param|yes|
|limit|limit|query param|yes|
|offset|limit|query param|yes|

**Example response**
```
200 OK
{}
```

### 27.2 DELETE released pkg
delete released pkg
```
Resource URI: /mec/developer/v2/released-packages/{packageId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|packageId|packageId|path param|yes|

**Example response**
```
200 OK
true
```

### 27.3 POST release pkg
release pkg
```
Resource URI: /mec/developer/v2/released-packages/{packageId}/action/release
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|packageId|packageId|path param|yes|
|publishAppDto|publishAppDto|body param|yes|

```
publishAppDto
{
  "price": 0,
  "free": false
}
```

**Example response**
```
200 OK
true
```

### 27.4 POST get released content
query package content
```
Resource URI: /mec/developer/v2/released-packages/{packageId}/action/get-file-content
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|packageId|packageId|path param|yes|
|structureReqDto|structureReqDto|body param|yes|

```
structureReqDto
{
  "filePath": "string"
}
```

**Example response**
```
200 OK
{
  "filePath": "string",
  "content": "string"
}
```

### 27.5 POST synchronize pkg
synchronize released pkg from appstore
```
Resource URI:/mec/developer/v2/released-packages
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|pkgReqDtos	|pkgReqDtos|body param|yes

```
pkgReqDtos
[
  {
    "appId": "string",
    "packageId": "string"
  }
]
```

**Example response**
```
200 OK
true
```

### 27.6 GET released pkg structure
get released pkg structure
```
Resource URI: /mec/developer/v2/released-packages/{packageId}/action/get-pkg-structure
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|packageId|packageId|path param|yes|

**Example response**
```
200 OK
[
 {}
]
```

### 27.7 PUT modify pkg content
modify released pkg file content
```
Resource URI: /mec/developer/v2/released-packages/{packageId}/action/edit-file-content
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|packageId|packageId|path param|yes|
|releasedPkgFileContent|releasedPkgFileContent|body param|yes|

```
releasedPkgFileContent
{
  "filePath": "string",
  "content": "string"
}
```

**Example response**
```
200 OK
{
  "filePath": "string",
  "content": "string"
}
```

## 28. VmImage
This part is about the api for vm image
### 28.1 GET check upload
check chunk for upload vm image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}/action/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|identifier|identifier|query param|yes|
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

### 28.2 POST upload vm image
upload vm image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}/action/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|
|id|id|query param|yes|
|chunkNumber|chunkNumber|query param|yes|
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

### 28.3 DELETE cancel upload vm image
cancel upload vm image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}/action/upload
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|
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
  "statusCode": "CONTINUE",
  "statusCodeValue": 0
}
```

### 28.4 POST create vm image
create vm image
```
Resource URI: /mec/developer/v2/vmimages
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|VmImage|VmImage|body param|yes|

```
VmImage
{
  "visibleType": "public",
  "osType": "ubuntu",
  "osVersion": "string",
  "osBitType": "string",
  "systemDiskSize": 0,
  "name": "string"
}
```

**Example response**
```
200 OK
true
```

### 28.5 GET one vm image
query vm image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
```
200 OK
{
  "id": 0,
  "visibleType": "public",
  "osType": "ubuntu",
  "osVersion": "string",
  "osBitType": "string",
  "systemDiskSize": 0,
  "name": "string",
  "imageFileName": "string",
  "createTime": "string",
  "modifyTime": "string",
  "imageFormat": "string",
  "uploadTime": "string",
  "downLoadUrl": "string",
  "imageSize": 0,
  "status": "UPLOAD_WAIT",
  "imageSlimStatus": "SLIM_WAIT",
  "userId": "string",
  "userName": "string",
  "fileMd5": "string",
  "fileIdentifier": "string",
  "errorType": "string"
}
```

### 28.6 PUT modify vm image
modify vm image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|
|VmImage|VmImage|body param|yes|

```
VmImage
{
  "id": 0,
  "visibleType": "public",
  "osType": "ubuntu",
  "osVersion": "string",
  "osBitType": "string",
  "systemDiskSize": 0,
  "name": "string"
}
```

**Example response**
```
200 OK
true
```

### 28.7 DELETE vm image
delete vm image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
```
200 OK
true
```

### 28.8 GET download vm image
download vm image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}/action/download
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
```
200 OK
binary output.
```

### 28.9 POST get all vm image
query all vm image
```
Resource URI: /mec/developer/v2/vmimages/action/get-list
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|
|vmImageReq|vmImageReq|body param|yes|

```
vmImageReq
{
  "name": "string",
  "visibleType": "public",
  "userId": "string",
  "osType": "string",
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
      "id": 0,
      "visibleType": "public",
      "osType": "ubuntu",
      "osVersion": "string",
      "osBitType": "string",
      "systemDiskSize": 0,
      "name": "string",
      "imageFileName": "string",
      "createTime": "string",
      "modifyTime": "string",
      "imageFormat": "string",
      "uploadTime": "string",
      "downLoadUrl": "string",
      "imageSize": 0,
      "status": "UPLOAD_WAIT",
      "imageSlimStatus": "SLIM_WAIT",
      "userId": "string",
      "userName": "string",
      "fileMd5": "string",
      "fileIdentifier": "string",
      "errorType": "string"
    }
  ]
}
```

### 28.10 POST slim vm image
slim vm image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}/action/slim
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
```
200 OK
{
  "operationId": "string"
}
```

### 28.11 GET merge vm image
merge vm image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}/action/merge
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|
|fileName|fileName|query param|yes|
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
  "statusCode": "CONTINUE",
  "statusCodeValue": 0
}
```

### 28.12 PUT publish image
publish image
```
Resource URI: /mec/developer/v2/vmimages/{imageId}/action/publish
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
```
200 OK
true
```

### 28.13 PUT reset image
reset vm image status
```
Resource URI: /mec/developer/v2/vmimages/{imageId}/action/reset
```
|Name|Definition|Type|Required|
|-------------|-------------|------------|------------|
|imageId|imageId|path param|yes|

**Example response**
```
200 OK
true
```
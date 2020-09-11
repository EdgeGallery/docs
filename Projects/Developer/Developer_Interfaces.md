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
 

# Developer-Server
This section cover the Developer-Server interfaces.

## 1. Plugin

### 1.1 POST upload plugin 
Upload one plugin with some params.
```
Resource URI: /mec/developer/v1/plugins
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| pluginFile | plugin file|request part|yes|
| logoFile | plugin logo file |request part|yes|
| apiFile | plugin api file |request part|yes|
| pluginName | plugin name |request part|yes|
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
| codeLanguage | language represented by the plugin |request param|no|
| pluginType | 1 plugin 2 sdk |request param|no|
| version | plugin version |request param|no|
| introduction | plugin brief |request param|no|

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
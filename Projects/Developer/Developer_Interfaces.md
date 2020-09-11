APP Store Interfaces
==============
- [APP Store Interfaces](#appstore-interfaces)
- [AppStore-Server](#AppStore-server)
  - [1. APP](#1-app)
    - [1.1 apps](#11-apps)
      - [1.1.1 GET all by condation](#111-get-all)
      - [1.1.2 GET one](#112-get-one)
      - [1.1.3 POST](#112-post)
      - [1.1.4 DELETE one](#112-delete-one)
      - [1.1.5 GET lastest package](#112-get-latest-package)
      - [1.1.6 GET app icon](#112-get-app-icon)
  - [2. Package](#2-package)
    - [2.1 packages](#21-packages)
      - [2.1.1 GET all package by appid](#211-get-all)
      - [2.1.2 GET one](#212-get-one)
      - [2.1.3 DELETE one](#213-delete-one)
      - [2.1.4 DOWNLOAD one](#213-delete-one)
    - [2.2 files](#21-files)
      - [2.2.1 GET FILE CONTENT](#221-get-file-by-filepath)
  - [3. Comments](#3-comment)
    - [3.1 comments](#31-comments)
      - [3.1.1 GET all comments by appid](#311-get-all)
      - [3.1.2 POST one comment to app](#312-get-one)

# AppStore-Server
This section cover the AppStore-Server interfaces.

## 1. APP

APP is the basic publishing unit of APP Store. 

### 1.1 apps

Unit of APP Server, one app with one or more packages.

#### 1.1.1 GET all

Query all apps by condation.

```
Resource URI: /mec/appstore/v1/apps
```

| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| name | app name. |request param|no|
| provider | app provider. |request param|no|
| type | app type. |request param|no|
| affinity | app affinity. |request param|no|
| userId | app creater. |request param|no|

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
    "userName": "string"
  }
]
```

#### 1.1.2 GET one
Query app by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appId | app name.|path | yes|


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
  }
```

#### 1.1.3 POST 
registe a app.
```
Resource URI: /mec/appstore/v1/apps
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| userId | user id|request param | yes|
| userName | app name|request param | yes|
| file | package file|RequestPart | yes|
| icon | app icon file|RequestPart | yes|
| type | application type|RequestPart | yes|
| shortDesc | short desc of input|RequestPart | yes|
| affinity | affinity of app|RequestPart | yes|
| industry | industry of app|RequestPart | yes|

Example response:
```
200 OK
  add app and upload package success.
```

#### 1.1.4 DELETE 
delete a app.
```
Resource URI: /mec/appstore/v1/apps/{appId}
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| userId | user id|request param | yes|
| userName | app name|request param | yes|
| appId | app id|path | yes|

Example response:
```
200 OK
  delete App success..
```

#### 1.1.5 GET lastest package
get latest version package of app.
```
Resource URI: /mec/appstore/v1/apps/{appId}/action/download
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| userId | user id|request param | yes|
| userName | app name|request param | yes|
| appId | app id|path | yes|

Example response:
```
200 OK
  binary output.
```

#### 1.1.6 GET lastest package
get app icon by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/icon
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| userId | user id|request param | yes|
| userName | app name|request param | yes|
| appId | app id|path | yes|

Example response:
```
200 OK
  binary output.
```

APP Store Interfaces
==============
- [APP Store Interfaces](#appstore-interfaces)
- [AppStore-Server](#AppStore-server)
  - [1. APP](#1-app)
    - [1.1 apps](#11-apps)
      - [1.1.1 GET all by condation](#111-get-all)
      - [1.1.2 GET one](#112-get-one)
      - [1.1.3 POST](#112-post)
      - [1.1.4 DELETE one](#112-delete-one)
      - [1.1.5 GET lastest package](#112-get-latest-package)
      - [1.1.6 GET app icon](#112-get-app-icon)
  - [2. Package](#2-package)
    - [2.1 packages](#21-packages)
      - [2.1.1 GET all package by appid](#211-get-all)
      - [2.1.2 GET one](#212-get-one)
      - [2.1.3 DELETE one](#213-delete-one)
      - [2.1.4 DOWNLOAD one](#213-delete-one)
    - [2.2 files](#21-files)
      - [2.2.1 GET FILE CONTENT](#221-get-file-by-filepath)
  - [3. Comments](#3-comment)
    - [3.1 comments](#31-comments)
      - [3.1.1 GET all comments by appid](#311-get-all)
      - [3.1.2 POST one comment to app](#312-get-one)

# AppStore-Server
This section cover the AppStore-Server interfaces.

## 2. Package

Package belong to App, etch App have at least one Package. 

### 2.1 packages


#### 2.1.1 GET all package by app id

Query all packages by appid.

```
Resource URI: /mec/appstore/v1/apps/{appId}/packages
```

| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appId | app id |type|yes|

Example response:
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

#### 2.1.2 GET one
Query app by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appId | app id|path | yes|
| packageId | package id|path | yes|

Example response:
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

#### 2.1.3 DELETE one 
delete a package of app.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appId | app id|path | yes|
| packageId | package id|path | yes|

Example response:
```
200 OK
   delete package success.
```

#### 2.1.4 GET download one 
download one package by appId and packageId.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/download
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appId | app id|path | yes|
| packageId | package id|path | yes|

Example response:
```
200 OK
  binary output.
```
### 2.2 files


#### 2.2.1 GET lastest package
get latest version package of app.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/files
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| userId | user id|request param | yes|
| userName | app name|request param | yes|
| appId | app id|path | yes|
| filePath | file path|FormParam | yes|

Example response:
```
200 OK
  file content output.
```
## 3. Comment

User can leave comments to app. 

### 3.1 comments


#### 3.1.1 GET all comments by app id
```
Resource URI: /mec/appstore/v1/apps/{appId}/comments
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| appId | app id|path | yes|


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

#### 3.1.1 POST leave a comment to app
```
Resource URI: /mec/appstore/v1/apps/{appId}/comments
```
| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| userId | user id|request param | yes|
| userName | app name|request param | yes|
| appId | app id|path | yes|
| entity | comment entity|RequestBody | yes|

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
 comments success.
```
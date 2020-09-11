APP Store Interfaces
==============
- [APP Store Interfaces](#appstore-interfaces)
- [AppStore-Server](#appStore-server)
  - [1. APP](#1-app)
    - [1.1 Get All Apps](#11-get-all-apps)
    - [1.2 Get One App](#12-get-one-app)
    - [1.3 Register App](#13-register-app)
    - [1.4 Delete One App](#14-delete-one-app)
    - [1.5 Get Latest Version Of App](#15-get-latest-version-of-app)
    - [1.6 Get Icon Of App](#16-get-icon-of-app)
  - [2. Package](#2-package)
    - [2.1 Get All Packages Of APP](#21-get-all-packages-of-app)
    - [2.2 Get One Package](#22-get-one-package)
    - [2.3 Delete One Package](#23-delete-one-package)
    - [2.4 Download One Package](#24-delete-one-package)
    - [2.5 Get File Content](#25-get-file-content)
  - [3. Comments](#3-comments)
    - [3.1 Get Comments Of App](#31-get-comments-of-app)
    - [3.2 Submit Comment To App](#32-submit-comment-to-app)

# AppStore-Server
This section cover the AppStore-Server interfaces.

## 1. APP

APP is the basic publishing unit of APP Store. 


### 1.1 Get All Apps

Query all apps by condation.

```
Resource URI: /mec/appstore/v1/apps
Method: GET
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

### 1.2 Get One App
Query app by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}
Method: GET
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

### 1.3 Register App 
registe a app.
```
Resource URI: /mec/appstore/v1/apps
Method: POST
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

### 1.4 Delete One App 
delete a app.
```
Resource URI: /mec/appstore/v1/apps/{appId}
Method: DELETE
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

### 1.5 Get Latest Version Of App
get latest version package of app.
```
Resource URI: /mec/appstore/v1/apps/{appId}/action/download
Method: GET
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

### 1.6 Get Icon Of App
get app icon by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/icon
Method: GET
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

## 2. Package

Package belong to App, etch App have at least one Package. 


### 2.1 Get All Packages Of APP

Query all packages by app id.

```
Resource URI: /mec/appstore/v1/apps/{appId}/packages
Method: GET
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

### 2.2 Get One Package
Query app by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
Method: GET
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

### 2.3 Delete One Package
delete a package of app.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}
Method: DELETE
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

### 2.4 Download One Package 
download one package by appId and packageId.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/action/download
Method: GET
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

### 2.5 Get File Content
Get file content by app id package id and file path.
```
Resource URI: /mec/appstore/v1/apps/{appId}/packages/{packageId}/files
Method: GET
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

User can submit comments to an app. 


### 3.1 Get Comments Of App
Get comments by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/comments
Method: GET
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

### 3.1 Submit Comment To App
User submit comment to app by app id.
```
Resource URI: /mec/appstore/v1/apps/{appId}/comments
Method: POST
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
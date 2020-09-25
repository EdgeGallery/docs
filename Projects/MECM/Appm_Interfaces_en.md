Application Package Manager Interface
==============
The document is for the Application Package Manager project, there is one part of interfaces in the project.

- [Application Package Manager Interface](#appm-interfaces)
  - [1. App Package Manage Handler](#1-app-package-manage-handler)
    - [1.1 Get All Application Packages](#11-get-all-application-packages)
    - [1.2 Onboard Application Package](#12-onboard-application-package)
    - [1.3 Get Application Package Information](#13-get-application-package-information)
    - [1.4 Delete Application Packages](#14-delete-application-packages)
    - [1.5 Download Csar](#15-download-csar)
    - [1.6 Delete Application Package](#16-delete-application-package)

## 1. App Package Manage Handler

### 1.1 Get All Application Packages

Retrieves all application packages

```
Resource URI: /apm/v1/tenants/{tenant_id}/packages
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|access_token |access token|header |yes|
|tenant_id|tenant id|path|yes|

Example response:
```
200 OK
[
  "response": {}
]
```

### 1.2 Onboard Application Package
Onboard application package
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages
Method: POST
```

|Name|Definition|type|Required|
|---|---|---|---|
|access_token|access_token|header|yes|
|appPackageDto|app package info|body|yes|
|tenant_id|tenant id|path|yes|

Example request body:
```
{
  "appIconUrl": "string",
  "appId": "string",
  "appPkgAffinity": "string",
  "appPkgDesc": "string",
  "appPkgId": "string",
  "appPkgName": "string",
  "appPkgPath": "string",
  "appPkgVersion": "string",
  "appProvider": "string",
  "createdTime": "string",
  "mecHostInfo": [
    {
      "error": "string",
      "hostIp": "string",
      "status": "string"
    }
  ],
  "modifiedTime": "string"
}
```
Example response:
```
200 OK
```

### 1.3 Get Application Package Information
Retrieves application package information.
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages/{app_package_id}
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|access_token |access token|header |yes|
|app_package_id|app package id|path|yes|
|tenant_id|tenant id|path|yes|

Example response:
```
200 OK
  {
    "appIconUrl": "string",
    "appId": "string",
    "appPkgAffinity": "string",
    "appPkgDesc": "string",
    "appPkgId": "string",
    "appPkgName": "string",
    "appPkgPath": "string",
    "appPkgVersion": "string",
    "appProvider": "string",
    "createdTime": "string",
    "mecHostInfo": [
      {
        "error": "string",
        "hostIp": "string",
        "status": "string"
      }
    ],
    "modifiedTime": "string"
  }
```

### 1.4 Delete Application Packages
Deletes application package
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages/{app_package_id}
Method: DELETE
```

|Name|Definition|type|Required|
|---|---|---|---|
|access_token |access token|header |yes|
|app_package_id|app package id|path |yes|
|tenant_id|tenant id|path |yes|
|appId |app id|path |yes|

Example response:
```
200 OK
```

### 1.5 Download Csar
Download application package CSAR
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages/{app_package_id}/download
Method: GET
```

|Name|Definition|type|Required|
|---|---|---|---|
|app_package_id|app package id|path |yes|
|tenant_id |tenant id|path |yes|

Example response:
```
200 OK
  {
    "description": "string",
    "file": {
      "absolute": true,
      "absolutePath": "string",
      "canonicalPath": "string",
      "directory": true,
      "file": true,
      "freeSpace": 0,
      "hidden": true,
      "name": "string",
      "parent": "string",
      "path": "string",
      "totalSpace": 0,
      "usableSpace": 0
    },
    "filename": "string",
    "inputStream": {},
    "open": true,
    "readable": true,
    "uri": {
      "absolute": true,
      "authority": "string",
      "fragment": "string",
      "host": "string",
      "opaque": true,
      "path": "string",
      "port": 0,
      "query": "string",
      "rawAuthority": "string",
      "rawFragment": "string",
      "rawPath": "string",
      "rawQuery": "string",
      "rawSchemeSpecificPart": "string",
      "rawUserInfo": "string",
      "scheme": "string",
      "schemeSpecificPart": "string",
      "userInfo": "string"
    },
    "url": {
      "authority": "string",
      "content": {},
      "defaultPort": 0,
      "file": "string",
      "host": "string",
      "path": "string",
      "port": 0,
      "protocol": "string",
      "query": "string",
      "ref": "string",
      "userInfo": "string"
    }
  }
```

### 1.6 Delete Application Package
Deletes an application packages
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages/{app_package_id}/hosts/{host_ip}
Method: DELETE
```

|Name|Definition|type|Required|
|---|---|---|---|
|access_token |access token|header |yes|
|app_package_id |app package id|path |yes|
|host_ip|host ip|path |yes|
|tenant_id |tenant id|path |yes|

Example response:
```
200 OK
```
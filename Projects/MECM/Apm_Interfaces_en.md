Application Package Manager Interface
==============
The document is for the Application Package Manager project, there is one part of interfaces in the project.

### Get All Application Packages

Retrieves all application packages

```
Resource URI: /apm/v1/tenants/{tenant_id}/packages
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant id|path|yes|Valid UUID|64|

Example response:
```
200 OK
[
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
]
```

### Onboard Application Package
Onboard application package
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|tenant_id|tenant id|path|yes|Valid UUID|64|
|appIconUrl|appIconUrl|body|yes|Valid URL|1024|
|appId|appId|body|yes|AlphaNumeric with smaller case alphabets|32|
|appPkgAffinity|appPkgAffinity|body|yes|AlhpaNumeric|255|
|appPkgDesc|appPkgDesc|body|yes|AlhpaNumeric|1024|
|appPkgId|appPkgId|body|yes|AlphaNumeric with smaller case alphabets|32|
|appPkgName|appPkgName|body|yes|AlphaNumeric and allowed special characters hypen and underscore|255|
|appPkgPath|appPkgPath|body|yes|Valid URL|1024|
|appPkgVersion|appPkgVersion|body|yes|Valid URL|1024|
|appProvider|appProvider|body|yes|AlphaNumeric|1024|
|createdTime|createdTime|body|yes|Valid time|255|
|mecHostInfo|mecHostInfo|body|yes|Valid URL|15|

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
[
  {
     "packageId": "string"
  }
]
```

### Get Application Package Information
Retrieves application package information.
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages/{app_package_id}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|app_package_id|app package id|path|yes|Alphanumeric and must be smaller case|32|
|tenant_id|tenant id|path|yes|Valid UUID|64|

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

### Delete Application Packages
Deletes application package
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages/{app_package_id}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|app_package_id|app package id|path |yes|Alphanumeric and must be smaller case|32|
|tenant_id|tenant id|path |yes|Valid UUID|64|
|appId |app id|path |yes|Alphanumeric and must be smaller case|32|

Example response:
```
200 OK
{
 "success"
}
```

### Download Csar
Download application package CSAR
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages/{app_package_id}/download
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|app_package_id|app package id|path |yes|Alphanumeric and must be smaller case|32|
|tenant_id |tenant id|path |yes|Valid UUID|64|

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

### Delete Application Package
Deletes an application packages
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages/{app_package_id}/hosts/{host_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|app_package_id |app package id|path |yes|Alphanumeric and must be smaller case|32|
|host_ip|host ip|path |yes|Valid IP address|15|
|tenant_id |tenant id|path |yes|Valid UUID|64|

Example response:
```
200 OK
{
 "success"
}
```

### On-boards application with package.
On-boards application with package provided.
```
Resource URI: /apm/v1/tenants/{tenant_id}/packages/upload
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|appPkgName|appPkgName|body|yes|AlphaNumeric and allowed special characters hypen and underscore|255|
|appPkgVersion|appPkgVersion|body|yes|Valid URL|1024|
|File|file|formData|No|
|hostList|host list|formData|yes|
|tenant_id|tenant id|path|no|Valid UUID|64|

Example request body:
```
{
  "access_token": "string",
  "appPackageName": "string",
  "appPackageVersion": "string",
  "file": "file",
  "hostList": "string",
  "tenant_id": "string",
}
```
Example response:
```
202 Accepted
{
  "appId": "string",
  "appPackageId": "string"
}
```
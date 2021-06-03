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

### Queries liveness & readiness
Retrieves data for liveness & readiness
```
Resource URI: /apm/v1/health
Method: GET
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
```
### Retrieves all application packages info from app store.
Retrieves all application packages info from app store.
```
Resource URI: /apm/v1/apps/info/appstores/{appstore_ip}
Method: GET
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|appstore_ip|appstore_ip|body|yes|AlphaNumeric with smaller case alphabets|32|

Example response:
```
200 OK
```

### Sync application packages
Sync application package by downloading package from appstore.
```
Resource URI: /apm/v1/apps/sync
Method: POST
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|appId|appId|body|yes|AlphaNumeric with smaller case alphabets|32|
|packageId|packageId|body|yes|AlphaNumeric with smaller case alphabets|32|

Example request body:
```
[
    {
        "appId": "string",
        "appstoreIp": "string",
        "packageId": "string"
    },
    {
        "appId": "string",
        "appstoreIp": "string",
        "packageId": "string"
    }
]
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

### Retrieves all application packages sync status
Retrieves all application packages sync status.
```
Resource URI: /apm/v1/apps/syncstatus
Method: GET
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
```

### Get Application Package Information
Retrieve application packages sync status.
```
Resource URI: /apm/v1/apps/{app_id}/packages/{package_id}/syncstatus
Method: GET
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|appId|appId|body|yes|AlphaNumeric with smaller case alphabets|32|
|packageId|packageId|body|yes|AlphaNumeric with smaller case alpha

Example response:
```
200 OK
{
 "appId": "ad dolore laborum",
 "name": "Excep",
 "operationalInfo": "est magna",
 "packageId": "sit n",
 "syncStatus": "cillum exercitation quis"
}
```

### Get Application Package Information
Retrieve application packages sync status.
```
Resource URI: /apm/v1/tenants/{tenant_id}/app_package_infos/sync
Method: POST
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "appPackageRecord": [
        {
            "appPkgId": "8e3d6f90bad74cecb7544fc5ebf56782a5df67ab47ba40e09015136573d7bce439937079-99fe-4cd8-881f-04ca8c4fe09d",
            "appPkgName": "Video_Surveillance_ap",
            "appPkgVersion": "2",
            "appPkgPath": "abc",
            "appProvider": "",
            "appPkgDesc": "abc",
            "appPkgAffinity": "bangalore",
            "appIconUrl": "",
            "createdTime": "2021-03-12 07:59:55.695956+00",
            "modifiedTime": "",
            "appId": "1",
            "tenantId": "e921ce54-82c8-4532-b5c6-8516cf75f7a7",
            "packageId": "1",
            "origin": "MEPM",
            "syncStatus": false,
            "mecHostInfo": [
                {
                    "pkgHostKey": "8e3d6f90bad74cecb7544fc5ebf56782a5df67ab47ba40e09015136573d7bce439937079-99fe-4cd8-881f-04ca8c4fe09d119.8.47.5",
                    "hostIp": "119.8.47.5",
                    "appPkgId": "8e3d6f90bad74cecb7544fc5ebf56782a5df67ab47ba40e09015136573d7bce4",
                    "status": "",
                    "tenantId": "e921ce54-82c8-4532-b5c6-8516cf75f7a7",
                    "error": "success",
                    "origin": "MEPM",
                    "syncStatus": false
                }
            ]
        }
    ]
}
```

### APM Open Api Swagger

* Please refer [APM_OPEN_API](https://gitee.com/edgegallery/docs/blob/master/Projects/MECM/MECM_APIs/apm-swagger-openapi.yaml)
Inventory Interfaces
==============
The document is for the Inventory project, there are three parts of interfaces in the project.

- [Inventory Interfaces](#appo-interfaces)
  - [1. App Lcm Inventory Handler](#1-app-lcm-inventory-handler)
    - [1.1 Get All Application LCM Records](#11-get-all-application-lcm-records)
    - [1.2 Add Applcm Record](#12-add-applcm-record)
    - [1.3 Delete All Applcm Record](#13-delete-all-applcm-record)
    - [1.4 Get Application LCM Record](#14-get-application-lcm-record)
    - [1.5 Update Application LCM Record](#15-update-application-lcm-record)
    - [1.6 Delete Application LCM Record](#16-delete-application-lcm-record)
  - [2.App Store Inventory Handler](#2-app-store-inventory-handler)
    - [2.1 Get All Application Records ](#21-get-all-application-records)
    - [2.2 Add Application Store Record](#22-add-application-store-record)
    - [2.3 Delete All Application Records](#23-delete-all-application-records)
    - [2.4 Get Application Stores Record](#24-get-application-stores-record)
    - [2.5 Update App Store Record](#25-update-app-store-record)
    - [2.6 Deletes Application Record](#26-deletes-application-record)
  - [3.MEC Host Inventory Handler](#3-mec-host-inventory-handler)
      - [3.1 Get All MEC Host Records](#31-get-all-mec-host-records)
      - [3.2 Add MEC Host Record](#32-add-mec-host-record)
      - [3.3 Delete All MEC Host Records](#33-delete-all-mec-host-records)
      - [3.4 Get MEC Host Record](#34-get-mec-host-record)
      - [3.5 Update MEC Host Record](#35-update-mec-host-record)
      - [3.6 Delete MEC Host Record](#36-delete-mec-host-record)
      - [3.7 Upload K8s Configuration File](#37-upload-k8s-configuration-file)
      - [3.8 Delete K8s Configuration File](#38-delete-k8s-configuration-file)

## 1. App Lcm Inventory Handler

### 1.1 Get All Application LCM records

Retrieves all application LCM records

```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms
Method: GET
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
[
  {}
]
```

### 1.2 Add Applcm Record
Adds new application LCM record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms
Method: POST
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|appLcmDto|applcm inventory information|body|yes|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|
|applcmIp|applcmIp|body|yes|Valid URL and not exceed 15 characters|
|applcmPort|applcmPort|body|yes|Valid Port|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|

Example request body:
```
{
  "applcmIp": "string",
  "applcmPort": "string",
  "userName": "string"
}
```

Example response:
```
200 OK
```

### 1.3 Delete All Applcm Record
Deletes all application LCM Records.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms
Method: DELETE
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
```

### 1.4 Get Application LCM Record
Retrieves application LCM Record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms/{applcm_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|applcm_ip|applcm ip|path |yes|Valid IP address and not exceed 15 characters|
|tenant_id|tenant identifier|path |yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
{
  "applcmIp": "string",
  "applcmPort": "string",
  "userName": "string"
}
```

### 1.5 Update Application LCM Record
Updates existing application LCM record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms/{applcm_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|appLcmDto |applcm inventory information|body |yes|
|applcm_ip|applcm IP|path |yes|Valid IP address and not exceed 15 characters|
|tenant_id |tenant identifier|path |yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
```

### 1.6 Delete Application LCM Record
Deletes application LCM record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms/{applcm_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|applcm_ip |applcm ip|path |yes|Valid IP address and not exceed 15 characters|
|tenant_id |tenant identifier|path |yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
```

## 2. App Store Inventory Handler

### 2.1 Get All Application Records 
Retrieves all application store records
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores
Method: GET
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token|access token|header|yes|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
  {
    {}
  }
```

### 2.2 Add Application Store Record
Adds new application store record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores
Method: POST
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token|access token|header|yes|
|appStoreDto|appstore inventory information|object|yes|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|
|appstoreIp|appstoreIp|body|yes|Valid IP address and not exceed 15 characters|
|appstoreName|appstoreName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|
|appstorePort|appstorePort|body|yes|Valid Port and not exceed 5 characters|
|producer|producer|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|
|uri|uri|body|yes|Valid UUID and not exceed 128 characters|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|

Example request body:
```
{
  "appstoreIp": "string",
  "appstoreName": "string",
  "appstorePort": "string",
  "producer": "string",
  "uri": "string",
  "userName": "string"
}
```
Example response:
```
200 OK
  {
    {}
  }
```

### 2.3 Delete All Application Records
Deletes all application stores records
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores
Method: DELETE
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|tenant_id |tenant identifier|path   |yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
  {
    "response": {}
  }
```

### 2.4 Get Application Stores Record
Retrieves application store record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores/{appstore_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access_token|header |yes|
|appstore_ip |appstore IP|path |yes|Valid IP address and not exceed 15 characters|
|tenant_id |tenant identifier|path |yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
  {
    "address": "string",
    "affinity": "string",
    "applcmIp": "string",
    "city": "string",
    "edgeName": "string",
    "edgerepoIp": "string",
    "edgerepoPort": "string",
    "edgerepoUsername": "string",
    "mechostIp": "string",
    "mechostName": "string",
    "userName": "string",
    "zipCode": "string"
  }
```

### 2.5 Update App Store Record
Updates existing application store record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores/{appstore_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token|access token|header|yes|
|appStoreDto|appstore inventory information|body|yes|
|appstore_ip|appstore IP|path|yes|Valid IP address and not exceed 15 characters|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|
|appstoreIp|appstoreIp|body|yes|Valid IP address and not exceed 15 characters|
|appstoreName|appstoreName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|
|appstorePort|appstorePort|body|yes|Valid Port and not exceed 5 characters|
|producer|producer|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|
|uri|uri|body|yes|Valid UUID and not exceed 128 characters|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|

Example request body:
```
{
  "appstoreIp": "string",
  "appstoreName": "string",
  "appstorePort": "string",
  "producer": "string",
  "uri": "string",
  "userName": "string"
}
```

Example response:
```
200 OK
  [
    "response": {}
  ]
```

### 2.6 Deletes Application Record
Deletes application store record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores/{appstore_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token|access token|header|yes|
|appstore_ip|appstore IP|path|yes|Valid IP address and not exceed 15 characters|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
  {
    "response": {}
  }
```

## 3. MEC Host Inventory Handler

### 3.1 Get All MEC Host Records

Retrieves all MEC host records

```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts
Method: GET
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
[
  "response": {}
]
```

### 3.2 Add MEC Host Record
Adds new MEC host record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts
Method: POST
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|mecHostDto|mecHostDto|body|yes|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|
|appstoreIp|appstoreIp|body|yes|Valid IP address and not exceed 15 characters|
|appstoreName|appstoreName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|
|appstorePort|appstorePort|body|yes|Valid Port and not exceed 5 characters|
|producer|producer|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|
|uri|uri|body|yes|Valid UUID and not exceed 128 characters|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|    

Example request body:
```
{
  "appstoreIp": "string",
  "appstoreName": "string",
  "appstorePort": "string",
  "producer": "string",
  "uri": "string",
  "userName": "string"
}
```

Example response:
```
200 OK
  [
    "response": {}
  ]
```

### 3.3 Delete All MEC Host Records
Deletes all application stores records
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts
Method: DELETE
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|tenant_id |tenant identifier|path   |yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
  {
    "response": {}
  }
```
### 3.4 Get MEC Host Record

Retrieves MEC host records

```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|mechost_ip |mechost_ip|path |yes|Valid IP address and not exceed 15 characters|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|

```
200 OK
  {
    "address": "string",
    "affinity": "string",
    "applcmIp": "string",
    "city": "string",
    "edgeName": "string",
    "edgerepoIp": "string",
    "edgerepoPort": "string",
    "edgerepoUsername": "string",
    "mechostIp": "string",
    "mechostName": "string",
    "userName": "string",
    "zipCode": "string"
  }
```
### 3.5 Update MEC Host Record
Updates existing MEC host record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token|access token|header|yes|
|mecHostDto|mechost inventory information|body|yes|
|mechost_ip|mechost IP|path|yes|Valid IP address and not exceed 15 characters|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|
|address|address|body|yes|Valid IP address and not exceed 255 characters|
|affinity|affinity|body|yes|AlphaNumeric, special characters allowed are hypen,underscore and comma and not exceed 128 characters|
|applcmIp|applcmIp|body|yes|Valid IP address and not exceed 15 characters|
|city|city|body|yes|AlphaNumeric, special characters allowed are slash and space and not exceed 128 characters|
|edgeName|edgeName|body|yes|AlphaNumeric, special characters allowed are slash and space and not exceed 128 characters|
|edgerepoIp|edgerepoIp|body|yes|Valid IP address and not exceed 255 characters|
|edgerepoUsername|edgerepoUsername|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|
|mechostIp|mechostIp|body|yes|Valid IP address and not exceed 15 characters|
|mechostName|mechostName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore and not exceed 128 characters|
|zipCode|zipCode|body|yes|Alpha, special characters allowed are hypen and underscore and not exceed 128 characters|

Example request body:
```
{
  "address": "string",
  "affinity": "string",
  "applcmIp": "string",
  "city": "string",
  "edgeName": "string",
  "edgerepoIp": "string",
  "edgerepoPort": "string",
  "edgerepoUsername": "string",
  "mechostIp": "string",
  "mechostName": "string",
  "userName": "string",
  "zipCode": "string"
}
```

Example response:
```
200 OK
  [
    "response": {}
  ]
```
### 3.6 Delete MEC Host Record
Deletes application stores record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|mechost_ip |mechost IP|path |yes|Valid IP address and not exceed 15 characters|
|tenant_id |tenant identifier|path   |yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
  {
    "response": {}
  }
```

### 3.7 Upload K8s Configuration File
Upload K8s configuration file to applcm

```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/k8sconfig
Method: POST
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|file|file|formData|yes|
|mechost_ip|mechost IP|path|yes|Valid IP address and not exceed 15 characters|
|tenant_id|tenant identifier|path|yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
  [
    "response": {}
  ]
```

### 3.8 Delete K8s Configuration File
Deletes K8s configuration file from applcm
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/k8sconfig
Method: DELETE
```

|Name|Definition|type|Required|Allowed|
|---|---|---|---|---|
|access_token |access token|header |yes|
|mechost_ip |mechost IP|path |yes|Valid IP address and not exceed 15 characters|
|tenant_id |tenant identifier|path   |yes|Valid UUID and not exceed 64 characters|

Example response:
```
200 OK
  {
    "response": {}
  }
```
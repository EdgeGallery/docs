Applcm Interface
==============
The document is for the Applcm project, there is one part of interfaces in the project.

- [Applcm Interface](#applcm-interface)
  - [1. Applcm Controller](#1-applcm-controller)
    - [1.1 Upload Config File](#11-upload-config-file)
    - [1.2 Delete Config File](#12-delete-config-file)
    - [1.3 Instantiate Application](#13-instantiate-application)
    - [1.4 Terminates Application](#14-terminates-application)
    - [1.5 Query](#15-query)
    - [1.6 Query Kpi](#16-query-kpi)
    - [1.7 Query MepCapabilities](#17-query-mepcapabilities)

## 1. Applcm Controller

Operation for applcm system

### 1.1 Upload Config File

Upload Config File

```
Resource URI: /lcmcontroller/v1/configuration
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|hostIp|host_ip|string|yes|Valid IP Address|15|
|configFile|configFile|formData|yes|

Example response:
```
200 OK
[
  "response": {}
]
```

```
201 Created
[
  "response": {}
]
```

### 1.2 Delete Config File
Removes the config file
```
Resource URI: /lcmcontroller/v1/configuration
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt Token|
|hostIp|host_ip|string|yes|Valid IP Address|15|

Example response:
```
200 OK
```

### 1.3 Instantiate Application
Application instantiated
```
Resource URI: /lcmcontroller/v1/app_instance/:appInstanceId/instantiate
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|
|hostIp|host Ip|string|yes|Valid IP|15|
|file|file|formData|yes|

Example response:
```
200 OK
  {
    {}
  }
```

### 1.4 Terminates Application
Terminates application instance id
```
Resource URI: /lcmcontroller/v1/app_instances/:appInstanceId/terminate
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|

Example response:
```
200 OK
```

### 1.5 Query
Get the statistics information
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|app_package_id|app package id|path |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### 1.6 Query Kpi
Get cpu , memory and file system size
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/hosts/:hostIp/kpi
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|host_ip|host ip|path |yes|Valid IP Address|15|
|tenant_id |tenant id|path |yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### 1.7 Query MepCapabilities
Get Mep Capabilities
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/hosts/:hostIp/mep_capabilities
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|host_ip|host ip|path |yes|Valid IP Address|15|
|tenant_id |tenant id|path |yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```
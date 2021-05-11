Applcm Interface
==============
The document is for the Applcm project, there is one part of interfaces in the project.

### Upload Config File

Upload Config File

```
Resource URI: /lcmcontroller/v1/configuration
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|hostIp|host Ip|string|yes|Valid IP Address|15|
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

### Delete Config File
Removes the config file
```
Resource URI: /lcmcontroller/v1/configuration
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt Token|
|hostIp|host Ip|string|yes|Valid IP Address|15|

Example response:
```
200 OK
```

### Instantiate Application
Application instantiated
```
Resource URI: /lcmcontroller/v1/app_instance/{appInstanceId}/instantiate
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|hostIp|host Ip|string|yes|Valid IP|15|
|appName|appName|string|yes|AlphaNumeric|128|
|file|file|formData|yes|

Example response:
```
200 OK
  {
    {}
  }
```

### Terminates Application
Terminates application instance id
```
Resource URI: /lcmcontroller/v1/tenants/{tenantId}/app_instances/{appInstanceId}/terminate
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Query
Get the statistics information
```
Resource URI: /lcmcontroller/v1/tenants/{tenantId}/app_instances/{appInstanceId}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Query Kpi
Get cpu , memory and file system size
```
Resource URI: /lcmcontroller/v1/tenants/{tenantId}/hosts/{hostIp}/kpi
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|hostIp|host Ip|path |yes|Valid IP Address|15|
|tenantId |tenant Id|path |yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Query MepCapabilities
Get Mep Capabilities
```
Resource URI: /lcmcontroller/v1/tenants/{tenantId}/hosts/{hostIp}/mep_capabilities
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|hostIp|host Ip|path |yes|Valid IP Address|15|
|tenantId|tenant Id|path |yes|Valid UUID|64|

Example response:
```
200 OK
    [
     {
       "capabilityId": "string",
       "capabilityName": "string",
       "status": "string",
       "version": "string",
        "consumers": [
          {
            "applicationInstanceId": "string"
          },
          {
            "applicationInstanceId": "string"
          },
        ]
     },
     {
       "capabilityId": "string",
       "capabilityName": "string",
       "status": "string",
       "version": "string",
        "consumers": [
          {
            "applicationInstanceId": "string"
          }
        ]
     }
    ]
```

### Get Mep Capability
Retrieves edge host performance statistics based on capability id
```
Resource URI: /lcmcontroller/v1/tenants/{tenantId}/hosts/{hostIp}/mep_capabilities/{capability_id}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|capability_id|capability_id|path|yes|Alphanumeric characters,special characters are hypen and underscore|128|

Example response:
```
200 OK
  [
   {
     "capabilityId": "string",
     "capabilityName": "string",
     "status": "string",
     "version": "string",
      "consumers": [
        {
          "applicationInstanceId": "string"
        },
        {
          "applicationInstanceId": "string"
        },
      ]
   }
  ]
```

### Queries liveness & readiness
Retrieves data for liveness & readiness
```
Resource URI: /lcmcontroller/v1/health
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
```

### App Deployment Status
Retrieves status of the application deployment
```
Resource URI: /lcmcontroller/v1/hosts/{hostIp}/packages/{packageId}/status
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|packageId|package Id|path|yes|Valid UUID without hypen|64|

Example response:
```
200 OK
{
  true
}
```

### Query
GetWorkloadDescription
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId/workload/events
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Query AppInstance information
AppInstance information
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Query
Sync app instances records
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/sync_updated
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```
### Query
Sync app instances stale records
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/sync_deleted
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Upload package
Upload package
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/packages
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|packageId|package Id|header|yes|Valid UUID without hypen|64|
|appId|app Id|header|yes|Valid UUID without hypen|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|packages|package file|formData|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Delete package
Delete package
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/packages/:packageId
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|packageId|package Id|path|yes|Valid UUID without hypen|64|

Example response:
```
200 OK
```

### Delete application package on host
Delete application package on host
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/packages/:packageId/hosts/:hostIp
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|packageId|package Id|path|yes|Valid UUID without hypen|64|
|host_ip|host ip|path|yes|Valid IP|15|

Example response:
```
200 OK
```

### Distribute package
Distribute package
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/packages/:packageId
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|packageId|package Id|header|yes|Valid UUID without hypen|64|
|packages|package file|formData|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Query
Distribution status
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/packages/:packageId
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|packageId|package Id|header|yes|Valid UUID without hypen|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Distribution status
Distribution status
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/packages
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Sync app package records
Sync app package records
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/packages/sync_updated
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Sync app package stale records
Sync app package stale records
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/packages/sync_deleted
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Add MEC host
Add mec host information
```
Resource URI: /lcmcontroller/v1//hosts
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|mecHostInfo|MecHostInfo|body|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Update MEC host
Add mec host information
```
Resource URI: /lcmcontroller/v1//hosts
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|mecHostInfo|MecHostInfo|body|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Query MEC hosts
Query mec host information
```
Resource URI: /lcmcontroller/v1/hosts
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
  {
    {}    
  }
```

### Delete MEC host
Delete mec host information
```
Resource URI: /lcmcontroller/v1/hosts:hostIp
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt Token|
|host_ip|host ip|path|yes|Valid IP|15|

Example response:
```
200 OK
```

### Batch terminate application
Batch terminate application
```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/batchTerminate
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Sync mec host records
Sync mec host records
```
Resource URI: /lcmcontroller/v1/hosts/sync_updated
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
  {
    {}    
  }
```

### Sync mec host stale records
### Sync mec host stale recordsSync mec host stale records

```
Resource URI: /lcmcontroller/v1/hosts/sync_deleted
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
  {
    {}    
  }
```

### Create Image
### Create Image

```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId/images
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|vmId|vm Id|body|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Delete Image
### Delete Image

```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId/images/:imageId
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|imageId|image Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```

### Get Image
### Get Image

```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId/images/:imageId
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|imageId|image Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {}    
  }
```


### Get Image file
### Get Image file

```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId/images/:imageId/file
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|imageId|image Id|path|yes|Valid UUID|64|
|chunk_num|chunk num|header|yes|Valid int|64|

Example response:
```
200 OK
  {
    {}    
  }
```
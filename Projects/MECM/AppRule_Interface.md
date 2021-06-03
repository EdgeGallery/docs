Application rule manager Interface
==================================
The document is for the Application rule manager project, there is one part of interfaces in the project.

### Queries liveness & readiness
Retrieves data for liveness & readiness
```
Resource URI: /apprulemgr/v1/health
Method: GET
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
```

### Configures app rule
Application Rule Config create request

```
Resource URI: /apprulemgr/v1/tenants/:tenantId/app_instances/:appInstanceId/appd_configuration
Method: POST
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|


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

### Updates app rule configuration
Updates app rule configuration
```
Resource URI: /apprulemgr/v1/tenants/:tenantId/app_instances/:appInstanceId/appd_configuration
Method: PUT
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Deletes app rule configuration
Deletes app rule configuration
```
Resource URI: /apprulemgr/v1/tenants/:tenantId/app_instances/:appInstanceId/appd_configuration
Method: DELETE
```
|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Query
Returns app rule configuration
```
Resource URI: /apprulemgr/v1/tenants/:tenantId/app_instances/:appInstanceId/appd_configuration
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

### Synchronize added or update records
Synchronize added or update records
```
Resource URI: /apprulemgr/v1/tenants/:tenantId/app_instances/appd_configuration/sync_updated
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

### Synchronize deleted records
Synchronize deleted records
```
Resource URI: /apprulemgr/v1/tenants/:tenantId/app_instances/appd_configuration/sync_deleted
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
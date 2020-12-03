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
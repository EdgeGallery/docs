Applcm Interface
==============
The document is for the Applcm project, there is one part of interfaces in the project.

### Upload Config File

Upload Config File

```
Resource URI: /lcmcontroller/v2/configuration
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/configuration
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/app_instance/{appInstanceId}/instantiate
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|appInstanceId|appInstance Id|path|yes|Valid UUID|64|
|tenantId|tenant Id|path|yes|Valid UUID|64|
|hostIp|host Ip|string|yes|Valid IP|15|
|appName|appName|string|yes|AlphaNumeric|128|
|parameters|key value pair|map|no|valid string

Example request body:

```
{
    "hostIp": "119.8.47.5",
    "packageId": "ea3b8191f8a84565bd8eb5933c8bbcd560e4f65665a84cba851c93ece4fd825d",
    "appName": "testApplication",
    "parameters": {
    	"mepIp": "MEP IP",
    	"mepPort": "MEP port",
    	"ak": "access key",
    	"sk": "secure key",
    	"...": "..."
    }
}
```

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
Resource URI: /lcmcontroller/v2/tenants/{tenantId}/app_instances/{appInstanceId}/terminate
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/{tenantId}/app_instances/{appInstanceId}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/{tenantId}/hosts/{hostIp}/kpi
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/{tenantId}/hosts/{hostIp}/mep_capabilities
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/{tenantId}/hosts/{hostIp}/mep_capabilities/{capability_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
|Name|Definition|Type|Required|Allowed|Max Length|
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
|Name|Definition|Type|Required|Allowed|Max Length|
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

### Query workload
GetWorkloadDescription
```
Resource URI: /lcmcontroller/v2/tenants/:tenantId/app_instances/:appInstanceId/workload/events
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
|Name|Definition|Type|Required|Allowed|Max Length|
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

### Query app instances records
Sync app instances records
```
Resource URI: /lcmcontroller/v2/tenants/:tenantId/app_instances/sync_updated
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
### Query stale records
Sync app instances stale records
```
Resource URI: /lcmcontroller/v2/tenants/:tenantId/app_instances/sync_deleted
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/:tenantId/packages
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/:tenantId/packages/:packageId
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/:tenantId/packages/:packageId/hosts/:hostIp
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/:tenantId/packages/:packageId
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/:tenantId/packages/:packageId
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/:tenantId/packages/sync_updated
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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
Resource URI: /lcmcontroller/v2/tenants/:tenantId/packages/sync_deleted
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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

```
Resource URI: /lcmcontroller/v1//hosts
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|mecHostInfo|MecHostInfo|body|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Update MEC host

```
Resource URI: /lcmcontroller/v1//hosts
Method: PUT
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|
|mecHostInfo|MecHostInfo|body|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Query MEC hosts

```
Resource URI: /lcmcontroller/v1/hosts
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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

```
Resource URI: /lcmcontroller/v1/hosts:hostIp
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt Token|
|host_ip|host ip|path|yes|Valid IP|15|

Example response:
```
200 OK
```

### Batch terminate application


```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/batchTerminate
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt Token|
|tenantId|tenant Id|path|yes|Valid UUID|64|

Example response:
```
200 OK
```

### Sync mec host records

```
Resource URI: /lcmcontroller/v1/hosts/sync_updated
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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

```
Resource URI: /lcmcontroller/v1/hosts/sync_deleted
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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

```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId/images
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
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

```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId/images/:imageId
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
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

```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId/images/:imageId
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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

```
Resource URI: /lcmcontroller/v1/tenants/:tenantId/app_instances/:appInstanceId/images/:imageId/file
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
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

### Get Services

```
Resource URI: /lcmcontroller/v1/mep/subscribe_statistic
Method: GET
```

Example response:
```
200 OK
  [{
	"serInstanceId": "xxx",
	"serName": "xxx",
	"serCategory": {
		"href": "/example/catalogue1",
		"id": "id12345",
		"name": "RNI",
		"version": "1.2.3"
	},
	"version": "4.5.8",
	"state": "INACTIVE",
	"transportId": "Rest1",
	"transportInfo": {
		"id": "TransId12345",
		"name": "REST",
		"description": "REST API",
		"type": "REST_HTTP",
		"protocol": "HTTP",
		"version": "2.0",
		"endpoint": {
			"uris": null,
			"addresses": null,
			"alternative": null
		},
		"security": {
			"oAuth2Info": {
				"grantTypes": ["OAUTH2_CLIENT_CREDENTIALS"],
				"tokenEndpoint": "/mecSerMgmtApi/security/TokenEndPoint"
			}
		}
	},
	"serializer": "JSON",
	"scopeOfLocality": "MEC_SYSTEM",
	"isLocal": true,
	"livenessInterval": 60,
	"_links": {
		"self": {
			"liveness": "/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/31fe525ee3dbccbf25a234f8e81d696c/liveness"
		},
		"appInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f"
	}
}]
```

### Get Kong Logs

```
Resource URI: /lcmcontroller/v1/mep/kong_log
Method: GET
```


```
200 OK
{
	"appServices": [{
		"callTimes": [0, 0, 0, 0, 0, 0, 0],
		"desc": "",
		"name": "hehe5"
	}],
	"mepServices": [{
		"callTimes": [0, 0, 0, 3, 0, 0, 0],
		"desc": "",
		"name": "serviceRegister"
	}]
}
```

### Get Subscribe Statistic

```
Resource URI: /lcmcontroller/v1/mep/subscribe_statistic
Method: GET
```

```
200 OK
{
	"subscribeNum": {
		"appSubscribeNum": 0,
		"serviceSubscribedNum": 0
	},
	"subscribeRelations": []
}
```

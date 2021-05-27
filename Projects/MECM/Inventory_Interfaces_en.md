Inventory Interfaces
==============
The document is for the Inventory project, there are three parts of interfaces in the project.

### Get All Application Records 
Retrieves all application store records
```
Resource URI: /inventory/v1/appstores
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|

Example response:
```
200 OK
  {
    {
      "appstoreIp": "string",
      "appstoreName": "string",
      "appstorePort": "string",
      "producer": "string",
      "uri": "string",
      "userName": "string"
    }
  }
```

### Add Application Store Record
Adds new application store record
```
Resource URI: /inventory/v1/appstores
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appstoreIp|appstoreIp|body|yes|Valid IP Address|15|
|appstoreName|appstoreName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|appstorePort|appstorePort|body|yes|Valid Port|5|
|producer|producer|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|uri|uri|body|yes|Valid UUID|128|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

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
  {
    "Saved"
  }
]
```

### Delete All Application Records
Deletes all application stores records
```
Resource URI: /inventory/v1/appstores
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Get Application Stores Record
Retrieves application store record
```
Resource URI: /inventory/v1/appstores/{appstore_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access_token|header |yes|Jwt token|
|appstore_ip |appstore IP|path |yes|Valid IP Address|15|

Example response:
```
200 OK
  {
    "appstoreIp" : "string"   
    "appstorePort" : "string"   
    "uri" : "string"
    "userName" : "string"   
    "appstoreName" : "string" 
    "producer" : "string"
  }
```
### Add Application record
Adds a new application store record entry into the Inventory.
```
Resource URI: /inventory/v1/appstores
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appstoreIp|appstoreIp|body|yes|Valid IP Address|15|
|appstoreName|appstoreName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|appstorePort|appstorePort|body|yes|Valid Port|5|
|appstoreRepoName|appstoreRepoName|body|yes|Valid appstoreRepoName|128|
|appstoreRepo|appstoreRepo|body|yes|Valid appstoreRepo|128|
|appstoreRepoUserName|appstoreRepoUserName|body|yes|Valid appstoreRepoUserName|128|
|appstoreRepoPassword|appstoreRepoPassword|body|yes|Valid appstoreRepoPassword|15|
|producer|producer|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

Example request body:
```
  {
    "appstoreIp" : "string"   
    "appstorePort" : "string"
    "appstoreName" : "string"   
    "appstoreRepoName" : "string"
    "appstoreRepo" : "string"   
    "appstoreRepoUserName" : "string"
    "appstoreRepoPassword" : "string"
    "producer" : "string"
  }
```

Example response:
```
200 OK
[
  {
    "Saved"
  }
]
```
### Update Application record
Updates an exiting application store record in the Inventory matching the given tenant ID & application store IP
```
Resource URI: /inventory/v1/appstores/{appstore_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appstoreIp|appstoreIp|body|yes|Valid IP Address|15|
|appstoreName|appstoreName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|appstorePort|appstorePort|body|yes|Valid Port|5|
|appstoreRepoName|appstoreRepoName|body|yes|Valid appstoreRepoName|128|
|appstoreRepo|appstoreRepo|body|yes|Valid appstoreRepo|128|
|appstoreRepoUserName|appstoreRepoUserName|body|yes|Valid appstoreRepoUserName|128|
|appstoreRepoPassword|appstoreRepoPassword|body|yes|Valid appstoreRepoPassword|15|
|producer|producer|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

Example request body:
```
  {
    "appstoreIp" : "string"   
    "appstorePort" : "string"
    "appstoreName" : "string"   
    "appstoreRepoName" : "string"
    "appstoreRepo" : "string"   
    "appstoreRepoUserName" : "string"
    "appstoreRepoPassword" : "string"
    "producer" : "string"
  }
```

Example response:
```
200 OK
[
  {
    "Updated"
  }
]
```

### Get App Stores Record
Retrieves all application store record
```
Resource URI: /inventory/v1/appstores
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access_token|header |yes|Jwt token|

Example response:
```
200 OK
[
  {
    "appstoreIp" : "string"   
    "appstorePort" : "string"
    "appstoreName" : "string"   
    "appstoreRepoName" : "string"
    "appstoreRepo" : "string"   
    "appstoreRepoUserName" : "string"
    "appstoreRepoPassword" : "string"
    "producer" : "string"
  },
  {
    "appstoreIp" : "string"   
    "appstorePort" : "string"
    "appstoreName" : "string"   
    "appstoreRepoName" : "string"
    "appstoreRepo" : "string"   
    "appstoreRepoUserName" : "string"
    "appstoreRepoPassword" : "string"
    "producer" : "string"
  }  
]
```
### Delete App Stores Record
Deletes all application store records for a given tenant.
```
Resource URI: /inventory/v1/appstores/
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Get App Stores Record
Retrieves a specific application store record in the Inventory matching the given tenant ID & application store IP
```
Resource URI: /inventory/v1/appstores/{appstore_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access_token|header |yes|Jwt token|
|appstore_ip|appstore IP|path|yes|Valid IP Address|15|

Example response:
```
200 OK
  {
    "appstoreIp" : "string"   
    "appstorePort" : "string"
    "appstoreName" : "string"   
    "appstoreRepoName" : "string"
    "appstoreRepo" : "string"   
    "appstoreRepoUserName" : "string"
    "appstoreRepoPassword" : "string"
    "producer" : "string"
  }
```
### Delete App Stores Record
Deletes a specific application store record in the Inventory matching the given tenant ID & application store IP
```
Resource URI: /inventory/v1/appstores/{appstore_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|appstore_ip|appstore IP|path|yes|Valid IP Address|15|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Update App Store Record
Updates existing application store record
```
Resource URI: /inventory/v1/appstores/{appstore_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appstore_ip|appstore IP|path|yes|Valid IP Address|15|
|appstoreIp|appstoreIp|body|yes|Valid IP Address|15|
|appstoreName|appstoreName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|appstorePort|appstorePort|body|yes|Valid Port|5|
|producer|producer|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|uri|uri|body|yes|Valid UUID|128|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

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
  {
    "Updated"
  }
]
```

### Deletes Application Record
Deletes application store record
```
Resource URI: /inventory/v1/appstores/{appstore_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appstore_ip|appstore IP|path|yes|Valid IP address|15|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Get All MEC Host Records

Retrieves all MEC host records

```
Resource URI: /inventory/v1/mechosts
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
[
 {
       "mechostIp": "string",
       "mechostName": "string",
       "zipCode": "string",
       "city": "string",
       "address": "string",
       "affinity": "string",
       "userName": "string",
       "edgerepoName": null,
       "edgerepoIp": "string",
       "edgerepoPort": "string",
       "edgerepoUsername": "string",
       "applcmIp": "string",
       "hwcapabilities": [
           {
               "hwType": "string",
               "hwVendor": "string",
               "hwModel": "string"
           },
           {
               "hwType": "string",
               "hwVendor": "string",
               "hwModel": "string"
           }
       ]
   }
]
```

### Add MEC Host Record
Adds new MEC host record
```
Resource URI: /inventory/v1/mechosts
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|mechost_ip|mechost IP|path|yes|Valid IP address|15|
|address|address|body|yes|Valid IP address|255|
|affinity|affinity|body|yes|AlphaNumeric, special characters allowed are hypen,underscore and comma|128|
|applcmIp|applcmIp|body|yes|Valid IP address|15|
|city|city|body|yes|AlphaNumeric, special characters allowed are slash and space|128|
|edgeName|edgeName|body|yes|AlphaNumeric, special characters allowed are slash and space|128|
|edgerepoIp|edgerepoIp|body|yes|Valid IP address|255|
|edgerepoUsername|edgerepoUsername|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|mechostIp|mechostIp|body|yes|Valid IP address|15|
|mechostName|mechostName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|zipCode|zipCode|body|yes|Alpha, special characters allowed are hypen and underscore|128| 
|hwcapabilities|hardwareCapabilities|body|No|AlphaNumeric characters allowed|128|
|hwType|hardwareType|body|No|AlphaNumeric characters allowed|128|
|hwVendor|hardwareVendor|body|No|AlphaNumeric characters allowed|128|
|hwModel|hardwareModel|body|No|AlphaNumeric characters allowed|128|

Example request body:
```
[
  {
      "mechostIp": "string",
      "mechostName": "string",
      "zipCode": "string",
      "city": "string",
      "address": "string",
      "affinity": "string",
      "userName": "string",
      "edgerepoName": null,
      "edgerepoIp": "string",
      "edgerepoPort": "string",
      "edgerepoUsername": "string",
      "applcmIp": "string",
      "hwcapabilities": [
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          },
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          }
      ]
  }
]
```

Example response:
```
200 OK
[
  {
    "Saved"
  }
]
```

### Delete All MEC Host Records
Deletes all application stores records
```
Resource URI: /inventory/v1/mechosts
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```
### Get MEC Host Record

Retrieves MEC host records

```
Resource URI: /inventory/v1/mechosts/{mechost_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost_ip|path |yes|Valid IP address|15|

```
200 OK
{
      "mechostIp": "string",
      "mechostName": "string",
      "zipCode": "string",
      "city": "string",
      "address": "string",
      "affinity": "string",
      "userName": "string",
      "edgerepoName": null,
      "edgerepoIp": "string",
      "edgerepoPort": "string",
      "edgerepoUsername": "string",
      "applcmIp": "string",
      "hwcapabilities": [
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          },
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          }
      ]
  }
```
### Update MEC Host Record
Updates existing MEC host record
```
Resource URI: /inventory/v1/mechosts/{mechost_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|mechost_ip|mechost IP|path|yes|Valid IP address|15|
|address|address|body|yes|Valid IP address|255|
|affinity|affinity|body|yes|AlphaNumeric, special characters allowed are hypen,underscore and comma|128|
|applcmIp|applcmIp|body|yes|Valid IP address|15|
|city|city|body|yes|AlphaNumeric, special characters allowed are slash and space|128|
|edgeName|edgeName|body|yes|AlphaNumeric, special characters allowed are slash and space|128|
|edgerepoIp|edgerepoIp|body|yes|Valid IP address|255|
|edgerepoUsername|edgerepoUsername|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|mechostIp|mechostIp|body|yes|Valid IP address|15|
|mechostName|mechostName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|zipCode|zipCode|body|yes|Alpha, special characters allowed are hypen and underscore|128|
|hwcapabilities|hardwareCapabilities|body|No|AlphaNumeric characters allowed|128|
|hwType|hardwareType|body|No|AlphaNumeric characters allowed|128|
|hwVendor|hardwareVendor|body|No|AlphaNumeric characters allowed|128|
|hwModel|hardwareModel|body|No|AlphaNumeric characters allowed|128|

Example request body:
```
{
      "mechostIp": "string",
      "mechostName": "string",
      "zipCode": "string",
      "city": "string",
      "address": "string",
      "affinity": "string",
      "userName": "string",
      "edgerepoName": null,
      "edgerepoIp": "string",
      "edgerepoPort": "string",
      "edgerepoUsername": "string",
      "applcmIp": "string",
      "hwcapabilities": [
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          },
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          }
      ]
  }
```

Example response:
```
200 OK
[
  {
    "Updated"
  }
]
```
### Delete MEC Host Record
Deletes application stores record
```
Resource URI: /inventory/v1/mechosts/{mechost_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost IP|path |yes|Valid IP Address|15|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Add Application record
Adds new application record. 
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/apps
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appInstanceId |appInstance id|body |yes|Valid UUID|64|
|mechost_ip |mechost ip|path|yes|Valid IP Address|15|
|appName |appName|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|
|capabilities |capabilities|body|yes|capabilities |10|
|packageId |packageId|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|64|
|status |status|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "appInstanceId": "string",
  "appName": "string",
  "capabilities": [
    "string"
  ],
  "packageId": "string",
  "status": "string"
}
```

Example response:
```
200 OK
[
  {
    "Saved"
  }
]
```

### Update Application record
Updates Application record. 
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/apps/{app_id}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|appInstanceId |appInstance id|body |yes|Valid UUID|64|
|tenant_id |tenant identifier|path|yes|Valid UUID|64|
|mechost_ip |mechost ip|path|yes|Valid IP Address|15|
|appName |appName|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|
|capabilities |capabilities|body|yes|capabilities |10|
|packageId |packageId|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|64|
|status |status|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "appInstanceId": "string",
  "appName": "string",
  "capabilities": [
    "string"
  ],
  "packageId": "string",
  "status": "string"
}
```

Example response:
```
200 OK
[
  {
    "Updated"
  }
]
```

### Delete Application record
Delete application record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/apps/{app_id}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost_ip|path |yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|app_id|application id|path|yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Retrieves MEC host record
Retrieves MEC host record for specific capabilities
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/capabilities
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost_ip|path |yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|capabilities |capabilities|path|yes|capabilities |10|

Example response:
```
200 OK
{
      "hwcapabilities": [
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          },
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          }
      ]
  }
```

### Retrieves MEC application record
Retrieves applications matching capability in a specific MEC host record.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/capabilities/{capability_type}/applications
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost_ip|path |yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|capabilities |capabilities|path|yes|capabilities |10|
|capabilityType |capability type|path|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|

Example response:
```
200 OK
{
      "apps": [
          {
              "appInstanceId": "string",
              "appName": "string",
              "packageId": "string"
              "capabilities": [
                  "string"
              ],
              "status": "Created"
      ]
  }
```

### Upload K8s Configuration File
Upload K8s configuration file to applcm

```
Resource URI: /inventory/v1/mechosts/{mechost_ip}/k8sconfig
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|file|file|formData|yes|
|mechost_ip|mechost IP|path|yes|Valid IP Address|15|

Example response:
```
200 OK
  [
    "response": {}
  ]
```

### Delete K8s Configuration File
Deletes K8s configuration file from applcm
```
Resource URI: /inventory/v1/mechosts/{mechost_ip}/k8sconfig
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost IP|path |yes|Valid IP Address|15|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Queries liveness & readiness
Retrieves data for liveness & readiness
```
Resource URI: /inventory/v1/health
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
```

### Add APPDRule record to Inventory.
Adds a new APPDRule record entry into the Inventory.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/app_instances/{app_instance_id}/appd_configuration
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|


Example request body:
```
{
  "appTrafficRule": [
    {
      "trafficRuleId": "string",
      "filterType": "string",
      "priority": int,
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "srcPort": [
            "string"
          ],
          "dstPort": [
            "string"
          ],
          "protocol": [
            "string"
          ],
          "qCI": int,
          "dSCP": int,
          "tC": int
        }
      ],
      "action": "string",
      "state": "string"
    }
  ],
  "appDNSRule": [
    {
      "dnsRuleId": "string",
      "domainName": "string",
      "ipAddressType": "string",
      "ipAddress": "string",
      "ttl": int,
      "state": "string"
    }
  ],
  "appSupportMp1": true,
  "appName": "abcd"
}
```

Example response:
```
200 OK
{
    "Saved"
}
```

### Update APPDRule record to Inventory.
Updates a existing APPDRule record entry into the Inventory matching the given tenant ID & app instance ID.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/app_instances/{app_instance_id}/appd_configuration
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|


Example request body:
```
{
  "appTrafficRule": [
    {
      "trafficRuleId": "string",
      "filterType": "string",
      "priority": int,
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "srcPort": [
            "string"
          ],
          "dstPort": [
            "string"
          ],
          "protocol": [
            "string"
          ],
          "qCI": int,
          "dSCP": int,
          "tC": int
        }
      ],
      "action": "string",
      "state": "string"
    }
  ],
  "appDNSRule": [
    {
      "dnsRuleId": "string",
      "domainName": "string",
      "ipAddressType": "string",
      "ipAddress": "string",
      "ttl": int,
      "state": "string"
    }
  ],
  "appSupportMp1": true,
  "appName": "abcd"
}
```

Example response:
```
200 OK
{
    "Updated"
}
```

### Get APPDRule record to Inventory.
Retrieves appDRule records for given tenant ID and app instance ID.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/app_instances/{app_instance_id}/appd_configuration
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|


Example response body:
```
200 OK
{
  "appTrafficRule": [
    {
      "trafficRuleId": "string",
      "filterType": "string",
      "priority": int,
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "srcPort": [
            "string"
          ],
          "dstPort": [
            "string"
          ],
          "protocol": [
            "string"
          ],
          "qCI": int,
          "dSCP": int,
          "tC": int
        }
      ],
      "action": "string",
      "state": "string"
    }
  ],
  "appDNSRule": [
    {
      "dnsRuleId": "string",
      "domainName": "string",
      "ipAddressType": "string",
      "ipAddress": "string",
      "ttl": int,
      "state": "string"
    }
  ],
  "appSupportMp1": true,
  "appName": "abcd"
}
```

### Delete APPDRule record .
Deletes appDRule records for a given tenant and app instance.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/app_instances/{app_instance_id}/appd_configuration
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|


Example response body:
```
200 OK
{
"DELETED"
}
```

### Synchronizes mec host info from edge
Synchronizes mec host info from edge.
```
Resource URI: /mepms/{mepm_ip}/mechost/sync
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mepm_ip|mepm_ip|path|yes|Valid IP Address|15|


Example response body:
```
200 OK
{
    "mecHostUpdatedRecs": [
        {
            "mechostIp": "127.0.0.2",
            "mechostName": "edgegallery3",
            "zipCode": "560038",
            "city": "bangalore",
            "address": "anadapura",
            "affinity": "karanataka",
            "userName": "ramasubbareddy",
            "configUploadStatus": "false",
            "coordinates": "1,2",
            "vim": "openstack",
            "origin": "MEPM",
            "hwcapabilities": [
                {
                    "hwType": "type6",
                    "hwVendor": "vendor1",
                    "hwModel": "model"
                }
            ]
        }
    ]
}
```


### Synchronizes mec host info from edge
Synchronizes mec host info from edge.
```
Resource URI: /tenants/{tenant_id}/mepms/{mepm_ip}/apprule/sync
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|mepm_ip|mepm_ip|path|yes|Valid IP Address|15|

Example response body:
```
200 OK
{
    "appdRuleUpdatedRecs": [
        {
            "appdRuleId": "e921ce54-82c8-4532-b5c6-8516cf75f7a771ea862b-5806-4196-bce3-434bf9c95b18",
            "tenantId": "e921ce54-82c8-4532-b5c6-8516cf75f7a7",
            "appInstanceId": "71ea862b-5806-4196-bce3-434bf9c95b18",
            "appName": "abcd",
            "appSupportMp1": true,
            "appTrafficRule": [
                {
                    "trafficRuleId": "TrafficRule1",
                    "filterType": "FLOW",
                    "priority": 1,
                    "action": "DROP",
                    "trafficFilter": [
                        {
                            "trafficFilterId": "7e302be6-253b-4d09-8d1d-ef6630db7b88",
                            "srcAddress": [
                                "192.168.1.1/28",
                                "192.168.1.2/28"
                            ],
                            "srcPort": null,
                            "dstAddress": [
                                "192.168.1.1/28"
                            ],
                            "dstPort": [
                                "6666666666"
                            ],
                            "protocol": [
                                "TCP"
                            ],
                            "qCI": 1,
                            "dSCP": 0,
                            "tC": 1,
                            "tag": [
                                "1"
                            ],
                            "srcTunnelAddress": [
                                "1.1.1.1/24"
                            ],
                            "dstTunnelAddress": null,
                            "srcTunnelPort": [
                                "65536"
                            ],
                            "dstTunnelPort": [
                                "65537"
                            ]
                        }
                    ],
                    "dstInterface": [
                        {
                            "dstInterfaceId": "cf053d4c-250b-450f-a657-a30328a3b27a",
                            "interfaceType": "",
                            "srcMacAddress": "",
                            "dstMacAddress": "",
                            "dstIpAddress": "",
                            "TunnelInfo": {
                                "tunnelInfoId": "be36d5e2-41db-4270-b6cf-ba9e7b7a89aa",
                                "tunnelType": "",
                                "tunnelDstAddress": "",
                                "tunnelSrcAddress": "",
                                "tunnelSpecificData": ""
                            }
                        }
                    ]
                }
            ],
            "appDnsRule": [
                {
                    "dnsRuleId": "dnsRule4",
                    "domainName": "www.example.com",
                    "ipAddressType": "IP_V4",
                    "ipAddress": "192.0.2.0",
                    "ttl": 30
                }
            ],
            "Origin": "MEPM"
        }
    ]
}
```
### Get MEPM Record

Retrieves all MEPM records

```
Resource URI: /inventory/v1/mepms
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

```
200 OK
[
 {
      "mepmIp": "string",
      "mepmName": "string",
      "mepmPort": "string",
      "userName": "string"
   }
  ]
```
### Add MEPM Record
Adds new MEPM record
```
Resource URI: /inventory/v1/mepms
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|mepmIp|mepm Ip|body|yes|Valid IP address|15|
|mepmName|mepm Name|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|mepmPort|mepm Port|body|yes|Vaild Port|5|
|userName|user Name|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

Example request body:
```
[
  {
      "mepmIp": "string",
      "mepmName": "string",
      "mepmPort": "string",
      "userName": "string"
  }
]
```

Example response:
```
200 OK
[
  {
    "Saved"
  }
]
```

### Delete All MEPM Records
Deletes all mepm records
```
Resource URI: /inventory/v1/mepms
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Get MEPM Record

Retrieves mepm records

```
Resource URI: /inventory/v1/mepms/{mepm_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mepm_ip |mepm IP|path |yes|Valid IP address|15|

```
200 OK
{
      "mepmIp": "string",
      "mepmName": "string",
      "mepmPort": "string",
      "userName": "string"
  }
```
### Update MEPM Record
Updates existing mepm record
```
Resource URI: /inventory/v1/mepms/{mepm_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|mepm_ip|mepm IP|path|yes|Valid IP address|15|
|mepmIp|mepm Ip|body|yes|Vaild IP address|15|
|mepmName|mepm Name|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|mepmPort|mepm Port|body|yes|Vaild Port|5|
|userName|user Name|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

Example request body:
```
{
        "mepmIp": "string",
        "mepmName": "string",
        "mepmPort": "string",
        "userName": "string"
  }
```

Example response:
```
200 OK
[
  {
    "Updated"
  }
]
```
### Delete MEPM Record
Deletes mepm record
```
Resource URI: /inventory/v1/mepms/{mepm_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mepm_ip |mepm IP|path |yes|Valid IP Address|15|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Inventory Open Api Swagger

* Please refer [INVENTORY_OPEN_API](https://gitee.com/edgegallery/docs/blob/master/Projects/MECM/MECM_APIs/inventory-swagger-openapi.yaml)

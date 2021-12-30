Rescontroller Interface
==============
The document is for the Rescontroller project, there is one part of interfaces in the project.


### Create server on mechost

Create servers on mechost
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/servers
Method: Post
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example request:
```
{
    "server" : {
        "name": "vmTest",
        "flavor": "0e12087a-7c87-476a-8f84-7398e991cecc",
        "image" : "cec3aab9-5991-4893-befe-4775ddf79de6",
        "imageRef" : "70a599e0-31e7-49b7-b260-868f441e862b",
        "availabilityZone": "us-west",
        "user_data" : "IyEvYmluL2Jhc2gKL2Jpbi9zdQplY2hvICJJIGFtIGluIHlvdSEiCg==",
        "configDrive": "true",
        "securityGroups": [
            {
                "name": "default"
            }
        ],
		"netWork": [
            {
                "network": "0884b5fb-ea5c-4951-9c54-256f4fc38991",
				"fixedIp": "192.168.xx.19"
            },
			{
                "network": "241aee72-de67-4c95-bdaa-e63f12fbd183",
				"fixedIp": "192.168.xx.19"
            },
			{
                "network": "446aa035-f737-45db-9834-83c7a5f94046",
				"fixedIp": "192.168.xxx.19"
            }
        ]
    }
}
```

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "Create server success",
    "params": null
}
```


### Query serverson mechost

Query servers on mechost

```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/servers
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": {
	"servers": [
        {
            "OS-DCF:diskConfig": "AUTO",
            "OS-EXT-AZ:availability_zone": "nova",
            "OS-EXT-SRV-ATTR:host": "compute",
            "OS-EXT-SRV-ATTR:hostname": "new-server-test",
            "OS-EXT-SRV-ATTR:hypervisor_hostname": "fake-mini",
            "OS-EXT-SRV-ATTR:instance_name": "instance-00000001",
            "OS-EXT-SRV-ATTR:kernel_id": "",
            "OS-EXT-SRV-ATTR:launch_index": 0,
            "OS-EXT-SRV-ATTR:ramdisk_id": "",
            "OS-EXT-SRV-ATTR:reservation_id": "r-l0i0clt2",
            "OS-EXT-SRV-ATTR:root_device_name": "/dev/sda",
            "OS-EXT-SRV-ATTR:user_data": "IyEvYmluL2Jhc2gKL2Jpbi9zdQplY2hvICJJIGFtIGluIHlvdSEiCg==",
            "OS-EXT-STS:power_state": 1,
            "OS-EXT-STS:task_state": null,
            "OS-EXT-STS:vm_state": "active",
            "OS-SRV-USG:launched_at": "2019-04-23T15:19:15.317839",
            "OS-SRV-USG:terminated_at": null,
            "accessIPv4": "1.2.3.4",
            "accessIPv6": "80fe::",
            "addresses": {
                "private": [
                    {
                        "OS-EXT-IPS-MAC:mac_addr": "00:0c:29:0d:11:74",
                        "OS-EXT-IPS:type": "fixed",
                        "addr": "192.168.1.30",
                        "version": 4
                    }
                ]
            },
            "config_drive": "",
            "created": "2019-04-23T15:19:14Z",
            "description": null,
            "flavor": {
                "disk": 1,
                "ephemeral": 0,
                "extra_specs": {},
                "original_name": "m1.tiny",
                "ram": 512,
                "swap": 0,
                "vcpus": 1
            },
            "hostId": "2091634baaccdc4c5a1d57069c833e402921df696b7f970791b12ec6",
            "host_status": "UP",
            "id": "2ce4c5b3-2866-4972-93ce-77a2ea46a7f9",
            "image": {
                "id": "70a599e0-31e7-49b7-b260-868f441e862b",
            },
            "key_name": null,
            
            "locked": true,
            "locked_reason": "I don't want to work",
            "metadata": {
                "My Server Name": "Apache1"
            },
            "name": "new-server-test",
            "os-extended-volumes:volumes_attached": [],
            "progress": 0,
            "security_groups": [
                {
                    "name": "default"
                }
            ],
            "status": "ACTIVE",
            "tags": [],
            "tenant_id": "6f70656e737461636b20342065766572",
            "trusted_image_certificates": null,
            "updated": "2019-04-23T15:19:15Z",
            "user_id": "admin"
        }
    ]},
    "retCode": 0,
    "message": "Query servers success",
    "params": null
}
```
### Query vm on mechost by vmId

Query vm on mechost by vmId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/servers/:serverId
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": {"server": {
        "OS-DCF:diskConfig": "AUTO",
        "OS-EXT-AZ:availability_zone": "nova",
        "OS-EXT-SRV-ATTR:host": "compute",
        "OS-EXT-SRV-ATTR:hostname": "new-server-test",
        "OS-EXT-SRV-ATTR:hypervisor_hostname": "fake-mini",
        "OS-EXT-SRV-ATTR:instance_name": "instance-00000001",
        "OS-EXT-SRV-ATTR:kernel_id": "",
        "OS-EXT-SRV-ATTR:launch_index": 0,
        "OS-EXT-SRV-ATTR:ramdisk_id": "",
        "OS-EXT-SRV-ATTR:reservation_id": "r-t61j9da6",
        "OS-EXT-SRV-ATTR:root_device_name": "/dev/sda",
        "OS-EXT-SRV-ATTR:user_data": "IyEvYmluL2Jhc2gKL2Jpbi9zdQplY2hvICJJIGFtIGluIHlvdSEiCg==",
        "OS-EXT-STS:power_state": 1,
        "OS-EXT-STS:task_state": null,
        "OS-EXT-STS:vm_state": "active",
        "OS-SRV-USG:launched_at": "2019-04-23T15:19:10.855016",
        "OS-SRV-USG:terminated_at": null,
        "accessIPv4": "1.2.3.4",
        "accessIPv6": "80fe::",
        "addresses": {
            "private": [
                {
                    "OS-EXT-IPS-MAC:mac_addr": "00:0c:29:0d:11:74",
                    "OS-EXT-IPS:type": "fixed",
                    "addr": "192.168.1.30",
                    "version": 4
                }
            ]
        },
        "config_drive": "",
        "created": "2019-04-23T15:19:09Z",
        "description": null,
        "flavor": {
            "disk": 1,
            "ephemeral": 0,
            "extra_specs": {},
            "original_name": "m1.tiny",
            "ram": 512,
            "swap": 0,
            "vcpus": 1
        },
        "hostId": "2091634baaccdc4c5a1d57069c833e402921df696b7f970791b12ec6",
        "host_status": "UP",
        "id": "0e12087a-7c87-476a-8f84-7398e991cecc",
        "image": {
            "id": "70a599e0-31e7-49b7-b260-868f441e862b",
        },
        "key_name": null,
        
        "locked": true,
        "locked_reason": "I don't want to work",
        "metadata": {
            "My Server Name": "Apache1"
        },
        "name": "new-server-test",
        "os-extended-volumes:volumes_attached": [],
        "progress": 0,
        "security_groups": [
            {
                "name": "default"
            }
        ],
        "server_groups": [],
        "status": "ACTIVE",
        "tags": [],
        "tenant_id": "6f70656e737461636b20342065766572",
        "trusted_image_certificates": null,
        "updated": "2019-04-23T15:19:11Z",
        "user_id": "admin"
    }},
    "retCode": 0,
    "message": "Query servers success",
    "params": null
}
```

### Operate vm server

Operate vm server
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/servers/:serverId
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example request:
```
{
    "action" : "" ### reboot/createImage/pause(数据保留到内存)/unpause(after pause)/suspend(数据保留到磁盘)/resume(after suspend)/stop(关机)/start(after stop)/createConsole
    ### if action reboot, need add params like "HARD" or "SOFT" , if action createImage need add params name and metadata
	"reboot" : " " 
	"createImage : { 
	    "name": "vmsnap",
		"metadata": { }
	} 
}
```

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "Operate servers success",
    "params": null
}
```

### Delete servers on mechost by serverId

Delete servers on mechost by serverId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/servers/:serverId
Method: Delete
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete servers success",
    "params": null
}
```


### Create flavor on mechost.

Create flavor on mechost by flavorId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/flavors
Method: Post
```

|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example request:
```
{
        "name": "test_flavor",
	"vcpus": 2,
        "ram": 1024,
        "disk": 10,
        "swap": "10",
        "extraSpecs": {
		    "EG": "true"
		}
}
```

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "create flavor success",
    "params": null
}
```

### Query flavors on mechost

Query flavors on mechost

```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/flavors
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "flavors": [
        {
            "name": "test_flavor",
		    "vcpus": 2,
            "ram": 1024,
            "disk": 10,
            "swap": "10",
            "extraSpecs": {
		        "EG": "true"
		    }
    }]
}
```
### Query flavor on mechost by flavorId

Query flavor on mechost by flavorId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/flavors/:flavorId
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": {
		"name": "test_flavor",
		"vcpus": 2,
        "ram": 1024,
        "disk": 10,
        "swap": "10",
        "extraSpecs": {
		    "EG": "true"
		}},
    "retCode": 0,
    "message": "Query flavor success",
    "params": null
}
```

### Delete flavor on mechost by flavorId

Delete vm on mechost by flavorId

```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/flavors/:flavorId
Method: Delete
```

|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete flavor success",
    "params": null
}
```

### Query images on mechost

Query images on mechost

```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/images
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "images": [
        {
            "status": "active",
            "name": "cirros-0.3.2-x86_64-disk",
            "tags": [],
            "container_format": "bare",
            "created_at": "2014-11-07T17:07:06Z",
            "disk_format": "qcow2",
            "updated_at": "2014-11-07T17:19:09Z",
            "visibility": "public",
            "self": "/v2/images/1bea47ed-f6a9-463b-b423-14b9cca9ad27",
            "min_disk": 0,
            "protected": false,
            "id": "1bea47ed-f6a9-463b-b423-14b9cca9ad27",
            "file": "/v2/images/1bea47ed-f6a9-463b-b423-14b9cca9ad27/file",
            "checksum": "64d7c1cd2b6f60c92c14662941cb7913",
            "os_hash_algo": "sha512",
            "os_hash_value": "073b4523583784fbe01daff81eba092a262ec37ba6d04dd3f52e4cd5c93eb8258af44881345ecda0e49f3d8cc6d2df6b050ff3e72681d723234aff9d17d0cf09",
            "os_hidden": false,
            "owner": "5ef70662f8b34079a6eddb8da9d75fe8",
            "size": 13167616,
            "min_ram": 0,
            "schema": "/v2/schemas/image",
            "virtual_size": null
        },
        {
            "status": "active",
            "name": "F17-x86_64-cfntools",
            "tags": [],
            "container_format": "bare",
            "created_at": "2014-10-30T08:23:39Z",
            "disk_format": "qcow2",
            "updated_at": "2014-11-03T16:40:10Z",
            "visibility": "public",
            "self": "/v2/images/781b3762-9469-4cec-b58d-3349e5de4e9c",
            "min_disk": 0,
            "protected": false,
            "id": "781b3762-9469-4cec-b58d-3349e5de4e9c",
            "file": "/v2/images/781b3762-9469-4cec-b58d-3349e5de4e9c/file",
            "checksum": "afab0f79bac770d61d24b4d0560b5f70",
            "os_hash_algo": "sha512",
            "os_hash_value": "ea3e20140df1cc65f53d4c5b9ee3b38d0d6868f61bbe2230417b0f98cef0e0c7c37f0ebc5c6456fa47f013de48b452617d56c15fdba25e100379bd0e81ee15ec",
            "os_hidden": false,
            "owner": "5ef70662f8b34079a6eddb8da9d75fe8",
            "size": 476704768,
            "min_ram": 0,
            "schema": "/v2/schemas/image",
            "virtual_size": null
        }
    ],
    "schema": "/v2/schemas/images",
    "first": "/v2/images"
}
```
### Query image on mechost by imageId

Query image on mechost by imageId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/images/imageId
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "status": "active",
    "name": "cirros-0.3.2-x86_64-disk",
    "tags": [],
    "container_format": "bare",
    "created_at": "2014-05-05T17:15:10Z",
    "disk_format": "qcow2",
    "updated_at": "2014-05-05T17:15:11Z",
    "visibility": "public",
    "self": "/v2/images/1bea47ed-f6a9-463b-b423-14b9cca9ad27",
    "min_disk": 0,
    "protected": false,
    "id": "1bea47ed-f6a9-463b-b423-14b9cca9ad27",
    "file": "/v2/images/1bea47ed-f6a9-463b-b423-14b9cca9ad27/file",
    "checksum": "64d7c1cd2b6f60c92c14662941cb7913",
    "os_hash_algo": "sha512",
    "os_hash_value": "073b4523583784fbe01daff81eba092a262ec37ba6d04dd3f52e4cd5c93eb8258af44881345ecda0e49f3d8cc6d2df6b050ff3e72681d723234aff9d17d0cf09",
    "os_hidden": false,
    "owner": "5ef70662f8b34079a6eddb8da9d75fe8",
    "size": 13167616,
    "min_ram": 0,
    "schema": "/v2/schemas/image",
    "virtual_size": null
}
```

### Delete image on mechost by imageId

Delete vm on mechost by imageId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/images/imageId
Method: Delete
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete image success",
    "params": null
}
```

### Create image on mechost

Create vm on mechost by imageId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/images
Method: Post
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example request:
```
{
    name: "",
    containerFormat: "",
    diskFormat: "",
    minRam: 1,
    minDisk: 10,
    properties: { }
}
```

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "Create image success",
    "params": null
}
```

### Import image on mechost

import image on mechost by imageId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/images/:imageId
Method: Post
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example request:
```
{
    resourceUri: "",       
}
```

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "Create image success",
    "params": null
}
```

### Add networks on mechost

Add network on mechost

```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/networks
Method: Post
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example request:
```
{
    "name": "sample_network",
    "adminStateUp": true,
    "dnsDomain": "my-domain.org.",
    "mtu": 1400,
    "portSecurityEnabled": true,
    "providerNetworkType": 
    "providerPhysicalNetwork": 
    "providerSegmentationId":
    "qosPolicyId": ""
    "routerExternal": true
    "segments" :[
        {
            "providerSegmentationId": 1,
            "providerPhysicalNetwork": "",
            "providerNetworkType": ""
        }
        ],
        "shared": true,
        "vlanTransparent": true,
        "isDefault": true,
        "subnets": [{
            "name": "subnetA",
            "enableDhcp": true,
            "dnsNameservers": [
              "",""
            ],
            "allocationPools": [
                {
                    "start": "192.168.xxx.5",
                    "end": "192.168.xxx.25"
                }
            ],
            "ipVersion": 
            "gatewayIp": "192.168.xxx.1",
            "cidr": "10.0.0.0/24",
            "ipv6AddressMode": ,
            "ipv6RaMode": 
        }
        ]
        
}
```

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "Create networks success",
    "params": null
}
```


### Query networks on mechost

Query networks on mechost

```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/networks
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": {"networks": [
        {
            "admin_state_up": true,
            "availability_zone_hints": [],
            "availability_zones": [
                "nova"
            ],
            "created_at": "2016-03-08T20:19:41",
            "dns_domain": "my-domain.org.",
            "id": "d32019d3-bc6e-4319-9c1d-6722fc136a22",
            "ipv4_address_scope": null,
            "ipv6_address_scope": null,
            "l2_adjacency": false,
            "mtu": 1500,
            "name": "net1",
            "port_security_enabled": true,
            "project_id": "4fd44f30292945e481c7b8a0c8908869",
            "qos_policy_id": "6a8454ade84346f59e8d40665f878b2e",
            "revision_number": 1,
            "router:external": false,
            "shared": false,
            "status": "ACTIVE",
            "subnets": [
                "54d6f61d-db07-451c-9ab3-b9609b6b6f0b"
            ],
            "tenant_id": "4fd44f30292945e481c7b8a0c8908869",
            "updated_at": "2016-03-08T20:19:41",
            "vlan_transparent": true,
            "description": "",
            "is_default": false
        },
        {
            "admin_state_up": true,
            "availability_zone_hints": [],
            "availability_zones": [
                "nova"
            ],
            "created_at": "2016-03-08T20:19:41",
            "dns_domain": "my-domain.org.",
            "id": "db193ab3-96e3-4cb3-8fc5-05f4296d0324",
            "ipv4_address_scope": null,
            "ipv6_address_scope": null,
            "l2_adjacency": false,
            "mtu": 1500,
            "name": "net2",
            "port_security_enabled": true,
            "project_id": "26a7980765d0414dbc1fc1f88cdb7e6e",
            "qos_policy_id": "bfdb6c39f71e4d44b1dfbda245c50819",
            "revision_number": 3,
            "router:external": false,
            "shared": false,
            "status": "ACTIVE",
            "subnets": [
                "08eae331-0402-425a-923c-34f7cfe39c1b"
            ],
            "tenant_id": "26a7980765d0414dbc1fc1f88cdb7e6e",
            "updated_at": "2016-03-08T20:19:41",
            "vlan_transparent": false,
            "description": "",
            "is_default": false
        }
    ]},
    "retCode": 0,
    "message": "Query networks success",
    "params": null
}
```
### Query network on mechost by networkId

Query network on mechost by networkId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/networks/:networkId
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": {
            "admin_state_up": true,
            "availability_zone_hints": [],
            "availability_zones": [
                "nova"
            ],
            "created_at": "2016-03-08T20:19:41",
            "dns_domain": "my-domain.org.",
            "id": "db193ab3-96e3-4cb3-8fc5-05f4296d0324",
            "ipv4_address_scope": null,
            "ipv6_address_scope": null,
            "l2_adjacency": false,
            "mtu": 1500,
            "name": "net2",
            "port_security_enabled": true,
            "project_id": "26a7980765d0414dbc1fc1f88cdb7e6e",
            "qos_policy_id": "bfdb6c39f71e4d44b1dfbda245c50819",
            "revision_number": 3,
            "router:external": false,
            "shared": false,
            "status": "ACTIVE",
            "subnets": [
                "08eae331-0402-425a-923c-34f7cfe39c1b"
            ],
            "tenant_id": "26a7980765d0414dbc1fc1f88cdb7e6e",
            "updated_at": "2016-03-08T20:19:41",
            "vlan_transparent": false,
            "description": "",
            "is_default": false},
    "retCode": 0,
    "message": "Query network success",
    "params": null
}
```

### Delete network on mechost by networkId

Delete network on mechost by networkId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/networks/networkId
Method: Delete
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete networks success",
    "params": null
}
```

### Create securityGroup

Create securityGroup
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/securityGroups
Method: Post
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example request:
```
{
    "name": "new-webservers",
}
```


Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "Create securityGroup success",
    "params": null
}
```

### Query securityGroups on mechost

Query securityGroups on mechost

```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/securityGroups
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": {"securityGroup": [
        {
            "description": "default",
            "id": "85cc3048-abc3-43cc-89b3-377341426ac5",
            "name": "default",
            "securityGroupRule": [
                {
                    "direction": "egress",
                    "ethertype": "IPv6",
                    "id": "3c0e45ff-adaf-4124-b083-bf390e5482ff",
                    "port_range_max": null,
                    "port_range_min": null,
                    "protocol": null,
                    "remote_group_id": null,
                    "remote_ip_prefix": null,
                    "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                    "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "revision_number": 1,
                    "tags": ["tag1,tag2"],
                    "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "created_at": "2018-03-19T19:16:56Z",
                    "updated_at": "2018-03-19T19:16:56Z",
                    "description": ""
                },
                {
                    "direction": "egress",
                    "ethertype": "IPv4",
                    "id": "93aa42e5-80db-4581-9391-3a608bd0e448",
                    "port_range_max": null,
                    "port_range_min": null,
                    "protocol": null,
                    "remote_group_id": null,
                    "remote_ip_prefix": null,
                    "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                    "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "revision_number": 2,
                    "tags": ["tag1,tag2"],
                    "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "created_at": "2018-03-19T19:16:56Z",
                    "updated_at": "2018-03-19T19:16:56Z",
                    "description": ""
                },
                {
                    "direction": "ingress",
                    "ethertype": "IPv6",
                    "id": "c0b09f00-1d49-4e64-a0a7-8a186d928138",
                    "port_range_max": null,
                    "port_range_min": null,
                    "protocol": null,
                    "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                    "remote_ip_prefix": null,
                    "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                    "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "revision_number": 1,
                    "tags": ["tag1,tag2"],
                    "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "created_at": "2018-03-19T19:16:56Z",
                    "updated_at": "2018-03-19T19:16:56Z",
                    "description": ""
                },
                {
                    "direction": "ingress",
                    "ethertype": "IPv4",
                    "id": "f7d45c89-008e-4bab-88ad-d6811724c51c",
                    "port_range_max": null,
                    "port_range_min": null,
                    "protocol": null,
                    "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                    "remote_ip_prefix": null,
                    "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                    "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "revision_number": 1,
                    "tags": ["tag1,tag2"],
                    "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "created_at": "2018-03-19T19:16:56Z",
                    "updated_at": "2018-03-19T19:16:56Z",
                    "description": ""
                }
            ],
            "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "revision_number": 8,
            "created_at": "2018-03-19T19:16:56Z",
            "updated_at": "2018-03-19T19:16:56Z",
            "tags": ["tag1,tag2"],
            "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "stateful": true,
            "shared": false
        }
    ]},
    "retCode": 0,
    "message": "Query securityGroups success",
    "params": null
}
```
### Query securityGroup on mechost by securityGroupId

Query securityGroup on mechost by securityGroupId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/securityGroups/:securityGroupId
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": {"securityGroup": {
        "description": "default",
        "id": "85cc3048-abc3-43cc-89b3-377341426ac5",
        "name": "default",
        "securityGroupRule": [
            {
                "securityGroupId": "a7734e61-b545-452d-a3cd-0189cbd9747a",
		        "direction": "egress",
		        "protocol": "tcp",
                "ethertype": "IPv4",
		        "port_range_min": 80,
                "port_range_max": 90,
		        remoteIpPrefix: "",
                "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5"
            },
            {
                "securityGroupId": "a7734e61-b545-452d-a3cd-0189cbd9747b",
		        "direction": "egress",
		        "protocol": "tcp",
                "ethertype": "IPv4",
		        "port_range_min": 80,
                "port_range_max": 90,
		        remoteIpPrefix: "",
                "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac6"
            },
            {
                "securityGroupId": "a7734e61-b545-452d-a3cd-0189cbd9747c",
		        "direction": "ingress",
		        "protocol": "tcp",
                "ethertype": "IPv4",
		        "port_range_min": 80,
                "port_range_max": 90,
		        remoteIpPrefix: "",
                "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac6"
            },
            {
                "securityGroupId": "a7734e61-b545-452d-a3cd-0189cbd9747d",
		        "direction": "ingress",
		        "protocol": "tcp",
                "ethertype": "IPv4",
		        "port_range_min": 80,
                "port_range_max": 90,
		        remoteIpPrefix: "",
                "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac8"
            }
        ],
        "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
        "created_at": "2018-03-19T19:16:56Z",
        "updated_at": "2018-03-19T19:16:56Z",
        "revision_number": 4,
        "tags": ["tag1,tag2"],
        "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
        "stateful": true,
        "shared": false
    }},
    "retCode": 0,
    "message": "Query securityGroup success",
    "params": null
}
```

### Delete securityGroup on mechost by securityGroupId

Delete SecurityGroup on mechost by securityGroupId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/securityGroups/:securityGroupId
Method: Delete
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete securityGroup success",
    "params": null
}
```


### Create securityGroupRules

Create securityGroupRules
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/securityGroups/:securityGroupId/securityGroupRules 
Method: Post
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example request:
```
{
        "securityGroupId": "a7734e61-b545-452d-a3cd-0189cbd9747a",
        "direction": "ingress",
        "protocol": "tcp",
        "ethertype": "IPv4",
        "port_range_min": 80,
        "port_range_max": 90,
        remoteIpPrefix: "",
        "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5"
}
```


Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "Create securityGroupRules success",
    "params": null
}
```


### Query securityGroupRules on mechost

Query securityGroupRules on mechost

```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/securityGroups/:securityGroupId/securityGroupRules
Method: Get
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": {"securityGroupRule": [
        {
            "direction": "egress",
            "ethertype": "IPv6",
            "id": "3c0e45ff-adaf-4124-b083-bf390e5482ff",
            "port_range_max": null,
            "port_range_min": null,
            "protocol": null,
            "remote_group_id": null,
            "remote_ip_prefix": null,
            "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
            "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "revision_number": 1,
            "created_at": "2018-03-19T19:16:56Z",
            "updated_at": "2018-03-19T19:16:56Z",
            "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "description": ""
        },
        {
            "direction": "egress",
            "ethertype": "IPv4",
            "id": "93aa42e5-80db-4581-9391-3a608bd0e448",
            "port_range_max": null,
            "port_range_min": null,
            "protocol": null,
            "remote_group_id": null,
            "remote_ip_prefix": null,
            "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
            "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "revision_number": 1,
            "created_at": "2018-03-19T19:16:56Z",
            "updated_at": "2018-03-19T19:16:56Z",
            "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "description": ""
        },
        {
            "direction": "ingress",
            "ethertype": "IPv6",
            "id": "c0b09f00-1d49-4e64-a0a7-8a186d928138",
            "port_range_max": null,
            "port_range_min": null,
            "protocol": null,
            "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
            "remote_ip_prefix": null,
            "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
            "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "revision_number": 2,
            "created_at": "2018-03-19T19:16:56Z",
            "updated_at": "2018-03-19T19:16:56Z",
            "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "description": ""
        },
        {
            "direction": "ingress",
            "ethertype": "IPv4",
            "id": "f7d45c89-008e-4bab-88ad-d6811724c51c",
            "port_range_max": null,
            "port_range_min": null,
            "protocol": null,
            "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
            "remote_ip_prefix": null,
            "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
            "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "revision_number": 1,
            "created_at": "2018-03-19T19:16:56Z",
            "updated_at": "2018-03-19T19:16:56Z",
            "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "description": ""
        }
    ]},
    "retCode": 0,
    "message": "Query securityGroupRules success",
    "params": null
}
```


### Delete securityGroupRules on mechost by securityGroupRulesId 

Delete vm on mechost by securityGroupId
```
Resource URI: /rescontroller/v1/tenants/:tenantId/hosts/:hostIp/securityGroups/:securityGroupId/securityGroupRules/:securityGroupRuleId

```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt Token|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete securityGroup success",
    "params": null
}
```

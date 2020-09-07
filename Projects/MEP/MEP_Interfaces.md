MEP Interfaces
==============
- [MEP Interfaces](#mep-interfaces)
- [Mep-Server](#mep-server)
  - [1. DNS rule configurations](#1-dns-rule-configurations)
    - [1.1 Mp1 Interface for DNS configurations](#11-mp1-interface-for-dns-configurations)
      - [1.1.1 GET all](#111-get-all)
      - [1.1.2 GET one](#112-get-one)
      - [1.1.2 PUT](#112-put)
    - [1.2 Mm5 Interface for DNS configurations](#12-mm5-interface-for-dns-configurations)
      - [1.2.1 POST](#121-post)
      - [1.2.2 GET all](#122-get-all)
      - [1.2.3 GET one](#123-get-one)
      - [1.2.4 PUT](#124-put)
      - [1.2.5 DELETE](#125-delete)
- [Dns-Server](#dns-server)
  - [1. DNS management](#1-dns-management)
    - [1.1 Create/Set new entry](#11-createset-new-entry)
    - [1.2. Delete an entry](#12-delete-an-entry)

# Mep-Server
This section cover the mep-server interfaces.

## 1. DNS rule configurations

DNS rules can be configured using both Mp1 and Mm5 interfaces.

### 1.1 Mp1 Interface for DNS configurations

Uisng the Mp1 interfaces mec apps can query and activate/deactivate dns rules associated to it. Implementation of this interface are as per the *ETSI GS MEC 011 V2.1.1* document.

#### 1.1.1 GET all

Query all DNS rules associated with an application.

```
Resource URI: /mep/mec_app_support/v1/applications/{appInstanceId}/dns_rules
```

| Name          | Definition    |
| ------------- | ------------- |
| appInstanceId | Application instance identifier, represents a MEC application instance. Provided by mep-server to the application during start up of the application. |

Example response:
```
200 OK
[
    {
        "dnsRuleId": "20a19292-384c-4d44-ba64-a8e8269f0f25",
        "domainName": "voicerecgservice.com",
        "ipAddressType": "IP_V4",
        "ipAddress": "192.168.27.48",
        "ttl": 30,
        "state": "ACTIVE"
    },
    {
        "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
        "domainName": "facerecgservice.com",
        "ipAddressType": "IP_V4",
        "ipAddress": "192.168.147.240",
        "ttl": 30,
        "state": "INACTIVE"
    }
]
```

#### 1.1.2 GET one

Query single DNS rule associated with an application.

```
Resource URI: /mep/mec_app_support/v1/applications/{appInstanceId}/dns_rules/{dnsRuleId}
```

| Name          | Definition    |
| ------------- | ------------- |
| appInstanceId | Application instance identifier, represents a MEC application instance. Provided by mep-server to the application during start up of the application. |
| dnsRuleId     | DNS rule identifier, represents a single DNS rule associated to a MEC application. |

Example response:
```
200 OK
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "INACTIVE"
}
```

#### 1.1.2 PUT

Modify the state of a rule associated with an application. This interface can modify the state from **ACTIVE** to **INACTIVE** or vice versa. No other field can be modified using this interface.

```
Resource URI: /mep/mec_app_support/v1/applications/{appInstanceId}/dns_rules/{dnsRuleId}
```

| Name          | Definition    |
| ------------- | ------------- |
| appInstanceId | Application instance identifier, represents a MEC application instance. Provided by mep-server to the application during start up of the application. |
| dnsRuleId     | DNS rule identifier, represents a single DNS rule associated to a MEC application. |

Request body can be as following.
| Field  Name   | Values                      | Mandatory?    |
| ------------- | --------------------------- | ------------- |
| dnsRuleId     | string                      | No, if present must be same with actual |
| domainName    | string                      | No, if present must be same with actual |
| ipAddressType | enum **{IP_V4, IP_V6}**     | No, if present must be same with actual |
| ipAddress     | string                      | No, if present must be same with actual |
| ttl           | int (non-zero value)        | No, if present must be same with actual |
| state         | enum **{ACTIVE, INACTIVE}** | Yes |


Example request body:
```
{
    "state": "ACTIVE"
}
or
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "ACTIVE"
}
```

Example response:
```
200 OK
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "ACTIVE"
}
```

### 1.2 Mm5 Interface for DNS configurations

Uisng the Mm5 interfaces MECM can create, query, update or delete the dns rules associated to and application. Implementation of this interface are specified in *ETSI GS MEC 010-1 V1.1.1* and *ETSI GS MEC 010-2 V2.1.1* documents.

#### 1.2.1 POST 

Create a new DNS rule and associate it with a MEC application. DNS rule id will be generated by the mep-server, thus no need to pass this field during the creation.

```
Resource URI: /mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules
```

| Name          | Definition    |
| ------------- | ------------- |
| appInstanceId | Application instance identifier, represents a MEC application instance. |

Request body can be as following.
| Field  Name   | Values                      | Mandatory? | 
| ------------- | --------------------------- | ---------- |
| domainName    | string                      | Yes |
| ipAddressType | enum **{IP_V4, IP_V6}**     | Yes |
| ipAddress     | string                      | Yes |
| ttl           | int (non-zero value)        | Yes |
| state         | enum **{ACTIVE, INACTIVE}** | Yes |

Example request body:
```
{
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "INACTIVE"
}
```

Example response:
```
200 OK
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "INACTIVE"
}
```

#### 1.2.2 GET all 

Query all DNS rules associated with an application.

```
Resource URI: /mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules
```

| Name          | Definition    |
| ------------- | ------------- |
| appInstanceId | Application instance identifier, represents a MEC application instance. |


Example response:
```
200 OK
[
    {
        "dnsRuleId": "20a19292-384c-4d44-ba64-a8e8269f0f25",
        "domainName": "voicerecgservice.com",
        "ipAddressType": "IP_V4",
        "ipAddress": "192.168.27.48",
        "ttl": 30,
        "state": "ACTIVE"
    },
    {
        "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
        "domainName": "facerecgservice.com",
        "ipAddressType": "IP_V4",
        "ipAddress": "192.168.147.240",
        "ttl": 30,
        "state": "INACTIVE"
    }
]
```

#### 1.2.3 GET one

Query single DNS rule associated with an application.

```
Resource URI: /mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules/{dnsRuleId}
```

| Name          | Definition    |
| ------------- | ------------- |
| appInstanceId | Application instance identifier, represents a MEC application instance. |
| dnsRuleId     | DNS rule identifier, represents a single DNS rule associated to a MEC application. |

Example response:
```
200 OK
{
    "dnsRuleId": "20a19292-384c-4d44-ba64-a8e8269f0f25",
    "domainName": "voicerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.27.48",
    "ttl": 30,
    "state": "ACTIVE"
}
```

#### 1.2.4 PUT 

Modify the state of a rule associated with an application. This interface can modify the state from **ACTIVE** to **INACTIVE** or vice versa. No other field can be modified using this interface.

```
Resource URI: /mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules/{dnsRuleId}
```

| Name          | Definition    |
| ------------- | ------------- |
| appInstanceId | Application instance identifier, represents a MEC application instance. |
| dnsRuleId     | DNS rule identifier, represents a single DNS rule associated to a MEC application. |

Request body can be as following.
| Field  Name   | Values                      | Mandatory?    |
| ------------- | --------------------------- | ------------- |
| dnsRuleId     | string                      | No, if present must be same with actual |
| domainName    | string                      | No, if present must be same with actual |
| ipAddressType | enum **{IP_V4, IP_V6}**     | No, if present must be same with actual |
| ipAddress     | string                      | No, if present must be same with actual |
| ttl           | int (non-zero value)        | No, if present must be same with actual |
| state         | enum **{ACTIVE, INACTIVE}** | Yes |


Example request body:
```
{
    "state": "ACTIVE"
}
or
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "ACTIVE"
}
```

Example response:
```
200 OK
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "ACTIVE"
}
```

#### 1.2.5 DELETE

Delete a DNS rule associated to an application.

```
Resource URI: /mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules/{dnsRuleId}
```

| Name          | Definition    |
| ------------- | ------------- |
| appInstanceId | Application instance identifier, represents a MEC application instance. |
| dnsRuleId     | DNS rule identifier, represents a single DNS rule associated to a MEC application. |

Example response:
```
204 No Content
```


# Dns-Server

Mep has a programmable dns server which can perform the name resolution of the MEC applications. This management interface of the dns server is handled using a rest interface and this section cover the details of this interface.

## 1. DNS management

### 1.1 Create/Set new entry

DNS entry can be added or modified using this interface. Once a record is added/modified, the resource will be available for the device application to query.

```
Method: PUT
Resource URI: "/mep/dns_server_mgmt/v1/rrecord"
```

Example request body:
```
[
  {
    "zone": ".",
    "rr": [
      {
        "name": "www.example.com.",
        "type": "A",
        "class": "IN",
        "ttl": 30,
        "rData": [
          "172.168.15.101"
        ]
      }
    ]
  }
]
```

Using this interface multiple records on multiple zones can be submitted together.

Details about the request fields:
| Field  Name   | Values                      | Mandatory?    | Description |
| ------------- | --------------------------- | ------------- | ----------- |
| zone          | string                      | Yes | Zone name |
| name          | string                      | Yes | Domain name | 
| type          | enum **{A, AAAA}**          | Yes | DNS resource type, A in case of Ipv4 and AAAA for Ipv6 |
| class         | enum **{IN}**               | Yes on create | Resource record class |
| ttl           | int (non-zero value)        | Yes on create | Record TTL value |
| rData         | list(string)                | Yes on create | IP Address list, Ip type must match with the **type** field |


Example response:
```
200 Success
```

### 1.2. Delete an entry

DNS entry can be deleted from the dns-server using this interface.

```
Method: DELETE
Resource URI: "/mep/dns_server_mgmt/v1/rrecord/{fqdn}/{rrtype}"
```

| Name          | Definition    |
| ------------- | ------------- |
| fqdn          | The domain name of the dns entry. |
| rrtype        | Resource record type of the entry(A or AAAA). |


Example response:
```
200 Success
```
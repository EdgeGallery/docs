接口设计
==============

- [接口设计](#接口设计)
  - [MEP 接口简介](#mep-接口简介)
  - [MEP-auth模块接口](#mep-auth模块接口)
    - [服务认证接口](#服务认证接口)
    - [AK/SK配置接口](#aksk配置接口)
  - [MEP-server 接口](#mep-server-接口)
    - [应用服务管理相关接口](#应用服务管理相关接口)
      - [1. 查询应用服务](#1-查询应用服务)
      - [2. 查询应用指定服务](#2-查询应用指定服务)
      - [3. 注册应用服务](#3-注册应用服务)
      - [4. 更新应用服务](#4-更新应用服务)
      - [5. 删除应用服务](#5-删除应用服务)
    - [可用事件订阅相关接口](#可用事件订阅相关接口)
      - [1. 查询可用事件订阅](#1-查询可用事件订阅)
      - [2. 注册可用事件订阅](#2-注册可用事件订阅)
      - [3. 删除可用事件订阅](#3-删除可用事件订阅)
      - [4. 查询指定可用事件订阅](#4-查询指定可用事件订阅)
    - [终止事件订阅相关接口](#终止事件订阅相关接口)
      - [1. 查询终止事件订阅](#1-查询终止事件订阅)
      - [2. 注册终止事件订阅](#2-注册终止事件订阅)
      - [3. 删除终止事件订阅](#3-删除终止事件订阅)
      - [4. 查询指定终止事件订阅](#4-查询指定终止事件订阅)
    - [Heartbeat related interfaces](#heartbeat-related-interfaces)
      - [1. Query service liveness info](#1-query-service-liveness-info)
      - [2. Update liveness info](#2-update-liveness-info)
    - [DNS rule configuration interfaces](#dns-rule-configuration-interfaces)
      - [1. Query all dns rules](#1-query-all-dns-rules)
      - [2. Query a specific dns rule](#2-query-a-specific-dns-rule)
      - [3. Update a specific dns rule](#3-update-a-specific-dns-rule)
    - [Traffic rule configuration interfaces](#traffic-rule-configuration-interfaces)
      - [1. Query all traffic rules](#1-query-all-traffic-rules)
      - [2. Query a specific traffic rule](#2-query-a-specific-traffic-rule)
      - [3. Update a specific traffic rule](#3-update-a-specific-traffic-rule)
    - [Mm5 Interface for appd configurations](#mm5-interface-for-appd-configurations)
      - [1. Create a new appd configurations](#1-create-a-new-appd-configurations)
      - [2. Query appd configuration](#2-query-appd-configuration)
      - [3. Modify appd configuration](#3-modify-appd-configuration)
      - [4. Delete appd configuration](#4-delete-appd-configuration)
      - [5. Query task status](#5-query-task-status)
    - [Query Platform Capabilities(Services)](#query-platform-capabilitiesservices)
      - [1. Query all capabilities](#1-query-all-capabilities)
      - [2. Query individual capability](#2-query-individual-capability)
    - [异常状态码](#异常状态码)
  - [Dns-Server](#dns-server)
    - [1. Create/Set new entry](#1-createset-new-entry)
    - [2. Delete an entry](#2-delete-an-entry)
  - [MEP Agent](#mep-agent)
      - [1. Get token](#1-get-token)

## MEP 接口简介

MEP主要包含MEP-server和MEP-auth两个主要功能模块。MEP server接口分为两类，一类为遵循ETSI MEC 011 v2.1.1标准的Mp1接口，主要为App提供服务注册发现，App状态通知订阅，Dns规则获取等功能；另一类为Mm5接口，主要为MECM/MEPM提供配置管理功能。MEP auth目前主要作为鉴权模块，为App提供token申请发放功能。  
URL为服务自己的URL，PORT为服务自己的PORT。如果经过KONG，PORT变成KONG的PORT，URL需要添加对应的路由。mepauth直接添加{KONG_MEPAUTH_ROUTE}（当前值为/mepauth），mepserver把/mep用{KONG_MEPSERVER_ROUTE}（当前值为/mepserver）替换。

## MEP-auth模块接口



### 服务认证接口

应用通过AK/SK向LDVS进行鉴权认证，认证通过后返回token，每个token具有有效期（1小时），token分配方在有效期结束后将收回token，当携带过期的token的HTTP请求到达的时候，将被以状态码401返回；此时token携带方需要重新进行token获取。当token还在有效期内，token携带方再次使用相同的用户获取token时返回当前仍然有效的token。

URL：

```
POST /mepauth/v1/token
```

请求参数：

 |名称  |          类型 |    描述       |                                      IN     |  必选|
 |---|---|---|---|---|
 | Content-Type |   String  | MIME类型，  填"application/json"                        |               header  | 是|                                                                    
 | Authorization|   String   |认证信息   |                                      header  | 是|
 |  x-sdk-date  |    String   |签名时间（当前时间戳，格式：YYYYMMDDTHHMMSSZ）|   header |  是|
 |  Host    |       String |  与生成认证信息签名用到的host字段保持一致   |      header|   是|


Body参数：

无


请求示例：

```
POST /mepauth/v1/token

{
  "header": [
    {
      "key": "Content-Type",
      "value": "application/json"
    },
    {
      "key": "Authorization",
      "value": "SDK-HMAC-SHA256 Access= QVUJMSUMgS0VZLS0tLS0=,
      SignedHeaders=content-type;host;x-sdk-date,
      Signature=142b0dc3feaeb3662b2033a8e6425596546e08a231aa39179b4060867dd15d3d"
    },
    {
      "key": "x-sdk-date",
      "value": "20060102T150405Z"
    },
    {
      "key":"Host",
      "value":"xxx"
    }
  ]
}
```


返回参数：

返回码：200

OK

|名称     |       类型  |   描述   |               必选|
  |---|---|---|---|
  |access\_token |  String  | Token|                 是|
  |token\_type     |String   |Token类型（Bearer）|   是|
  |expires\_in    | int     | 失效时间             | 是|

返回示例：

```
HTTP/1.1 200 OK
{
	"access_token":"xxxx",
	"token_type":"Bearer",
	"expires_in":"3600"
}

```


注：在测试时，请确保启动EG-LDVS时使用的AK/SK和获取token时使用的AK/SK相同。基于AK/SK的认证，EG-LDVS对于相同的AK若5分钟内三次认证失败，对应AK将被锁定15分钟。

### AK/SK配置接口

URL：

```
PUT /mepauth/v1/applications/{appInstanceId}/confs
```

请求参数：

|名称    |        类型    | 描述     |                           IN   |    必选|
  | ---| ---| ---| ---| ---| 
 |  Content-Type    | String   | MIME类型，填"application/json"                       |     header|   是| 
  |appInstanceId |  String |  APP实例ID（UUID）             |      path |    是|

Body参数：

  |  名称     |                     类型 |              描述        |             必选| 
  | ---| ---| ---| ---|
  | authInfo|                  Object|            用户信息                        | 是| 
  | &gt;credentials|               Object|            证书信息|   是      | 
  | &gt;&gt;accessKeyId|                   String  |          AK          |                是|
  | &gt;&gt;secretKey|                   String  |          SK          |                是|

请求示例：

```
PUT /mepauth/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/confs
{
    "header": [
        {
            "key": "Content-Type",
            "value": "application/json"
        }
    ],
    "body": {
        "authInfo": {
            "credentials": {
                "accessKeyId": "QVUJMSUMgS0VZLS0tLS0",
                "secretKey": "DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc"
            }
        }
    }
}
```

返回参数：

返回码：200

OK

  |  名称     |                     类型 |              描述        |             必选| 
  | ---| ---| ---| ---|
  | authInfo|                  Object|            用户信息                        | 是| 
  | &gt;credentials|               Object|            证书信息|   是      | 
  | &gt;&gt;accessKeyId|                   String  |          AK          |                是|
  | &gt;&gt;secretKey|                   String  |          SK          |                是|

返回示例：

```
HTTP/1.1 200 OK
{
    "authInfo": {
        "credentials": {
            "accessKeyId": "QVUJMSUMgS0VZLS0tLS0",
            "secretKey": "DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc"
        }
    }
}
```

## MEP-server 接口

### 应用服务管理相关接口

#### 1. 查询应用服务

查询指定APP的服务列表

URL

```
GET /mep/mec_service_mgmt/v1/applications/{appInstanceId}/services
```

请求参数：

  |名称            | 类型  |   描述     |                           IN    |   必选|
  |---|---|---|---|---| 
  |Authorization |  String |  Token信息，格式：Bearer token信息  | header  | 是|
  |appInstanceId  | String  | APP实例ID（UUID）                   |path    | 是|

Body参数：

无

请求示例：

```
GET /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services
{
  "header": [
    {
      "key": "Authorization",
      "value": "Bearer xxx"
    }
  ]
}

```


返回参数：

返回码：200

OK

 |名称                      |   类型            |  描述      |                                                                                                            必选|
  |---|---|---|---|
 | serInstanceId      |          String       |     服务实例ID         |                                                                                                   是|
|  serName    |                  String  |          服务名称         |                                                                                                     是|
  |serCategory      |            Object      |      服务类别       |                                                                                                       否|
 | &gt;href        |             String   |         目录参考    |                                                                                                          否|
 | &gt;id          |            String   |         类别ID        |                                                                                                       否
  |&gt;name  |                   String |           类别名称      |                                                                                                        否|
|  &gt;version|                  String   |         类别版本号        |                                                                                                    否|
  |version|                      String     |       服务版本号        |                                                                                                    是|
  |state |                       String |           服务状态（ACTIVE/INACTIVE）  |                                                                                         是|
  |transportInfo   |             Object |           服务信息       |                                                                                                       否|
|  &gt;id     |                  String     |       ID     |                                                                                                               否|
 | &gt;name  |                   String |           名称       |                                                                                                           否|
  |&gt; description    |         String    |        描述       |                                                                                                           否|
  |&gt; type |                   String|            类型（REST\_HTTP/MB\_TOPIC\_BASED/MB\_ROUTING/MB\_PUBSUB/RPC/RPC\_STREAMING/WEBSOCKET）   |                            否|
 | &gt; protocol   |             String   |         协议名称          |                                                                                                    否|
 | &gt; version                | String|            版本号   |                                                                                                             否|
 | &gt; endpoint               | Ojbect|            Endpoint，三种信息其中的一个（uris/addresses/alternative） |                                                           否|
  |&gt;&gt;uris   |              Array\[String\]|   URI格式的服务入口信息列表|                                                                                             否|
|  &gt;&gt;addresses |           Array\[Object\] |  服务入口信息地址列表（IP地址+端口号）  |                                                                               否|
  |&gt;&gt;&gt;host    |         String      |      IP地址     |                                                                                                           否|
  |&gt;&gt;&gt;port   |         String     |       端口号            |                                                                                                    否|
 | &gt;&gt;alternative  |        String     |       已实现格式或者外部规范定义的服务入口信息        |                                                                      否|
  |&gt; security |               Object       |     安全信息        |                                                                                                      否|
  |&gt;&gt; oAuth2Info     |     Object    |        OAuth2.0参数      |                                                                                                    否|
  |&gt;&gt;&gt; grantTypes   |   Array\[String\]|   准予类型（OAUTH2\_AUTHORIZATION\_CODE/OAUTH2\_IMPLICIT\_GRANT/OAUTH2\_RESOURCE\_OWNER/OAUTH2\_CLIENT\_CREDENTIALS） |  否|
 | &gt;&gt;&gt; tokenEndpoint  | String    |        Token endpoint        |                                                                                                否|
 | &gt; implSpecificInfo|        String     |       其他实现信息            |                                                                                              否|
  |serializer    |               String   |        序列化类型（JSON/XML/PROTOBUF3）  |                                                                                    是|
  |scopeOfLocality  |            String   |         地域范围（MEC\_SYSTEM/MEC\_HOST/NFVI\_POP/ZONE/ZONE\_GROUP/NFVI\_NODE），默认值MEC\_HOST   |                           否|
  |consumedLocalOnly  |          boolean    |       是否只被本地域APP消费（true/false）    |                                                                               否|
  |isLocal                  |    boolean |          是否在本地域（true/false）       |                                                                                     否|
  |livenessInterval         |    integer |          Interval (in seconds) between two consecutive heartbeat messages |                                                否|
  |\_links                  |    Object  |         Links to resources related to this resource. Shall be absent in HTTP requests. |                                     否|
  |&gt;self                 |    object |          Link to this resource. Shall be present in HTTP responses.        |                                                  否|
  |&gt;&gt;liveness         |    string |          Link to the resource where the MEC platform expects the service instance to send the liveness information. |         否|

返回示例：

```
HTTP/1.1 200 OK
{
[
  {
    "serInstanceId": "0bc92b06cc213d2ad8beda71bd0e1460",
    "serName": "ExampleService",
    "serCategory": {
      "href": "/example/catalogue1",
      "id": "id12345",
      "name": "RNI",
      "version": "version1"
    },
    "version": "ServiceVersion1",
    "state": "ACTIVE",
    "transportInfo": {
      "id": "TransId12345",
      "name": "REST",
      "description": "REST API",
      "type": "REST_HTTP",
      "protocol": "HTTP",
      "version": "2.0",
      "endpoint": {},
      "security": {
        "oAuth2Info": {
          "grantTypes": [
            "OAUTH2_CLIENT_CREDENTIALS"
          ],
          "tokenEndpoint": "/mecSerMgmtApi/security/TokenEndPoint"
        }
      },
      "implSpecificInfo": {}
    },
    "serializer": "JSON",
    "scopeOfLocality": "MEC_SYSTEM",
    "consumedLocalOnly": false,
    "isLocal": true,
    "livenessInterval": 60,
    "_links": {
      "self": {
        "liveness" : "/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/service/0bc92b06cc213d2ad8beda71bd0e1460/liveness"
      }
    }
  }
]
}

```

#### 2. 查询应用指定服务

查询对应APP的指定服务

URL

```
GET /mep/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}
```

请求参数：

  |名称            |类型  |   描述     |                           IN      | 必选|
  |---|---|---|---|---| 
  |Authorization  | String  | Token信息，格式：Bearer token信息  | header |  是|
  |appInstanceId  | String   |APP实例ID（UUID）                  | path  |   是|
  |serviceId      | String   |APP服务实例ID                      | path |    是|

Body参数：

无

请求示例：

```
GET /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460
{
  "header": [
    {
      "key": "Authorization",
      "value": "Bearer xxx"
    }
  ]
}

```

返回参数：

返回码：200

OK

 |名称        |                 类型   |           描述           |                                                                                                       必选|
  |---|---|---|---|
  |serInstanceId  |              String|            服务实例ID   |                                                                                                         是|
 | serName      |                String|            服务名称  |                                                                                                           是|
 | serCategory  |                Object |           服务类别        |                                                                                                      否|
  &gt;href   |                  String   |         目录参考    |                                                                                                          否|
 |&gt;id     |                  String |           类别ID    |                                                                                                            否|
 | &gt;name |                    String    |        类别名称             |                                                                                                 否|
 | &gt;version   |               String |           类别版本号         |                                                                                                   否|
|  version   |                   String    |        服务版本号              |                                                                                              是|
 | state      |                  String   |         服务状态（ACTIVE/INACTIVE）       |                                                                                    是|
 | transportInfo  |              Object  |          服务信息           |                                                                                                   否|
 | &gt;id    |                   String       |     ID    |                                                                                                                否|
  |&gt;name     |                String    |        名称       |                                                                                                           否|
  |&gt; description    |         String   |         描述         |                                                                                                         否|
 | &gt; type|                    String |           类型（REST\_HTTP/MB\_TOPIC\_BASED/MB\_ROUTING/MB\_PUBSUB/RPC/RPC\_STREAMING/WEBSOCKET）     |                          否|
 | &gt; protocol |               String |           协议名称      |                                                                                                        否|
 | &gt; version |                String |           版本号   |                                                                                                             否|
 | &gt; endpoint   |             Ojbect  |          Endpoint，三种信息其中的一个（uris/addresses/alternative）|                                                            否|
 | &gt;&gt;uris |                Array\[String\] |  URI格式的服务入口信息列表    |                                                                                         否
 | &gt;&gt;addresses |           Array\[Object\] |  服务入口信息地址列表（IP地址+端口号）     |                                                                            否|
 | &gt;&gt;&gt;host|             String|            IP地址 |                                                                                                               否|
 | &gt;&gt;&gt;port  |           String  |          端口号        |                                                                                                        否|
  |&gt;&gt;alternative |         String   |         已实现格式或者外部规范定义的服务入口信息   |                                                                           否|
  |&gt; security|                Object|            安全信息|                                                                                                              否
  |&gt;&gt; oAuth2Info  |        Object |           OAuth2.0参数  |                                                                                                        否|
  |&gt;&gt;&gt; grantTypes |     Array\[String\]   |准予类型（OAUTH2\_AUTHORIZATION\_CODE/OAUTH2\_IMPLICIT\_GRANT/OAUTH2\_RESOURCE\_OWNER/OAUTH2\_CLIENT\_CREDENTIALS）|   否|
  |&gt;&gt;&gt; tokenEndpoint |  String   |         Token endpoint    |                                                                                                    否
 | &gt; implSpecificInfo   |     String  |         其他实现信息        |                                                                                                  否
 | serializer  |                 String      |      序列化类型（JSON/XML/PROTOBUF3）    |                                                                                  是|
  |scopeOfLocality              String   |         地域范围（MEC\_SYSTEM/MEC\_HOST/NFVI\_POP/ZONE/ZONE\_GROUP/NFVI\_NODE），默认值MEC\_HOST  |                            |否|
 | consumedLocalOnly |           boolean   |        是否只被本地域APP消费（true/false）  |                                                                                 否|
|isLocal |                     boolean  |         是否在本地域（true/false）|                                                                                            否|
  |livenessInterval         |    integer |          Interval (in seconds) between two consecutive heartbeat messages |                                                否|
  |\_links                  |    Object  |         Links to resources related to this resource. Shall be absent in HTTP requests. |                                     否|
  |&gt;self                 |    object |          Link to this resource. Shall be present in HTTP responses.        |                                                  否|
  |&gt;&gt;liveness         |    string |          Link to the resource where the MEC platform expects the service instance to send the liveness information. |         否|

返回示例：

```
HTTP/1.1 200 OK
{
 "serInstanceId": "0bc92b06cc213d2ad8beda71bd0e1460",
 "serName": "ExampleService",
 "serCategory": {
      "href": "/example/catalogue1",
      "id": "id12345",
      "name": "RNI",
      "version": "version1"
 },
 "version": "ServiceVersion1",
 "state": "ACTIVE",
 "transportInfo": {
   "id": "TransId12345",
   "name": "REST",
   "description": "REST API",
   "type": "REST_HTTP",
   "protocol": "HTTP",
   "version": "2.0",
   "endpoint": {},
   "security": {
        "oAuth2Info": {
          "grantTypes": [
            "OAUTH2_CLIENT_CREDENTIALS"
          ],
          "tokenEndpoint": "/mecSerMgmtApi/security/TokenEndPoint"
        }
      },
      "implSpecificInfo": {}
    },
    "serializer": "JSON",
    "scopeOfLocality": "MEC_SYSTEM",
    "consumedLocalOnly": false,
    "isLocal": true,
    "livenessInterval": 60,
    "_links": {
      "self": {
        "liveness" : "/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/service/0bc92b06cc213d2ad8beda71bd0e1460/liveness"
      }
    }
 }
```

#### 3. 注册应用服务

为指定APP注册服务。

URL

```
POST /mep/mec_service_mgmt/v1/applications/{appInstanceId}/services
```

请求参数：

|名称    |        类型    | 描述     |                           IN   |    必选|
  | ---| ---| ---| ---| ---| 
 |  Content-Type    | String   | MIME类型，填"application/json"                       |     header|   是|                                                                                          
 |Authorization |  String |  Token信息，格式：Bearer token信息  | header|   是|
  |appInstanceId |  String |  APP实例ID（UUID）             |      path |    是|

Body参数：

  |  名称     |                     类型 |              描述        |                                                                                                           必选| 
  | ---| ---| ---| ---|
  | serName     |                  String |            服务名称（字母/数字/\_/-的组合，但不能以\_和-开头或结尾），最大长度128                                                | 是| 
 |  serCategory    |               Object|             服务类别          |                                                                                                     否| 
|   &gt;href  |                   String  |           目录参考          |                                                                                                     否| 
|   &gt;id      |                  String   |          类别ID，字母与数字组合，最大长度64     |                                                                                否| 
  | &gt;name   |                   String        |     类别名称  |                                                                                                             否| 
  | &gt;version   |                String    |         类别版本号     |                                                                                                        否| 
  | version   |                    String    |         服务版本号（格式为x\[.y\[.z\]\]，xyz取值范围0\~32767，例如：1；1.2；1.2.3）      |                                      是
|   state      |                   String  |           服务状态（ACTIVE/INACTIVE）      |                                                                                      是| 
 |  transportId    |               String     |        服务信息ID，字母与数字组合，最大长度64   |                                                                              否| 
 |  transportInfo  |               Object |            服务信息    |                                                                                                           否| 
 |  &gt;id   |                     String   |          ID，字母与数字组合，最大长度64    |                                                                                     否| 
  | &gt;name      |                String     |        名称（字母/数字/\_/-的组合，但不能以\_和-开头或结尾），最大长度128 |                                                    否| 
|   &gt; description  |            String |            描述，最大长度128              |                                                                                        否| 
  | &gt; type |                    String |            类型（REST\_HTTP/MB\_TOPIC\_BASED/MB\_ROUTING/MB\_PUBSUB/RPC/RPC\_STREAMING/WEBSOCKET）    |                           否| 
 |  &gt; protocol   |              String   |          协议名称，最大长度32 |                                                                                                  否| 
 |  &gt; version   |               String    |         版本号    |                                                                                                             否| 
 |  &gt; endpoint    |             Object |            Endpoint，三种信息其中的一个（uris/addresses/alternative）  |                                                           否| 
 |  &gt;&gt;uris     |             Array\[String\] |   URI格式的服务入口信息列表|                                                                                              否| 
 |  &gt;&gt;addresses  |           Array\[Object\]  |  服务入口信息地址列表（IP地址+端口号）    |                                                                              否| 
  | &gt;&gt;&gt;host     |         String    |         IP地址。例如：192.168.0.1  |                                                                                            否| 
  | &gt;&gt;&gt;port   |           String   |          端口号（&lt;=65535）。例如：8080       |                                                                                否| 
  | &gt;&gt;alternative |          String   |          已实现格式或者外部规范定义的服务入口信息   |                                                                            否| 
  | &gt; security    |             Object     |        安全信息     |                                                                                                          否| 
 |  &gt;&gt; oAuth2Info|           Object    |         OAuth2.0参数   |                                                                                                        否| 
 |  &gt;&gt;&gt; grantTypes   |    String    |         准予类型（OAUTH2\_AUTHORIZATION\_CODE/OAUTH2\_IMPLICIT\_GRANT/OAUTH2\_RESOURCE\_OWNER/OAUTH2\_CLIENT\_CREDENTIALS）  |  否| 
 |  &gt;&gt;&gt; tokenEndpoint|    String   |          Token endpoint  |                                                                                                       否| 
  | &gt; implSpecificInfo |        String  |           其他实现信息                                                                                                          | 否| 
  | serializer    |                String    |         序列化类型（JSON/XML/PROTOBUF3）|                                                                                       是
  | scopeOfLocality   |            String   |          地域范围（MEC\_SYSTEM/MEC\_HOST/NFVI\_POP/ZONE/ZONE\_GROUP/NFVI\_NODE），默认值MEC\_HOST  |                             否| 
  | consumedLocalOnly   |          boolean |           是否只被本地域APP消费（true/false） |                                                                                   否
  | isLocal     |                  boolean  |          是否在本地域（true/false）     |                                                                                        否|
  | livenessInterval          |    integer |          Interval (in seconds) between two consecutive heartbeat messages |                                                否|

请求示例：

```
POST /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services
{
  "header": [
    {
      "key": "Content-Type",
      "value": "application/json",
      "key": "Authorization",
      "value": "Bearer xxx"
    }
  ],
  "body": {
    "serName": "FaceRegService",
    "serCategory": {
    "href": "/example/catalogue1",
    "id": "id12345",
    "name": "RNI",
    "version": "1.2.4"
    },
    "version": "4.5.7",
    "state": "ACTIVE",
    "transportId": "Rest1",
    "transportInfo": {
    "id": "TransId12345",
    "name": "REST",
    "description": "REST API",
    "type": "REST_HTTP",
    "protocol": "HTTP",
    "version": "2.0",
    "endpoint": {},
    "security": {
      "oAuth2Info": {
            "grantTypes": [
            "OAUTH2_CLIENT_CREDENTIALS"
            ],
            "tokenEndpoint": "/mecSerMgmtApi/security/TokenEndPoint"
      }
    },
    "implSpecificInfo": {}
     },
     "serializer": "JSON",
     "scopeOfLocality": "MEC_SYSTEM",
     "consumedLocalOnly": false,
     "isLocal": true,
     "livenessInterval": 60
  }
}
```

返回参数：

返回码：201

OK

 | 名称           |               类型     |          描述        |                                                                                                           必选| 
  | ---| ---| ---| ---| 
|   serInstanceId   |              String  |           服务实例ID      |                                                                                                       是
  | serName   |                    String  |           服务名称   |                                                                                                            是| 
 |  serCategory  |                 Object   |          服务类别          |                                                                                                     否| 
|   &gt;href    |                  String |            目录参考        |                                                                                                       否| 
|   &gt;id   |                     String  |           类别ID      |                                                                                                           否| 
 |  &gt;name  |                   String  |           类别名称 |                                                                                                              否| 
  | &gt;version |                  String     |        类别版本号        |                                                                                                     否| 
  | version   |                    String    |         服务版本号    |                                                                                                         是| 
 |  state    |                     String    |         服务状态（ACTIVE/INACTIVE） |                                                                                           是| 
|   transportInfo |                Object    |              |                                                                                                                  否| 
  | &gt;id    |                    String   |          ID     |                                                                                                                否| 
 |  &gt;name          |            String    |         名称             |                                                                                                      否| 
  | &gt; description |            String   |          描述   |                                                                                                                否| 
  | &gt; type    |                String  |           类型（REST\_HTTP/MB\_TOPIC\_BASED/MB\_ROUTING/MB\_PUBSUB/RPC/RPC\_STREAMING/WEBSOCKET）   |                             否| 
 |  &gt; protocol|                 String|             协议名称      |                                                                                                         否| 
|   &gt; version    |              String      |       版本号   |                                                                                                              否| 
|   &gt; endpoint  |               Ojbect |            endpoint，三种信息其中的一个（uris/addresses/alternative） |                                                            否| 
  | &gt;&gt;uris    |              Array\[String\] |   URI格式的服务入口信息列表      |                                                                                        否| 
  | &gt;&gt;addresses  |           Array\[Object\]|    服务入口信息地址列表（IP地址+端口号）   |                                                                               否| 
  | &gt;&gt;&gt;host  |            String        |     IP地址    |                                                                                                             否| 
|   &gt;&gt;&gt;port   |           String   |          端口号            |                                                                                                     否| 
  | &gt;&gt;alternative    |       String     |       已实现格式或者外部规范定义的服务入口信息      |                                                                         否| 
 |  &gt; security   |              Object |            安全信息          |                                                                                                     否| 
 |  &gt;&gt; oAuth2Info|           Object    |         OAuth2.0参数       |                                                                                                    否| 
 |  &gt;&gt;&gt; grantTypes |      Array\[String\] |   准予类型（OAUTH2\_AUTHORIZATION\_CODE/OAUTH2\_IMPLICIT\_GRANT/OAUTH2\_RESOURCE\_OWNER/OAUTH2\_CLIENT\_CREDENTIALS）|    否| 
  | &gt;&gt;&gt; tokenEndpoint|    String     |        Token endpoint   |                                                                                                      否| 
  | &gt; implSpecificInfo |        String  |           其他实现信息     |                                                                                                      否| 
 |  serializer |                   String |            序列化类型（JSON/XML/PROTOBUF3）       |                                                                                是| 
  | scopeOfLocality |              String   |          地域范围（MEC\_SYSTEM/MEC\_HOST/NFVI\_POP/ZONE/ZONE\_GROUP/NFVI\_NODE），默认值MEC\_HOST       |                        否| 
 |  consumedLocalOnly   |          boolean   |         是否只被本地域APP消费（true/false）   |                                                                                 否| 
  | isLocal        |               boolean     |       是否在本地域（true/false） |                                                                                            否|
  |livenessInterval         |    integer |          Interval (in seconds) between two consecutive heartbeat messages |                                                否|
  |\_links                  |    Object  |         Links to resources related to this resource. Shall be absent in HTTP requests. |                                     否|
  |&gt;self                 |    object |          Link to this resource. Shall be present in HTTP responses.        |                                                  否|
  |&gt;&gt;liveness         |    string |          Link to the resource where the MEC platform expects the service instance to send the liveness information. |         否|

返回示例：

```
HTTP/1.1 201 OK
{
    "serInstanceId": "0bc92b06cc213d2ad8beda71bd0e1460",
    "serName": "FaceRegService",
    "serCategory": {
        "href": "/example/catalogue1",
        "id": "id12345",
        "name": "RNI",
        "version": "1.2.4"
    },
    "version": "4.5.7",
    "state": "ACTIVE",
    "transportId": "Rest1",
    "transportInfo": {
        "id": "TransId12345",
        "name": "REST",
        "description": "REST API",
        "type": "REST_HTTP",
        "protocol": "HTTP",
        "version": "2.0",
        "endpoint": {},
        "security": {
            "oAuth2Info": {
                    "grantTypes": [
                    "OAUTH2_CLIENT_CREDENTIALS"
                    ],
                    "tokenEndpoint": "/mecSerMgmtApi/security/TokenEndPoint"
            }
        },
        "implSpecificInfo": {}
    },
    "serializer": "JSON",
    "scopeOfLocality": "MEC_SYSTEM",
    "consumedLocalOnly": false,
    "isLocal": true,
    "livenessInterval": 60,
    "_links": {
      "self": {
        "liveness" : "/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/service/0bc92b06cc213d2ad8beda71bd0e1460/liveness"
      }
    }    
}
```

**注：单个应用注册的服务数量应不超过50个，超出后服务将报错。**

#### 4. 更新应用服务

更新APP指定服务信息。

URL

```
PUT /mep/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}
```

请求参数：

  | 名称           |  类型   |   描述           |                      IN     |   必选| 
  |---|---|---|---|---|
  | Content-Type  |   String   | MIME类型，  填"application/json"        |                 header  | 是|                                                                     
  |Authorization   |String   |Token信息，格式：Bearer token信息  | header   |是|
  |appInstanceId  | String   |APP实例ID（UUID）                  | path    | 是|
  |serviceId     |  String   |APP服务实例ID                       |path     |是|

Body参数：

  | 名称               |          类型      |        描述           |                                                                                                       必选|
  |---|---|---|---|
 | serName       |               String      |      服务名称（字母/数字/\_/-的组合，但不能以\_和-开头或结尾），最大长度128  |                                              是|
 | serCategory   |               Object  |          服务类别               |                                                                                               否||
|  &gt;href    |                 String  |          目录参考        |                                                                                                      否|
|  &gt;id         |              String    |        类别ID，字母与数字组合，最大长度64     |                                                                               否|
 | &gt;name     |                String       |     类别名称      |                                                                                                        否|
|  &gt;version    |              String   |         类别版本号          |                                                                                                  否|
  |version    |                  String  |          服务版本号（例如：1；1.0；1.0.2） |                                                                                    是|
|  state  |                      String|            服务状态（ACTIVE/INACTIVE）     |                                                                                      是|
 | transportId     |             String   |         服务信息ID，字母与数字组合，最大长度64  |                                                                              否|
|  transportInfo    |            Object    |        服务信息         |                                                                                                     否|
|  &gt;id    |                   String   |         ID，字母与数字组合，最大长度64  |                                                                                      否|
 | &gt;name   |                  String     |       名称（字母/数字/\_/-的组合，但不能以\_和-开头或结尾），最大长度128|                                                    否|
 | &gt; description |            String   |         描述，最大长度128      |                                                                                               否|
|  &gt; type  |                  String     |       类型（REST\_HTTP/MB\_TOPIC\_BASED/MB\_ROUTING/MB\_PUBSUB/RPC/RPC\_STREAMING/WEBSOCKET）  |                             否|
 | &gt; protocol  |              String|            协议名称，最大长度32   |                                                                                               否|
 | &gt; version |                String   |         版本号     |                                                                                                           否|
 | &gt; endpoint|                Object |           Endpoint，三种信息其中的一个（uris/addresses/alternative）                                                            |否|
  |&gt;&gt;uris  |               Array\[String\]|   URI格式的服务入口信息列表|                                                                                             否|
  |&gt;&gt;addresses  |          Array\[Object\] |  服务入口信息地址列表（IP地址+端口号） |                                                                                否|
 | &gt;&gt;&gt;host   |          String   |         IP地址。例如：192.168.0.1|                                                                                             否|
 | &gt;&gt;&gt;port   |          String   |         端口号（&lt;=65535）。例如：8080  |                                                                                    否|
|  &gt;&gt;alternative   |       String  |          已实现格式或者外部规范定义的服务入口信息    |                                                                          否|
 | &gt; security    |            Object    |        安全信息     |                                                                                                         否|
  |&gt;&gt; oAuth2Info   |       Object      |      OAuth2.0参数    |                                                                                                      否|
  |&gt;&gt;&gt; grantTypes |     String    |        准予类型（OAUTH2\_AUTHORIZATION\_CODE/OAUTH2\_IMPLICIT\_GRANT/OAUTH2\_RESOURCE\_OWNER/OAUTH2\_CLIENT\_CREDENTIALS）  | 否|
  |&gt;&gt;&gt; tokenEndpoint |  String |           Token endpoint             |                                                                                           否|
  |&gt; implSpecificInfo  |      String |           其他实现信息      |                                                                                                    否|
 | serializer  |                 String  |          序列化类型（JSON/XML/PROTOBUF3）|                                                                                      是|
 | scopeOfLocality     |         String |           地域范围（MEC\_SYSTEM/MEC\_HOST/NFVI\_POP/ZONE/ZONE\_GROUP/NFVI\_NODE），默认值MEC\_HOST     |                         否|
  |consumedLocalOnly|            boolean  |         是否只被本地域APP消费（true/false）   |                                                                                否|
|  isLocal |                    boolean |          是否在本地域（true/false）      |                                                                                      否|
|  livenessInterval         |      integer |          Interval (in seconds) between two consecutive heartbeat messages |                                                否|

请求示例：

```
PUT /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460
{
        "header": [
            {
                "key": "Content-Type",
                "value": "application/json",
                "key": "Authorization",
                "value": "Bearer xxx"
            }
        ],
        "body": {
            "serName": "FaceRegService",
            "serCategory": {
                "href": "/example/catalogue1",
                "id": "id12345",
                "name": "RNI",
                "version": "1.2.4"
            },
            "version": "4.5.7",
            "state": "ACTIVE",
            "transportId": "Rest1",
            "transportInfo": {
                "id": "TransId12345",
                "name": "REST",
                "description": "REST API",
                "type": "REST_HTTP",
                "protocol": "HTTP",
                "version": "2.0",
                "endpoint": {},
                "security": {
                    "oAuth2Info": {
                        "grantTypes": [
                            "OAUTH2_CLIENT_CREDENTIALS"
                        ],
                        "tokenEndpoint": "/mecSerMgmtApi/security/TokenEndPoint"
                    }
                },
                "implSpecificInfo": {}
            },
            "serializer": "JSON",
            "scopeOfLocality": "MEC_SYSTEM",
            "consumedLocalOnly": false,
            "isLocal": true,
            "livenessInterval": 60
        }
}


```

 返回参数：

返回码：200

OK

  |名称       |                  类型    |          描述              |                                                                                                    必选|
  |---|---|---|---|
 | serInstanceId|                String   |         服务实例ID               |                                                                                             是|
 | serName        |              String    |        服务名称        |                                                                                                      是|
|  serCategory    |              Object   |         服务类别               |                                                                                               否|
 | &gt;href         |            String     |       目录参考        |                                                                                                      否|
|  &gt;id  |                     String      |      类别ID       |                                                                                                         否|
  |&gt;name   |                  String    |        类别名称  |                                                                                                            否|
  &gt;version     |             String|            类别版本号     |                                                                                                       否|
|  version    |                  String  |          服务版本号          |                                                                                                  是|
  state     |                   String  |          服务状态（ACTIVE/INACTIVE）   |                                                                                        是|
  transportInfo    |            Object |           服务信息      |                                                                                                        否|
|  &gt;id                     |  String      |      ID     |                                                                                                               否|
 | &gt;name|                    String       |     名称    |                                                                                                              否
  |&gt; description|            String  |          描述     |                                                                                                             否|
| &gt; type   |                 String  |          类型（REST\_HTTP/MB\_TOPIC\_BASED/MB\_ROUTING/MB\_PUBSUB/RPC/RPC\_STREAMING/WEBSOCKET）  |                             否
 | &gt; protocol    |            String  |          协议名称       |                                                                                                       否|
  |&gt; version|                 String |           版本号       |                                                                                                         否|
  |&gt; endpoint |               Object    |        endpoint，三种信息其中的一个（uris/addresses/alternative）    |                                                        否|
 | &gt;&gt;uris   |              Array\[String\] |  URI格式的服务入口信息列表   |                                                                                          否|
 | &gt;&gt;addresses     |       Array\[Object\]  | 服务入口信息地址列表（IP地址+端口号）   |                                                                              否|
 | &gt;&gt;&gt;host |            String  |          IP地址         |                                                                                                       否|
  |&gt;&gt;&gt;port   |          String|            端口号   |                                                                                                             否|
 | &gt;&gt;alternative |         String   |         已实现格式或者外部规范定义的服务入口信息    |                                                                          否|
  |&gt; security |               Object    |        安全信息      |                                                                                                        否|
 | &gt;&gt; oAuth2Info |         Object  |          OAuth2.0参数       |                                                                                                   否|
  |&gt;&gt;&gt; grantTypes |     String  |          准予类型（OAUTH2\_AUTHORIZATION\_CODE/OAUTH2\_IMPLICIT\_GRANT/OAUTH2\_RESOURCE\_OWNER/OAUTH2\_CLIENT\_CREDENTIALS）|   否|
  |&gt;&gt;&gt; tokenEndpoint  | String |           Token endpoint    |                                                                                                    否|
 | &gt; implSpecificInfo   |     String   |         其他实现信息   |                                                                                                       否|
 | serializer  |                 String   |         序列化类型（JSON/XML/PROTOBUF3）|                                                                                      是|
|  scopeOfLocality    |          String      |      地域范围（MEC\_SYSTEM/MEC\_HOST/NFVI\_POP/ZONE/ZONE\_GROUP/NFVI\_NODE），默认值MEC\_HOST   |                           否|
|  consumedLocalOnly  |         boolean   |        是否只被本地域APP消费（true/false） |                                                                                  否|
 | isLocal   |                   boolean    |       是否在本地域（true/false）  |                                                                                          否|
 |livenessInterval         |    integer |          Interval (in seconds) between two consecutive heartbeat messages |                                                否|
 |\_links                  |    Object  |         Links to resources related to this resource. Shall be absent in HTTP requests. |                                     否|
 |&gt;self                 |    object |          Link to this resource. Shall be present in HTTP responses.        |                                                  否|
 |&gt;&gt;liveness         |    string |          Link to the resource where the MEC platform expects the service instance to send the liveness information. |         否|

返回示例：

```
HTTP/1.1 200 OK
{
    "serInstanceId": "0bc92b06cc213d2ad8beda71bd0e1460",
    "serName": "FaceRegService",
    "serCategory": {
        "href": "/example/catalogue1",
        "id": "id12345",
        "name": "RNI",
        "version": "1.2.4"
    },
    "version": "4.5.7",
    "state": "ACTIVE",
    "transportId": "Rest1",
    "transportInfo": {
        "id": "TransId12345",
        "name": "REST",
        "description": "REST API",
        "type": "REST_HTTP",
        "protocol": "HTTP",
        "version": "2.0",
        "endpoint": {},
        "security": {
            "oAuth2Info": {
                "grantTypes": [
                    "OAUTH2_CLIENT_CREDENTIALS"
                ],
                "tokenEndpoint": "/mecSerMgmtApi/security/TokenEndPoint"
            }
        },
        "implSpecificInfo": {}
    },
    "serializer": "JSON",
    "scopeOfLocality": "MEC_SYSTEM",
    "consumedLocalOnly": false,
    "isLocal": true,
    "livenessInterval": 60,
    "_links": {
      "self": {
        "liveness" : "/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/service/0bc92b06cc213d2ad8beda71bd0e1460/liveness"
      }
    }    
}

```

#### 5. 删除应用服务

删除APP指定服务。

URL

```
DELETE /mep/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}
```

请求参数：

  |名称      |      类型    | 描述         |                       IN   |    必选|
  |---|---|---|---|---| 
  |Authorization |  String |  Token信息，格式：Bearer token信息   |header |  是|
  |appInstanceId|   String  | APP实例ID（UUID）          |         path  |   是|
  |serviceId   |    String   |APP服务实例ID          |             path |    是|

Body参数：

无

请求示例：

```
DELETE /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460
{
    "header": [
        {
            "key": "Authorization",
            "value": "Bearer xxx"
        }
    ],
    "body": {
    }
}

```

返回参数：

返回码：204

OK

返回示例：

```
HTTP/1.1 204 OK
{
}

```

### 可用事件订阅相关接口

#### 1. 查询可用事件订阅

查询指定APP的可用事件订阅信息

URL

```
GET /mep/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息 | header |  是   |
| appInstanceId | String | APP实例ID（UUID） | path |  是   |

Body参数：

无

请求示例：

```
GET /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
{
    "header": [
        {
            "key": "Authorization",
            "value": "Bearer xxx"
        }
    ]
}

```

返回参数：

返回码：200

OK

| **名称** | **类型** | **描述** | **必选** |
| --- | --- | --- | --- |
| \_links  | Object | 结果信息 | 是 |
| &gt;self | Object | 调用者信息 | 是 |
| &gt;&gt;href | String | 调用者URL | 是 |
| &gt;subscriptions | Array\[Object\] | 订阅者列表 | 是 |
| &gt;&gt;href | String | 订阅者URI | 是 |
| &gt;&gt;rel | String | 固定值SerAvailabilityNotificationSubscription | 是 |

返回示例：

```
HTTP/1.1 200 OK
{
    "_links": {
        "self": {
            "href":"/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f /subscriptions"
        },
        "subscriptions": [
            {
                "href":"/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731",
                "rel": "SerAvailabilityNotificationSubscription"
            }
        ]
    }
}
```

#### 2. 注册可用事件订阅

为指定APP注册可用事件订阅

URL

```
POST /mep/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Content-Type  | String | MIME类型，填"application/json" | header |  是   |
| Authorization | String | Token信息，格式：Bearer token信息 | header |  是   |
| appInstanceId | String | APP实例ID（UUID） | path |  是   |

Body参数：

| **名称** | **类型** | **描述** | **必选** |
| --- | --- | --- | --- |
| subscriptionType  | String | 订阅类型（SerAvailabilityNotificationSubscription） |  是   |
| callbackReference | String | 用于接收通知的回调URI，不支持域名格式，仅支持IP地址+URL，且不能包含localhost、127.x.x.x、mepserver容器IP网段，例如：https://159.138.1.2:8080/xxx |  是   |
| filteringCriteria | Object | 过滤条件列表 |  否   |
| &gt;serInstanceIds | Array\[String\] | 上报事件的应用服务实例ID列表 |  否   |
| &gt;serNames | Array\[String\] | 上报事件的应用服务实例名称列表（每个服务实例名称都是字母/数字/\_/-的组合，但不能以\_和-开头或结尾，最大长度128） |  否   |
| &gt;serCategories | Array\[Object\] | 上报事件的应用服务类别列表 |  否   |
| &gt;&gt;href | String | 类别参考 |  否   |
| &gt;&gt;id | String | 类别ID，最大长度64 |  否   |
| &gt;&gt;name | String | 类别名称（字母/数字/\_/-的组合，但不能以\_和-开头或结尾），最大长度128 |  否   |
| &gt;&gt;version | String | 类别版本号 |  否   |
| &gt;states | Array\[String\] | 上报事件的应用服务状态（ACTIVE/INACTIVE） |  否   |
| &gt;isLocal  | boolean | 是否在本地域（true/false） |  否   |

请求示例：

```
POST /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
{
    "header": [
        {
            "key": "Content-Type",
            "value": "application/json",
            "key": "Authorization",
            "value": "Bearer xxx"
        }
    ]
    "body": {
        "subscriptionType": "SerAvailabilityNotificationSubscription",
        "callbackReference": "https://159.138.1.2:8080/callback",
        "filteringCriteria": {
            "serInstanceIds": [
                "0bc92b06cc213d2ad8beda71bd0e1460"
            ],
            "serNames": [
                "FaceRegService5"
            ],
            "serCategories": [
                {
                    "href": "/example/catalogue1",
                    "id": "id12345",
                    "name": "RNI",
                    "version": "1.2.2"
                }
            ],
            "states": [
                "ACTIVE"
            ],
            "isLocal": true
        }
    }
}
```

返回参数：

返回码：201

OK

| **名称** | **类型** | **描述** | **必选** |
| --- | --- | --- | --- |
| subscriptionId  | String | 订阅Id |  是   |
| subscriptionType  | String | 订阅类型（SerAvailabilityNotificationSubscription） |  是   |
| callbackReference  | String | 用于接收通知的回调URI，不支持域名格式，仅支持IP地址+URL，且不能包含localhost、127.x.x.x、mepserver容器IP网段，例如：https://159.138.1.2:8080/xxx |  是   |
| \_links  | Object | 调用者自身信息 |  是   |
| &gt;self  | Object | 调用者自身信息 |  是   |
| &gt;&gt;href  | String |  调用者自身URI |  是   |
| filteringCriteria  | Object | 过滤条件列表 |  否   |
| &gt;serInstanceIds  | Array\[String\] | 上报事件的应用服务实例ID列表 |  否   |
| &gt;serNames  | Array\[String\] | 上报事件的应用服务实例名称列表 |  否   |
| &gt;serCategories  | Array\[Object\] | 上报事件的应用服务类别列表 |  否   |
| &gt;&gt;href  | String | 类别参考 |  否   |
| &gt;&gt;id  | String | 类别ID |  否   |
| &gt;&gt;name   | String | 类别名称 |  否   |
| &gt;&gt;version  | String | 类别版本号 |  否   |
| &gt;states  | Array\[String\] | 上报事件的应用服务状态（ACTIVE/INACTIVE） |  否   |
| &gt;isLocal  | boolean | 是否在本地域（true/false） |  否   |

返回示例：

```
HTTP/1.1 201 OK
{
    "subscriptionId": "826a3890-8b05-416f-8d24-7a87e9eca731",
    "subscriptionType": "SerAvailabilityNotificationSubscription",
    "callbackReference": "https://159.138.1.2:8080/callback",
    "_links": {
        "self": {
            "href":"/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731"
        }
    },
    "filteringCriteria": {
        "serInstanceIds": [
            "0bc92b06cc213d2ad8beda71bd0e1460"
        ],
        "serNames": [
            "FaceRegService5"
        ],
        "serCategories": [
            {
                "href": "/example/catalogue1",
                "id": "id12345",
                "name": "RNI",
                "version": "1.2.2"
            }
        ],
        "states": [
            "ACTIVE"
        ],
        "isLocal": true
    }
}

```

**注：单个应用注册的可用事件订阅数量应不超过50个，超出后服务将报错。**

#### 3. 删除可用事件订阅

删除指定可用事件订阅信息

URL

```
DELETE /mep/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息 | header |  是   |
| appInstanceId  | String | APP实例ID（UUID） | path |  是   |
| subscriptionId  | String | 事件订阅ID | path |  是   |

Body参数：

无

请求示例：

```
DELETE /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
{
    "header": [
        {
            "key": "Authorization",
            "value": "Bearer xxx"
        }
    ]
}

```

返回参数：

返回码：204

OK

返回示例：

```
HTTP/1.1 204 OK
{    
}

```

#### 4. 查询指定可用事件订阅

查询指定ID的可用事件订阅信息

URL

```
GET /mep/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息 | header |  是   |
| appInstanceId  | String | APP实例ID（UUID） | path |  是   |
| subscriptionId  | String | 事件订阅ID | path |  是   |

Body参数：

无

请求示例：

```
GET /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
{
    "header": [
        { 
            "key": "Authorization",
            "value": "Bearer xxx"
        }
    ]
}

```

返回参数：

返回码：200

OK

| **名称** | **类型** | **描述** | **必选** |
| --- | --- | --- | --- |
| subscriptionType  | String | 订阅类型（SerAvailabilityNotificationSubscription） |  是   |
| callbackReference  | String | 用于接收通知的回调URI，不支持域名格式，仅支持IP地址+URL，且不能包含localhost、127.x.x.x、mepserver容器IP网段，例如：https://159.138.1.2:8080/xxx |  是   |
| \_links  | Object | 调用者自身信息 |  是   |
| &gt;self  | Object | 调用者自身信息 |  是   |
| &gt;&gt;href   | String | 调用者自身URI |  是   |
| filteringCriteria  |Object | 过滤条件列表 |  否   |
| &gt;serInstanceIds  | Array\[String\] | 上报事件的应用服务实例ID列表 |  否   |
| &gt;serNames  | Array\[String\]  | 上报事件的应用服务实例名称列表 |  否   |
| &gt;serCategories  | Array\[Object\] | 上报事件的应用服务类别列表 |  否   |
| &gt;&gt;href  | String | 类别参考 |  否   |
| &gt;&gt;id  | String | 类别ID |  否   |
| &gt;&gt;name  | String | 类别名称 |  否   |
| &gt;&gt;version  | String | 类别版本号 |  否   |
| &gt;states  | Array\[String\] | 上报事件的应用服务状态（ACTIVE/INACTIVE） |  否   |
| &gt;isLocal  | boolean | 是否在本地域（true/false） |  否   |

返回示例：

```
HTTP/1.1 200 OK
{
    "subscriptionType": "SerAvailabilityNotificationSubscription",
    "callbackReference": "https://159.138.1.2:8080/callback",
    "_links": {
        "self": {
            "href":"/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731"
        }
    },
    "filteringCriteria": {
        "serInstanceIds": [
            "0bc92b06cc213d2ad8beda71bd0e1460"
        ],
        "serNames": [
            "FaceRegService5"
        ],
        "serCategories": [
            {
                "href": "/example/catalogue1",
                "id": "id12345",
                "name": "RNI",
                "version": "1.2.2"
            }
        ],
        "states": [
            "ACTIVE"
        ],
        "isLocal": true
    }
}
```

### 终止事件订阅相关接口

#### 1. 查询终止事件订阅

查询指定APP的终止事件订阅信息

URL

```
GET /mep/mec_app_support/v1/applications/{appInstanceId}/subscriptions
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息 | header |  是   |
| appInstanceId  | String | APP实例ID（UUID） | path |  是   |

Body参数：

无

请求示例：

```
GET /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
{
    "header": [
        {
            "key": "Authorization",
            "value": "Bearer xxx"
        }
    ]
}

```

返回参数：

返回码：200

OK

| **名称** | **类型** | **描述** | **必选** |
| --- | --- | --- | --- |
| \_links  | Object | 结果信息 |  是   |
| &gt;self  | Object | 调用者信息 |  是   |
| &gt;&gt;href  | String | 调用者URL |  是   |
| &gt;subscriptions  | Array\[Object\] | 订阅者列表 |  是   |
| &gt;&gt;href  | String | 订阅者URI |  是   |
| &gt;&gt;rel  | String | 固定值AppTerminationNotificationSubscription |  是   |

返回示例：

```
HTTP/1.1 200 OK
{
    "_links": {
        "self": {
            "href":"/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f /subscriptions"
        },
        "subscriptions": [
            {
                "href":"/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731",
                "rel": "AppTerminationNotificationSubscription"
            }
        ]
    }
}

```

#### 2. 注册终止事件订阅

为指定APP注册终止事件订阅

URL

```
POST /mep/mec_app_support/v1/applications/{appInstanceId}/subscriptions
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Content-Type  | String | MIME类型，填"application/json"  | header |  是   |
| Authorization  | String | Token信息，格式：Bearer token信息 | header |  是   |
| appInstanceId  | String | APP实例ID（UUID） | path |  是   |

Body参数：

| **名称** | **类型** | **描述** | **必选** |
| --- | --- | --- | --- |
| subscriptionType  | String | 订阅类型（AppTerminationNotificationSubscription）  |  是   |
| callbackReference  | String | 用于接收通知的回调URI，不支持域名格式，仅支持IP地址+URL，且不能包含localhost、127.x.x.x、mepserver容器IP网段，例如：https://159.138.1.2:8080/xxx |  是   |
| appInstanceId  | String | APP实例ID（UUID） |  是   |

请求示例：

```
POST /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
{
    "header": [
        {
            "key": "Content-Type",
            "value": "application/json",
            "key": "Authorization",
            "value": "Bearer xxx"
        }
    ]
    "body": {
        "subscriptionType": "AppTerminationNotificationSubscription",
        "callbackReference": "https://159.138.1.2:8080/callback",
        "appInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f"
    }
}

```

返回参数：

返回码：201

OK

| **名称** | **类型** | **描述** | **必选** |
| --- | --- | --- | --- |
| subscriptionId  | String | 订阅Id  |  是   |
| subscriptionType  | String | 订阅类型（AppTerminationNotificationSubscription）  |  是   |
| callbackReference  | String | 用于接收通知的回调URI，不支持域名格式，仅支持IP地址+URL，且不能包含localhost、127.x.x.x、mepserver容器IP网段，例如：https://159.138.1.2:8080/xxx   |  是   |
| \_links  | Object | 调用者自身信息  |  是   |
| &gt;self  | Object | 调用者自身信息  |  是   |
| &gt;&gt;href  | String | 调用者自身URI  |  是   |
| appInstanceId  | String |   |  是   |

返回示例：

```
HTTP/1.1 201 OK
{
    "subscriptionId": "826a3890-8b05-416f-8d24-7a87e9eca731",
    "subscriptionType": "AppTerminationNotificationSubscription",
    "callbackReference": "https://159.138.1.2:8080/callback",
    "_links": {
        "self": {
            "href":"/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731"
        }
    },
    "appInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f"
}

```

**注：单个应用注册的终止事件订阅数量应不超过50个，超出后服务将报错。**

#### 3. 删除终止事件订阅

删除指定终止事件订阅信息

URL

```
DELETE /mep/mec_app_support/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  是   |
| appInstanceId  | String | APP实例ID（UUID）  | path |  是   |
| subscriptionId  | String | 事件订阅ID（UUID） | path |  是   |

Body参数：

无

请求示例：

```
DELETE /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
{
    "header": [
        {
            "key": "Authorization",
            "value": "Bearer xxx"
        }
    ]
}

```

返回参数：

返回码：204

OK

返回示例：

```
HTTP/1.1 204 OK
{

}
```

#### 4. 查询指定终止事件订阅

查询指定ID的终止事件订阅信息

URL

```
GET /mep/mec_app_support/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  是   |
| appInstanceId  | String | APP实例ID（UUID）  | path |  是   |
| subscriptionId  | String | 事件订阅ID（UUID） | path |  是   |

Body参数：

无

请求示例：

```
GET /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
{
    "header": [
        {
            "key": "Authorization",
            "value": "Bearer xxx"
        }
    ]
}

```

返回参数：

返回码：200

OK

| **名称** | **类型** | **描述** | **必选** |
| --- | --- | --- | --- |
| subscriptionType  | String | 订阅类型（ AppTerminationNotificationSubscription）  |  是   |
| callbackReference  | String | 用于接收通知的回调URI，不支持域名格式，仅支持IP地址+URL，且不能包含localhost、127.x.x.x、mepserver容器IP网段，例如：https://159.138.1.2:8080/xxx  |  是   |
| \_links  | Object | 调用者自身信息  |  是   |
| &gt;self  | Object | 调用者自身信息  |  是   |
| &gt;&gt;href  | String | 调用者自身URI  |  是   |
| appInstanceId  | String |   |  是   |

返回示例：

```
HTTP/1.1 200 OK
{
    "subscriptionType": "AppTerminationNotificationSubscription",
    "callbackReference": "https://159.138.1.2:8080/callback",
    "_links": {
        "self": {
            "href":"/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731"
        }
    },
    "appInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f "
}

```

### Heartbeat related interfaces
#### 1. Query service liveness info
This method retrieves information about an individual mec service liveness resource

URL
```
GET /mep/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}/liveness
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID（UUID）  | path |  Yes   |
| serviceId      | String   |APP服务实例ID                      | path |    是|

Body parameters:

None

Example Request:

```
GET /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460/liveness
```

Return Parameters:

| Name          | Type                        | Description              |
| ------------- | --------------------------- | ------------------------ |
| state     | enum **{ACTIVE, INACTIVE, SUSPENDED}**                      | State                  |
| timeStamp    | object                      | The time when the last heartbeat message was received      |
| &gt;seconds | int32     | The seconds partof the time  |
| &gt;nanoseconds     | int32                      | The nano seconds part of the time       |
| interval           | int         | Interval between two consecutive hearbeat message                |

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
    "state": "ACTIVE",
    "timeStamp": {
        "seconds": 1605249472,
        "nanoseconds": 436892745
      }
    "interval": 60
}
```

Exception status code

| **HTTP Status Code** | **Description** |
| --- | --- |
| 400  | Bad request, used to indicate that the requested parameters are incorrect. |
| 403   | The current operation is forbidden. |
| 404  | The requested resource was not found. |

#### 2. Update liveness info
This method also referred as "heartbeat" message to (re)confirm the active status about an individual mec service. But not to change the state from "INACTIVE" to "ACTIVE".
NOTE: As per ETSI doc, this message should be a PATCH message. Since we use servicecomb rest server which doesn't support PATCH message. we kept it as PUT. But behviour will be similar to patch.
URL
```
PUT /mep/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}/liveness
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID（UUID）  | path |  Yes   |
| serviceId      | String   |APP服务实例ID                      | path |    是|

Body parameters:

| Name          | Type                        | Description              | Required      |
| ------------- | --------------------------- | ------------------------ | ------------- |
| state     | enum **{ACTIVE}**                      | service state                 | Yes |

Example Request:

```
PUT /mep/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460/liveness
{
  state: "ACTIVE"
}
```

Return Parameters:
None

Return Code: 204 OK

Example Response:
Empty response

Exception status code

| **HTTP Status code** | **Description** |
| ----- | ----- |
| 400   | Bad request, used to indicate that the requested parameters are incorrect. |
| 403   | The current operation is forbidden. |
| 404  | The requested resource was not found. |
| 409  | conflict state. |



### DNS rule configuration interfaces

Using the Mp1 interfaces mec apps can query and activate/deactivate dns rules associated to it. Implementation of this interface are as per the *ETSI GS MEC 011 V2.1.1* document.

#### 1. Query all dns rules

Query all DNS rules associated with an application.

URL

```
GET /mep/mec_app_support/v1/applications/{appInstanceId}/dns_rules
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID（UUID）  | path |  Yes   |

Body parameters:

None

Example Request:

```
GET /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules
```

Return Parameters:

| Name          | Type                        | Description              |
| ------------- | --------------------------- | ------------------------ |
| dnsRuleId     | string                      | Rule Id                  |
| domainName    | string                      | MEC app domain name      |
| ipAddressType | enum **{IP_V4, IP_V6}**     | MEC app ip address type  |
| ipAddress     | string                      | MEC app ip address       |
| ttl           | int (non-zero value)        | TTL value                |
| state         | enum **{ACTIVE, INACTIVE}** | State                    |

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
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

#### 2. Query a specific dns rule

Query single DNS rule associated with an application.

URL

```
GET /mep/mec_app_support/v1/applications/{appInstanceId}/dns_rules/{dnsRuleId}
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |
| dnsRuleId      | String | DNS rule identifier(UUID) | path | Yes| 

Body parameters:

None

Example Request:

```
GET /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules/bbc14ed1-92f4-457f-95e8-93aa723a9f12
```

Return Parameters:

| Name          | Type                        | Description              | 
| ------------- | --------------------------- | ------------------------ | 
| dnsRuleId     | string                      | Rule Id                  | 
| domainName    | string                      | MEC app domain name      | 
| ipAddressType | enum **{IP_V4, IP_V6}**     | MEC app ip address type  | 
| ipAddress     | string                      | MEC app ip address       | 
| ttl           | int (non-zero value)        | TTL value                | 
| state         | enum **{ACTIVE, INACTIVE}** | State                    | 

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "INACTIVE"
}
```

#### 3. Update a specific dns rule

Modify the state of a rule associated with an application. This interface can modify the state from **ACTIVE** to **INACTIVE** or vice versa. No other field can be modified using this interface.

URL

```
PUT /mep/mec_app_support/v1/applications/{appInstanceId}/dns_rules/{dnsRuleId}
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |
| dnsRuleId      | String | DNS rule identifier(UUID) | path | Yes| 

Body parameters:

| Name          | Type                        | Description              | Required      |
| ------------- | --------------------------- | ------------------------ | ------------- |
| dnsRuleId     | string                      | Rule Id                  | No, if present must be same with actual |
| domainName    | string                      | MEC app domain name      | No, if present must be same with actual |
| ipAddressType | enum **{IP_V4, IP_V6}**     | MEC app ip address type  | No, if present must be same with actual |
| ipAddress     | string                      | MEC app ip address       | No, if present must be same with actual |
| ttl           | int (non-zero value)        | TTL value                | No, if present must be same with actual |
| state         | enum **{ACTIVE, INACTIVE}** | State                    | Yes |

Example Request:

```
PUT /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules/bbc14ed1-92f4-457f-95e8-93aa723a9f12
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "ACTIVE"
}
```

Return Parameters:

| Name          | Type                        | Description              | 
| ------------- | --------------------------- | ------------------------ | 
| dnsRuleId     | string                      | Rule Id                  | 
| domainName    | string                      | MEC app domain name      | 
| ipAddressType | enum **{IP_V4, IP_V6}**     | MEC app ip address type  | 
| ipAddress     | string                      | MEC app ip address       | 
| ttl           | int (non-zero value)        | TTL value                | 
| state         | enum **{ACTIVE, INACTIVE}** | State                    | 

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "ACTIVE"
}
```

### Traffic rule configuration interfaces

Using the Mp1 interfaces mec apps can query and modify the traffic rules associated to it. Implementation of this interface are as per the *ETSI GS MEC 011 V2.1.1* document.

#### 1. Query all traffic rules

Query all traffic rules associated with an application.

URL

```
GET /mep/mec_app_support/v1/applications/{appInstanceId}/traffic_rules
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID（UUID）  | path |  Yes   |

Body parameters:

None

Example Request:

```
GET /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/traffic_rules
```

Return Parameters:

| Name                  | Type                        | Description              |
| --------------------- | --------------------------- | ------------------------ |
| trafficRuleId         | string                      | Traffic rule ID.         |
| filterType            | enum **{FLOW, PACKET}**     | Filter type.             |
| priority              | number (1 ~ 256)            | Priority of the traffic rule. If any conflict in the traffic rules, then higher the priority higher the precedence.       |
| trafficFilter         | list                        | List of traffic filters. |
| &gt; srcAddress       | list                        | List of source ip address.|
| &gt; dstAddress       | list                        | List of destination ip address.|
| &gt; srcPort          | list                        | List of source port address.|
| &gt; dstPort          | list                        | List of destination port address.|
| &gt; protocol         | list                        | List of protocols.       |
| &gt; tag              | list                        | List of tags.            |
| &gt; srcTunnelAddress | list                        | List of source tunnel address.   |
| &gt; tgtTunnelAddress | list                        | List of target tunnel address.   |
| &gt; srcTunnelPort    | list                        | List of source tunnel ports.     |
| &gt; dstTunnelPort    | list                        | List of destination tunnel ports.|
| &gt; qCI              | number                      | Match packets with same QCI.     |
| &gt; dSCP             | number                      | Match packets with same DSCP.    |
| &gt; tC               | number                      | Match packets with same TC.      |
| action                | enum **{DROP, FORWARD_DECAPSULATED, FORWARD_AS_IS, PASSTHROUGH, DUPLICATE_DECAPSULATED, DUPLICATE_AS_IS}** | Action when traffic rule matches. |
| dstInterface          | list                        | Destination interface parameters.|
| &gt; interfaceType    | enum **{TUNNEL, MAC, IP}**  | Match packets with same TC.      |
| &gt; tunnelInfo       | object                      | Tunnel parameters.       |
| &gt;&gt; tunnelType   | enum **{GTP_U, GRE}**       | Tunnel type.             |
| &gt;&gt; tunnelDstAddress | string                  | Destination IP address.  |
| &gt;&gt; tunnelSrcAddress | string                  | Source IP address.       |
| &gt; srcMacAddress    | string                      | Source MAC address       |
| &gt; dstMacAddress    | string                      | Destination MAC address. |
| &gt; dstIpAddress     | string                      | Destination IP address.  |
| state                 | enum **{ACTIVE, INACTIVE}** | State of the rule.       |

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
[
  {
    "trafficRuleId": "TrafficRule1",
    "filterType": "FLOW",
    "priority": 1,
    "trafficFilter": [
      {
        "srcAddress": [
          "192.158.1.1/28"
        ],
        "dstAddress": [
          "192.168.1.1/28"
        ],
        "srcPort": [
          "8080"
        ],
        "dstPort": [
          "8080"
        ],
        "protocol": [
          "TCP"
        ],
        "tag": null,
        "srcTunnelAddress": null,
        "tgtTunnelAddress": null,
        "srcTunnelPort": null,
        "dstTunnelPort": null,
        "qCI": 2,
        "dSCP": 0,
        "tC": 1
      }
    ],
    "action": "DROP",
    "dstInterface": [],
    "state": "ACTIVE"
  }
]
```

#### 2. Query a specific traffic rule

Query single traffic rule associated with an application.

URL

```
GET /mep/mec_app_support/v1/applications/{appInstanceId}/traffic_rules/{trafficRuleId}
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |
| trafficRuleId  | String | Traffic rule identifier(UUID) | path | Yes| 

Body parameters:

None

Example Request:

```
GET /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/traffic_rules/TrafficRule1
```

Return Parameters:

| Name                  | Type                        | Description              |
| --------------------- | --------------------------- | ------------------------ |
| trafficRuleId         | string                      | Traffic rule ID.         |
| filterType            | enum **{FLOW, PACKET}**     | Filter type.             |
| priority              | number (1 ~ 256)            | Priority of the traffic rule. If any conflict in the traffic rules, then higher the priority higher the precedence.       |
| trafficFilter         | list                        | List of traffic filters. |
| &gt; srcAddress       | list                        | List of source ip address.|
| &gt; dstAddress       | list                        | List of destination ip address.|
| &gt; srcPort          | list                        | List of source port address.|
| &gt; dstPort          | list                        | List of destination port address.|
| &gt; protocol         | list                        | List of protocols.       |
| &gt; tag              | list                        | List of tags.            |
| &gt; srcTunnelAddress | list                        | List of source tunnel address.   |
| &gt; tgtTunnelAddress | list                        | List of target tunnel address.   |
| &gt; srcTunnelPort    | list                        | List of source tunnel ports.     |
| &gt; dstTunnelPort    | list                        | List of destination tunnel ports.|
| &gt; qCI              | number                      | Match packets with same QCI.     |
| &gt; dSCP             | number                      | Match packets with same DSCP.    |
| &gt; tC               | number                      | Match packets with same TC.      |
| action                | enum **{DROP, FORWARD_DECAPSULATED, FORWARD_AS_IS, PASSTHROUGH, DUPLICATE_DECAPSULATED, DUPLICATE_AS_IS}** | Action when traffic rule matches. |
| dstInterface          | list                        | Destination interface parameters.|
| &gt; interfaceType    | enum **{TUNNEL, MAC, IP}**  | Match packets with same TC.      |
| &gt; tunnelInfo       | object                      | Tunnel parameters.       |
| &gt;&gt; tunnelType   | enum **{GTP_U, GRE}**       | Tunnel type.             |
| &gt;&gt; tunnelDstAddress | string                  | Destination IP address.  |
| &gt;&gt; tunnelSrcAddress | string                  | Source IP address.       |
| &gt; srcMacAddress    | string                      | Source MAC address       |
| &gt; dstMacAddress    | string                      | Destination MAC address. |
| &gt; dstIpAddress     | string                      | Destination IP address.  |
| state                 | enum **{ACTIVE, INACTIVE}** | State of the rule.       |

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
  "trafficRuleId": "TrafficRule1",
  "filterType": "FLOW",
  "priority": 1,
  "trafficFilter": [
    {
      "srcAddress": [
        "192.158.1.1/28"
      ],
      "dstAddress": [
        "192.168.1.1/28"
      ],
      "srcPort": [
        "8080"
      ],
      "dstPort": [
        "8080"
      ],
      "protocol": [
        "TCP"
      ],
      "tag": null,
      "srcTunnelAddress": null,
      "tgtTunnelAddress": null,
      "srcTunnelPort": null,
      "dstTunnelPort": null,
      "qCI": 2,
      "dSCP": 0,
      "tC": 1
    }
  ],
  "action": "DROP",
  "dstInterface": [],
  "state": "ACTIVE"
}
```

#### 3. Update a specific traffic rule

Modify the traffic rule associated with an application. 

URL

```
PUT /mep/mec_app_support/v1/applications/{appInstanceId}/traffic_rules/{trafficRuleId}
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |
| trafficRuleId  | String | Traffic rule identifier(UUID) | path | Yes| 

Body parameters:

| Name                  | Type                        | Description              |
| --------------------- | --------------------------- | ------------------------ |
| trafficRuleId         | string                      | Traffic rule ID.         |
| filterType            | enum **{FLOW, PACKET}**     | Filter type.             |
| priority              | number (1 ~ 256)            | Priority of the traffic rule. If any conflict in the traffic rules, then higher the priority higher the precedence.       |
| trafficFilter         | list                        | List of traffic filters. |
| &gt; srcAddress       | list                        | List of source ip address.|
| &gt; dstAddress       | list                        | List of destination ip address.|
| &gt; srcPort          | list                        | List of source port address.|
| &gt; dstPort          | list                        | List of destination port address.|
| &gt; protocol         | list                        | List of protocols.       |
| &gt; tag              | list                        | List of tags.            |
| &gt; srcTunnelAddress | list                        | List of source tunnel address.   |
| &gt; tgtTunnelAddress | list                        | List of target tunnel address.   |
| &gt; srcTunnelPort    | list                        | List of source tunnel ports.     |
| &gt; dstTunnelPort    | list                        | List of destination tunnel ports.|
| &gt; qCI              | number                      | Match packets with same QCI.     |
| &gt; dSCP             | number                      | Match packets with same DSCP.    |
| &gt; tC               | number                      | Match packets with same TC.      |
| action | enum **{DROP, FORWARD_DECAPSULATED, FORWARD_AS_IS, PASSTHROUGH, DUPLICATE_DECAPSULATED, DUPLICATE_AS_IS}** | Action when traffic rule matches. |
| dstInterface          | list                        | Destination interface parameters.|
| &gt; interfaceType    | enum **{TUNNEL, MAC, IP}**  | Match packets with same TC.      |
| &gt; tunnelInfo       | object                      | Tunnel parameters.       |
| &gt;&gt; tunnelType   | enum **{GTP_U, GRE}**       | Tunnel type.             |
| &gt;&gt; tunnelDstAddress | string                  | Destination IP address.  |
| &gt;&gt; tunnelSrcAddress | string                  | Source IP address.       |
| &gt; srcMacAddress    | string                      | Source MAC address       |
| &gt; dstMacAddress    | string                      | Destination MAC address. |
| &gt; dstIpAddress     | string                      | Destination IP address.  |
| state                 | enum **{ACTIVE, INACTIVE}** | State of the rule.       |

Example Request:

```
PUT /mep/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/traffic_rules/TrafficRule1
{
  "trafficRuleId": "TrafficRule1",
  "filterType": "FLOW",
  "priority": 1,
  "trafficFilter": [
    {
      "srcAddress": [
        "192.158.1.1/28"
      ],
      "dstAddress": [
        "192.168.1.1/28"
      ],
      "srcPort": [
        "8080"
      ],
      "dstPort": [
        "8080"
      ],
      "protocol": [
        "TCP"
      ],
      "tag": null,
      "srcTunnelAddress": null,
      "tgtTunnelAddress": null,
      "srcTunnelPort": null,
      "dstTunnelPort": null,
      "qCI": 2,
      "dSCP": 0,
      "tC": 1
    }
  ],
  "action": "DROP",
  "dstInterface": [],
  "state": "ACTIVE"
}
```

Return Parameters:

| Name                  | Type                        | Description              |
| --------------------- | --------------------------- | ------------------------ |
| trafficRuleId         | string                      | Traffic rule ID.         |
| filterType            | enum **{FLOW, PACKET}**     | Filter type.             |
| priority              | number (1 ~ 256)            | Priority of the traffic rule. If any conflict in the traffic rules, then higher the priority higher the precedence.       |
| trafficFilter         | list                        | List of traffic filters. |
| &gt; srcAddress       | list                        | List of source ip address.|
| &gt; dstAddress       | list                        | List of destination ip address.|
| &gt; srcPort          | list                        | List of source port address.|
| &gt; dstPort          | list                        | List of destination port address.|
| &gt; protocol         | list                        | List of protocols.       |
| &gt; tag              | list                        | List of tags.            |
| &gt; srcTunnelAddress | list                        | List of source tunnel address.   |
| &gt; tgtTunnelAddress | list                        | List of target tunnel address.   |
| &gt; srcTunnelPort    | list                        | List of source tunnel ports.     |
| &gt; dstTunnelPort    | list                        | List of destination tunnel ports.|
| &gt; qCI              | number                      | Match packets with same QCI.     |
| &gt; dSCP             | number                      | Match packets with same DSCP.    |
| &gt; tC               | number                      | Match packets with same TC.      |
| action                | enum **{DROP, FORWARD_DECAPSULATED, FORWARD_AS_IS, PASSTHROUGH, DUPLICATE_DECAPSULATED, DUPLICATE_AS_IS}** | Action when traffic rule matches. |
| dstInterface          | list                        | Destination interface parameters.|
| &gt; interfaceType    | enum **{TUNNEL, MAC, IP}**  | Match packets with same TC.      |
| &gt; tunnelInfo       | object                      | Tunnel parameters.       |
| &gt;&gt; tunnelType   | enum **{GTP_U, GRE}**       | Tunnel type.             |
| &gt;&gt; tunnelDstAddress | string                  | Destination IP address.  |
| &gt;&gt; tunnelSrcAddress | string                  | Source IP address.       |
| &gt; srcMacAddress    | string                      | Source MAC address       |
| &gt; dstMacAddress    | string                      | Destination MAC address. |
| &gt; dstIpAddress     | string                      | Destination IP address.  |
| state                 | enum **{ACTIVE, INACTIVE}** | State of the rule.       |

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
  "trafficRuleId": "TrafficRule1",
  "filterType": "FLOW",
  "priority": 1,
  "trafficFilter": [
    {
      "srcAddress": [
        "192.158.1.1/28"
      ],
      "dstAddress": [
        "192.168.1.1/28"
      ],
      "srcPort": [
        "8080"
      ],
      "dstPort": [
        "8080"
      ],
      "protocol": [
        "TCP"
      ],
      "tag": null,
      "srcTunnelAddress": null,
      "tgtTunnelAddress": null,
      "srcTunnelPort": null,
      "dstTunnelPort": null,
      "qCI": 2,
      "dSCP": 0,
      "tC": 1
    }
  ],
  "action": "DROP",
  "dstInterface": [],
  "state": "ACTIVE"
}
```

### Mm5 Interface for appd configurations


Using the Mm5 interfaces MECM can create, query, update or delete the appd configurations which includes multiple dns and traffic rules associated to an application. Implementation of this interface are specified in *ETSI GS MEC 010-1 V1.1.1* and *ETSI GS MEC 010-2 V2.1.1* documents.

#### 1. Create a new appd configurations

Create a new appd configuration and associate it with a MEC application. Each configuration can have thirty-two DNS rules and sixteen Traffic rules. There can be only one appd configuration per application at a time and the appd configuration is an asynchronous in nature. Once the request is received in the mep, after validation mep will start a task to handle multiple dns and traffic rules and return a task id to the caller of the API. Using the task-id the caller can check the status of the operation at any time.

URL

```
POST /mepcfg/app_lcm/v1/applications/{appInstanceId}/appd_configuration
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |

Body parameters:

| Name                      | Type                        | Description              | Required      |
| ------------------------- | --------------------------- | ------------------------ | ------------- |
| appTrafficRule            | list                        | List of traffic rules. Max 16.| No |
| &gt; trafficRuleId        | string                      | Traffic rule ID.         | Yes |
| &gt; filterType           | enum **{FLOW, PACKET}**     | Filter type.             | Yes |
| &gt; priority             | number (1 ~ 256)            | Priority of the traffic rule. If any conflict in the traffic rules, then higher the priority higher the precedence.             | Yes |
| &gt; trafficFilter        | list                        | List of traffic filters. Max 16.| No |
| &gt;&gt; srcAddress       | list                        | List of source ip address. Max 64.| No |
| &gt;&gt; dstAddress       | list                        | List of destination ip address. Max 64.| No |
| &gt;&gt; srcPort          | list                        | List of source port address.| No |
| &gt;&gt; dstPort          | list                        | List of destination port address.| No |
| &gt;&gt; protocol         | list                        | List of protocols. Max 8.| Yes |
| &gt;&gt; tag              | list                        | List of tags. Max 8.| Yes |
| &gt;&gt; srcTunnelAddress | list                        | List of source tunnel address. | No |
| &gt;&gt; tgtTunnelAddress | list                        | List of target tunnel address. | No |
| &gt;&gt; srcTunnelPort    | list                        | List of source tunnel ports. | No |
| &gt;&gt; dstTunnelPort    | list                        | List of destination tunnel ports. | No |
| &gt;&gt; qCI              | number                      | Match packets with same QCI. | No |
| &gt;&gt; dSCP             | number                      | Match packets with same DSCP. | No |
| &gt;&gt; tC               | number                      | Match packets with same TC. | No |
| &gt; action | enum **{DROP, FORWARD_DECAPSULATED, FORWARD_AS_IS, PASSTHROUGH, DUPLICATE_DECAPSULATED, DUPLICATE_AS_IS}** | Action when traffic rule matches. | Yes |
| &gt; dstInterface         | list                        | Destination interface parameters. Max 2. | No |
| &gt;&gt; interfaceType    | enum **{TUNNEL, MAC, IP}**  | Match packets with same TC. | Yes |
| &gt;&gt; tunnelInfo       | object                      | Tunnel parameters. | No |
| &gt;&gt;&gt; tunnelType   | enum **{GTP_U, GRE}**       | Tunnel type. | Yes |
| &gt;&gt;&gt; tunnelDstAddress   | string                | Destination IP address. | No |
| &gt;&gt;&gt; tunnelSrcAddress   | string                | Source IP address. | No |
| &gt;&gt; srcMacAddress    | string                      | Source MAC address | No |
| &gt;&gt; dstMacAddress    | string                      | Destination MAC address. | No |
| &gt;&gt; dstIpAddress     | string                      | Destination IP address. | No |
| &gt; state                | enum **{ACTIVE, INACTIVE}** | State of the rule. | No |
| appDNSRule                | list                        | List of DNS rules. Max 32.| No |
| &gt; dnsRuleId            | string                      | DNS rule ID.         | Yes |
| &gt; domainName           | string                      | Domain name.         | Yes |
| &gt; ipAddressType        | enum **{IPv4, IPv6}**       | IP address type.     | Yes |
| &gt; ipAddress            | string                      | IP address.          | Yes |
| &gt; ttl                  | number                      | Time To Live value.  | Yes |
| &gt; state                | enum **{ACTIVE, INACTIVE}** | Rule state.          | Yes |
| appSupportMp1             | bool                        | Whether Mp1 interface is supported. | No |
| appName                   | string                      | Application name.    | Yes |


Example Request:

```
POST /mepcfg/app_lcm/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/appd_configuration
{
  "appTrafficRule": [
    {
      "trafficRuleId": "TrafficRule1",
      "filterType": "FLOW",
      "priority": 1,
      "trafficFilter": [
        {
          "srcAddress": [
            "192.158.1.1/28"
          ],
          "dstAddress": [
            "192.168.1.1/28"
          ],
          "srcPort": [
            "8080"
          ],
          "dstPort": [
            "8080"
          ],
          "protocol": [
            "TCP"
          ],
          "qCI": 1,
          "dSCP": 0,
          "tC": 1
        }
      ],
      "action": "DROP",
      "state": "ACTIVE"
    }
  ],
  "appDNSRule": [
    {
      "dnsRuleId": "dnsRule1",
      "domainName": "facerecgservice.com",
      "ipAddressType": "IP_V4",
      "ipAddress": "192.168.147.240",
      "ttl": 30,
      "state": "ACTIVE"
    }
  ],
  "appSupportMp1": true,
  "appName": "abc1"
}
```

Return Parameters:

| Name          | Type    | Description                 |
| ------------- | ------- | --------------------------- |
| taskId        | string  | Task ID                     |
| appInstanceId | string  | Application instance ID     |
| configResult  | string  | Configuration result        |
| configPhase   | string  | Progress percentage         |
| Detailed      | string  | Detailed reason             |


Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
  "taskId": "d464dd0a-d927-4baf-bc2c-d902fb0b2c73",
  "appInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f",
  "configResult": "PROCESSING",
  "configPhase": "0",
  "Detailed": "Operation In progress"
}
```

#### 2. Query appd configuration

Query appd configuration associated with an application.

URL

```
GET /mepcfg/app_lcm/v1/applications/{appInstanceId}/appd_configuration
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |

Body parameters:

None

Example Request:

```
GET /mepcfg/app_lcm/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/appd_configuration
```

Return Parameters:

| Name                      | Type                        | Description              |
| ------------------------- | --------------------------- | ------------------------ |
| appTrafficRule            | list                        | List of traffic rules.   |
| &gt; trafficRuleId        | string                      | Traffic rule ID.         |
| &gt; filterType           | enum **{FLOW, PACKET}**     | Filter type.             |
| &gt; priority             | number (1 ~ 256)            | Priority of the traffic rule. If any conflict in the traffic rules, then higher the priority higher the precedence.       |
| &gt; trafficFilter        | list                        | List of traffic filters. |
| &gt;&gt; srcAddress       | list                        | List of source ip address.|
| &gt;&gt; dstAddress       | list                        | List of destination ip address.|
| &gt;&gt; srcPort          | list                        | List of source port address.|
| &gt;&gt; dstPort          | list                        | List of destination port address.|
| &gt;&gt; protocol         | list                        | List of protocols.       |
| &gt;&gt; tag              | list                        | List of tags.            |
| &gt;&gt; srcTunnelAddress | list                        | List of source tunnel address.   |
| &gt;&gt; tgtTunnelAddress | list                        | List of target tunnel address.   |
| &gt;&gt; srcTunnelPort    | list                        | List of source tunnel ports.     |
| &gt;&gt; dstTunnelPort    | list                        | List of destination tunnel ports.|
| &gt;&gt; qCI              | number                      | Match packets with same QCI.     |
| &gt;&gt; dSCP             | number                      | Match packets with same DSCP.    |
| &gt;&gt; tC               | number                      | Match packets with same TC.      |
| &gt; action | enum **{DROP, FORWARD_DECAPSULATED, FORWARD_AS_IS, PASSTHROUGH, DUPLICATE_DECAPSULATED, DUPLICATE_AS_IS}** | Action when traffic rule matches. |
| &gt; dstInterface         | list                        | Destination interface parameters.|
| &gt;&gt; interfaceType    | enum **{TUNNEL, MAC, IP}**  | Match packets with same TC.      |
| &gt;&gt; tunnelInfo       | object                      | Tunnel parameters.       |
| &gt;&gt;&gt; tunnelType   | enum **{GTP_U, GRE}**       | Tunnel type.             |
| &gt;&gt;&gt; tunnelDstAddress   | string                | Destination IP address.  |
| &gt;&gt;&gt; tunnelSrcAddress   | string                | Source IP address.       |
| &gt;&gt; srcMacAddress    | string                      | Source MAC address       |
| &gt;&gt; dstMacAddress    | string                      | Destination MAC address. |
| &gt;&gt; dstIpAddress     | string                      | Destination IP address.  |
| &gt; state                | enum **{ACTIVE, INACTIVE}** | State of the rule.       |
| appDNSRule                | list                        | List of DNS rules.       |
| &gt; dnsRuleId            | string                      | DNS rule ID.             |
| &gt; domainName           | string                      | Domain name.             |
| &gt; ipAddressType        | enum **{IPv4, IPv6}**       | IP address type.         |
| &gt; ipAddress            | string                      | IP address.              |
| &gt; ttl                  | number                      | Time To Live value.      |
| &gt; state                | enum **{ACTIVE, INACTIVE}** | Rule state.              |
| appSupportMp1             | bool                        | Whether Mp1 interface is supported. |
| appName                   | string                      | Application name.        | 

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
  "appTrafficRule": [
    {
      "trafficRuleId": "TrafficRule1",
      "filterType": "FLOW",
      "priority": 1,
      "trafficFilter": [
        {
          "srcAddress": [
            "192.158.1.1/28"
          ],
          "dstAddress": [
            "192.168.1.1/28"
          ],
          "srcPort": [
            "8080"
          ],
          "dstPort": [
            "8080"
          ],
          "protocol": [
            "TCP"
          ],
          "tag": null,
          "srcTunnelAddress": null,
          "tgtTunnelAddress": null,
          "srcTunnelPort": null,
          "dstTunnelPort": null,
          "qCI": 2,
          "dSCP": 0,
          "tC": 1
        }
      ],
      "action": "DROP",
      "dstInterface": [],
      "state": "ACTIVE"
    }
  ],
  "appDNSRule": [
    {
      "dnsRuleId": "dnsRule1",
      "domainName": "facerecgservice.com",
      "ipAddressType": "IP_V4",
      "ipAddress": "192.168.147.240",
      "ttl": 30,
      "state": "ACTIVE"
    }
  ],
  "appSupportMp1": true,
  "appName": "abc1"
}
```
#### 3. Modify appd configuration

Appd configuration for each applications can be configured using this interface. MEP will take the difference of existing configuration and the new modification input and then act on create/modify/delete of dns and/or traffic rules.

URL

```
PUT /mepcfg/app_lcm/v1/applications/{appInstanceId}/appd_configuration
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |

Body parameters:

| Name                      | Type                        | Description              | Required      |
| ------------------------- | --------------------------- | ------------------------ | ------------- |
| appTrafficRule            | list                        | List of traffic rules. Max 16.| No |
| &gt; trafficRuleId        | string                      | Traffic rule ID.         | Yes |
| &gt; filterType           | enum **{FLOW, PACKET}**     | Filter type.             | Yes |
| &gt; priority             | number (1 ~ 256)            | Priority of the traffic rule. If any conflict in the traffic rules, then higher the priority higher the precedence.             | Yes |
| &gt; trafficFilter        | list                        | List of traffic filters. Max 16.| No |
| &gt;&gt; srcAddress       | list                        | List of source ip address. Max 64.| No |
| &gt;&gt; dstAddress       | list                        | List of destination ip address. Max 64.| No |
| &gt;&gt; srcPort          | list                        | List of source port address.| No |
| &gt;&gt; dstPort          | list                        | List of destination port address.| No |
| &gt;&gt; protocol         | list                        | List of protocols. Max 8.| Yes |
| &gt;&gt; tag              | list                        | List of tags. Max 8.| Yes |
| &gt;&gt; srcTunnelAddress | list                        | List of source tunnel address. | No |
| &gt;&gt; tgtTunnelAddress | list                        | List of target tunnel address. | No |
| &gt;&gt; srcTunnelPort    | list                        | List of source tunnel ports. | No |
| &gt;&gt; dstTunnelPort    | list                        | List of destination tunnel ports. | No |
| &gt;&gt; qCI              | number                      | Match packets with same QCI. | No |
| &gt;&gt; dSCP             | number                      | Match packets with same DSCP. | No |
| &gt;&gt; tC               | number                      | Match packets with same TC. | No |
| &gt; action | enum **{DROP, FORWARD_DECAPSULATED, FORWARD_AS_IS, PASSTHROUGH, DUPLICATE_DECAPSULATED, DUPLICATE_AS_IS}** | Action when traffic rule matches. | Yes |
| &gt; dstInterface         | list                        | Destination interface parameters. Max 2. | No |
| &gt;&gt; interfaceType    | enum **{TUNNEL, MAC, IP}**  | Match packets with same TC. | Yes |
| &gt;&gt; tunnelInfo       | object                      | Tunnel parameters. | No |
| &gt;&gt;&gt; tunnelType   | enum **{GTP_U, GRE}**       | Tunnel type. | Yes |
| &gt;&gt;&gt; tunnelDstAddress   | string                | Destination IP address. | No |
| &gt;&gt;&gt; tunnelSrcAddress   | string                | Source IP address. | No |
| &gt;&gt; srcMacAddress    | string                      | Source MAC address | No |
| &gt;&gt; dstMacAddress    | string                      | Destination MAC address. | No |
| &gt;&gt; dstIpAddress     | string                      | Destination IP address. | No |
| &gt; state                | enum **{ACTIVE, INACTIVE}** | State of the rule. | No |
| appDNSRule                | list                        | List of DNS rules. Max 32.| No |
| &gt; dnsRuleId            | string                      | DNS rule ID.         | Yes |
| &gt; domainName           | string                      | Domain name.         | Yes |
| &gt; ipAddressType        | enum **{IPv4, IPv6}**       | IP address type.     | Yes |
| &gt; ipAddress            | string                      | IP address.          | Yes |
| &gt; ttl                  | number                      | Time To Live value.  | Yes |
| &gt; state                | enum **{ACTIVE, INACTIVE}** | Rule state.          | Yes |
| appSupportMp1             | bool                        | Whether Mp1 interface is supported. | No |
| appName                   | string                      | Application name.    | Yes |

Example Request:

```
PUT /mepcfg/app_lcm/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/appd_configuration
{
  "appTrafficRule": [
    {
      "trafficRuleId": "TrafficRule1",
      "filterType": "FLOW",
      "priority": 1,
      "trafficFilter": [
        {
          "srcAddress": [
            "192.158.1.1/28"
          ],
          "dstAddress": [
            "192.168.1.1/28"
          ],
          "srcPort": [
            "8080"
          ],
          "dstPort": [
            "8080"
          ],
          "protocol": [
            "TCP"
          ],
          "qCI": 1,
          "dSCP": 0,
          "tC": 1
        }
      ],
      "action": "DROP",
      "state": "ACTIVE"
    }
  ],
  "appDNSRule": [
    {
      "dnsRuleId": "dnsRule1",
      "domainName": "facerecgservice.com",
      "ipAddressType": "IP_V4",
      "ipAddress": "192.168.147.240",
      "ttl": 30,
      "state": "ACTIVE"
    }
  ],
  "appSupportMp1": true,
  "appName": "abc1"
}
```

Return Parameters:

| Name          | Type    | Description                 |
| ------------- | ------- | --------------------------- |
| taskId        | string  | Task ID                     |
| appInstanceId | string  | Application instance ID     |
| configResult  | string  | Configuration result        |
| configPhase   | string  | Progress percentage         |
| Detailed      | string  | Detailed reason             |

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
  "taskId": "d464dd0a-d927-4baf-bc2c-d902fb0b2c73",
  "appInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f",
  "configResult": "PROCESSING",
  "configPhase": "0",
  "Detailed": "Operation In progress"
}
```

#### 4. Delete appd configuration

Delete appd configuration request.

URL

```
DELETE /mepcfg/app_lcm/v1/applications/{appInstanceId}/appd_configuration
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |

Body parameters:

None

Example Request:

```
DELETE /mepcfg/app_lcm/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/appd_configuration
```

Return Parameters:

| Name          | Type    | Description                 |
| ------------- | ------- | --------------------------- |
| taskId        | string  | Task ID                     |
| appInstanceId | string  | Application instance ID     |
| configResult  | string  | Configuration result        |
| configPhase   | string  | Progress percentage         |
| Detailed      | string  | Detailed reason             |


Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
  "taskId": "d464dd0a-d927-4baf-bc2c-d902fb0b2c73",
  "appInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f",
  "configResult": "PROCESSING",
  "configPhase": "0",
  "Detailed": "Operation In progress"
}
```

#### 5. Query task status

Once the appd configuration create, modify or delete is submitted, mep will create a task and return a task id to the caller and the caller can periodically check the status of the task using this id. This interface calls the mep for the task status.

URL

```
GET /mepcfg/app_lcm/v1/tasks/{taskId}/appd_configuration
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| taskId  | String | Task ID(UUID)  | path |  Yes   |

Body parameters:

None

Example Request:

```
GET /mepcfg/app_lcm/v1/tasks/d464dd0a-d927-4baf-bc2c-d902fb0b2c73/appd_configuration
```

Return Parameters:

| Name          | Type    | Description                 |
| ------------- | ------- | --------------------------- |
| taskId        | string  | Task ID                     |
| appInstanceId | string  | Application instance ID     |
| configResult  | string  | Configuration result        |
| configPhase   | string  | Progress percentage         |
| Detailed      | string  | Detailed reason             |


Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
  "taskId": "d464dd0a-d927-4baf-bc2c-d902fb0b2c73",
  "appInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f",
  "configResult": "SUCCESS",
  "configPhase": "100",
  "Detailed": ""
}
```

### Query Platform Capabilities(Services)

MEP supports for querying the capabilities(services) registered with it. These capability information will be used by the MECM to display it to the user on its portal. MECM send the capability query to MEP over Mm5 interface.

#### 1. Query all capabilities

Interface to query all capabilities. This interface return the capability list registered to the queried MEP server along with the consumers of it.

URL

```
GET /mepcfg/mec_platform_config/v1/capabilities
```

Request parameters:

None

Body parameters:

None

Example Request:

```
GET /mepcfg/mec_platform_config/v1/capabilities
```

Return Parameters:

| Name           | Type                        | Description              |
| -------------- | --------------------------- | ------------------------ |
| capabilityId   | String                      | Capability/Service id    |
| capabilityName | String                      | Capability/Service name  |
| status         | Enum **{ACTIVE, INACTIVE}** | Status                   |
| version        | String                      | Version info             |
| consumers      | Array[Object]               | Consumer object list     |
| &gt;applicationInstanceId | String           | Consumer application id  |

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
[
    {
        "capabilityId": "16384563dca094183778a41ea7701d15",
        "capabilityName": "FaceRegService",
        "status": "ACTIVE",
        "version": "4.5.8",
        "consumers": [
            {
                "applicationInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f"
            },
            {
                "applicationInstanceId": "f05a5591-d8f2-4f89-8c0b-8cea6d45712e"
            },
            {
                "applicationInstanceId": "86dfc97d-325e-4feb-ac4f-280a0ba42513"
            }
        ]
    },
    {
        "capabilityId": "f7e898d1c9ea9edd05e1181bc09afc5e",
        "capabilityName": "Location",
        "status": "ACTIVE",
        "version": "v1.19",
        "consumers": [
            {
                "applicationInstanceId": "88922760-861b-4578-aae5-77b8fcb06142"
            }
        ]
    }
]
```

#### 2. Query individual capability

Interface to query an individual capability from MEP. This interface return a capability along with the consumers of it.

URL

```
GET /mepcfg/mec_platform_config/v1/capabilities/{capabilityId}
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| capabilityId  | String | Capability ID（UUID）  | path |  Yes   |

Body parameters:

None

Example Request:

```
GET /mepcfg/mec_platform_config/v1/capabilities/16384563dca094183778a41ea7701d15
```

Return Parameters:

| Name           | Type                        | Description              |
| -------------- | --------------------------- | ------------------------ |
| capabilityId   | String                      | Capability/Service id    |
| capabilityName | String                      | Capability/Service name  |
| status         | Enum **{ACTIVE, INACTIVE}** | Status                   |
| version        | String                      | Version info             |
| consumers      | Array[Object]               | Consumer object list     |
| &gt;applicationInstanceId | String           | Consumer application id  |

Return Code: 200 OK

Example Response:
```
HTTP/1.1 200 OK
{
    "capabilityId": "16384563dca094183778a41ea7701d15",
    "capabilityName": "FaceRegService",
    "status": "ACTIVE",
    "version": "4.5.8",
    "consumers": [
        {
            "applicationInstanceId": "5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f"
        },
        {
            "applicationInstanceId": "f05a5591-d8f2-4f89-8c0b-8cea6d45712e"
        },
        {
            "applicationInstanceId": "86dfc97d-325e-4feb-ac4f-280a0ba42513"
        }
    ]
}
```

### 异常状态码
|**HTTP状态码**|**描述**|
|---|---|
|400|错误的请求，用来表示请求的参数不正确。|
|401|当前请求需要鉴权认证。|
|403|禁止当前操作。|
|404|请求的资源未被发现。|
|412|请求中的先决条件验证失败。|
|414|请求的URI超长，服务器拒绝处理请求。|
|500|内部服务器错误。|
|503|服务不可用。|

## Dns-Server

Mep has a programmable dns server which can perform the name resolution of the MEC applications. This management interface of the dns server is handled using a rest interface and this section cover the details of this interface.

### 1. Create/Set new entry

DNS entry can be added or modified using this interface. Once a record is added/modified, the resource will be available for the device application to query.

Using this interface multiple records on multiple zones can be submitted together.

URL

```
PUT /mep/dns_server_mgmt/v1/rrecord
```

Request parameters:

None

Body parameters:

| Name          | Type                        | Description              | Required      |
| ------------- | --------------------------- | ------------------------ | ------------- |
| zone          | string                      | Zone name | Yes |
| name          | string                      | Domain name | Yes |
| type          | enum **{A, AAAA}**          | DNS resource type, A in case of Ipv4 and AAAA for Ipv6 | Yes |
| class         | enum **{IN}**               | Resource record class | Yes on create |
| ttl           | int (non-zero value)        | Record TTL value | Yes on create |
| rData         | list(string)                | IP Address list, Ip type must match with the **type** field | Yes on create |

Example Request:

```
PUT /mep/dns_server_mgmt/v1/rrecord
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

Return Parameters:

None

Return Code: 200 Success

Example Response:
```
HTTP/1.1 200 Success
```

### 2. Delete an entry

DNS entry can be deleted from the dns-server using this interface.

URL

```
DELETE /mep/dns_server_mgmt/v1/rrecord/{fqdn}/{rrtype}
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| fqdn  | String | Fully Qualified Domain Name | path |  Yes   |
| rrtype      | String | Resource record type of the entry(A or AAAA). | path | Yes |

Body parameters:

None

Example Request:

```
DELETE /mep/dns_server_mgmt/v1/rrecord/www.example.com./A
```

Return Parameters:

None

Return Code: 200 Success

Example Response:
```
HTTP/1.1 200 Success
```
## MEP Agent
Mep agent is a component which run as side car with application. It helps to get authenticaion token, do service registration, send heartbeat on behalf of application.

#### 1. Get token
Applicaiontion can call this API to get authentication token from mepauth.
URL
```
GET /mep-agent/v1/token
```
Request parameters:

 | **Name** | **Type** | **Description** | **IN** | **Required** |
 | --- | --- | --- | --- | --- |
 | Content-Type |   String  | MIME type, fill in "application/json"                        |               header  | Yes|

Body parameters:

None

Example request:

```
GET /mep-agent/v1/token

{
  "header": [
    {
      "key": "Content-Type",
      "value": "application/json"
    }
  ]
}
```

Return parameters:

Return code: 200 OK

|Name     |       Type  |   Description   |               Required|
|---|---|---|---|
|access\_token |  String  | Token|                 Yes|
|token\_type     |String   |Token Type（Bearer）|   Yes|
|expires\_in    | int     | Expire time             | Yes|

Return example:

```
HTTP/1.1 200 OK
{
	"access_token":"xxxx",
	"token_type":"Bearer",
	"expires_in":"3600"
}

```
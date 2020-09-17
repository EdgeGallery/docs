MEP Interfaces
==============
- [MEP Interfaces](#mep-interfaces)
  - [MEP 接口简介](#mep-接口简介)
  - [MEP-auth模块接口](#mep-auth模块接口)
    - [服务认证接口](#服务认证接口)
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
    - [异常状态码](#异常状态码)
    - [DNS rule configuration interfaces](#dns-rule-configuration-interfaces)
      - [1. Mp1 Interface for DNS configurations](#1-mp1-interface-for-dns-configurations)
        - [1.1 Query all dns rules](#11-query-all-dns-rules)
        - [1.2 Query a specific dns rule](#12-query-a-specific-dns-rule)
        - [1.3 Update a specific dns rule](#13-update-a-specific-dns-rule)
      - [2. Mm5 Interface for DNS configurations](#2-mm5-interface-for-dns-configurations)
        - [2.1 Create a new dns rule](#21-create-a-new-dns-rule)
        - [2.2 Query all dns rules](#22-query-all-dns-rules)
        - [2.3 Query a specific dns rule](#23-query-a-specific-dns-rule)
        - [2.4 Modify a dns rule](#24-modify-a-dns-rule)
        - [2.5 Delete a dns rule](#25-delete-a-dns-rule)
  - [Dns-Server](#dns-server)
    - [1. Create/Set new entry](#1-createset-new-entry)
    - [2. Delete an entry](#2-delete-an-entry)

## MEP 接口简介

MEP主要包含MEP-server和MEP-auth两个主要功能模块。截止到v0.9版本，MEP server接口分为两类，一类为遵循ETSI MEC 011 v2.1.1标准的Mp1接口，主要为App提供服务注册发现，App状态通知订阅，Dns规则获取等功能；另一类为Mm5接口，主要为MECM/MEPM提供配置管理功能。MEP auth目前主要作为鉴权模块，为App提供token申请发放功能。

## MEP-auth模块接口



### 服务认证接口

应用通过AK/SK向LDVS进行鉴权认证，认证通过后返回token，每个token具有有效期（1小时），token分配方在有效期结束后将收回token，当携带过期的token的HTTP请求到达的时候，将被以状态码401返回；此时token携带方需要重新进行token获取。当token还在有效期内，token携带方再次使用相同的用户获取token时返回当前仍然有效的token。

URL：

```
POST https://{HOST}:{PORT}/{KONG_MEPAUTH_ROUTE}/mepauth/v1/token
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

注：当前接口实现没有使用CanonicalQueryString和RequestPayloa（body体）信息。

请求示例：

```
POST https://{HOST}:8443/mepauth/mepauth/v1/token

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

## MEP-server 接口

### 应用服务管理相关接口

#### 1. 查询应用服务

查询指定APP的服务列表

URL

```
GET https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services
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
GET https://{HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services
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
    "isLocal": true
  }
]
}

```

#### 2. 查询应用指定服务

查询对应APP的指定服务

URL

```
GET https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}
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
GET https://{HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460
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
    "isLocal": true
 }
```

#### 3. 注册应用服务

为指定APP注册服务。

URL

```
POST https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services
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

请求示例：

```
POST https://{HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services
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
     "isLocal": true
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
    "isLocal": true
}
```

**注：单个应用注册的服务数量应不超过50个，超出后服务将报错。**

#### 4. 更新应用服务

更新APP指定服务信息。

URL

```
PUT https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}
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

请求示例：

```
PUT https://{HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460
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
            "isLocal": true
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
    "isLocal": true
}

```

#### 5. 删除应用服务

删除APP指定服务。

URL

```
DELETE https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}
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
DELETE https://{HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460
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
GET https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions
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
GET https://{HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
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
POST https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions
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
POST https://{HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
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
DELETE https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
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
DELETE https://{HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
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
GET https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
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
GET https://{HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
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
GET https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/subscriptions
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
GET https://{HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
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
POST https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/subscriptions
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
POST https://{HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
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
DELETE https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
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
DELETE https://{HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
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
GET https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
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
GET https://{HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
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



### 异常状态码
| **HTTP状态码** | **描述** |
| --- | --- |
| 400  | 错误的请求，用来表示请求的参数不正确。 |
| 401  | 当前请求需要鉴权认证。 |
| 403   | 禁止当前操作。 |
| 404  | 请求的资源未被发现。 |
| 412  | 请求中的先决条件验证失败。 |
| 414  | 请求的URI超长，服务器拒绝处理请求。 |
| 500  | 内部服务器错误。 |
| 503  | 服务不可用。 |


### DNS rule configuration interfaces

DNS rules can be configured using both Mp1 and Mm5 interfaces.

#### 1. Mp1 Interface for DNS configurations

Uisng the Mp1 interfaces mec apps can query and activate/deactivate dns rules associated to it. Implementation of this interface are as per the *ETSI GS MEC 011 V2.1.1* document.

##### 1.1 Query all dns rules

Query all DNS rules associated with an application.

URL

```
GET https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/dns_rules
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
GET https://{HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules
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

##### 1.2 Query a specific dns rule

Query single DNS rule associated with an application.

URL

```
GET https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/dns_rules/{dnsRuleId}
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
GET https://{HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules/bbc14ed1-92f4-457f-95e8-93aa723a9f12
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

##### 1.3 Update a specific dns rule

Modify the state of a rule associated with an application. This interface can modify the state from **ACTIVE** to **INACTIVE** or vice versa. No other field can be modified using this interface.

URL

```
PUT https://{HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/dns_rules/{dnsRuleId}
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
PUT https://{HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules/bbc14ed1-92f4-457f-95e8-93aa723a9f12
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "ACTIVE"
}

or

PUT https://{HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules/bbc14ed1-92f4-457f-95e8-93aa723a9f12
{
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

#### 2. Mm5 Interface for DNS configurations


Uisng the Mm5 interfaces MECM can create, query, update or delete the dns rules associated to and application. Implementation of this interface are specified in *ETSI GS MEC 010-1 V1.1.1* and *ETSI GS MEC 010-2 V2.1.1* documents.

##### 2.1 Create a new dns rule

Create a new DNS rule and associate it with a MEC application. DNS rule id will be generated by the mep-server, thus no need to pass this field during the creation.

URL

```
POST https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |

Body parameters:

| Name          | Type                        | Description              | Required      |
| ------------- | --------------------------- | ------------------------ | ------------- |
| domainName    | string                      | MEC app domain name      | Yes |
| ipAddressType | enum **{IP_V4, IP_V6}**     | MEC app ip address type  | Yes |
| ipAddress     | string                      | MEC app ip address       | Yes |
| ttl           | int (non-zero value)        | TTL value                | Yes |
| state         | enum **{ACTIVE, INACTIVE}** | State                    | Yes |

Example Request:

```
POST https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules
{
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

##### 2.2 Query all dns rules

Query all DNS rules associated with an application.

URL

```
GET https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |

Body parameters:

None

Example Request:

```
GET https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules
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

##### 2.3 Query a specific dns rule

Query single DNS rule associated with an application.

URL

```
GET https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules/{dnsRuleId}
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |
| dnsRuleId      | String | DNS rule identifier(UUID) | path | Yes |

Body parameters:

None

Example Request:

```
GET https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules/20a19292-384c-4d44-ba64-a8e8269f0f25
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
    "dnsRuleId": "20a19292-384c-4d44-ba64-a8e8269f0f25",
    "domainName": "voicerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.27.48",
    "ttl": 30,
    "state": "ACTIVE"
}
```

##### 2.4 Modify a dns rule

Modify the state of a rule associated with an application. This interface can modify the state from **ACTIVE** to **INACTIVE** or vice versa. No other field can be modified using this interface.

URL

```
PUT https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules/{dnsRuleId}
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |
| dnsRuleId      | String | DNS rule identifier(UUID) | path | Yes |

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
PUT https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules/bbc14ed1-92f4-457f-95e8-93aa723a9f12
{
    "dnsRuleId": "bbc14ed1-92f4-457f-95e8-93aa723a9f12",
    "domainName": "facerecgservice.com",
    "ipAddressType": "IP_V4",
    "ipAddress": "192.168.147.240",
    "ttl": 30,
    "state": "ACTIVE"
}

or 

PUT https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules/bbc14ed1-92f4-457f-95e8-93aa723a9f12
{
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

##### 2.5 Delete a dns rule

Delete a DNS rule associated to an application.

URL

```
DELETE https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/{appInstanceId}/dns_rules/{dnsRuleId}
```

Request parameters:

| **Name** | **Type** | **Description** | **IN** | **Required** |
| --- | --- | --- | --- | --- |
| Authorization  | String | Token信息，格式：Bearer token信息  | header |  Yes   |
| appInstanceId  | String | APP实例ID(UUID)  | path |  Yes   |
| dnsRuleId      | String | DNS rule identifier(UUID) | path | Yes |

Body parameters:

None

Example Request:

```
DELETE https://{HOST}:{PORT}/mepcfg/mec_app_config/v1/rules/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/dns_rules/20a19292-384c-4d44-ba64-a8e8269f0f25
```

Return Parameters:

None

Return Code: 204 No Content

Example Response:
```
HTTP/1.1 204 No Content
```

## Dns-Server

Mep has a programmable dns server which can perform the name resolution of the MEC applications. This management interface of the dns server is handled using a rest interface and this section cover the details of this interface.

### 1. Create/Set new entry

DNS entry can be added or modified using this interface. Once a record is added/modified, the resource will be available for the device application to query.

Using this interface multiple records on multiple zones can be submitted together.

URL

```
PUT https://{HOST}:{PORT}/mep/dns_server_mgmt/v1/rrecord
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
PUT https://{HOST}:{PORT}/mep/dns_server_mgmt/v1/rrecord
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
DELETE https://{HOST}:{PORT}/mep/dns_server_mgmt/v1/rrecord/{fqdn}/{rrtype}
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
DELETE https://{HOST}:{PORT}/mep/dns_server_mgmt/v1/rrecord/www.example.com./A
```

Return Parameters:

None

Return Code: 200 Success

Example Response:
```
HTTP/1.1 200 Success
```
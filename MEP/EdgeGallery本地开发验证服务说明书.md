*   [快速入门](#快速入门)
    *   [产品描述](#产品描述)
        *   [背景与趋势](#背景与趋势)
        *   [产品定位](#产品定位)
    *   [系统原理](#系统原理)
        *   [系统架构](#系统架构)
    *   [系统默认帐号](#系统默认帐号)
    *   [数据库默认帐号](#数据库默认帐号)
*   [特性](#特性)
*   [使用指南](#使用指南)
    *   [基于EG-LDVS的应用开发指南](#基于EG-LDVS的应用开发指南)
        *   [应用接口调用流程](#应用接口调用流程)
        *   [API接口说明](#API接口说明)
            *   [接口使用约束](#接口使用约束)
            *   [服务认证接口](#服务认证接口)
            *   [应用服务管理相关接口](#应用服务管理相关接口)
            *   [可用事件订阅相关接口](#可用事件订阅相关接口)
            *   [终止事件订阅相关接口](#终止事件订阅相关接口)
            *   [异常状态码](#异常状态码)
    *   [部署指南](#部署指南)
        *   [前置条件](#前置条件)
        *   [EG-LDVS MEP部署指导](#EG-LDVS-MEP部署指导)
        *   [EG-LDVS MEP-agent部署指导](#EG-LDVS-MEP-agent部署指导)
    *   [卸载指南](#卸载指南)


快速入门
========

产品描述
--------

### 背景与趋势

随着物联网、人工智能、云计算、移动互联网、大数据和大视频等产业技术的蓬勃发展，以及围绕ICT开放生态的成熟，网络资源和计算能力逐步朝着资源集中化和边缘化方向演进。

多接入边缘计算MEC（Multi-access Edge
Computing）为典型的资源边缘化模式，在移动网络边缘提供IT服务环境和云计算能力，实时完成移动网络边缘的业务处理。MEC将随着CT和IT深度融合趋势，物联网的兴起、人工智能技术的发展，以及企业对生产数据的安全性、实时性的诉求，持续快速的发展。

在MEC场景下，海量的应用将运行在网络边缘进行业务处理，并且应用能够使用网络的开放能力，应用之间也能够互相进行能力提供和消费。

![输入图片说明](https://images.gitee.com/uploads/images/2020/0805/102832_c7372e58_5504908.png "164204_1eeb56cc_5504908.png")

### 产品定位

EG-LDVS(EdgeGallery-Location Development Verfication Service 边缘侧-本地开发验证服务)
是EdgeGallery生态的一个重要部件，通过实现MEP相关接口以及行为，支撑应用开发者能够基于本地开发验证服务进行开发。LDVS基于MP1接口的实现，为应用开发者提供本地开发以及自验证的能力。作为提供给边缘应用开发者的开发测试套件，EG-LDVS运行在应用开发者可靠的系统内。

系统原理
--------

### 系统架构

EG-LDVS包含MEP和MEP-Agent两个组件。
![输入图片说明](https://images.gitee.com/uploads/images/2020/0804/164331_49cda7cd_5504908.png "系统架构.png")

MEP组件：应用本地开发验证服务，提供边缘平台的相关API接口，仅支持开发者本地测试使用，组件本身具备服务治理的功能API，以及相关的能力开放API，但不实现API具体的功能，仅返回正确的API响应。

MEP组件运行时包含如下微服务：

- mepauth：提供应用认证相关的能力。

- mep：提供服务治理，通知管理的相关功能。

- kong：EG-LDVS使用了服务转发开源软件kong，kong不由产品交付，直接使用上游社区镜像，负责相关路由转发功能。

- postgres：kong会使用postgres存储数据，postgres不由产品交付，直接使用上游社区镜像。

MEP-Agent组件：应用集成适配器，这个组件在实际使用时，应用开发者可以将其作为应用的一部分。它实现了实例配置信息导入，服务注册等相关基础功能，可以简化应用与平台的集成。

系统默认帐号
------------

MEPServer、MEP-agent、MEPAuth容器内系统默认帐号说明，如下表：

|**用户名**|   **用户组** |  **用途**   |                                                                                        **远程登录**   |**权限** |    **默认密码**  | **密码修改策略** |  **密码修改方法**|
|---|---|---|---| ---|---|---|---|
| eguser   |    eggroup  |    用于启动服务的帐号   |                                                                              禁用  |         工作用户 |    无    |         无需修改   |        不涉及|
|  root   |      root  |       系统默认用户，能够控制所有资源，创建其他用户和赋予其他用户权限，执行操作系统提供的所有操作功能。|   禁用       |    管理域用户   |无 |            无需修改|           不涉及|
 | bin     |     bin  |       bin帐号  |                                                                                          禁用      |     不涉及     |  无        |    无需修改|           不涉及|
  |daemon  |     daemon    |   daemon帐号  |                                                                                       禁用   |        不涉及   |    无      |       无需修改 |          不涉及|
  |adm  |        adm  |        adm帐号|                                                                                            禁用  |         不涉及 |      无    |         无需修改 |          不涉及|
 |lp|           lp      |     打印服务帐号|                                                                                       禁用 |         不涉及   |    无   |         无需修改    |       不涉及|
  |sync|         root     |    同步服务帐号    |                                                                                   禁用|           不涉及      | 无         |    无需修改       |    不涉及|
 | shutdown  |   root     |    关机服务帐号  |                                                                                     禁用 |          不涉及   |    无    |         无需修改 |         不涉及|
  |halt |        root  |       关机服务帐号 |                                                                                      禁用   |        不涉及 |      无 |            无需修改  |         不涉及|
|  mail   |      mail    |     邮件服务帐号|                                                                                       禁用  |         不涉及     |  无     |        无需修改  |         不涉及|
  |news   |      news    |     news服务帐号   |                                                                                    禁用     |      不涉及 |      无      |       无需修改 |          不涉及|
  |uucp |        uucp  |       UUCP服务帐号    |                                                                                   禁用         |  不涉及   |    无         |    无需修改   |        不涉及|
  |operator    | root    |     操作帐号   |                                                                                        禁用       |    不涉及  |     无    |        无需修改  |         不涉及|
  |man   |       man    |      Manual pages viewer使用  |                                                                          禁用  |        不涉及 |      无      |       无需修改  |         不涉及|
 | postmaster|   mail   |      邮件服务帐号  |                                                                                     禁用     |      不涉及 |      无   |          无需修改 |          不涉及|
|  cron   |      cron     |    cron服务帐号       |                                                                                禁用    |       不涉及  |    无      |       无需修改 |          不涉及|
 | ftp         | ftp          |FTP帐号     |                                                                                       禁用     |      不涉及    |   无   |          无需修改   |        不涉及|
  |sshd         |sshd    |     SSH服务帐号    |                                                                                    禁用         |  不涉及  |     无  |           无需修改      |     不涉及|
 | at        |   at     |      At服务帐号    |                                                                                     禁用    |       |不涉及   |    无  |           无需修改  |         不涉及|
  |squid    |    squid    |    Squid服务帐号   |                                                                                   禁用   |        不涉及   |    无     |        无需修改    |       不涉及|
 | xfs    |      xfs    |      xfs服务帐号       |                                                                                 禁用         |  不涉及       |无  |           无需修改   |        不涉及|
  |games        |users    |    games服务帐号  |                                                                                    禁用      |     不涉及     |  无           |  无需修改   |        不涉及|
  |cyrus   |     mail  |       邮件服务帐号     |                                                                                  禁用         |  不涉及   |   无    |         无需修改  |         不涉及|
  |vpopmail   |  vpopmail   |  vpopmail服务帐号     |                                                                              禁用    |       不涉及  |     无     |        无需修改  |         不涉及|
  |ntp  |        ntp    |      NTP帐号      |                                                                                      禁用      |     不涉及   |    无         |    无需修改   |        不涉及|
  |smmsp   |     smmsp  |      smmsp服务帐号        |                                                                             禁用    |       不涉及 |      无     |        无需修改  |         不涉及|
 | guest    |    users  |      游客帐号         |                                                                                  禁用    |       不涉及     |  无       |      无需修改  |         不涉及|
|  nobody   |    nobody |      nobody帐号   |                                                                                      禁用  |         不涉及   |    无      |       无需修改 |          不涉及|

数据库默认帐号
--------------

EG-LDVS使用开源Postgres数据库，在系统中，kong服务和mepauth服务均使用特定用户访问数据库，用户信息如下。相关密码由用户部署时自行设置，部署过程参考*部署指南*章节。[](#部署指南)

  |**用户名**  | **密码**  |           **用途**|
 | ---|---|---|
  |admin      |  用户部署时自行设置   |pg的admin用户，用于创建数据库和其他业务连接用户|
  |kong         |用户部署时自行设置   |kong服务访问数据库使用的用户名|

特性
====

EG-LDVS服务管理功能
---------------------------

**定义**

服务管理功能是指LDVS能够进行服务的注册，更新，删除，查询的能力。

**设计原理**

LDVS-MEP提供服务注册，更新，删除，查询相关API接口。应用能够通过LDVS-MEP进行服务的注册，更新，删除，查询。

![输入图片说明](https://images.gitee.com/uploads/images/2020/0804/165650_4eeb753e_5504908.png "特性1.png")

EG-LDVS应用服务状态订阅/通知功能
----------------------------------------

**定义**

应用服务状态订阅/通知功能是指LDVS能够进行服务状态的订阅，更新，删除，通知的能力。

**设计原理**

LDVS
MEP管理应用服务的状态，应用通过MEP进行服务的注册，当服务消费者期望使用服务供应者的服务时，需要通过MEP订阅服务供应者的服务状态。通过订阅接口，MEP能够识别服务消费者关注的服务，在服务状态发生变化时，能够将相关的服务状态通知到服务消费者。

应用能够通过LDVS-MEP进行服务状态的订阅，更新，删除，查询。

![输入图片说明](https://images.gitee.com/uploads/images/2020/0804/165707_f4dbb36e_5504908.png "特性2.png")

EG-LDVS应用集成插件mep-agent
------------------------------------

**定义**

LDVS MEP-Agent作为应用快速集成适配器，实现服务配置导入和服务注册的功能。

**设计原理**

LDVS
MEP管理应用的服务，应用需要将其服务注册到MEP中，MEP-Agent作为适配器，将服务信息（包括应用实例ID）导入给应用，同时提供配置的方式将应用的服务注册到MEP中。

![输入图片说明](https://images.gitee.com/uploads/images/2020/0804/165723_8d9be51d_5504908.png "特性3.png")

使用指南
========

基于EG-LDVS的应用开发指南
-------------------------

### <span id="_应用认证机制（责任人：陈传雨）" class="anchor"><span id="_应用认证机制" class="anchor"><span id="_应用接口调用流程" class="anchor"></span></span></span>应用接口调用流程

在启动应用开发验证前，开发者需要了解应用认证机制。在应用开发者基于EG-LDVS进行开发调测时，确保应用和EG-LDVS通过如下方式启动。

-   在启动应用实例时，通过应用启动参数或输入配置得到应用的appInstanceId，AK/SK，即应用已知自身的appInstanceId和AK/SK。参考*部署mep-agent*章节。[](#将应用信息导入mep)

-   在启动EG-LDVS时，配置同样的appInstanceId，AK/SK，确保其能对该应用进行认证。参考*部署mepauth*章节。[](#部署mepauth)

应用调用EG-LDVS的API接口的流程如下。

1.  应用使用*服务认证接口*，获取token[](#_导入应用认证信息接口)

2.  EG-LDVS对ak/sk进行校验并签发token

3.  EG-LDVS返回token

4.  应用携带token进行服务接口调用。可调用*应用服务管理相关接口*，*可用事件订阅相关接口*，*终止事件订阅相关接口*。[](#应用服务管理相关接口)[](#可用事件订阅相关接口)[](#终止事件订阅相关接口)

5.  EG-LDVS校验token并处理相关请求。

![输入图片说明](https://images.gitee.com/uploads/images/2020/0804/165746_8ff53084_5504908.png "接口调用.png")

应用实例ID，AK/SK的样例值如下：

```
AppInstanceId: 5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f
AK: QVUJMSUMgS0VZLS0tLS0
SK: DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc
```

目前EG-LDVS只支持启动时设置appInstanceId，AK/SK，用户可以自行设置AK/SK，仅需确保格式正确即可。
在应用开发者进行本地开发验证时，确保部署EG-LDVS时以及在app调用EG-LDVS获取token和调用相关服务接口时，使用相同的AK/SK。

应用开发者在开发应用时，应用在启动时获得appInstanceId,
AK/SK。应用需要保存该信息，在使用MEP平台服务时，使用该信息与MEP平台进行交互。

<span id="_AK/SK签名认证算法说明" class="anchor"></span>

### AK/SK签名认证算法说明

应用与LDVS交互时，需要首先通过服务认证接口获取token，需要使用分配给应用的AK/SK使用签名算法获取签名结果，作为”
Authorization”的值添加在请求header中，以获取有效token，在后续的交互接口中，携带该token进行交互。

EG-LDVS采用和华为公有云相同的签名认证算法，相关指导说明可以参考华为公有云AK/SK签名认证算法指导：

[*https://support.huaweicloud.com/devg-apisign/api-sign-algorithm.html*](https://support.huaweicloud.com/devg-apisign/api-sign-algorithm.html)

签名后获取的Authorization样例：

```
Authorization: SDK-HMAC-SHA256 Access=QVUJMSUMgS0VZLS0tLS0, SignedHeaders=content-type;host;x-sdk-date, Signature=142b0dc3feaeb3662b2033a8e6425596546e08a231aa39179b4060867dd15d3d
```

具体获取token方法请参考*服务认证接口*。

注：服务认证接口实现中没有使用CanonicalQueryString和RequestPayload（body体）信息，故签名算法中也不要使用这两个信息。[](#_导入应用认证信息接口)

### API接口说明

本小节介绍EG-LDVS的API接口。

<span id="_导入应用认证信息接口" class="anchor"><span id="_服务认证接口"
class="anchor"></span></span>接口请求示例中的参数说明：

  |名称    |                 值    |             描述|
  |---|---|---|
  |LDVS\_HOST  |             部署LDVS的主机IP |  主机IP|
  |PORT                    | 8443  |             kong开放给应用的端口|
  |KONG\_MEPAUTH\_ROUTE     |mepauth           | mepauth在kong中的路由url|
  |KONG\_MEPSERVER\_ROUTE  | mepserver          |mepserver在kong中的路由url|

#### 接口使用约束

由于EG-LDVS仅为提供给应用开发者进行平台接口调用开发与测试，所以只提供一个网络平面与应用进行交互，请调测时，直接访问部署服务器的8443端口进行API调用。

另外，为确保EG-LDVS正常工作，对接口调用存在如下限制。

-   使用服务认证接口获取token，限制为每分钟100次

-   使用其它服务接口，限制为不区分接口每分钟1000次

-   Request body最大长度4kb

#### 服务认证接口

应用通过AK/SK向LDVS进行鉴权认证，认证通过后返回token，每个token具有有效期（1小时），token分配方在有效期结束后将收回token，当携带过期的token的HTTP请求到达的时候，将被以状态码401返回；此时token携带方需要重新进行token获取。当token还在有效期内，token携带方再次使用相同的用户获取token时返回当前仍然有效的token。

URL：

```
POST https://{LDVS_HOST}:{PORT}/{KONG_MEPAUTH_ROUTE}/mepauth/v1/token
```

请求参数：

 |名称  |          类型 |    描述       |                                      IN     |  必选|
 |---|---|---|---|---|
 | Content-Type |   String  | MIME类型，  填“application/json”                        |               header  | 是|                                                                    
 | Authorization|   String   |认证信息   |                                      header  | 是|
 |  x-sdk-date  |    String   |签名时间（当前时间戳，格式：YYYYMMDDTHHMMSSZ）|   header |  是|
 |  Host    |       String |  与生成认证信息签名用到的host字段保持一致   |      header|   是|


Body参数：

无

注：当前接口实现没有使用CanonicalQueryString和RequestPayloa（body体）信息。

请求示例：

```
POST https://{LDVS_HOST}:8443/mepauth/mepauth/v1/token

{
  “header”: [
    {
      “key”: “Content-Type”,
      “value”: “application/json”
    },
    {
      “key”: “Authorization”,
      “value”: “SDK-HMAC-SHA256 Access= QVUJMSUMgS0VZLS0tLS0=,
      SignedHeaders=content-type;host;x-sdk-date,
      Signature=142b0dc3feaeb3662b2033a8e6425596546e08a231aa39179b4060867dd15d3d”
    },
    {
      “key”: “x-sdk-date”,
      “value”: “20060102T150405Z”
    },
    {
      “key”:”Host”,
      “value”:”xxx”
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
	“access_token”:”xxxx”,
	“token_type”:”Bearer”,
	“expires_in”:”3600”
}

```


注：在测试时，请确保启动EG-LDVS时使用的AK/SK和获取token时使用的AK/SK相同。基于AK/SK的认证，EG-LDVS对于相同的AK若5分钟内三次认证失败，对应AK将被锁定15分钟。

#### 应用服务管理相关接口

##### 1. 查询应用服务

查询指定APP的服务列表

URL

```
GET https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services
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
GET https://{LDVS_HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services
{
  “header”: [
    {
      “key”: “Authorization”,
      “value”: “Bearer xxx”
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
    “serInstanceId”: “0bc92b06cc213d2ad8beda71bd0e1460”,
    “serName”: “ExampleService”,
    “serCategory”: {
      “href”: “/example/catalogue1”,
      “id”: “id12345”,
      “name”: “RNI”,
      “version”: “version1”
    },
    “version”: “ServiceVersion1”,
    “state”: “ACTIVE”,
    “transportInfo”: {
      “id”: “TransId12345”,
      “name”: “REST”,
      “description”: “REST API”,
      “type”: “REST_HTTP”,
      “protocol”: “HTTP”,
      “version”: “2.0”,
      “endpoint”: {},
      “security”: {
        “oAuth2Info”: {
          “grantTypes”: [
            “OAUTH2_CLIENT_CREDENTIALS”
          ],
          “tokenEndpoint”: “/mecSerMgmtApi/security/TokenEndPoint”
        }
      },
      “implSpecificInfo”: {}
    },
    “serializer”: “JSON”,
    “scopeOfLocality”: “MEC_SYSTEM”,
    “consumedLocalOnly”: false,
    “isLocal”: true
  }
]
}

```

##### 2. 查询应用指定服务

查询对应APP的指定服务

URL

```
GET https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}
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
GET https://{LDVS_HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460
{
  “header”: [
    {
      “key”: “Authorization”,
      “value”: “Bearer xxx”
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
 “serInstanceId”: “0bc92b06cc213d2ad8beda71bd0e1460”,
 “serName”: “ExampleService”,
 “serCategory”: {
      “href”: “/example/catalogue1”,
      “id”: “id12345”,
      “name”: “RNI”,
      “version”: “version1”
 },
 “version”: “ServiceVersion1”,
 “state”: “ACTIVE”,
 “transportInfo”: {
   “id”: “TransId12345”,
   “name”: “REST”,
   “description”: “REST API”,
   “type”: “REST_HTTP”,
   “protocol”: “HTTP”,
   “version”: “2.0”,
   “endpoint”: {},
   “security”: {
        “oAuth2Info”: {
          “grantTypes”: [
            “OAUTH2_CLIENT_CREDENTIALS”
          ],
          “tokenEndpoint”: “/mecSerMgmtApi/security/TokenEndPoint”
        }
      },
      “implSpecificInfo”: {}
    },
    “serializer”: “JSON”,
    “scopeOfLocality”: “MEC_SYSTEM”,
    “consumedLocalOnly”: false,
    “isLocal”: true
 }
```

##### 3. 注册应用服务

为指定APP注册服务。

URL

```
POST https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services
```

请求参数：

|名称    |        类型    | 描述     |                           IN   |    必选|
  | ---| ---| ---| ---| ---| 
 |  Content-Type    | String   | MIME类型，填“application/json”                       |     header|   是|                                                                                          
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
POST https://{LDVS_HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services
{
  “header”: [
    {
      “key”: “Content-Type”,
      “value”: “application/json”,
      “key”: “Authorization”,
      “value”: “Bearer xxx”
    }
  ],
  “body”: {
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

##### 4. 更新应用服务

更新APP指定服务信息。

URL

```
PUT https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}
```

请求参数：

  | 名称           |  类型   |   描述           |                      IN     |   必选| 
  |---|---|---|---|---|
  | Content-Type  |   String   | MIME类型，  填“application/json”        |                 header  | 是|                                                                     
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
PUT https://{LDVS_HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460
{
        “header”: [
            {
                “key”: “Content-Type”,
                “value”: “application/json”,
                “key”: “Authorization”,
                “value”: “Bearer xxx”
            }
        ],
        “body”: {
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

##### 5. 删除应用服务

删除APP指定服务。

URL

```
DELETE https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/services/{serviceId}
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
DELETE https://{LDVS_HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/services/0bc92b06cc213d2ad8beda71bd0e1460
{
    “header”: [
        {
            “key”: “Authorization”,
            “value”: “Bearer xxx”
        }
    ],
    “body”: {
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

#### 可用事件订阅相关接口

##### 1. 查询可用事件订阅

查询指定APP的可用事件订阅信息

URL

```
GET https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions
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
GET https://{LDVS_HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
{
    “header”: [
        {
            “key”: “Authorization”,
            “value”: “Bearer xxx”
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

##### 2. 注册可用事件订阅

为指定APP注册可用事件订阅

URL

```
POST https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Content-Type  | String | MIME类型，填“application/json” | header |  是   |
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
POST https://{LDVS_HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
{
    “header”: [
        {
            “key”: “Content-Type”,
            “value”: “application/json”,
            “key”: “Authorization”,
            “value”: “Bearer xxx”
        }
    ]
    “body”: {
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

##### 3. 删除可用事件订阅

删除指定可用事件订阅信息

URL

```
DELETE https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
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
DELETE https://{LDVS_HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
{
    “header”: [
        {
            “key”: “Authorization”,
            “value”: “Bearer xxx”
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

##### 4. 查询指定可用事件订阅

查询指定ID的可用事件订阅信息

URL

```
GET https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_service_mgmt/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
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
GET https://{LDVS_HOST}:8443/mepserver/mec_service_mgmt/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
{
    “header”: [
        { 
            “key”: “Authorization”,
            “value”: “Bearer xxx”
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

#### 终止事件订阅相关接口

##### 1. 查询终止事件订阅

查询指定APP的终止事件订阅信息

URL

```
GET https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/subscriptions
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
GET https://{LDVS_HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
{
    “header”: [
        {
            “key”: “Authorization”,
            “value”: “Bearer xxx”
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

##### 2. 注册终止事件订阅

为指定APP注册终止事件订阅

URL

```
POST https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/subscriptions
```

请求参数：

| **名称** | **类型** | **描述** | **IN** | **必选** |
| --- | --- | --- | --- | --- |
| Content-Type  | String | MIME类型，填“application/json”  | header |  是   |
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
POST https://{LDVS_HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions
{
    “header”: [
        {
            “key”: “Content-Type”,
            “value”: “application/json”,
            “key”: “Authorization”,
            “value”: “Bearer xxx”
        }
    ]
    “body”: {
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

##### 3. 删除终止事件订阅

删除指定终止事件订阅信息

URL

```
DELETE https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
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
DELETE https://{LDVS_HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
{
    “header”: [
        {
            “key”: “Authorization”,
            “value”: “Bearer xxx”
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

##### 4. 查询指定终止事件订阅

查询指定ID的终止事件订阅信息

URL

```
GET https://{LDVS_HOST}:{PORT}/{KONG_MEPSERVER_ROUTE}/mec_app_support/v1/applications/{appInstanceId}/subscriptions/{subscriptionId}
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
GET https://{LDVS_HOST}:8443/mepserver/mec_app_support/v1/applications/5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f/subscriptions/826a3890-8b05-416f-8d24-7a87e9eca731
{
    “header”: [
        {
            “key”: “Authorization”,
            “value”: “Bearer xxx”
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



#### 异常状态码
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

部署指南 
---------

说明：EG-LDVS部署后服务即直接可用，无单独的服务启动命令。

### 前置条件

建议使用Ubuntu系统宿主环境进行产品部署。

 | 序号  | 工具  |  用途  | 说明|
 | --- | --- | --- | --- |
 | 1 | Docker Community Edition | 容器引擎 | 获取地址（第三方软件的官方网站）：[*www.docker.com*](http://www.docker.com)，下载18.xx版本及以上版本软件及资料。 | 
 | 2 | openssl | 用于用户准备SSL证书及密钥 | 使用宿主环境操作系统对应包管理工具进行下载安装，如 apt-get install openssl | 
 | 3 | git | 分布式代码版本控制系统，用于用户获取EG-LDVS源码 | 使用宿主环境操作系统对应包管理工具进行下载安装，如 apt-get install git | 

### EG-LDVS MEP部署指导

本章节介绍MEP组件的部署方式。

建议使用者以容器的形式部署MEP。EG-LDVS不直接提供镜像，需要使用者基于EG-LDVS各组件的源码编译出docker镜像并进行部署。

EG-LDVS
MEP只包含mepauth和mepserver两个组件的源码，在部署时，需要部署开源社区的kong和postgres，提供路由转发和存储数据库。

 | 容器名 | 容器作用 | 镜像名 | 镜像来源 | 
 | --- | --- | --- | --- |
 | kong-service | 提供路由转发功能，由kong对外发布相关接口 | kong:2.0.4-alpine | 非产品交付，从开源社区获取 | 
 | postgres-db | 作为kong的数据存储和mepauth提供应用认证信息存储数据库。 | postgres:12.3 | 非产品交付，从开源社区获取 | 
 | mepauth | 提供认证服务和提供应用信息导入服务 | edgegallery/mepauth:1.0 | 使用者自行编译完整镜像，产品交付组件源码 | 
 | mepserver | 提供应用服务治理，状态订阅等服务。 | edgegallery/mep:1.0 | 使用者自行编译完整镜像，产品交付组件源码 | 

#### 关闭history

基于安全考虑，我们建议使用者在部署过程中关闭history，避免使用者在部署过程中设置的密码等信息泄露的风险。
```
root@ubuntu:~# set +o history
```
#### 准备SSL证书及密钥

EG-LDVS不预置SSL证书及密钥，用户需要自行准备，在测试场景下，用户可以使用openssl工具生成的临时证书，以下以在Ubuntu系统生成步骤为例，证书及密钥的准备步骤如下：

此处假定用户准备的证书及密钥文件名称如下，并将证书保存在
/home/EG-LDVS/mepserver/ 路径下：

-   SSL 根证书文件：ca.crt

-   SSL 证书文件：mepserver_tls.crt

-   SSL 证书加密密钥文件：mepserver_encryptedtls.key

-   SSL 证书密钥加密密码：mepserver_cert\_pwd

-   Mepauth JWT 公钥文件：jwt_publickey

-   Mepauth JWT 密钥文件：jwt_encrypted_privatekey

备注：部署指南章节中，相关命令均在/home/EG-LDVS中执行，若用户并非在该目录下进行证书生成等操作，可在部署指导中执行相关命令时，对/home/EG-LDVS路径做相关替换。命令中其余路径相关设置，需遵照部署指南要求进行操作，若自行更改可能导致部署失败。

以下命令中涉及到的用于加密证书秘钥文件的密码，请用户在执行openssl命令时自行设置，并将该密码保存到相应的文件中。

出于安全性考虑建议用户在设置密码时考虑下列建议：

-   口令长度至少8个字符

-   口令必须包含如下至少两种字符的组合：

-至少一个小写字母；

-至少一个大写字母；

-至少一个数字；

-至少一个特殊字符：\`\~!@\#\$%\^&\*()-\_=+\\|\[\]{};:'“,.&lt;&gt;/?
和空格

```
# Create mepserver directory
root@ubuntu:~# mkdir -p /home/EG-LDVS/mepserver
root@ubuntu:~# cd /home/EG-LDVS/mepserver

# Generate ca certificate
root@ubuntu:/home/EG-LDVS/mepserver# openssl genrsa -out ca.key 2048
root@ubuntu:/home/EG-LDVS/mepserver# openssl req -new -key ca.key -subj /C=CN/ST=Beijing/L=Beijing/O=edgegallery/CN=edgegallery -out ca.csr
root@ubuntu:/home/EG-LDVS/mepserver# openssl x509 -req -days 365 -in ca.csr -extfile /etc/ssl/openssl.cnf -extensions v3_ca -signkey ca.key -out ca.crt

# Generate tls certificate
root@ubuntu:/home/EG-LDVS/mepserver# openssl genrsa -out mepserver_tls.key 2048

# Encrypt tls private key  
root@ubuntu:/home/EG-LDVS/mepserver# openssl rsa -in mepserver_tls.key -aes256 -out mepserver_encryptedtls.key
# 用户需通过交互式命令设置加密密码，并将密码保存到mepserver_cert_pwd文件中（请确保mepserver_cert_pwd文件中密码后无换行符），此处假定密码设置为te9Fmv%qaq
root@ubuntu:/home/EG-LDVS/mepserver# openssl req -new -key mepserver_tls.key -subj /C=CN/ST=Beijing/L=Beijing/O=edgegallery/CN=edgegallery -out mepserver_tls.csr
root@ubuntu:/home/EG-LDVS/mepserver# openssl x509 -req -in mepserver_tls.csr -extfile /etc/ssl/openssl.cnf -extensions v3_req -CA ca.crt -CAkey ca.key -CAcreateserial -out mepserver_tls.crt

# Generate mepauth jwt keypair
root@ubuntu:/home/EG-LDVS/mepserver# openssl genrsa -out jwt_privatekey 2048
root@ubuntu:/home/EG-LDVS/mepserver# openssl rsa -in jwt_privatekey -pubout -out jwt_publickey
# Encrypt jwt private key 
root@ubuntu:/home/EG-LDVS/mepserver# openssl rsa -in jwt_privatekey -aes256 -out jwt_encrypted_privatekey
# 用户需通过交互式命令设置加密密码，此处假定密码设置为qC#4k5ibyZ

```

**注：上述过程中生成的ca.key 及 jwt_privatekey为密钥文件。为保障安全性，请用户从环境中删除或妥善存储在安全的位置。**

出于安全性考虑，所有容器内由non-root用户（uid166）运行程序。同时建议用户在宿主机创建并使用non-root用户(以下命令假定用户创建了uid为166的eguser用户和eggroup用户组)运行容器命令。
```
root@ubuntu:/home/EG-LDVS/mepserver# cd /home/EG-LDVS
# Add eguser and eggroup
root@ubuntu:/home/EG-LDVS# groupadd -r -g 166 eggroup
root@ubuntu:/home/EG-LDVS# useradd -r -g 166 -u 166 eguser
# Add eguser to docker group
root@ubuntu:/home/EG-LDVS# usermod -aG docker eguser
```
将文件属主和属组设置为eguser和eggroup，并将证书及密钥文件的权限设置为600。
```
root@ubuntu:/home/EG-LDVS# chown eguser:eggroup /home/EG-LDVS/mepserver/*
root@ubuntu:/home/EG-LDVS# chmod 600 /home/EG-LDVS/mepserver/*
```
#### 构建mepserver 和 mepauth 容器镜像

本节介绍如何基于EG-LDVS源码构建mepserver和mepauth容器镜像。此处假设用户已经获取到发布的mep代码并放置到/home/EG-LDVS/mep目录下。
```
root@ubuntu:/home/EG-LDVS# cd mep/mepserver
root@ubuntu:/home/EG-LDVS/mep/mepserver# git checkout 1.0
root@ubuntu:/home/EG-LDVS/mep/mepserver# docker build --no-cache -t edgegallery/mep:1.0 -f docker/Dockerfile .
root@ubuntu:/home/EG-LDVS/mep/mepserver# cd ../mepauth
root@ubuntu:/home/EG-LDVS/mep/mepauth# docker build --no-cache -t edgegallery/mepauth:1.0 -f docker/Dockerfile .
```

注：EG-LDVS容器镜像基于开源linux操作系统的基础镜像构建，默认使用的是Alpine Linux，用户可以根据偏好修改Dockerfile以使用其他Linux基础镜像。例如想要将mep镜像修改为基于Ubuntu18.04，对应的mep/mepserver/docker/Dockerfile 文件修改如下：
```
*
*
*
RUN GOOS=linux go build -buildmode=pie -ldflags '-linkmode "external" -extldflags "-static"' -o app

# 用户可以根据偏好修改基础镜像，例如使用ubuntu:18.04
FROM ubuntu:18.04
RUN sed -i "s|umask 022|umask 027|g" /etc/profile
# Create the home directory for the new mep user.
RUN mkdir -p /usr/mep

# Set the home directory to our app user's home.
ENV HOME=/usr/mep
ENV UID=166
ENV GID=166
ENV USER_NAME=eguser
ENV GROUP_NAME=eggroup
ENV ENV="/etc/profile"

# Create an app user so our program doesn't run as root.
RUN groupadd -r -g $GID $GROUP_NAME &&\
    useradd -r -u $UID -g $GID -d $HOME -s /sbin/nologin -c "Docker image user" $USER_NAME &&\
    chown -R $USER_NAME:$GROUP_NAME $HOME
*
*
*
```
#### 部署开源kong及postgres数据库

EG-LDVS使用上游开源社区提供的kong作为路由转发，kong容器镜像(kong:2.0.4-alpine)需使用者直接从上游开源社区的DockerHub镜像库拉取。同时，kong运行时依赖postgres数据库，需要使用者从上游开源社区自行拉取postgres容器镜像（postgres:12.3）。

以下命令中涉及到的数据库密码请用户在运行 docker 命令时和
init.sql中自行设置，并确保运行kong-service时密码一致。

出于安全性考虑建议用户在设置密码时考虑下列建议：

-   口令长度至少8个字符

-   口令必须包含如下至少两种字符的组合：

-至少一个小写字母；

-至少一个大写字母；

-至少一个数字；

-一个特殊字符：-

数据库用户说明：

 | 用户名 | 密码 | 类型 | 备注 | 
 | --- | --- | --- | --- | 
 | admin | &lt;用户输入&gt; | super user | pg的admin用户，用于创建数据库和其他业务连接用户 | 
 | kong | &lt;用户输入&gt; | general user | 用于kong连接pg的用户 | 

\*注：处于安全考虑，建议用户设置的密码都满足以上复杂度要求

用户权限说明：

 | usename | usesysid | usecreatedb | usesuper | userepl | usebypassrls | passwd | valuntil | useconfig | 
 | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
 | admin | 10 | t | t | t | t | \*\*\*\*\*\*\*\* | | | 
 | kong | 16385 | f | f | f | f | \*\*\*\*\*\*\*\* | | | |

注：EG-LDVS使用上游开源社区提供的postgreSQL数据库，数据库容器镜像直接从上游开源社区的DockerHub镜像库拉取。为了提高数据库的使用安全性，EG-LDVS使用一份数据库加固脚本init.sql用于在启动数据库时进行一系列安全加固操作。用户需要将该加固脚本保存到部署环境，并通过目录映射方式映射到数据库容器中。此处假设用户将加固
init.sql 保存在 /home/EG-LDVS/mepserver/
路径下。实际执行以下命令时请根据环境实际情况修改对应参数。
```
# Create docker network mep-net
root@ubuntu:~# docker network create mep-net

# create postgres work directory
root@ubuntu:~# mkdir -p /data/thirdparty/postgres
root@ubuntu:~# chown eguser:eggroup /data/thirdparty/postgres
root@ubuntu:~# chmod 700 /data/thirdparty/postgres

# create kong work directory
root@ubuntu:~# mkdir -p /data/thirdparty/kong
root@ubuntu:~# chown eguser:eggroup /data/thirdparty/kong
root@ubuntu:~# chmod 700 /data/thirdparty/kong

root@ubuntu:~# cat > /home/EG-LDVS/mepserver/init.sql <<EOF
CREATE USER kong WITH PASSWORD '<password>';   --请用户自行设置kong用户密码
REVOKE connect ON DATABASE kong FROM PUBLIC;
GRANT ALL PRIVILEGES ON DATABASE kong TO admin;
GRANT ALL PRIVILEGES ON DATABASE kong TO kong;
GRANT connect ON DATABASE kong TO kong;
ALTER DATABASE template0 is_template false;
ALTER DATABASE template1 is_template false;
DROP DATABASE template0;
DROP DATABASE template1;
DROP DATABASE postgres;
EOF

root@ubuntu:~# chown eguser:eggroup /home/EG-LDVS/mepserver/init.sql
root@ubuntu:~# chmod 600 /home/EG-LDVS/mepserver/init.sql

# Run postgresql container
root@ubuntu:~# docker run -d --name postgres-db \
--cap-drop All \
--network=mep-net \
--user=166:166 \
-e "POSTGRES_USER=admin" \
-e "POSTGRES_DB=kong" \
-e "POSTGRES_PASSWORD=<password>" \ #请用户自行设置admin用户密码
-e "POSTGRES_INITDB_ARGS=--auth-local=password" \  
-e "PGDATA=/var/lib/postgresql/data/pgdata" \
-v "/data/thirdparty/postgres:/var/lib/postgresql/data" \
-v "/home/EG-LDVS/mepserver/mepserver_tls.crt:/var/lib/postgresql/data/server.crt:ro"\
-v "/home/EG-LDVS/mepserver/mepserver_tls.key:/var/lib/postgresql/data/server.key:ro"\
-v "/home/EG-LDVS/mepserver/init.sql:/docker-entrypoint-initdb.d/init.sql:ro"\
postgres:12.3 \
-c ssl=on \
-c ssl_cert_file=/var/lib/postgresql/data/server.crt \
-c ssl_key_file=/var/lib/postgresql/data/server.key

# modify owner and mode of soft link
root@ubuntu:~# chown eguser:eggroup /data/thirdparty/postgres/server.crt
root@ubuntu:~# chown eguser:eggroup /data/thirdparty/postgres/server.key
root@ubuntu:~# chmod 600 /data/thirdparty/postgres/server.crt
root@ubuntu:~# chmod 600 /data/thirdparty/postgres/server.key
```
EG-LDVS使用上游开源社区提供的kong作为路由转发，kong容器镜像直接从上游开源社区的DockerHub镜像库拉取。
```
# Run kong container
root@ubuntu:~# docker run --rm --link postgres-db:postgres-db \
            --cap-drop All \
            --user=166:166 \
            --network=mep-net \
            -e "KONG_DATABASE=postgres" \
            -e "KONG_PG_HOST=postgres-db" \
            -e "KONG_PG_USER=kong" \
            -e "KONG_PG_PASSWORD=<password>" \ #请保持与之前设置的kong用户密码一致**
            kong:2.0.4-alpine kong migrations bootstrap

root@ubuntu:~# cp -r /home/EG-LDVS/mep/kong-plugin /tmp/kong-conf
root@ubuntu:~# chown -R eguser:eggroup /tmp/kong-conf
root@ubuntu:~# chmod 700 /tmp/kong-conf

root@ubuntu:~# docker run -d --name kong-service \
            --cap-drop All \
            --user=166:166 \
            --link postgres-db:postgres-db \
            --link mepserver:mepserver \
            --link mepauth:mepauth \
            --network=mep-net \
            -v /home/EG-LDVS/mepserver/mepserver_tls.crt:/var/lib/kong/data/kong.crt:ro\
            -v /home/EG-LDVS/mepserver/mepserver_tls.key:/var/lib/kong/data/kong.key:ro\
            -v /home/EG-LDVS/mepserver/ca.crt:/var/lib/kong/data/ca.crt:ro \
            -v /tmp/kong-conf/appid-header:/usr/local/share/lua/5.1/kong/plugins/appid-header:ro\
            -v /tmp/kong-conf/kong.conf:/etc/kong/kong.conf:ro \
            -e "KONG_DATABASE=postgres" \
            -e "KONG_PG_HOST=postgres-db" \
            -e "KONG_PG_USER=kong" \
            -e "KONG_PG_PASSWORD=<password>" \ #请保持与之前数据库部署时设置的kong用户密码一致
            -e "KONG_PROXY_ACCESS_LOG=/tmp/access.log" \
            -e "KONG_ADMIN_ACCESS_LOG=/tmp/admin-access.log" \
            -e "KONG_PROXY_ERROR_LOG=/tmp/proxy.log" \
            -e "KONG_ADMIN_ERROR_LOG=/tmp/proxy-admin.log" \
            -e "KONG_PG_SSL=on" \
            -e "KONG_PG_SSL_VERIFY=on" \
            -e "KONG_LUA_SSL_TRUSTED_CERTIFICATE=/var/lib/kong/data/ca.crt" \
            -e "KONG_SSL_CERT=/var/lib/kong/data/kong.crt" \
            -e "KONG_SSL_CERT_KEY=/var/lib/kong/data/kong.key" \
            -e "KONG_ADMIN_SSL_CERT=/var/lib/kong/data/kong.crt" \
            -e "KONG_ADMIN_SSL_CERT_KEY=/var/lib/kong/data/kong.key" \
            -e "KONG_PREFIX=/var/lib/kong/data/kongdata" \
            -e "KONG_HEADERS=off" \
            -e "KONG_SSL_CIPHER_SUITE=custom" \
            -e "KONG_SSL_CIPHERS=ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384"\
            -e "KONG_NGINX_HTTP_SSL_PROTOCOLS=TLSv1.2 TLSv1.3" \
            -e "KONG_NGINX_HTTP_SSL_PREFER_SERVER\_CIPHERS=on" \
            -v /data/thirdparty/kong:/var/lib/kong/data \
            -p <host IP>:8443:8443 \ # host IP 为部署环境的IP地址
            kong:2.0.4-alpine /bin/sh -c 'export ADDR=`hostname`;export KONG_ADMIN_LISTEN="$ADDR:8444 ssl";export KONG_PROXY_LISTEN="$ADDR:8443 ssl http2";./docker-entrypoint.sh kong docker-start'

# Remove init.sql
root@ubuntu:~# rm /home/EG-LDVS/mepserver/init.sql

# Modify owner and mode of soft link
root@ubuntu:~# chown eguser:eggroup /data/thirdparty/kong/ca.crt
root@ubuntu:~# chown eguser:eggroup /data/thirdparty/kong/kong.crt
root@ubuntu:~# chown eguser:eggroup /data/thirdparty/kong/kong.key
root@ubuntu:~# chmod 600 /data/thirdparty/kong/ca.crt
root@ubuntu:~# chmod 600 /data/thirdparty/kong/kong.crt
root@ubuntu:~# chmod 600 /data/thirdparty/kong/kong.key
```
#### 部署mepserver 
```
# Run mepserver container
root@ubuntu:~# docker run -itd --name mepserver \
            --cap-drop All \
            --network=mep-net \
            -e "SSL_ROOT=/usr/mep/ssl/" \
            -v /home/EG-LDVS/mepserver/mepserver_tls.crt:/usr/mep/ssl/server.cer:ro\
            -v /home/EG-LDVS/mepserver/mepserver_encryptedtls.key:/usr/mep/ssl/server_key.pem:ro\
            -v /home/EG-LDVS/mepserver/ca.crt:/usr/mep/ssl/trust.cer:ro \
            -v /home/EG-LDVS/mepserver/mepserver_cert_pwd:/usr/mep/ssl/cert_pwd:ro\
            edgegallery/mep:1.0
```
#### 部署mepauth

下面命令中我们使用样例ACCESS_KEY、SECRET_KEY与APP_INST_ID、KEY_COMPONENT：

-   ACCESS_KEY: QVUJMSUMgS0VZLS0tLS0

-   SECRET_KEY:
    DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc

-   APP_INST_ID: 5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f

-   KEY_COMPONENT:
    oikYVgrRbDZHZSaobOTo8ugCKsUSdVeMsg2d9b7Qr250q2HNBiET4WmecJ0MFavRA0cBzOWu8sObLha17auHoy6ULbAOgP50bDZapxOylTbr1kq8Z4m8uMztciGtq4e11GA0aEh0oLCR3kxFtV4EgOm4eZb7vmEQeMtBy4jaXl6miMJugoRqcfLo9ojDYk73lbCaP9ydUkO56fw8dUUYjeMvrzmIZPLdVjPm62R4AQFQ4CEs7vp6xafx9dRwPoym

备注：建议对ACCESS_KEY、SECERT_KEY、KEY_COMPONENT进行设置修改，其中ACCESS_KEY、SECERT_KEY保持长度不变，KEY_COMPONENT长度不小于256。应用通过接口访问EG-LDVS时，需要保证使用的AK/SK与此处设置的ACCESS_KEY、SECERT_KEY相同。

将jwt密码、ACCESS_KEY、SECRET_KEY与APP_INST_ID、KEY_COMPONENT样例保存到/tmp/mepauth-conf/mepauth.properties文件：
```
root@ubuntu:~# mkdir –p /tmp/mepauth-conf/
root@ubuntu:~# cat > /tmp/mepauth-conf/mepauth.properties <<EOF
JWT_PRIVATE_KEY=qC#4k5ibyZ #请保持与之前设置的jwt密码一致
ACCESS_KEY=QVUJMSUMgS0VZLS0tLS0
SECRET_KEY=DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc
APP_INST_ID=5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f              
KEY_COMPONENT=oikYVgrRbDZHZSaobOTo8ugCKsUSdVeMsg2d9b7Qr250q2HNBiET4WmecJ0MFavRA0cBzOWu8sObLha17auHoy6ULbAOgP50bDZapxOylTbr1kq8Z4m8uMztciGtq4e11GA0aEh0oLCR3kxFtV4EgOm4eZb7vmEQeMtBy4jaXl6miMJugoRqcfLo9ojDYk73lbCaP9ydUkO56fw8dUUYjeMvrzmIZPLdVjPm62R4AQFQ4CEs7vp6xafx9dRwPoym
TRUSTED_LIST=<client_I_1>;<client_IP_2>;…… #请设置允许访问EG-LDVS的客户端IP白名单
EOF

root@ubuntu:~# chown -R eguser:eggroup /tmp/mepauth-conf/
root@ubuntu:~# chmod -R 640 /tmp/mepauth-conf/
root@ubuntu:~# chmod 600 /tmp/mepauth-conf/mepauth.properties

# Run mepauth container
root@ubuntu:~# docker run -itd --name mepauth \
            --cap-drop All \
            --network=mep-net \
            --link kong-service:kong-service \
            -v /home/EG-LDVS/mepserver/jwt_publickey:/usr/mep/keys/jwt_publickey:ro\
            -v /home/EG-LDVS/mepserver/jwt_encrypted_privatekey:/usr/mep/keys/jwt_encrypted_privatekey:ro\
            -v /home/EG-LDVS/mepserver/mepserver_tls.crt:/usr/mep/ssl/server.crt:ro\
            -v /home/EG-LDVS/mepserver/mepserver_tls.key:/usr/mep/ssl/server.key:ro\
            -v /home/EG-LDVS/mepserver/ca.crt:/usr/mep/ssl/ca.crt:ro \
            -v /tmp/mepauth-conf/mepauth.properties:/usr/mep/mepauth.properties \
            -e "MEPAUTH_APIGW_HOST=kong-service" \
            -e "MEPAUTH_APIGW_PORT=8444" \
            -e "MEPAUTH_CERT_DOMAIN_NAME=edgegallery" \
            edgegallery/mepauth:1.0
```
注：
出于安全性考虑，mepauth容器启动后会将/tmp/mepauth-conf/mepauth.properties文件的内容删除，以防信息泄露。

##### 更新TRUSTED_LIST

mepauth.properties文件中的“TRUSTED_LIST”字段用于设置允许调用EG-LDVS
提供的API服务的IP地址。如果需要修改允许调用EG-LDVS
API服务的IP地址，需要用户进入Postgres数据库容器，然后更新Kong数据库中的plugins表数据，具体操作步骤如下：
```
# 进入 Postgres 数据库容器
root@ubuntu:~# docker exec -it postgres-db /bin/sh
# 登录 Kong 数据库, 登录时需要输入之前为kong用户设置的密码
$ psql -U kong
# 更新plugins表数据，如果需要设置多个IP请用逗号分隔
$ update plugins set config='{"blacklist": null, "whitelist":["<client_IP_1>","<client_IP_2>"]}' where name='ip-restriction';
# 退出 Postgres 数据库容器
$ exit
# 重启kong容器
root@ubuntu:~# docker restart kong-service
```
### EG-LDVS MEP-agent部署指导

本小节介绍应用浅集成时如何通过Mep-agent进行配置集成。

Mep-agent是为第三方MEC
App提供代理服务的中间件，可以帮助未实现ETSI接口的MEC
App注册到MEP，实现MEC App的服务注册与发现。

Mep-agent由Go语言开发，建议开发者使用Docker容器的形式部署，Mep-agent启动时会读取MEC
App的配置文件 app_instance_info.yaml 并将MEC
App注册到Mep，实现服务注册与发现以及服务订阅。

在进行使用MEP-Agent之前，请参考[*应用接口调用流程*](#_应用接口调用流程)章节准备appInstanceId，AK，SK。[](#_应用认证机制（责任人：陈传雨）)

#### 将应用信息导入MEP

在启动测试前，需要确保MEP-Agent配置的APP_INST_ID，ACCESS_KEY/
SECRET_KEY
和部署的EG-LDVS保持一致，[*部署mepauth*](#部署mepauth)章节中介绍了相关的值，以下部署指导中使用的样例值已经与前者保持一致，如果用户在部署EG-LDVS
MEP时，未对启动值做自定义，可直接进行部署，否则请根据自定义值进行部署。[](#_导入应用认证信息接口)

#### Mep-agent部署指导

1.  关闭history
基于安全考虑，我们建议使用者在部署过程中关闭history，避免使用者在部署过程中设置的密码等信息泄露的风险。
```
root@ubuntu:~# set +o history
```
2.  构建mep-agent 容器镜像
此处假设用户已经获取到发布的mep-agent代码并放置到/home/EG-LDVS/mep-agent目录下。
```
root@ubuntu:/home/EG-LDVS# cd mep-agent
root@ubuntu:/home/EG-LDVSmep-agent# git checkout 1.0
root@ubuntu:/home/EG-LDVSmep-agent# docker build --no-cache -t edgegallery/mep-agent:1.0 -f docker/Dockerfile .
```
3.  运行mep-agent 容器
```
root@ubuntu:/home/EG-LDVS/mep-agent# mkdir –p /tmp/mepagent-conf/
root@ubuntu:/home/EG-LDVS/mep-agent# cp conf/app_conf.yaml/tmp/mepagent-conf/
root@ubuntu:~# cat > /tmp/mepagent-conf/mepagent.properties << EOF
ACCESS_KEY=QVUJMSUMgS0VZLS0tLS0
SECRET_KEY=DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc
EOF
root@ubuntu:/home/EG-LDVS/mep-agent# chown -R eguser:eggroup /tmp/mepagent-conf/
root@ubuntu:/home/EG-LDVS/mep-agent# chmod -R 640 /tmp/mepagent-conf/
root@ubuntu:/home/EG-LDVS/mep-agent# chmod 600 /tmp/mepagent-conf/app_conf.yaml
root@ubuntu:/home/EG-LDVS/mep-agent# chmod 600 /tmp/mepagent-conf/mepagent.properties
```
** 运行mep-agent容器，完成mec app服务注册（注：运行前请先获取AK及SK，并完成MEC APP部署，根据部署的MEC APP的实际信息修改app_instance_info配置文件，此次假定app_instance_info.yaml保存在/home/EG-LDVS/mep-agent/conf路径下。）
```
root@ubuntu:/home/EG-LDVS/mep-agent# chown -R eguser:eggroup /home/EG-LDVS/mep-agent/conf/app_instance_info.yaml
#可选，mep-agent默认自带一份样例app_instance_info.yaml用于注册
root@ubuntu:/home/EG-LDVS/mep-agent# chmod 600 /home/EG-LDVS/mep-agent/conf/app_instance_info.yaml #可选，mep-agent默认自带一份样例app_instance_info.yaml用于注册**
root@ubuntu:/home/EG-LDVS/mep-agent# cd conf
root@ubuntu:/home/EG-LDVS/mep-agent/conf# docker run -itd --name mepagent \
         --cap-drop All \
         -e MEP_IP=<host IP> \# host IP 为mep部署环境的IP地址**
         -e MEP_APIGW_PORT=8443 \
         -e MEP_AUTH_ROUTE=mepauth \
         -e ENABLE_WAIT=true \
         -v home/EG-LDVS/mepserver/ca.crt:/usr/mep/ssl/ca.crt:ro \
         -e "CA_CERT=/usr/mep/ssl/ca.crt" \
         -e "CA_CERT_DOMAIN_NAME=edgegallery " \
         -v /tmp/mepagent-conf/app_conf.yaml:/usr/mep/conf/app\_conf.yaml:ro \
         -v /tmp/mepagent-conf/mepagent.properties:/usr/mep/mepagent.properties\
         -v /home/EG-LDVS/mep-agent/conf/app_instance_info.yaml:/usr/mep/conf/app_instance_info.yaml:ro\ #可选， mep-agent默认自带一份样例app_instance_info.yaml用于注册
         edgegallery/mep-agent:1.0
```
注：
出于安全性考虑，mepagent容器启动后会将/tmp/mepagent-conf/mepagent.properties文件的内容删除，以防信息泄露。

同时我们建议用户在mepagent容器正常启动后删除/tmp/mepagent-conf目录下的app_conf.yaml文件及mepagent.properties文件。
```
root@ubuntu:~# rm –f /tmp/mepagent-conf/app_conf.yaml
root@ubuntu:~# rm –f /tmp/mepagent-conf/mepagent.properties
```

Mep-agent执行MEC App服务注册的流程：

1.  Mep-Agent向EG-LDVS MEP发送请求

请求头header携带着签名(签名算法参考*AK/SK签名认证算法说明*章节)，EG-LDVS MEP校验签名，校验通过返回token（有效期1小时）[](#_AK/SK签名认证算法说明)

2.  Mep-Agent向EG-LDVS MEP注册服务

请求头header携带token，Mep-Agent读取app_instance_info.yaml文件中的配置参数，转化为对象，放在body中，EG-LDVS MEP通过携带的token来进行鉴权，完成服务注册

Mep-agent 配置文件 app_instance_info.yaml样例：

```
# sample config yaml
appInstanceId: 5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f
serviceInfoPosts:
  - serName: ExampleService10
    serCategory:
      href: "/example/catalogue1"
      id: 57d75ef9-ca6a-47b7-bc3e-93b9d15d8efb
      name: RNI
      version: 1.0.2
    version: 1.0.1
    state: ACTIVE
    transportId: 6aca7e8c-d7f0-4a92-9374-b582d60ff104
    transportInfo:
      id: 6aca7e8c-d7f0-4a92-9374-b582d60ff104
      name: REST
      description: REST API
      type: REST_HTTP
      protocol: HTTP
      version: '2.0'
      endpoint:
        uris:
         - http://ExampleService:30005
      security:
        oAuth2Info:
          tokenEndpoint: /mecSerMgmtApi/security/TokenEndPoint
          grantTypes:
            - OAUTH2_CLIENT_CREDENTIALS
      implSpecificInfo: {}
    serializer: JSON
    scopeOfLocality: MEC_SYSTEM
    consumedLocalOnly: false
    isLocal: true
serAvailabilityNotificationSubscriptions:
  - subscriptionType: SerAvailabilityNotificationSubscription
    callbackReference: string
    links:
      self:
        href: /mecSerMgmtApi/example
    filteringCriteria:
      serInstanceIds:
        - a4fab6fa-9ac7-4e29-8af6-082223cd13fc
      serNames:
        - ExampleService
      serCategories:
        - href: /example/catalogue1
          id: 57d75ef9-ca6a-47b7-bc3e-93b9d15d8efb
          name: RNI
          version: v1
      states:
        - ACTIVE
      isLocal: true
```

其中serName为注册到Mep的MEC APP服务名称，uris为与Mep-agent一同部署的MEC
APP的url路径，需要用户根据MEC App的实际信息与部署情况填写。

**注：单个应用注册的服务数量以及可用/终止事件订阅数量均应不超过50个，超出后服务将报错。**

Mep-agent容器内日志路径为/usr/mep/log/mep-agent.log，用户可以根据日志内容可查看Mep-agent
服务注册是否成功。用户也可以通过*查询应用服务*API查看服务注册是否成功注册到MEP中。

卸载指南
--------

说明：
EG-LDVS无单独的服务停止命令，若用户希望停止服务时，直接通过卸载方式停止服务。

### EG-LDVS MEP/MEP-agent卸载指导

本章节介绍MEP、MEP-agnet组件的卸载方式。想要完整卸载MEP及MEP-agent组件需要在部署环境执行以下操作：

1.  删除MEP/MEP-agent相关容器

2.  删除MEP/MEP-agent相关文件目录

3.  删除eguser用户及eggroup用户组

#### 删除MEP/MEP-agent相关容器


```
# delete MEP/MEP-agent related containers
root@ubuntu:~# docker rm -f mepserver
root@ubuntu:~# docker rm -f mepauth
root@ubuntu:~# docker rm -f kong-service
root@ubuntu:~# docker rm -f postgres-db
root@ubuntu:~# docker rm -f mepagent
root@ubuntu:~# docker network rm mep-net
```


#### 删除MEP/MEP-agent相关文件目录
```
# delete configuration file directories
root@ubuntu:~# rm -rf /data/thirdparty/kong
root@ubuntu:~# rm -rf /data/thirdparty/postgres
root@ubuntu:~# rm -rf /home/EG-LDVS/mepserver
root@ubuntu:~# rm -rf /tmp/mepauth-conf/
root@ubuntu:~# rm -rf /tmp/mepagent-conf/
root@ubuntu:~# rm -rf /tmp/kong-conf/
```


#### 删除eguser用户及eggroup用户组
```
# delete ‘eguser’ user and ‘eggroup’ user group
root@ubuntu:~# userdel eguser
root@ubuntu:~# groupdel eggroup
```

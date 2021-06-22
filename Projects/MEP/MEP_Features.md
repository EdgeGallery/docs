特性设计
================

## MEP-auth 模块相关特性

### MEP-auth 为APP提供认证鉴权功能
MEP-auth为APP提供认证鉴权功能，提供token申请接口，APP可以基于AK/SK签名算法，向MEP-auth提供正确的签名，获得token，然后通过该token访问MEP-server相关接口。

应用APP通过MEP-auth申请token的流程如下图所示：

![](/uploads/images/2021/cor2020/165746_8ff53084_5504908.png "接口调用.png")

1.  应用使用 [*服务认证接口*](MEP_Interfaces.html#service-authentication-interface)，获取token

2.  MEP-auth对ak/sk进行签名校验并签发token

3.  MEP-auth返回token

4.  应用携带token进行服务接口调用。可调用 [*应用服务管理相关接口*](MEP_Interfaces.html#application-service-management-related-interface)，[*可用事件订阅相关接口*](MEP_Interfaces.html#available-event-subscription-related-interface)，[*终止事件订阅相关接口*](MEP_Interfaces.html#termination-event-subscription-related-interface)。

5.  MEP基于kong的jwt插件校验token并路由相关请求至MEP-server。

token申请接口详细描述请参看“MEP features”章节。

### MEP-auth 为API网关提供配置功能
MEP-auth模块在初始化，会首先对API网关（kong）进行初始化:

1. 在kong添加一个consumer
2. 为MEP-auth自身配置service和route
3. 为MEP-server配置servcie和route
4. 为MEP-auth和MEP-server配置并启用kong插件

MEP-auth在初始化kong过程中开启的插件包括：

- **JWT插件** 为相应接口提供token校验能力
- **Appid-header插件** 在接口request中插入X-AppinstanceID头，以供MEP-server校验；校验申请token的client ip与调用接口的client ip一致
- **Rate Limiting插件** 为MEP-auth和MEP-server接口提供流量控制能力
- **IP Restriction插件** 为MEP-auth提供客户端IP白名单功能支持
- **response-transformer插件** 提供清除response中server header能力
- **pre-function插件** 提供修改接口请求x_forwarded_for能力

## MEP sever特性


### MEP服务治理功能
**定义**

服务管理功能是指MEP能够进行服务的注册，更新，删除，查询的能力。

**设计原理**

MEP提供服务注册，更新，删除，查询相关API接口。应用能够通过LDVS-MEP进行服务的注册，更新，删除，查询。

![服务注册，删除](/uploads/images/2021/cor2020/165650_4eeb753e_5504908.png "特性1.png")

应用服务状态订阅/通知功能
----------------------------------------

**定义**

应用服务状态订阅/通知功能是指LDVS能够进行服务状态的订阅，更新，删除，通知的能力。

**设计原理**

MEP管理应用服务的状态，应用通过MEP进行服务的注册，当服务消费者期望使用服务供应者的服务时，需要通过MEP订阅服务供应者的服务状态。通过订阅接口，MEP能够识别服务消费者关注的服务，在服务状态发生变化时，能够将相关的服务状态通知到服务消费者。

应用能够通过LDVS-MEP进行服务状态的订阅，更新，删除，查询。

![](/uploads/images/2021/cor2020/165707_f4dbb36e_5504908.png "特性2.png")

### MEP Service hearbeat
Each MEC service instance that has previously registered in MEC platform and is configured for heartbeat shall send heartbeat message to the MEC platform periodically in order to show that the MEC service instance is still operational. When the MEC platform has not received the heartbeat for a configurable amount of time, the MEC platform considers that the service instance can no longer be discovered and The service state will change to SUSPEND if it was ACTIVE before.

#### How to configure hearbeat for a service
Service register message will carry the livenessinterval field in it. It is an option field. If it is configured that indicate this service want to send heartbeat message. MEP platform support livenessinterval value is 60s. It will overwrite any value set by the service.
Note: For details of service register message please check the interface doc.

#### How to send heartbeat message
Services which already has set livenessinterval in its register message should send hearbeat message to MEP. When service registers, its response message will carry the URL (liveness), using which service should send the heartbeat to MEP.
Note: For details of hearbeat message please check the interface document.

EG-LDVS应用集成插件mep-agent
------------------------------------

**定义**

LDVS MEP-Agent作为应用快速集成适配器，实现服务配置导入和服务注册的功能。

**设计原理**

LDVS
MEP管理应用的服务，应用需要将其服务注册到MEP中，MEP-Agent作为适配器，将服务信息（包括应用实例ID）导入给应用，同时提供配置的方式将应用的服务注册到MEP中。

![](/uploads/images/2021/cor2020/165723_8d9be51d_5504908.png "特性3.png")

### MEP-Agent Get token API
MEP-Agent will run as sidecar along with application. If Apllication need to obtain token from mep for communication with services, it can query mep-agent api.
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
**Return example**

```
HTTP/1.1 200 OK
{
	"access_token":"xxxx",
	"token_type":"Bearer",
	"expires_in":"3600"
}
```

Capabilities(Service) query support
------------------------------------
**定义**

Once capabilities(services) registered to the mep, other applications can consume it. MEP support the listing of these capabilities(services) over Mm5 interface.

**设计原理**

The capability query interface is exposed over Mm5 interface to MECM module and it can be queried together or independently. Each capability consists of a list of the present consumers to it.

![Query flow](/uploads/images/2021/cor2020/152205_3918141b_7625394.png "quwery_flow1.png")

## DNS server 特性
The MEP platform provides the domain name resolution services to the applications deployed in the EdgeGallery MEC, which can be utilized by the device applications in UE. MEC platform receives the DNS configurations from the MEC management, which includes the FQDN(Fully Qualified Domain Name), IP address and related entries. MEC applications can later query or modify the state of these configurations.

The three major operations for DNS are:

1. DNS management operations.
2. Query configuration and Activation/Deactivation by the MEC applications.
3. DNS query by the device applications.

We will see each of these features in the below section.
### DNS management operations

DNS configurations are created either by MECM modules during start-up or from the OSS directly. DNS management supports both create, update, query and delete operations.

**Rule creation at start-up**

DNS configurations are embedded in the application descriptor and MEO(Multi-access Edge Orchestrator) will get these information during the start-up of the application. Once MEO receives the application descriptor, it searches for the DNS related configurations and pass this information to the MEPM(MEC Platform Manager) module in the edge along with the start-up request on Mm3 interface.

Upon receiving the DNS configurations from MEO, MEPM send this request to the MEP server on Mm5 interface after deploying the MEC application.

![](/uploads/images/2021/cor2020/133822_31b532a2_7625394.png "meo-mepm-mep.png")

**Rule creation from OSS**

DNS configurations can be updated from OSS directly over Mm2 interface through MEPM.

![](/uploads/images/2021/cor2020/133912_597b2c17_7625394.png "oss-mepm-mep.png")

### DNS configurations from MEC applications

MEC applications can query the DNS configurations created for it and can activate or deactivate the same. Activation or deactivation can be performed by modifying the state of the DNS configuration.

![](/uploads/images/2021/cor2020/133933_9f7bd2ec_7625394.png "mecapp-mep.png")

### DNS query

Device application in the UE can query the DNS server for the domain name resolution. By default the DNS server will listen on the 53 port.

### How to configure the DNS server?

The dns server in MEP runs inside a container and can be configured using few command line parameters. 

**Command**

```
dnsserver [OPTION]...
```

Detailed list of the optional parameters are stated below.
| Parameter | Type | Range/Length | Default | Description |
| --------- | ---- | ------------ | ------- | ----------- |
| -db | string | 1~256  | dbEgDns | Backend store db name |
| -port | number | 1~65535  | 53 | DNS server listening port |
| -managementPort | number | 1~65535  | 8080 | Management interface listening port |
| -connectionTimeout | number | 2~50  | 2 | Connection timeout |
| -ipAdd | string | Ipv4/Ipv6  | 0.0.0.0 | DNS listening ip address |
| -managementIpAdd | string | Ipv4/Ipv6  | 0.0.0.0 | Management interface listening ip address |
| -forwarder | string | Ipv4/Ipv6  |  | DNS proxy server IP |
| -loadBalance | bool | true/false  | false | For domain names with multiple ip address, enabling this option will perform loadbalancing by shuffling the response IP list |

**Example**
```
$ dnsserver -port=8053 -managementPort=8080 -loadBalance -forwarder <some-dns-server>
```
## HealthCheck
### 需求来源

*EdgeGallery版本规划

### 需求描述（Requirement Description）

*Support mec-m check its edge healthy condition 

### Usecase



![](/uploads/images/2021/mep/usecase.png "healthcheck-usecase.png")

1. MECM调用中心侧服务HealthCheck-M，启动整体健康检查服务
2. 中心侧HealthCheck-M根据MECM调用时body内的mec list检查所辖的边缘节点
3. 各边缘节点HealthCheck收到中心侧HealthCheck-M的检查信息，先自查内部mep/lcm的健康情况，当边缘侧的mep/lcm均健康时，此边缘节点则认为本边缘节点健康
4. 完成自查后，边缘节点间启动互查机制，被访问的节点mep/lcm均健康则认为节点健康
5. 各边缘节点把通讯后互查结果反馈回HealthCheck-M，HealthCheck-M启动投票机制
6. 中心侧HealthCheck-M投票则是，当某节点收到其他节点的通讯成功的结果超过mec list总数的一半时中心侧认为此节点健康
7. HealthCheck-M把投票结果反馈给MECM或调用方

### 涉及模块&&EPIC&&Story

*MECM

​      *调用方启动HealthCheck-M，HealthCheck-M访问MECM-inventory获取mec list

*MEP

​       *边缘侧健康检查本节点MEP情况，MEP和LCM均健康时才认为此节点健康

*LCM

​       *边缘侧健康检查本节点MEP情况，MEP和LCM均健康时才认为此节点健康

### 业务流程

![](/uploads/images/2021/mep/routine.png "healthcheck-routine.png")

### 接口定义

|        | Method | URL                                  | Body                                                         |
| ------ | :----: | ------------------------------------ | ------------------------------------------------------------ |
| center |  GET   | /health-check/v1/center/action/start |                                                              |
| center |  GET   | /health-check/v1/center/health       | {["checked ip" : string, "condition" : bool]}                |
| edge   |  POST  | /health-check/v1/edge/action/start   | {"checker ip" : string, "edgeCheckInfo" : ["checked ip" : string, "condition" : bool]} |
| edge   |  GET   | /health-check/v1/edge/health         |                                                              |


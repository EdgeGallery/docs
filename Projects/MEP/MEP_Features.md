# MEP-auth 模块相关特性


## MEP-auth 为APP提供认证鉴权功能
MEP-auth为APP提供认证鉴权功能，提供token申请接口，APP可以基于AK/SK签名算法，向MEP-auth提供正确的签名，获得token，然后通过该token访问MEP-server相关接口。

应用APP通过MEP-auth申请token的流程如下图所示：

![输入图片说明](/uploads/images/2020/0804/165746_8ff53084_5504908.png "接口调用.png")

1.  应用使用[*服务认证接口*](#服务认证接口)，获取token

2.  MEP-auth对ak/sk进行签名校验并签发token

3.  MEP-auth返回token

4.  应用携带token进行服务接口调用。可调用[*应用服务管理相关接口*](#应用服务管理相关接口)，[*可用事件订阅相关接口*](#可用事件订阅相关接口)，[*终止事件订阅相关接口*](#终止事件订阅相关接口)。

5.  MEP基于kong的jwt插件校验token并路由相关请求至MEP-server。

token申请接口详细描述请参看“MEP features”章节。

## MEP-auth 为API网关提供配置功能
MEP-auth模块在初始化，会首先对API网关（kong）进行初始化:

1. 在kong添加一个consumer
2. 为MEP-auth自身配置service和route
3. 为MEP-server配置servcie和route
4. 为MEP-auth和MEP-server配置并启用kong插件

截止到v0.9版本，MEP-auth在初始化kong过程中开启的插件包括：

- JWT插件：为相应接口提供token校验能力
- Appid-header插件：在接口request中插入X-AppinstanceID头，以供MEP-server校验；校验申请token的client ip与调用接口的client ip一致
- Rate Limiting插件：为MEP-auth和MEP-server接口提供流量控制能力
- IP Restriction插件：为MEP-auth提供客户端IP白名单功能支持
- response-transformer插件：提供清除response中server header能力
- pre-function插件：提供修改接口请求x_forwarded_for能力

# MEP sever特性


## MEP服务治理功能
**定义**

服务管理功能是指MEP能够进行服务的注册，更新，删除，查询的能力。

**设计原理**

MEP提供服务注册，更新，删除，查询相关API接口。应用能够通过LDVS-MEP进行服务的注册，更新，删除，查询。

![服务注册，删除](https://images.gitee.com/uploads/images/2020/0804/165650_4eeb753e_5504908.png "特性1.png")

应用服务状态订阅/通知功能
----------------------------------------

**定义**

应用服务状态订阅/通知功能是指LDVS能够进行服务状态的订阅，更新，删除，通知的能力。

**设计原理**

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


# DNS server 特性
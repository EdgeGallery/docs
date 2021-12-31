# developer 容器应用开发指导

## 环境准备

### edgegallery 安装v1.5版本 
#### developer 孵化容器应用注意事项<br/>
1.5版本上传部署文件（应用孵化第三步选择沙箱之后），image校验规则如下：<br/>

 **1.** image默认配置为edgegallery镜像仓库地址（包括环境变量的配置形式），首先会去edgegallery仓库校验，如若不存在，提示用户上传镜像到edgegallery仓库）。<br/>

 
## 配置沙箱环境：developer新增K8S沙箱环境

 **1.** 利用admin账户登录Developer平台，打开集成开发-系统管理-沙箱管理，点击右上角新增沙箱环境按钮，添加k8的沙箱<br/>
![输入图片说明](/uploads/images/2021/0701/143746_1e95d967_5504908.png "k8s.png")<br/>
**2.** 参数说明：<br/>
 **名称** 边缘节点（沙箱环境）的名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **lcmIp** lcmcontroller的ip地址<br/>
 **mecHost:** 边缘节点的IP地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **端口号** lcmcontroller对外暴露的端口号<br/>
 **协议** 选择https&nbsp;&nbsp; **用户名** 登录mechost的用户名&nbsp;&nbsp; **密码** 登录mechost的密码<br/>
 **架构** 根据自己的需要选择&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **部署区域** 根据自己的需要填写<br/>
 **mecPort**连接mechost的端口号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**其他** 可以不用改动（资源配置可以为空）<br/>
**3.** 上传的配置文件结构如下，自己配置部分已由xxx代替：<br/>
![输入图片说明](/uploads/images/2021/0701/151313_489a9540_5504908.png "config.png")

## 容器应用开发
### 新建容器应用项目，主要的是选择容器属性，因为涉及到后续的发布能力，以新建项目为例作出说明
#### 1. 进入首页，点击应用孵化图标

#### 2. 点击创建应用，记得负载类型选择容器

#### 3. 点击能力中心，可以选择平台已有能力或者开发者已发布的能力

#### 4. 点击选择沙箱，选择可用的沙箱，然后上传部署脚本

#### 5. 接第四步，上传脚本完成，点击右侧，容器启动按钮，开始部署，部署完成，释放环境，点击右下角完成

#### 6. 点击制作镜像，可以配置需要发布的服务，点击右下角打包预览，打包完成，点击右上角，返回孵化流程

####7. 点击测试认证，选择对应的测试场景，点击右下角开始测试，等待测试完成

#### 8. 发布，测试完成，点击测试用例页面上部的发布按钮，发布应用到应用仓库

#### 9. 点击应用仓库，查看已发布应用

## 常见问题
#### 1.开发者对容器应用部署调测时，可以下载开发者平台提供的样例yaml，根据自己需要部署的应用，修改样例yaml并上传使用。<br/> 

#### 2.开发者平台会对上传的yaml中的镜像信息进行校验，yaml中配置的镜像不拘泥于固定格式，但是需要注意的是镜像需要为EdgeGallery仓库已有镜像。<br/> 

#### 3.如果yaml中配置的镜像形式为EdgeGallery仓库镜像形式，请提前上传镜像到EdgeGallery仓库，防止容器应用部署调测失败。<br/> 

#### 4.如果yaml中配置的镜像形式为EdgeGallery仓库镜像形式，建议的镜像配置格式如下：<br/> 

#### ‘{{.Values.imagelocation.domainname}}/{{.Values.imagelocation.project}}/xxx:xxx’<br/> 

#### 5.请尽可能的配置yaml中的namespace，并确保其格式为’{{ .Values.appconfig.appnamespace }}’。<br/> 

#### 6.尽可能一次性配置正确，确保yaml中的关键参数配置正确，例如暴露的端口，配置的环境变量等等。<br/> 

## 容器应用与MepAgent的集成
### 参考文档：[APP通过MEP调用](https://gitee.com/edgegallery/docs/blob/master/Projects/MEP/app%E9%80%9A%E8%BF%87MEP%E8%B0%83%E7%94%A8.md)
# developer 容器应用开发指导

## 环境准备

### edgegallery 安装v1.2版本 
#### developer 安装注意事项-镜像仓库配置<br/>
1.2版本部署yaml上传的时候，新增image校验，校验规则如下：<br/>

 **1.** image配置为edgegallery镜像仓库地址（包括环境变量的配置形式），首先会去edgegallery仓库进行拉取，如果拉取失败，提示上传者镜像信息配置有误（镜像地址配置错误或者未提前上传镜像到edgegallery仓库）。<br/>

 **2.** image配置为其他镜像仓库地址（例如swr,docker等仓库），首先会进行拉取，如果拉取失败，提示上传者镜像信息配置有误（镜像地址配置错误，开源仓库中未找到此镜像）。拉取成功，developer后台会对此镜像进行重新打标签，推到edgegallery仓库，下次开发者可以直接配置成edgegallery仓库的镜像地址形式，进行容器应用的开发。<br/>

 **3.** 镜像信息配置为其他形式（非edgegallery镜像仓库镜像地址），因为镜像大小以及仓库的不同，以及后续的重新打标签，推送操作，可能会有稍微的费时，请开发者上传yaml时耐心等待。
#### developer 安装注意事项-Docker配置<br/>

 **1.** 因为涉及到开发者连接edgegallery安装环境的docker去其他开源镜像仓库拉取镜像，因此开放2375端口（其他未被占用端口也可以）。以下操作以环境为Ubuntu18.04,Docker18.09.0作为样例说明，不同系统，docker的安装目录也不尽相同，具体原理大体一致。<br/>
- 查找docker.service的目录，操作命令systemctl status docker
![输入图片说明](https://images.gitee.com/uploads/images/2021/0630/170158_44bd012f_5504908.png "dockerservice-new.png")
- 编辑docker.service,添加如下内容<br/>
![输入图片说明](https://images.gitee.com/uploads/images/2021/0630/170510_ee349bc5_5504908.png "dockerservicecontent.png")
- systemctl daemon-reload //重新加载系统的daemon,使配置生效
- service docker restart  //重启docker<br/>

 **2.** 接上面的步骤，重启docker之后，查看/var/run/docker.sock的权限，如果docker.sock的权限中的o权限为0，手动为其添加rw权限
最终权限如下：<br/>
![输入图片说明](https://images.gitee.com/uploads/images/2021/0630/171606_83e1797d_5504908.png "dockersock.png")
<br/>
## 配置沙箱环境：developer新增K8S沙箱环境

 **1.** 利用admin账户登录Developer平台，打开系统-沙箱管理，点击左上角新增沙箱环境按钮，添加k8的沙箱<br/>
![输入图片说明](https://images.gitee.com/uploads/images/2021/0701/143746_1e95d967_5504908.png "k8s.png")<br/>
**2.** 参数说明：<br/>
 **名称** 边缘节点（沙箱环境）的名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **lcmIp** lcmcontroller的ip地址<br/>
 **mecHost:** 边缘节点的IP地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **端口号** lcmcontroller对外暴露的端口号<br/>
 **协议** 选择https&nbsp;&nbsp; **用户名** 登录mechost的用户名&nbsp;&nbsp; **密码** 登录mechost的密码<br/>
 **架构** 根据自己的需要需要&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **部署区域** 根据自己的需要需要<br/>
 **其他** 可以不用改动
**3.** 上传的配置文件结构如下，自己配置部分已由xxx代替：<br/>
![输入图片说明](https://images.gitee.com/uploads/images/2021/0701/151313_489a9540_5504908.png "config.png")

## 容器应用开发
todo 开发指导，快速集成，如何发布能力，如何服务注册、mepagent的集成，如何修改yaml、如何上传镜像




## 常见问题
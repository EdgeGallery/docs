SDK installation and use guide Guide
============

### 概述

开发者平台集成了API多语言SDK的生成，通过Swagger Codegen组件自动生成API的客户端源码，本地安装后更加方便的调用edgegallery平台提供的API能力，目前支持python、java、go语言。


### 安装指导
#### 源码下载
 
 登录edgegallery一站式集成开发平台，进入能力中心，打开需要的服务，选择语言进行SDK下载。

![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/184412_af3b54ee_7625288.png "屏幕截图.png")

#### JAVA语言SDK源码安装

你要先将maven安装到电脑上，配置上环境变量，path直接为maven地址/bin即可
修改maven的setting文件
目录自己对应：D:\apache-maven-3.5.0-bin\apache-maven-3.5.0\conf下的settings.xml
大概在56行左右
 <!-- 设置本地地址 -->
  <localRepository>D:\apache-maven-3.5.0-bin\repostory</localRepository>

不要着急打包，这里有个小的环节需要注意下，不然你打的jar是不用在其他项目引用的！
在你的项目pom文件底部把这个东西plugin注释掉，这个是创建项目原带的
![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/184520_07df5a09_7625288.png "屏幕截图.png")

然后进行打包

![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/184540_8bf0f0f1_7625288.png "屏幕截图.png")

打包完事之后，我们在我们项目的target找到我们的jar

![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/184555_effdac74_7625288.png "屏幕截图.png")

mvn命令打包的jar放入到我们的本地mvn仓库。

![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/184636_9e80e525_7625288.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/184717_f4f21403_7625288.png "屏幕截图.png")

这里我们写完注意以下几个我们填写的参数记住，我们去我们的仓库中查看一下：发现已经将包准备好了

![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/184732_9a81c89e_7625288.png "屏幕截图.png")

第四步 在使用项目中进行引用
在我们目标项目中pom下放入以下依赖

<dependency>
   <groupId>com.edgegallery.test</groupId>
   <artifactId>edgegallery-test</artifactId>
   <version>1.0</version>
</dependency>

![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/184931_603429e9_7625288.png "屏幕截图.png")

这下我们就可以直接使用里面的方法然后导包就ok了

![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/184947_ec120e7b_7625288.png "屏幕截图.png")

#### PYTHON语言SDK源码安装

打开相应的目录，执行以下命令：

python setup.py install

![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/185809_0440a8be_7625288.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/185836_d50b27ef_7625288.png "屏幕截图.png")

安装成功后，直接导入包名即可使用

![输入图片说明](https://images.gitee.com/uploads/images/2020/1215/190011_c58957d6_7625288.png "屏幕截图.png")




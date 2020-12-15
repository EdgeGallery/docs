SDK installation and use guide Guide
============

### 概述

开发者平台集成了API多语言SDK的生成，通过Swagger Codegen组件自动生成API的客户端源码，本地安装后更加方便的调用edgegallery平台提供的API能力，目前支持python、java、go语言。


### 安装指导
#### 源码下载
 
 登录edgegallery一站式集成开发平台，进入能力中心，打开需要的服务，选择语言进行SDK下载。

![](/uploads/images/2020/0908/163000_767c7da4_5416924.png "注册.PNG")
![](/uploads/images/2020/0908/163022_fe7cc972_5416924.png "登录.PNG")

#### JAVA语言SDK源码安装

你要先将maven安装到电脑上，配置上环境变量，path直接为maven地址/bin即可
修改maven的setting文件
目录自己对应：D:\apache-maven-3.5.0-bin\apache-maven-3.5.0\conf下的settings.xml
大概在56行左右
 <!-- 设置本地地址 -->
  <localRepository>D:\apache-maven-3.5.0-bin\repostory</localRepository>
不要着急打包，这里有个小的环节需要注意下，不然你打的jar是不用在其他项目引用的！
在你的项目pom文件底部把这个东西plugin注释掉，这个是创建项目原带的
然后进行打包

打包完事之后，我们在我们项目的target找到我们的jar

mvn命令打包的jar放入到我们的本地mvn仓库。

这里我们写完注意以下几个我们填写的参数记住，我们去我们的仓库中查看一下：发现已经将包准备好了

第四步 在使用项目中进行引用
在我们目标项目中pom下放入以下依赖

这下我们就可以直接使用里面的方法然后导包就ok了
![](/uploads/images/2020/0910/203347_7c79c40a_7625288.png "首页.png")

#### 开发工具-插件

 点击导航栏的开发工具，选择下拉列表中的插件，可以查看所有的开发者已上传的所有插件，目前登录用户只能删除自己上传的插件，可以查看详情，下载，评分等操作。

![](/uploads/images/2020/0915/100113_a5e86049_5504908.png "插件列表页.png")

#### 开发工具-上传

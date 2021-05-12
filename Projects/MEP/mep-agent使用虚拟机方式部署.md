### 打包可执行文件
1. git clone mep-agent的代码

```
git clone https://gitee.com/edgegallery/mep-agent.git
```
2. 编译打包成可执行文件

如果是windows环境打包linux可执行文件，需要设置GOOS

```
set GOOS=linux
```
在mep-agent目录下执行go build命令，当前dockerfile使用的go version为1.14.2，如果是1.16版本命令参数会不一样
```
# go version go1.14.2 windows/amd64
go build -buildmode=pie -ldflags '-linkmode "external" -extldflags "-static"' src/main/main.go

# go version go1.16.2 windows/amd64
go build -buildmode=pie -ldflags '-linkmode="external"' src/main/main.go
```

### 拷贝可执行文件和配置文件到虚拟机


��          �               �   N   �      L  ^   i  '   �  �   �  C   w     �     �     �  �        �     �     �  �    k   �     �  �     1   �  �   �  R   l     �     �  "   �  �        	     !	     ?	   **如果修改启动的端口，需要添加app.conf配置文件指定端口** git clone mep-agent的代码 vi /etc/profile 添加下面的环境变量，环境变量的值根据实际环境的值修改 wq保存后，source /etc/profile生效 在mep-agent目录下执行go build命令，当前dockerfile使用的go version为1.14.2，如果是1.16版本命令参数会不一样 如果是windows环境打包linux可执行文件，需要设置GOOS 打包可执行文件 执行可执行文件 编译打包成可执行文件 虚拟机创建/usr/mep目录，创建/usr/mep/log/mep-agent.log日志文件，拷贝代码中的conf、views目录到/usr/mep下，拷贝可执行文件到此目录（没有指定名词则为main） 设置可执行权限 设置环境变量 运行程序 Project-Id-Version: EdgeGallery Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-05-26 17:32+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.1
 ** If the activated port is modified, a app.conf configuration document is required to specify the port * * Code for git clone mep-agent vi /etc/profile adds the environment variable below, the value of the environment variable is modified based on the value of the actual environment source /etc/profile takes effect after wq archive Run the go build command under the mep-agent directory, current dockerfile uses go version 1.14.2, if it is a 1.16 version command parameter For windows environment packaging linux executable documents, GOOS needs to be set Pack executable documents Running a executable document Compiled into executable documents The virtual machine creates the /usr/mep directory, creates the /usr/mep/log/mep-agent.log log document, the conf in the copy code, the views directory to /usr/mep, copy executable documents to this directory (no noun is specified main) setting executable rights setting environment variables Run Process 
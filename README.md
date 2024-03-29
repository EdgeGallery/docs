# 文档

＃＃ 介绍
仓库的文档由文档工具[文档](http://docs.edgegallery.org/zh_CN/latest/)编译形成，链接如下：http://docs.edgegallery.org/zh_CN /最新的/

该文档目前包含以下内容：

- [开始](https://gitee.com/edgegallery/docs/blob/master/Get%20Started/Start%20from%20A%20Demo%20on%20EdgeGallery.md)
- [开发者指南](https://gitee.com/edgegallery/docs/tree/master/Developer%20Guide)
- [发布说明](https://gitee.com/edgegallery/docs/blob/master/Release%20Notes/EdgeGallery_RN_zh.md)
- [项目](https://gitee.com/edgegallery/docs/tree/master/Projects)


##版权
[Apache 许可证版本 2.0](https://gitee.com/edgegallery/docs/blob/master/license)

[知识共享公司 4.0（CC-BY-4.0）](https://gitee.com/edgegallery/docs/blob/master/license-cc-by-4.0)

## Docs repo 提交的必要步骤
在 docs 存储库的 .md 文件中进行更改后，必须遵循以下步骤才能使相同的翻译工作。即使 .md 文件是用英文编写的，也必须遵循这些步骤，以保持正确的翻译结构

###环境要求

- Ubuntu `18.04` 版本或更高版本
- python`3.8`安装在ubuntu中

### 设置环境

**第 1 步：安装 python 的虚拟环境**
``
apt-get 更新
apt-get install python-virtualenv
mkdir /opt/python/3.8
virtualenv -p /usr/bin/python3 /opt/python/3.8
源/opt/python/3.8/bin/activate
``

**第 2 步：准备虚拟环境**
在虚拟环境中安装 pip 最新版本 21.1.1
``
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.8 get-pip.py
``
确保在虚拟环境中执行 'pip --version' 命令会产生一个输出版本
``
(3.8) swajan@swajan-IdeaPad-3-15ADA05:~/jans_work/docs/2605/sixth_commit/docs$ pip --version
来自 /home/swajan/jans_work/python3/3.8/lib/python3.8/site-packages/pip (python 3.8) 的 pip 21.1.1
(3.8) swajan@swajan-IdeaPad-3-15ADA05:~/jans_work/docs/2605/sixth_commit/docs$
``

**第 3 步：Sphinx 工具安装**
- 进入 docs 代码目录，执行 `cd docs/`
- 从 docs 目录运行 `test_tools.sh`
这将导致生成 .pot 文件、更新 .po 文件、创建 .mo 文件、中文 html 和英文 html
``
生成的文件目录
.pot 文件目录：docs/_build/gettext/
.po 文件目录：docs/locale/en/LC_MESSAGES/
中文html目录：docs/build/html/
英文 html 目录：docs/_build/html/en
``

**第 4 步：翻译**
对于 docs 项目中 .md 文件的每次更改，都会更新或创建 .po 文件，而 `test_tools.sh` 在第 3 步中运行。

按照以下步骤制作正确的翻译内容。
1.【填充空msgStr】(#Fill-the-empty-msgStr)
2.【修改模糊msgStr】(#Modify-the-fuzzy-msgStr)
3.【移除旧内容】(#Remove-the-old-content)

**填充空的msgStr**
在 docs/locale/en/LC_MESSAGES/ 中为相同的修改过的 .md 文件导航相应的 .po 文件。
> 对于 docs/Projects/User Management/User_Interfaces.md 中的更改，应修改 docs/locale/en/LC_MESSAGES/Projects/User Management/User_Interfaces.po

文件中的所有 `msgId` 都应该可以进行翻译。对于每个 msgId，应该在 msgStr 中给出翻译
在文件中搜索`msgStr ""`，手动翻译msgId。
``
需要在 User_Interfaces.po 文件中转换的空 msgStr
#: ../../Projects/User Management/User_Interfaces.md
msgstr "邮箱地址"
msgstr ""
``
``
User_Interfaces.po 文件中 msgStr 的翻译内容
#: ../../Projects/User Management/User_Interfaces.md
msgstr "邮箱地址"
msgstr "电子邮件地址"
``
**修改模糊msgStr**
.md 的修改行会使 .po 文件具有“模糊”内容，也应该正确翻译。
> 在 .po 文件中搜索 `#,fuzzy`
``
#: ../../Projects/User Management/User_Interfaces.md:561
#，模糊
msgstr "注册前需要先获取图形验证码，应用评论通过verifyCode参数传递。"
msgstr "注册前，需要图形验证码通过verifyCode参数。"
``
> 去掉包含`#,fuzzy`的那一行，重新翻译msgId，更新User_Interface.po文件中的msgStr
``
#: ../../Projects/User Management/User_Interfaces.md:561
msgstr "注册前需要先获取图形验证码，应用评论通过verifyCode参数传递。"
msgstr "注册前需要获取图文验证码，应用评论通过verifyCode参数传递。"
``
**删除旧内容**
> 在 .po 文件中搜索 `#~`。
``
删除下面这些以“#~”开头的行
#~ msgstr "邮箱地址"
#~ msgstr "电子邮件地址"
``
**第 5 步：验证**
- 在所有 .po 文件中保存更改后，再次运行 docs/ 目录下的 `test_tools.sh`
- 进入`docs/_build/html/en`，验证对应的英文翻译的html文件

**第 6 步：提交**
在推送更改时，只提交在 `.po` 和 `.md` 中所做的更改。忽略所有其他文件夹和文件。
``
不要提交以下文件和文件夹。删除这些更改。
1. 文档/_build
2. 文档/构建
3. docs/locale/en/LC_MESSAGES/*.mo
``
## 文档详情
该仓库的文档通过文档工具编译形成[文档](http://docs.edgegallery.org/zh_CN/latest/)，链接如下：http://docs.edgegallery.org/zh_CN/latest/

该文档当前包含的内容如下：

- [开始](https://gitee.com/edgegallery/docs/blob/master/Get%20Started/Start%20from%20A%20Demo%20on%20EdgeGallery.md)
- [开发者指南](https://gitee.com/edgegallery/docs/tree/master/Developer%20Guide)
- [发布说明](https://gitee.com/edgegallery/docs/blob/master/Release%20Notes/EdgeGallery_RN_zh.md)
- [项目](https://gitee.com/edgegallery/docs/tree/master/Projects)
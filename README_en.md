# docs

## Introduction
The documentation of the warehouse is compiled and formed by the documentation tool[Documentation](http://docs.edgegallery.org/zh_CN/latest/)，The link is as follows：http://docs.edgegallery.org/zh_CN/latest/

The document currently contains the following content：

- [Get Started](https://gitee.com/edgegallery/docs/blob/master/Get%20Started/Start%20from%20A%20Demo%20on%20EdgeGallery.md)
- [Developer Guide](https://gitee.com/edgegallery/docs/tree/master/Developer%20Guide)
- [Release Notes](https://gitee.com/edgegallery/docs/blob/master/Release%20Notes/EdgeGallery_RN_zh.md)
- [Projects](https://gitee.com/edgegallery/docs/tree/master/Projects)


## copyright
[Apache License Version 2.0](https://gitee.com/edgegallery/docs/blob/master/license)

[Creative Commons Corporation 4.0（CC-BY-4.0）](https://gitee.com/edgegallery/docs/blob/master/license-cc-by-4.0)

## Mandatory step for Docs repo commit
After making changes in .md files of docs repository, the following steps must be followed to make the translation of the same to work. Even if the .md files are written in English, these steps must be followed, to maintain a proper translation structure

### Environment Requirement

- Ubuntu `18.04` version or higher than that
- python `3.8` installed in ubuntu

### Setting up of the env

**STEP 1: Install virtual env of python**
```
apt-get update
apt-get install python-virtualenv
mkdir /opt/python/3.8 
virtualenv -p /usr/bin/python3 /opt/python/3.8
source /opt/python/3.8/bin/activate
```

**STEP 2: Prepare the virtual env**
Install pip latest version 21.1.1, inside the virtual env
```
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.8 get-pip.py
```
Make sure that executing 'pip --version' command inside virtual env produces an output version
```
(3.8) swajan@swajan-IdeaPad-3-15ADA05:~/jans_work/docs/2605/sixth_commit/docs$ pip --version
pip 21.1.1 from /home/swajan/jans_work/python3/3.8/lib/python3.8/site-packages/pip (python 3.8)
(3.8) swajan@swajan-IdeaPad-3-15ADA05:~/jans_work/docs/2605/sixth_commit/docs$ 
```

**STEP 3: Sphinx tools installation**
- Go to the docs code directory, and do `cd docs/`
- Run `test_tools.sh` from the docs directory
This will result in generating .pot files, updating .po files, creating .mo files, chinese html and English html
```
Generated files directory
.pot files dir : docs/_build/gettext/
.po files dir: docs/locale/en/LC_MESSAGES/
Chinese html dir: docs/build/html/
English html dir: docs/_build/html/en
```

**STEP 4: Translation**
For every change in .md files in docs project made, the .po files will be updated or created, while the `test_tools.sh` was run in STEP 3. 

Follow the below steps to make a proper translated content.
1. [Fill the empty msgStr](#Fill-the-empty-msgStr)
2. [Modify the fuzzy msgStr](#Modify-the-fuzzy-msgStr)
3. [Remove the old content](#Remove-the-old-content)

**Fill the empty msgStr**
Navigate the corresponding .po file for the same modified .md file, in docs/locale/en/LC_MESSAGES/.
> For a change made in docs/Projects/User Management/User_Interfaces.md, the docs/locale/en/LC_MESSAGES/Projects/User Management/User_Interfaces.po should be modified

Translation should be available for all `msgId` in the file. For each msgId, translation should be given in msgStr
Search `msgStr ""` in the files, and do a manual translation of the msgId. 
```
Empty msgStr which needs translation in User_Interfaces.po file
#: ../../Projects/User Management/User_Interfaces.md
msgid "邮箱地址"
msgstr ""
```
```
Translated content of msgStr in User_Interfaces.po file
#: ../../Projects/User Management/User_Interfaces.md
msgid "邮箱地址"
msgstr "Email Address"
```
**Modify the fuzzy msgStr**
Modified lines of .md would make .po file have `fuzzy` content, which also should be properly translated.
> Search for `#, fuzzy` in the .po file
```
#: ../../Projects/User Management/User_Interfaces.md:561
#, fuzzy
msgid "注册前需要先获取图形验证码，应用评论通过verifyCode参数传递。"
msgstr "Before registration, a graphical verification code is required to pass through the verifyCode parameter."
```
> Remove the line which contains `#, fuzzy` and retranslate the msgId, and update the msgStr in User_Interface.po file
```
#: ../../Projects/User Management/User_Interfaces.md:561
msgid "注册前需要先获取图形验证码，应用评论通过verifyCode参数传递。"
msgstr "Before registering, you need to obtain the graphic verification code, and the application comments are passed through the verifyCode parameter."
```
**Remove the old content**
> Search for `#~` in the .po file.
```
Remove these below lines, which start with '#~'
#~ msgid "邮箱地址"
#~ msgstr "email address"
```
**STEP 5: Verification**
- After saving the changes in all the .po files, once again run the `test_tools.sh` under the docs/ directory
- Go into `docs/_build/html/en`, and verify the corresponding english translated html files

**STEP 6: Commit**
While pushing the changes, only commit the changes made in `.po` and `.md`. Ignore all the other folders and files.
```
Do not commit the below files and folders. Remove these changes.
1. docs/_build
2. docs/build
3. docs/locale/en/LC_MESSAGES/*.mo
```
## Documentation Details
该仓库的文档通过文档工具编译形成[文档](http://docs.edgegallery.org/zh_CN/latest/)，链接如下：http://docs.edgegallery.org/zh_CN/latest/

该文档当前包含内容如下：

- [Get Started](https://gitee.com/edgegallery/docs/blob/master/Get%20Started/Start%20from%20A%20Demo%20on%20EdgeGallery.md)
- [Developer Guide](https://gitee.com/edgegallery/docs/tree/master/Developer%20Guide)
- [Release Notes](https://gitee.com/edgegallery/docs/blob/master/Release%20Notes/EdgeGallery_RN_zh.md)
- [Projects](https://gitee.com/edgegallery/docs/tree/master/Projects)



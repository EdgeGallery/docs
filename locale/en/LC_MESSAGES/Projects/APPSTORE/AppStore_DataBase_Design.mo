��    	      d               �      �   :   -  >   h  [   �  /     A   3  F   u     �  �  �  �   X  C   �  K   5  n   �  A   �  Q   2  N   �     �   AppStore数据库使用了开源的PostgreSQL数据库，推荐版本为12.2。目前设计并应用了三张数据库表格： app_store_table: 存储外部appstore信息（POC特性） app_table: 存储app信息，如名字、提供者、描述等 catalog_package_table: 存储应用的package信息，一个应用可以拥有多个package csar_package_score: 存储应用的评论信息 message_table: 存储appstore间互通时的消息（POC特性） pushable_package_table: 存储可推送csar包的信息（POC特性） 数据库设计 Project-Id-Version: EdgeGallery Documentation 
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
 The AppStore database uses open-source PostgreSQL databases with a recommended version of 12.2.Three database tables are currently designed and applied: app_store_table: stores external appstore information (POC feature) app_table: stores app information such as name, provider, description, etc. catalog_package_table: package information for storage applications, one application can have multiple package csar_package_score: Comments information for storage applications message_table: Message (POC feature) to store intercommunication between appstore pushable_package_table: stores information that can push a cswar (POC feature) Database design 
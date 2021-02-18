# 接口URI变更

| 原URI | 现URI | 方法 | API说明 |
| --- | --- | --- | --- |
| /mec/appstore/poke/pushable/packages | /mec/appstore/v1/packages/pushable | GET | 查询可推送的应用列表 |
| /mec/appstore/poke/pushable/packages/{packageId} | /mec/appstore/v1/packages/{packageId}/pushable | GET | 根据packageId获取可推送应用包 |
| /mec/appstore/poke/pushable/packages/{packageId}/action/push | /mec/appstore/v1/packages/{packageId}/action/push | POST | 根据packageId推送应用包|
| /mec/appstore/poke/pushable/packages/{packageId}/action/download-package | /mec/appstore/v1/packages/{packageId}/action/download-package | GET | 根据packageId下载推送应用包 |
| /mec/appstore/poke/pushable/packages/{packageId}/action/download-icon | /mec/appstore/v1/packages/{packageId}/action/download-icon | GET | 根据packageId下载推送应用图标 |
| /mec/appstore/poke/appstores | /mec/appstore/v1/appstores | POST | 新增外部应用仓库 |
| /mec/appstore/poke/appstores/{appStoreId} | /mec/appstore/v1/appstores/{appStoreId} | DELETE | 删除外部应用仓库 |
| /mec/appstore/poke/appstores/{appStoreId} | /mec/appstore/v1/appstores/{appStoreId} | PUT | 修改外部应用仓库 |
| /mec/appstore/poke/appstores | /mec/appstore/v1/appstores | GET | 查询外部应用仓库列表 |
| /mec/appstore/poke/appstores/{appStoreId} | /mec/appstore/v1/appstores/{appStoreId} | GET | 查询外部应用仓库 |
| /mec/appstore/poke/messages | /mec/appstore/v1/messages| POST | 新增一条消息 |
| /mec/appstore/poke/messages | /mec/appstore/v1/messages | GET | 根据消息类型获取消息 |
| /mec/appstore/poke/messages/{messageId} | /mec/appstore/v1/messages/{messageId} | GET | 根据message id获取消息 |
| /mec/appstore/poke/messages/{messageId} | /mec/appstore/v1/messages/{messageId} | DELETE | 根据message id删除消息 |
| /mec/appstore/poke/messages/{messageId}/action/download | /mec/appstore/v1/messages/{messageId}/action/download | GET | 根据message id下载app相关信息 |
| /mec/appstore/poke/messages/{messageId}/action/readed | /mec/appstore/v1/messages/{messageId}/action/readed | PUT | 根据message id更新消息状态 |

# 删除接口

| API | 方法 | API说明 |
| --- | --- | --- |
| /mec/appstore/poke/messages/{messageId}/report-data | GET | 根据message id获取测试报告 |
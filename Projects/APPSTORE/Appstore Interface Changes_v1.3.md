
# 新增或者修改的接口
| **API**                                | **方法** | API说明             | **变更类型** | **说明**                                                     |
| -------------------------------------- | -------- | ------------------- | ------------ | ------------------------------------------------------------ |
| /mec/appstore/v2/messages | GET | 获取所有消息 | 删除 | 为支持更多的查询条件，变更为下面接口 |
| /mec/appstore/v2/messages/action/query       | POST   | 获取消息列表          | 新增         | 请求参数增加字段 appName、limit、offset、sortItem、sortType，timeFlag，readable，allMessage;  后台进行分页查询、支持模糊查询 ，按条件排序，查询已读未读消息，响应时间段内的消息，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v1/apps/{appId}/packages/{packageId}/icon       | POST   | 获取应用包图标          | 新增         | 请求参数字段appId 、packageId; 后台根据请求字返回给前台文件流。 |
| /mec/appstore/v1/experience/deploy       | POST   | 在线体验          | 修改         | 返回参数data由字符串修改为数组，里面存储应用的多个服务信息对象[{serviceName，nodePort，mecHost}]。 |
| /mec/appstore/v1/system/hosts/{hostId} | GET | 获取沙箱列表 | 修改 | 优化接口响应规范 |
| /mec/appstore/v1/system/hosts | POST | 新增沙箱 | 修改 | 优化接口响应规范，请求参数mepHost结构调整，新增parameter、status， status为必填参数，状态为NORMAL、BUSY、STOP状态。 |
| /mec/appstore/v1/system/hosts/{hostId} | PUT | 更改沙箱 | 修改 | 优化接口响应规范 |
| /mec/appstore/v1/system/hosts/{hostId} | DELETE | 删除沙箱 | 修改 | 优化接口响应规范 |


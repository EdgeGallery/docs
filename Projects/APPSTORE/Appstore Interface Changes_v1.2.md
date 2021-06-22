# 删除接口
| API | 方法 | API说明 |
| --- | --- | --- |
| /mec/appstore/v1/apps/{appId}/action/download | GET | 根据appId下载最新版本应用包 |

# 新增或者修改的接口
| **API**                                | **方法** | API说明             | **变更类型** | **说明**                                                     |
| -------------------------------------- | -------- | ------------------- | ------------ | ------------------------------------------------------------ |
| /mec/appstore/v2/query/apps       | POST   | 获取应用列表          | 新增         | 请求参数增加字段 appName、limit、offset、sortItem、sortType;  后台进行分页查询、支持模糊查询 ，按条件排序，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v2/apps/{appId}/packages                  | GET      | 根据appid获取应用包            | 新增         | 请求参数增加字段 appName、limit、offset、sortItem、sortType;  后台进行分页查询、支持模糊查询 ，按条件排序，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v2/packages              | GET      | 获取应用包列表     | 新增         | 请求参数在v1接口基础上增加字段  appName、limit、offset;  后台进行分页查询、支持模糊查询 ，按条件排序，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v2/appstores             | GET      | 获取appStore        | 新增       | 请求参数增加字段 appStoreName、limit、offset、sortItem、sortType;  后台进行分页查询、支持模糊查询 ，按条件排序，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v2/packages/pushable     | GET      | 获取应用推送app列表 | 新增         | 请求参数在v1接口基础上增加字段  appName、limit、offset、sortItem、sortType ;  后台进行分页查询、支持模糊查询，按条件排序 ，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v2/packages/pullable     | GET      | 获取应用拉取app列表 | 新增         | 请求参数在v1接口基础上增加字段  appName、limit、offset、sortItem、sortType;  后台进行分页查询、支持模糊查询 ，按条件排序，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v2/packages/{platformId}/pullable     | GET      | 根据appstoreid获取应用拉取app列表 | 新增         | 请求参数在v1接口基础上增加字段  appName、limit、offset、sortItem、sortType;  后台进行分页查询、支持模糊查询 ，按条件排序，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v2/messages              | GET      | 操作分析消息列表    | 新增         | 请求参数在v1接口基础上增加字段  appName、limit、offset、sortItem、sortType;  后台进行分页查询、支持模糊查询，按条件排序 ，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v2/apps/{appId}/comments | GET      | 获取应用评论信息    | 新增         | 请求参数在v1接口基础上增加字段  limit、offset;  后台进行分页查询、支持模糊查询 ，按条件排序，响应参数增加总数量total、limit、offset。 |
| /mec/appstore/v2/apps/{appId}/packages/{packageId}/action/publish | POST | 发布应用 | 新增 | 响应规范化：<br />{<br/>  "data" : string,<br/>  "retCode" : int,<br/>  "message": string,<br/>  "params": [string]<br/>} |
| /mec/appstore/v2/apps/{appId}/packages/{packageId} | GET | 根据appId和packageId获取应用包 | 新增 | 响应规范化：<br />{<br/>  "data" : PackageDto,<br/>  "retCode" : int,<br/>  "message": string,<br/>  "params": [string]<br/>} |
| /mec/appstore/v2/apps | POST | 上传应用 | 新增 | 响应规范化：<br />{<br/>  "data" : RegisterRespDto,<br/>  "retCode" : int,<br/>  "message": string,<br/>  "params": [string]<br/>} |
| /mec/appstore/v2/apps/{appId} | GET | 根据appId获取应用 | 新增 | 响应规范化：<br />{<br/>  "data" : AppDto,<br/>  "retCode" : int,<br/>  "message": string,<br/>  "params": [string]<br/>} |
| /mec/appstore/v2/messages | POST | 添加消息 | 新增 | 响应规范化：<br />{<br/>  "data" : string,<br/>  "retCode" : int,<br/>  "message": string,<br/>  "params": [string]<br/>} |
| /mec/appstore/v1/apps | GET | 获取应用列表 | 修改 | 1、响应增加deployMode字段，标识是虚机应用还是容器应用。 2、响应增加isHotApp字段，标识是否为近期热门应用。 3、userId请求参数为空时，只返回已发布showType非private的应用；非空时，返回当前用户所有的应用 |
| /mec/appstore/v1/apps/{appId} | GET | 根据appId获取应用 | 修改 | 1、响应增加deployMode字段，标识是虚机应用还是容器应用。 2、响应增加isHotApp字段，标识是否为近期热门应用。 3、userId请求参数为空时，只返回已发布showType非private的应用；非空时，返回当前用户所有的应用 |
| /mec/appstore/v1/apps/{appId}/packages | GET | 根据appId获取应用包列表 | 修改 | 1、响应增加deployMode字段，标识是虚机应用还是容器应用。  2、userId请求参数为空时，只返回已发布showType非private的应用包；非空时，返回当前用户所有的应用包 |
| /mec/appstore/v1/apps/{appId}/packages/{packageId} | GET | 根据appId和packageId获取应用包 | 修改 | 1、响应增加deployMode字段，标识是虚机应用还是容器应用。  2、userId请求参数为空时，只返回已发布showType非private的应用包；非空时，返回当前用户所有的应用包 |
| /mec/appstore/v1/packages | GET | 获取应用包列表 | 修改 | 1、响应增加deployMode字段，标识是虚机应用还是容器应用。  2、userId请求参数为空时，只返回已发布showType非private的应用包；非空时，返回当前用户所有的应用包 |
| /mec/appstore/v1/apps/hotapps                                | PUT | 修改热门应用 | 新增 | 根据应用ID更改应用是否为热门应用，请求参数为应用ID列表。 |
| /mec/appstore/v1/packages/pushable | GET | 获取可推送应用列表 | 修改 | 只返回已发布且showType为public属性的应用包 |
| /mec/appstore/v1/packages/{packages}/pushable | GET | 根据packageId获取可推送应用列表 | 修改 | 只返回已发布且showType为public属性的应用包 |
| /mec/appstore/v1/packages/pullable | GET | 获取可拉取应用列表 | 修改 | 只返回已发布且showType为public属性的应用包 |
| /mec/appstore/v1/apps/{appId}/package/{packageId}            | PUT    | 修改应用属性 | 新增                                 | 修改应用属性，包括应用的行业、类型、图标、视频、架构、描述、展示类型 |


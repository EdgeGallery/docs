��    %      D              l     m     �     �  !   �  '   �  "     1   )  /   [     �  	   �     �     �  �   �  �   ;  	   �  '   �       T        m     �     �     �  9   �  B   �  3   *     ^     n     u     �     �  -   �      �            0   ,     ]  �  d     �     	     "	  !   ?	  '   a	  "   �	  1   �	  /   �	     
     
     "
     &
  �   +
  �     
   �  E        G  c   M  !   �     �     �     �  f     R   t  T   �          1     5     M  -   T  ?   �  ,   �  )   �       K   +     w   /mec/appstore/v1/apps /mec/appstore/v1/apps/merge /mec/appstore/v1/apps/upload /mec/appstore/v1/apps/vm-register /mec/appstore/v1/apps/{appId}/demoVideo /mec/appstore/v1/packages/pullable /mec/appstore/v1/packages/{packageId}/action/pull /mec/appstore/v1/packages/{platformId}/pullable API API说明 GET POST appstore后台调用指定平台仓库的URI，下载指定应用的应用包和图标，并注册该应用到本平台，同时记录一条拉取消息 appstore后台调用指定平台仓库的URI，查询可推送应用列表，并过滤本平台已发布的应用，返回可拉取的应用列表给appstore前台 上传app 从指定平台仓库拉取指定应用 修改 修改上传请求参数，增加可选字段demoVideo，含义为应用演示视频 分片上传应用包 删除接口 变更类型 合并应用包 对于应用包较大的虚机应用调用此接口注册 将分片的应用包合并到一起上传到服务器目标路径 当应用包大于10M时，采用分片上传方式 接口URI变更 新增 新增或者修改的接口 方法 查询可拉取的应用列表 查询指定平台仓库可拉取应用列表 根据应用ID获取演示视频 注册虚机应用 获取应用视频 获取本平台仓库全部可拉取应用列表 说明 Project-Id-Version: EdgeGallery Documentation 
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
 /met/appstore/v1/apps /met/appstore/v1/apps/merge /mec/appstore/v1/apps/upload /mec/appstore/v1/apps/vm-register /mec/appstore/v1/apps/{appId}/demoVideo /mec/appstore/v1/packages/pullable /mec/appstore/v1/packages/{packageId}/action/pull /mec/appstore/v1/packages/{platformId}/pullable API API Description GET POST appstore background calls the URI of the designated platform warehouse, downloads the application package and icon for the specified application, and registers the application to the platform, while recording a pull message The appstore background call specifies the URI of the platform warehouse, the query can push the application list, and filters the published application of the platform, returns the callable application list to the appstore front desk Upload app Specifying the application from the specified platform warehouse pull amend Modify upload request parameters, increase optional field demoVideo, meaning application demo video Shards upload application package Delete Interface Change Type Combined application package calling this interface registration for the application packet with larger virtual machine application Merge the sliced application package together into the server target path together When the application package is larger than 10M, the fragment uploading mode is used Interface URI change add Add or Modify Interface method List of queries that can be pulled by queries Query specifying platform warehouse accessible application list Get a demo video based on the application ID Application of registered virtual machine Get the app video Get the list of all available pull applications for this platform warehouse explanation 
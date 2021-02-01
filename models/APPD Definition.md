# 概述
TOSCA(Topology and Orchestration Specificatioon for Cloud Applications)是一种描述云应用组件以及组件之间关系的建模语言，Tosca采用业务模板(service templates)的概念来描述云应用的组件。  
EdgeGallery采用TOSCA概念来描述APPD信息模型，基于TOSCA-Simple-Profile-yamle v1.2，参考ETSI NFV SOL001相关规范定义了对APPD的相关描述。  
APPD信息模型单元和TOCSA类型定义的映射关系如下：

| APPD 信息模型单元 | TOSCA 类型定义 |
|------------------|--------------------------------|
| APP             | tosca.nodes.nfv.VNF |
| VDU（容器场景时为Pod） | tosca.nodes.nfv.Vducp <br> tosca.nodes.nfv.Vdu.Compute <br> tosca.nodes.nfv.Vdu.VirtualStorage|
| Cpd | tosca.nodes.nfv.Cp |
| VduCpd(internal connection point) | tosca.nodes.nfv.VduCp | 
| Virtual Link | tosca.nodes.nfv.VnfVirtualLink |
| VirtualStorageDesc | tosca.nodes.nfv.Vdu.VirtualStorage | 
| VirtualComputeDesc | tosca.nodes.nfv.Vdu.Compute | 
| SwImageDesc | tosca.artifacts.nfv.SwImage |
|SecurityGroupRule | tosca.policies.nfv.SecurityGroupRule |

一个APPD文件包含最基本的信息，metadata，inputs参数，节点类型，数据类型，文件类型，分组类型和策略类型等。  

## 基本信息
APPD最开始需要包含最基本的信息，包含tosca_definition_version,  description, imports。  
样例如下：

```
tosca_definitions_version: "tosca_simple_profile_yaml_1_2"
description: "EdgeGallery APPD definition"
imports:
  - nfv_vnfd_types_v1_0.yaml
```

## Metadata定义
Metadata为APPD的元数据。  
具体参数如下：

| 名称 | 是否必选 |数据类型 | 取值范围 | 描述 |
|------|---------|--------|---------|------|
|template_name | 是 | string | - | 模板名称 |
|template_author |是 | string | - |模板作者 | 
|template_version | 是 |string | - | 模板版本 |
|vnfm_type | 是 | string | MEPM | 该参数用于表明APPD使用的平台，目前取值MEPM |
|vnfd_id | 是 | string | -  |该APPD对象的标识，全局唯一 |
|vnfd_version |是 | string |- | APPD版本号 | 
|vnfd_name | 是 |string | -| APPD名称 |
|vnfd_description |是 |string |- | APPD描述 |


Metadata的样例如下： 

```
metadata:
  template_name: "EdgeGallery-Template"
  template_author: "EdgeGallery"
  template_version: "1.0.0"
  vnfm_type: "MEPM"
  vnfd_id: "EdgeGallery-monitoring-service"
  vnfd_version: "v1.0"
  vnfd_name: "EdgeGallery_MEC_Sample_APPD"
  vnfd_description: "EdgeGallery MEC sample for APP"
```

## Inputs参数
Inputs参数格式参见TOSCA Simple Profile in YAML Version 1.1。以下列出APPD涉及到的定义部分。

```
<parameter_name>:
  type: <parameter_type> #参数类型，支持String，Integer，Boolean
  description: <parameter_descriptioon> #参数描述信息
  required: <parameter_required> #定义该参数是否为必选参数
  default: <parameter_default_value> #定义该参数的默认取值
  constraints: #定义该参数的取值范围
  -<parameter_constraints> 
```

Inputs样例如下：

```
inputs:
    INTERNAL_IP_VERSION:
      type: "string"
      default: "IPV4"
      description: "INTERNAL_IP_VERSION"
    cpuNumber:
      type: integer
      description: Number of CPUs
      required: true
      default: 2
      constraints:
      -valid_values:[1,2,4,8]
```

## 节点类型定义
###  APP(tosca.nodes.nfv.VNF)
APP在APPD描述文件中对应tosca.nodes.nfv.VNF节点，具体定义
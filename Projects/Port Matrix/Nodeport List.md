Kubernetes NodePort List
-------------------------

| **Component** | **Pod Name** | **Service Name** | **Node Port** | **Internal Port** |
| --- | --- | --- | --- | --- |
| appstore-be | appstore-be-0 | appstore-be-svc | ClusterIP| 8099 |
| appstore-fe | appstore-fe   | appstore-fe-svc | 30091| 8443|
| appstore-be-postgres | appstore-be-postgres-0 | appstore-be-postgres-svc | ClusterIP | 5432 |
| developer-be | developer-be-0 | N/A| N/A | N/A |
| developer-fe | developer-fe | developer-fe-svc | 30092| 8443|
| developer-be-postgres | developer-be-postgres-0 | developer-be-postgres-svc | ClusterIP | 5432 |
| user-mgmt | user-mgmt  | user-mgmt-svc | 30067| 8067 |
| user-mgmt-postgres | user-mgmt-postgres-0 | user-mgmt-postgres-svc | ClusterIP | 5432 |
| user-mgmt-redis | user-mgmt-redis-0 | user-mgmt-redis-svc | ClusterIP | 6379 |
| service-center | service-center| service-center | ClusterIP | 30100 |
| mecm-fe | mecm-fe| mecm-fe-svc | 30093| 8443|
| mecm-appo | mecm-appo| mecm-appo-svc | 30201| 8091|
| mecm-apm | mecm-apm| mecm-apm-svc | 30202| 8092|
| mecm-inventory| mecm-inventory| mecm-inventory-svc | 30203| 8093|
| mecm-applcm-controller| mecm-applcm-controller| mecm-applcm-controller-svc | 30204| 8094|
| mecm-applcm-k8splugin| mecm-applcm-k8splugin| mecm-applcm-k8splugin-svc | 30205| 8095|
| mepserver| |  | | |
| mepauth| |  | | |
| kong-apigw| |  | | |
| mep-postgre-db| |  | | |

ServiceComb NodePort List
--------------------------

> `All services registered to the service center`

| **Component** | **Service Name** | **REST Port** | **Spring Server Port (default 8080)** |
| --- | --- | --- | --- |
| appstore-be | mec-appstore | 8099 | 8099 |
| appstore-fe | appstore-fe | 8080 | 8443|
| developer-be | mec-developer | 9082| 9082 |
| developer-fe | developer-fe | 8080 | 8443|
| user-mgmt | user-mgmt-be | 8067 | 8067 |
| user-mgmt-fe | user-mgmt-fe | 8080 | 8443|
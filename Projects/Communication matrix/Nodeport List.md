Kubernetes NodePort List
-------------------------

| **Component** | **Pod Name** | **Service Name** | **Node Port** | **Internal Port** |
| --- | --- | --- | --- | --- |
| appstore-be | appstore-be-0 | appstore-be-svc | ClusterIP| 8099 |
| appstore-fe | appstore-fe   | appstore-fe-svc | ClusterIP| 8443|
| appstore-be-postgres | appstore-be-postgres-0 | appstore-be-postgres-svc | ClusterIP | 5432 |
| developer-be | developer-be-0 | N/A| N/A | N/A |
| developer-fe | developer-fe | developer-fe-svc | ClusterIP| 8443|
| developer-be-postgres | developer-be-postgres-0 | developer-be-postgres-svc | ClusterIP | 5432 |
| example-app | zoon-minder  | zoon-minder-svc  | 32040 | 80 |
| example-app | zoon-minder-db  | zonedb-svc  | ClusterIP| 3306|
| mecm-esr | mecesr  | mecesr | ClusterIP| 38181|
| mecm-meo-fe |  mecm-fe | mecm-fe-svc   | ClusterIP  | 8443  |
| toolchain | toolchain-0 | tool-chain-svc | ClusterIP  | 8059 |
| user-mgmt | user-mgmt-bcf6d68fc-cg7l4  | user-mgmt-svc | ClusterIP | 8067 |
| user-mgmt-postgres | user-mgmt-postgres-0 | user-mgmt-postgres-svc | ClusterIP | 5432 |
| user-mgmt-redis | user-mgmt-redis-0 | user-mgmt-redis-svc | ClusterIP | 6379 |
| service-center | service-center| service-center | ClusterIP | 30100 |
| integration-testing | N/A  | N/A  | N/A  | N/A  |
| mecm-applcm |  N/A  | N/A  | N/A  | N/A  |
| mecm-catalog |  N/A  | N/A  | N/A  | N/A  |
| mecm-meo-be |  N/A  | N/A  | N/A  | N/A  |
| mep | N/A  | N/A  | N/A  | N/A  |
| mep-agent | N/A  | N/A  | N/A  | N/A  |


Kubernetes Ingress Information
-------------------------------

> `Portal entrance`

| **Portal** | **Daily Build Env** | **Weekly Build Env** | **Server Port (default 8080)** |
| --- | --- | --- | --- |
| Developer | [https://daily.developer.edgegallery.org](https://daily.developer.edgegallery.org) | [https://developer.edgegallery.org](https://developer.edgegallery.org) | 8080 |
| Appstore | [https://daily.appstore.edgegallery.org](https://daily.appstore.edgegallery.org) | [https://appstore.edgegallery.org](https://appstore.edgegallery.org) | 8080 |
| MEC Manager | [http://daily.mecm.edgegallery.org](http://daily.mecm.edgegallery.org) | [http://mecm.edgegallery.org](http://mecm.edgegallery.org) | 8080 |

ServiceComb NodePort List
--------------------------

> `All services registered to the service center`

| **Component** | **Service Name** | **REST Port** | **Spring Server Port (default 8080)** |
| --- | --- | --- | --- |
| appstore-be | mec-appstore | 8099 | 8099 |
| appstore-fe | appstore-fe | 8080 | 8443|
| developer-be | mec-developer | 9082| 9082 |
| developer-fe | developer-fe | 8080 | 8443|user-mgmt-fe
| user-mgmt | user-mgmt-be | 8067 | 8067 |
| user-mgmt-fe | user-mgmt-fe | 8080 | 8443|
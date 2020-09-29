How to contribute
==========================

This section provides details on how to participate/contribute to the inventory project. 

## Build local development environment

This section will guide developers to build Inventory module locally and help developers to quickly understand and
 develop
 code 

The local startup of Inventory depends on：
```
- DataBase
- Inventory
```
In order to build a local environment, the final startup sequence is DataBase -> Inventory

### DataBase

1. Download and install postgres 12.3 database 

2. Set login name and password, such as inventory

3. Create a database named inventorydb

![](/uploads/images/2020/0924/inventory-db.png "inventory-db.png")

### Inventory

1. Download Inventory code

2. Configure the runtime environment variables (using IDEA as an example)

![](/uploads/images/2020/0924/inventory-contribution.png "inventory-contribution.png")

3. Update key-store and trust-store path in application.yaml

![](/uploads/images/2020/0924/meo-ssl.png "meo-ssl.png")

4. Run InventoryApplication to start inventory

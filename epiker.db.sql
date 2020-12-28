BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
	"MigrationId"	TEXT NOT NULL,
	"ProductVersion"	TEXT NOT NULL,
	CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY("MigrationId")
);
CREATE TABLE IF NOT EXISTS "ProductBrands" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT,
	CONSTRAINT "PK_ProductBrands" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ProductTypes" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT,
	CONSTRAINT "PK_ProductTypes" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Products" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT,
	"Description"	TEXT,
	"PictureUrl"	TEXT,
	"Price"	TEXT NOT NULL,
	"ProductTypeId"	INTEGER NOT NULL,
	"ProductBrandId"	INTEGER NOT NULL,
	CONSTRAINT "PK_Products" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Products_ProductTypes_ProductTypeId" FOREIGN KEY("ProductTypeId") REFERENCES "ProductTypes"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_Products_ProductBrands_ProductBrandId" FOREIGN KEY("ProductBrandId") REFERENCES "ProductBrands"("Id") ON DELETE CASCADE
);
INSERT INTO "__EFMigrationsHistory" ("MigrationId","ProductVersion") VALUES ('20200505212003_InitialCreate','3.1.1');
INSERT INTO "__EFMigrationsHistory" ("MigrationId","ProductVersion") VALUES ('20200513201150_InitialCreate','3.1.1');
INSERT INTO "ProductBrands" ("Id","Name") VALUES (1,'Angular');
INSERT INTO "ProductBrands" ("Id","Name") VALUES (2,'NetCore');
INSERT INTO "ProductBrands" ("Id","Name") VALUES (3,'VS Code');
INSERT INTO "ProductBrands" ("Id","Name") VALUES (4,'React');
INSERT INTO "ProductBrands" ("Id","Name") VALUES (5,'Typescript');
INSERT INTO "ProductBrands" ("Id","Name") VALUES (6,'Redis');
INSERT INTO "ProductTypes" ("Id","Name") VALUES (1,'Boards');
INSERT INTO "ProductTypes" ("Id","Name") VALUES (2,'Hats');
INSERT INTO "ProductTypes" ("Id","Name") VALUES (3,'Boots');
INSERT INTO "ProductTypes" ("Id","Name") VALUES (4,'Gloves');
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (1,'Typescript Entry Board','Aenean nec lorem. In porttitor. Donec laoreet nonummy augue.','images/products/sb-ts1.png','120.0',1,5);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (2,'Core Purple Boots','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.','images/products/boot-core1.png','199.99',3,2);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (3,'Core Red Boots','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.','images/products/boot-core2.png','189.99',3,2);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (4,'Redis Red Boots','Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.','images/products/boot-redis1.png','250.0',3,6);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (5,'Green React Gloves','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.','images/products/glove-react2.png','14.0',4,4);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (6,'Purple React Gloves','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa.','images/products/glove-react1.png','16.0',4,4);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (7,'Green Code Gloves','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.','images/products/glove-code2.png','15.0',4,3);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (8,'Blue Code Gloves','Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.','images/products/glove-code1.png','18.0',4,3);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (9,'Purple React Woolen Hat','Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.','images/products/hat-react2.png','15.0',2,4);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (10,'Green React Woolen Hat','Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.','images/products/hat-react1.png','8.0',2,4);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (11,'Core Blue Hat','Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.','images/products/hat-core1.png','10.0',2,2);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (12,'Angular Speedster Board 2000','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.','images/products/sb-ang1.png','200.0',1,1);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (13,'Green Angular Board 3000','Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.','images/products/sb-ang2.png','150.0',1,1);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (14,'Core Board Speed Rush 3','Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.','images/products/sb-core1.png','180.0',1,2);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (15,'Net Core Super Board','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.','images/products/sb-core2.png','300.0',1,2);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (16,'React Board Super Whizzy Fast','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.','images/products/sb-react1.png','250.0',1,4);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (17,'Angular Purple Boots','Aenean nec lorem. In porttitor. Donec laoreet nonummy augue.','images/products/boot-ang2.png','150.0',3,1);
INSERT INTO "Products" ("Id","Name","Description","PictureUrl","Price","ProductTypeId","ProductBrandId") VALUES (18,'Angular Blue Boots','Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.','images/products/boot-ang1.png','180.0',3,1);
CREATE INDEX IF NOT EXISTS "IX_Products_ProductBrandId" ON "Products" (
	"ProductBrandId"
);
CREATE INDEX IF NOT EXISTS "IX_Products_ProductTypeId" ON "Products" (
	"ProductTypeId"
);
COMMIT;

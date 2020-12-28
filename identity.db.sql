BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
	"MigrationId"	TEXT NOT NULL,
	"ProductVersion"	TEXT NOT NULL,
	CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY("MigrationId")
);
CREATE TABLE IF NOT EXISTS "AspNetRoles" (
	"Id"	TEXT NOT NULL,
	"Name"	TEXT,
	"NormalizedName"	TEXT,
	"ConcurrencyStamp"	TEXT,
	CONSTRAINT "PK_AspNetRoles" PRIMARY KEY("Id")
);
CREATE TABLE IF NOT EXISTS "AspNetUsers" (
	"Id"	TEXT NOT NULL,
	"UserName"	TEXT,
	"NormalizedUserName"	TEXT,
	"Email"	TEXT,
	"NormalizedEmail"	TEXT,
	"EmailConfirmed"	INTEGER NOT NULL,
	"PasswordHash"	TEXT,
	"SecurityStamp"	TEXT,
	"ConcurrencyStamp"	TEXT,
	"PhoneNumber"	TEXT,
	"PhoneNumberConfirmed"	INTEGER NOT NULL,
	"TwoFactorEnabled"	INTEGER NOT NULL,
	"LockoutEnd"	TEXT,
	"LockoutEnabled"	INTEGER NOT NULL,
	"AccessFailedCount"	INTEGER NOT NULL,
	"DisplayName"	TEXT,
	CONSTRAINT "PK_AspNetUsers" PRIMARY KEY("Id")
);
CREATE TABLE IF NOT EXISTS "AspNetRoleClaims" (
	"Id"	INTEGER NOT NULL,
	"RoleId"	TEXT NOT NULL,
	"ClaimType"	TEXT,
	"ClaimValue"	TEXT,
	CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Address" (
	"Id"	INTEGER NOT NULL,
	"FirstName"	TEXT,
	"LastName"	TEXT,
	"Street"	TEXT,
	"City"	TEXT,
	"State"	TEXT,
	"Zipcode"	TEXT,
	"AppUserId"	TEXT NOT NULL,
	CONSTRAINT "FK_Address_AspNetUsers_AppUserId" FOREIGN KEY("AppUserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_Address" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "AspNetUserClaims" (
	"Id"	INTEGER NOT NULL,
	"UserId"	TEXT NOT NULL,
	"ClaimType"	TEXT,
	"ClaimValue"	TEXT,
	CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "AspNetUserLogins" (
	"LoginProvider"	TEXT NOT NULL,
	"ProviderKey"	TEXT NOT NULL,
	"ProviderDisplayName"	TEXT,
	"UserId"	TEXT NOT NULL,
	CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY("LoginProvider","ProviderKey")
);
CREATE TABLE IF NOT EXISTS "AspNetUserRoles" (
	"UserId"	TEXT NOT NULL,
	"RoleId"	TEXT NOT NULL,
	CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY("UserId","RoleId")
);
CREATE TABLE IF NOT EXISTS "AspNetUserTokens" (
	"UserId"	TEXT NOT NULL,
	"LoginProvider"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Value"	TEXT,
	CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY("UserId","LoginProvider","Name"),
	CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE
);
INSERT INTO "__EFMigrationsHistory" ("MigrationId","ProductVersion") VALUES ('20201101191301_IdentityInitial','3.1.1');
INSERT INTO "AspNetUsers" ("Id","UserName","NormalizedUserName","Email","NormalizedEmail","EmailConfirmed","PasswordHash","SecurityStamp","ConcurrencyStamp","PhoneNumber","PhoneNumberConfirmed","TwoFactorEnabled","LockoutEnd","LockoutEnabled","AccessFailedCount","DisplayName") VALUES ('226ab362-607b-4cff-9e51-b7eda3a304ee','bob@test.com','BOB@TEST.COM','bob@test.com','BOB@TEST.COM',0,'AQAAAAEAACcQAAAAENi6A6u1iMV/GL91JLnS0vV5lE/d6KzsuJbdq3TL+IBrXP58NPPy5FzFfkto1w2Yug==','CWSNCHY4RDUZGNT63JSUOFUDE344ZP6Q','0eca49c8-5612-4d87-a2ca-e0fa6aa21a8b',NULL,0,0,NULL,1,0,'Bob');
INSERT INTO "AspNetUsers" ("Id","UserName","NormalizedUserName","Email","NormalizedEmail","EmailConfirmed","PasswordHash","SecurityStamp","ConcurrencyStamp","PhoneNumber","PhoneNumberConfirmed","TwoFactorEnabled","LockoutEnd","LockoutEnabled","AccessFailedCount","DisplayName") VALUES ('0bc68a3b-3a45-4b1b-8a64-a72970f51a91','tom@test.com','TOM@TEST.COM','tom@test.com','TOM@TEST.COM',0,'AQAAAAEAACcQAAAAEFkMT/RFx2QilT1yQgMkMD0IWMqtHndf6ddUbdW6UVfjwQDZ3IgNKhez45WxqxOtJg==','ZUUJQ7PT2MOQ62KREQVAYB7GQTBHGTMI','470eb5da-fa24-438f-ab16-7ae24e16ea6d',NULL,0,0,NULL,1,0,'Tom');
INSERT INTO "AspNetUsers" ("Id","UserName","NormalizedUserName","Email","NormalizedEmail","EmailConfirmed","PasswordHash","SecurityStamp","ConcurrencyStamp","PhoneNumber","PhoneNumberConfirmed","TwoFactorEnabled","LockoutEnd","LockoutEnabled","AccessFailedCount","DisplayName") VALUES ('efa3338b-070b-4ad7-89f0-1f04703b1db5','notanemail@test.gr','NOTANEMAIL@TEST.GR','notanemail@test.gr','NOTANEMAIL@TEST.GR',0,'AQAAAAEAACcQAAAAEP9wduceK+sNH5Doxzx2zPHNnED1JhtUEX0kmMEiHRTo2uZEGzvgdRiDM1EoL2ow5g==','O5IS3ROPA6AE6OZCXB4Q3YGGEKUAMIEX','2e777c17-c7f6-47eb-a2e5-25a360451407',NULL,0,0,NULL,1,0,'Lukes');
INSERT INTO "AspNetUsers" ("Id","UserName","NormalizedUserName","Email","NormalizedEmail","EmailConfirmed","PasswordHash","SecurityStamp","ConcurrencyStamp","PhoneNumber","PhoneNumberConfirmed","TwoFactorEnabled","LockoutEnd","LockoutEnabled","AccessFailedCount","DisplayName") VALUES ('a8861588-3bbb-47a8-96fa-24a193b671a6','notanemail','NOTANEMAIL','notanemail','NOTANEMAIL',0,'AQAAAAEAACcQAAAAEO76Js4SzuN1XgX6dAycrquyygmnYM2JZ3WfCsFc+BLjg/GC33P33s2ugu9XP/hdZw==','K4LEW3BOVROI6RS6WUJJP7PPVMW36GZM','6f677dfc-46f7-4162-8559-77f8b189eabe',NULL,0,0,NULL,1,0,'Lukes');
INSERT INTO "AspNetUsers" ("Id","UserName","NormalizedUserName","Email","NormalizedEmail","EmailConfirmed","PasswordHash","SecurityStamp","ConcurrencyStamp","PhoneNumber","PhoneNumberConfirmed","TwoFactorEnabled","LockoutEnd","LockoutEnabled","AccessFailedCount","DisplayName") VALUES ('d501a0f9-edee-4986-b978-deba6715c652','jimpet@test.com','JIMPET@TEST.COM','jimpet@test.com','JIMPET@TEST.COM',0,'AQAAAAEAACcQAAAAEFaDpKV5ghSwjY46rCF/u+imIQ2k6e9PZogDmUWihkH8ViS0sNN+J4C4YNA3XGij7Q==','JZLSSB766OQPNGH2HKBA6YF4KWDVGZZL','289a5767-cb4a-4375-b0d1-6a4d3ba2d1b7',NULL,0,0,NULL,1,0,'Jimpet');
INSERT INTO "Address" ("Id","FirstName","LastName","Street","City","State","Zipcode","AppUserId") VALUES (1,'Bob','Bobbity','10 The Street','New York','NY','90210','226ab362-607b-4cff-9e51-b7eda3a304ee');
INSERT INTO "Address" ("Id","FirstName","LastName","Street","City","State","Zipcode","AppUserId") VALUES (2,'Tom','Smith','100 Park Lane','London','London','SW1 1B','0bc68a3b-3a45-4b1b-8a64-a72970f51a91');
CREATE UNIQUE INDEX IF NOT EXISTS "IX_Address_AppUserId" ON "Address" (
	"AppUserId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" (
	"RoleId"
);
CREATE UNIQUE INDEX IF NOT EXISTS "RoleNameIndex" ON "AspNetRoles" (
	"NormalizedName"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" (
	"RoleId"
);
CREATE INDEX IF NOT EXISTS "EmailIndex" ON "AspNetUsers" (
	"NormalizedEmail"
);
CREATE UNIQUE INDEX IF NOT EXISTS "UserNameIndex" ON "AspNetUsers" (
	"NormalizedUserName"
);
COMMIT;

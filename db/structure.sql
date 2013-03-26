CREATE TABLE "members" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(30) DEFAULT '' NOT NULL, "hashed_password" varchar(40) DEFAULT '' NOT NULL, "firstname" varchar(30) DEFAULT '' NOT NULL, "lastname" varchar(30) DEFAULT '' NOT NULL, "mail" varchar(60) DEFAULT '' NOT NULL, "admin" boolean DEFAULT 'f' NOT NULL, "status" integer DEFAULT 1 NOT NULL, "last_login_on" datetime, "language" varchar(5) DEFAULT '', "auth_source_id" integer, "created_on" datetime, "updated_on" datetime, "etype" varchar(255), "identity_url" varchar(255), "mail_notification" varchar(255) DEFAULT '' NOT NULL);
CREATE TABLE "vyw_user_extensions" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"user_id" INTEGER NOT NULL,
"password" INTEGER DEFAULT NULL,
"image_url" varchar(255),
"created_on" datetime,
"updated_on" datetime
);
CREATE TABLE "vyw_users_attendances" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"user_id" INTEGER NOT NULL,
"date" datetime NOT NULL,
"in_time" datetime,
"out_time" datetime
"created_on" datetime,
"updated_on" datetime
);
CREATE UNIQUE INDEX "index_members_on_email" ON "members" ("email");
CREATE UNIQUE INDEX "index_members_on_reset_password_token" ON "members" ("reset_password_token");
CREATE INDEX "index_users_on_auth_source_id" ON "users" ("auth_source_id");
CREATE INDEX "index_users_on_id_and_type" ON "users" ("id", "etype");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130118164100');

INSERT INTO schema_migrations (version) VALUES ('20130320154100');
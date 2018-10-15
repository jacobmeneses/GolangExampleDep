-- Adminer 4.6.3 PostgreSQL dump

\connect "postgres";

DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."users" (
    "id" integer DEFAULT nextval('users_id_seq') NOT NULL,
    "name" character varying(100) NOT NULL,
    "email" character varying(100) NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL
) WITH (oids = false);

INSERT INTO "users" ("id", "name", "email", "created_at", "updated_at") VALUES
(1,	'user jacob',	'jacob@somegolangapi.com',	'2018-10-15 22:17:20.560925',	'2018-10-15 22:17:20.560925'),
(2,	'user john',	'john@somegolangapi.com',	'2018-10-15 22:17:40.554772',	'2018-10-15 22:17:40.554772'),
(3,	'Marlowe Laurissa',	'marlowe@somegolangapi.com',	'2018-10-15 22:17:51.295214',	'2018-10-15 22:17:51.295214');

-- 2018-10-15 22:20:11.478452+00

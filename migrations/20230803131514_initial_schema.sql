-- Create "account_groups" table
CREATE TABLE "account_groups" ("uuid" uuid NOT NULL, "display_name" character varying NULL, "country" character varying NULL, "locality" character varying NULL, "postal_code" character varying NULL, "street_address" character varying NULL, "region" character varying NULL, "external_id" character varying NOT NULL, "active" boolean NOT NULL, "created_at" timestamptz NOT NULL, "search" tsvector NULL GENERATED ALWAYS AS ((((((((to_tsvector('simple'::regconfig, (display_name)::text) || ''::tsvector) || to_tsvector('simple'::regconfig, (street_address)::text)) || ''::tsvector) || to_tsvector('simple'::regconfig, (region)::text)) || ''::tsvector) || to_tsvector('simple'::regconfig, (locality)::text)) || ''::tsvector) || to_tsvector('simple'::regconfig, (external_id)::text)) STORED, PRIMARY KEY ("uuid"));
-- Create index "account_groups_external_id_key" to table: "account_groups"
CREATE UNIQUE INDEX "account_groups_external_id_key" ON "account_groups" ("external_id");
-- Create index "idx_search" to table: "account_groups"
CREATE INDEX "idx_search" ON "account_groups" USING gin ("search");

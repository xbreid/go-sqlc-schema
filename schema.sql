CREATE TABLE "account_groups" (
    "uuid" uuid NOT NULL,
    "display_name" character varying NULL,
    "country" character varying NULL,
    "locality" character varying NULL,
    "postal_code" character varying NULL,
    "street_address" character varying NULL,
    "region" character varying NULL,
    "external_id" character varying NOT NULL,
    "active" boolean NOT NULL,
    "created_at" timestamptz NOT NULL,
    PRIMARY KEY ("uuid"));

CREATE UNIQUE INDEX "account_groups_external_id_key" ON "account_groups" ("external_id");

ALTER TABLE account_groups ADD search tsvector GENERATED ALWAYS AS
    (to_tsvector('simple', display_name) || ' ' ||
     to_tsvector('simple', street_address) || ' ' ||
     to_tsvector('simple', region) || ' ' ||
     to_tsvector('simple', locality) || ' ' ||
     to_tsvector('simple', external_id)
    ) STORED;

CREATE INDEX "idx_search" ON "account_groups" USING gin ("search");

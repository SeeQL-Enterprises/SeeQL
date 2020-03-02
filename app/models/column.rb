class Column < ApplicationRecord
  belongs_to :table
  enum data_type: ["bigint", "bigserial", "bit [ (n) ]", "bit varying [ (n) ]", "boolean",
                    "box", "bytea", "character [ (n) ]", "character varying [ (n) ]", "cidr", "circle",
                    "date", "double precision", "inet", "integer", "interval [ fields ] [ (p) ]",
                    "json", "jsonb", "line", "lseg", "macaddr", "money", "numeric [ (p, s) ]", "path",
                    "pg_lsn", "point", "polygon", "real", "smallint", "smallserial", "serial",
                    "text", "time [ (p) ] [ without time zone ]", "time [ (p) ] with time zone"; "timestamp [ (p) ] [ without time zone ]",
                    "timestamp [ (p) ] with time zone", "tsquery", "tsvector", "txid_snapshot", "uuid", "xml"]
end

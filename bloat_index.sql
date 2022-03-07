-----------------
-- Bloat Index --
-----------------

SELECT nspname,
       relname,
       ROUND (100 * PG_RELATION_SIZE (indexrelid) / PG_RELATION_SIZE (indrelid)) / 100 AS index_ratio,
       PG_SIZE_PRETTY (PG_RELATION_SIZE (indexrelid)) AS index_size,
       PG_SIZE_PRETTY (PG_RELATION_SIZE (indrelid)) AS table_size
  FROM pg_index i LEFT JOIN pg_class c ON (c.oid = i.indexrelid)
                  LEFT JOIN pg_namespace n ON (n.oid = c.relnamespace)
 WHERE nspname NOT IN ('pg_catalog','information_schema','pg_toast')
   AND c.relkind = 'i'
   AND PG_RELATION_SIZE (indrelid) > 0;
 
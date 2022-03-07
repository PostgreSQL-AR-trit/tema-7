-------------------
-- Table Options --
-------------------

SELECT pc.relname as objectname,
       pc.reloptions as objectoptions
  FROM pg_class AS pc INNER JOIN pg_namespace AS pns ON pns.oid = pc.relnamespace
 WHERE pns.nspname ='public'
   AND pc.relname = 'table_test';

 
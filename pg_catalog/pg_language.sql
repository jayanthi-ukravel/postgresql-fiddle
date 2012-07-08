select * from pg_language;


 SELECT pg_language.lanname AS name, 
        CASE
            WHEN pg_language.lanplcallfoid > 0::oid THEN pg_language.lanplcallfoid::regprocedure::name
            ELSE NULL::name
        END AS lanplcallfoid, 
        CASE
            WHEN pg_language.laninline > 0::oid THEN pg_language.laninline::regprocedure::name
            ELSE NULL::name
        END AS laninline, 
        CASE
            WHEN pg_language.lanvalidator > 0::oid THEN pg_language.lanvalidator::regprocedure::name
            ELSE NULL::name
        END AS lanvalidator
   FROM pg_language
  WHERE pg_language.lanname <> ALL (ARRAY['c'::name, 'internal'::name, 'plpgsql'::name])
  ORDER BY pg_language.lanname;
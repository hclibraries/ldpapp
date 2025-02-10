--metadb:function loan_count
CREATE OR REPLACE FUNCTION count_loans(start_date date DEFAULT '2000-01-01'::date, end_date date DEFAULT '2050-01-01'::date)
 RETURNS TABLE(item_id uuid, loan_count integer)
 LANGUAGE sql
AS $function$
SELECT 
    item_id,
    COUNT(*) AS loan_count
FROM folio_circulation.loan__t
WHERE start_date <= loan_date::DATE  -- Explicitly cast loan_date to DATE
AND loan_date::DATE < end_date
GROUP BY item_id;
$function$
;

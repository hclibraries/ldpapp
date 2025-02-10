--metadb:function loan_count
SELECT 
    item_id,
    COUNT(*) AS loan_count
FROM folio_circulation.loan__t
WHERE start_date <= loan_date::DATE  -- Explicitly cast loan_date to DATE
AND loan_date::DATE < end_date
GROUP BY item_id;

SELECT round(
           ( (SELECT count(DISTINCT item_id)::float FROM folio_circulation.loan__t) /
             (SELECT count(*)::float FROM folio_inventory.item__t) )::numeric,
           2) AS loan_quotient;

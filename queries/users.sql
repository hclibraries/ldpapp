CREATE FUNCTION get_users(
    start_date date DEFAULT '2000-01-01',
    end_date date DEFAULT '2050-01-01'
) 
RETURNS TABLE(
    id text, 
    barcode text, 
    created_date timestamp with time zone
) 
AS $$ 
    SELECT id::text, barcode, created_date 
    FROM user_users 
    WHERE user_users.created_date >= start_date 
    AND user_users.created_date <= end_date 
$$ 
LANGUAGE SQL STABLE PARALLEL SAFE;

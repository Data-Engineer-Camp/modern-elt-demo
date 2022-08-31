select
    customer_id,
    a.address_id as customer_address_id,
    store_id as customer_store_id,
    first_name as customer_first_name,
    last_name as customer_last_name,
    email as customer_email,
    date(create_date) as customer_create_date,
    address as customer_address,
    address2 as customer_address2,
    district as customer_district,
    city as customer_city,
    country as customer_country,
    postal_code as customer_postal_code,
    phone as customer_phone
from
    {{ ref('stg_customer') }} c
    left join {{ ref('dim_address') }} a on c.address_id = a.address_id
order by customer_id asc 

with customer as (
    select
        customer_id,
        first_name as customer_first_name,
        last_name as customer_last_name,
        email as customer_email,
        address as customer_address,
        district as customer_district,
        city as customer_city,
        country as customer_country,
        postal_code as customer_postal_code,
        phone as customer_phone
    from
        {{ ref('stg_customer') }} c
        left join {{ ref('prep_address') }} a on c.address_id = a.address_id
    order by customer_id asc 
)

select  
    {{ dbt_utils.surrogate_key(['customer_id']) }} as customer_key,
    customer_first_name, 
    customer_last_name, 
    customer_email, 
    customer_address, 
    customer_address2, 
    customer_district, 
    customer_city, 
    customer_country, 
    customer_postal_code, 
    customer_phone
from    
    customer 

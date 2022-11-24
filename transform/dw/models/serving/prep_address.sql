select
    address_id,
    ci.city_id,
    co.country_id,
    address,
    address2,
    district,
    city,
    country,
    postal_code,
    phone
from
    {{ ref('stg_address') }} a
    left join {{ ref('stg_city') }} ci on a.city_id = ci.city_id
    left join {{ ref('stg_country') }} co on ci.country_id = co.country_id
order by address_id asc

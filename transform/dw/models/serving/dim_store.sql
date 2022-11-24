with store as ( 
  select   
      s.store_id,
      a.address as store_address,
      a.district as store_district,
      a.city as store_city,
      a.country as store_country,
      a.postal_code as store_postal_code,
      first_name as staff_first_name,
      last_name as staff_last_name,
      email as staff_email,
      active as staff_active,
      username as staff_username,
      sa.address as staff_address,
      sa.district as staff_district,
      sa.city as staff_city,
      sa.country as staff_country,
      sa.phone as staff_phone
  from
    {{ ref('stg_store') }} s
  left join {{ ref('prep_address') }} a 
    on a.address_id = s.address_id
  left join {{ ref('stg_staff') }} st
    on st.staff_id = s.manager_staff_id
  left join {{ ref('prep_address') }} sa
    on sa.address_id = st.address_id
)

select 
  {{ dbt_utils.surrogate_key(['store_id']) }} as store_key, 
  store_address,
  store_district,
  store_city,
  store_country,
  store_postal_code,
  staff_first_name,
  staff_last_name,
  staff_email,
  staff_active,
  staff_username,
  staff_address,
  staff_district,
  staff_city,
  staff_country,
  staff_phone
from 
  store 

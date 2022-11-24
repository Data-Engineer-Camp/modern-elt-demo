select   
    s.store_id,
    manager_staff_id,
    s.address_id as store_address_id,
    a.address as store_address,
    a.address2 as store_address2,
    a.district as store_district,
    a.city as store_city,
    a.country as store_country,
    a.postal_code as store_postal_code,
    staff_id,
    first_name as staff_first_name,
    last_name as staff_last_name,
    sa.address_id as staff_address_id,
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

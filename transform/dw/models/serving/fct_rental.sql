with rental_payment as (
    select 
        rental_id, 
        sum(amount) amount
    from {{ ref('stg_payment') }}
    group by rental_id
)   

select
    r.rental_id,
    i.inventory_id,
    date(rental_date) as rental_date,
    r.customer_id,
    date(return_date) as return_date,
    r.staff_id,
    i.film_id,
    i.store_id,
    amount
from
    {{ ref('stg_rental') }} r
    left join {{ ref('stg_inventory') }} i on r.inventory_id = i.inventory_id
    left join rental_payment p on r.rental_id = p.rental_id

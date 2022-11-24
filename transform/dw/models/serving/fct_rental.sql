with rental_payment as (
    select 
        rental_id, 
        sum(amount) amount
    from {{ ref('stg_payment') }}
    group by rental_id
),    

rental as (
        select
            r.rental_id,
            r.customer_id,
            i.film_id,
            i.store_id,
            date(rental_date) as rental_date,
            date(return_date) as return_date,
            amount
    from
        {{ ref('stg_rental') }} r
        left join {{ ref('stg_inventory') }} i on r.inventory_id = i.inventory_id
        left join rental_payment p on r.rental_id = p.rental_id
)

select 
    {{ dbt_utils.surrogate_key(['rental_id']) }} as rental_key, 
    {{ dbt_utils.surrogate_key(['customer_id']) }} as customer_key, 
    {{ dbt_utils.surrogate_key(['film_id']) }} as film_key, 
    {{ dbt_utils.surrogate_key(['store_id']) }} as store_key, 
    {{ dbt_utils.surrogate_key(['rental_date']) }} as rental_date_key, 
    {{ dbt_utils.surrogate_key(['return_date']) }} as return_date_key
from 
    rental 

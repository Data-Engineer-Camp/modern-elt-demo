with dim_customer as (
    select * from {{ ref('dim_customer') }}
),

dim_date as (
    select * from {{ ref('dim_date') }}
),

dim_film as (
    select * from {{ ref('dim_film') }}
),

dim_store as (
    select * from {{ ref('dim_store') }}
), 

fct_rental as (
    select * from {{ ref('fct_rental') }}
)

select 
    {{ dbt_utils.star(from=ref('fct_rental'), relation_alias='fct_rental', except=[
    "customer_key", "film_key", "store_key", "rental_date_key", "return_date_key"]) }}, 
    {{ dbt_utils.star(from=ref('dim_customer'), relation_alias='dim_customer', except=["customer_key"]) }},
    {{ dbt_utils.star(from=ref('dim_film'), relation_alias='dim_film', except=["film_key"]) }},
    {{ dbt_utils.star(from=ref('dim_store'), relation_alias='dim_store', except=["store_key"]) }},
    rental_date.date_day as rental_date,
    return_date.date_day as return_date
from 
    fct_rental 
    left join dim_customer on fct_rental.customer_key = dim_customer.customer_key
    left join dim_film on fct_rental.film_key = dim_film.film_key
    left join dim_store on fct_rental.store_key = dim_store.store_key
    left join dim_date as rental_date on fct_rental.rental_date_key = rental_date.date_key
    left join dim_date as return_date on fct_rental.return_date_key = return_date.date_key

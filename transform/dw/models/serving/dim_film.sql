with film as ( 
    select
        f.film_id,
        title as film_title,
        release_year,
        rating,
        c.name as category_name,
        l.name as language_name,
        rental_duration,
        rental_rate,
        replacement_cost
    from
        {{ ref('stg_film') }} f
        left join {{ ref('stg_film_category') }} fc on f.film_id = fc.film_id
        left join {{ ref('stg_category') }} c on fc.category_id = c.category_id
        left join {{ ref('stg_language') }} l on f.language_id = l.language_id
    order by film_id
)

select 
    {{ dbt_utils.surrogate_key(['film_id']) }} as film_key, 
    film_title, 
    release_year, 
    rating, 
    category_name, 
    language_name, 
    rental_duration, 
    rental_rate,
    replacement_cost
from 
    film 

select * 
from 
    {{ source('dvd_rental', 'film_category') }}

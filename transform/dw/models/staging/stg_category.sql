select * 
from 
    {{ source('dvd_rental', 'category') }}

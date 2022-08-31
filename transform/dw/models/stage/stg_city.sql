select * 
from 
    {{ source('dvd_rental', 'city') }}

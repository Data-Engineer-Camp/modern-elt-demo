select * 
from 
    {{ source('dvd_rental', 'rental') }}

select * 
from 
    {{ source('dvd_rental', 'customer') }}

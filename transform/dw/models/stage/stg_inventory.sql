select * 
from 
    {{ source('dvd_rental', 'inventory') }}

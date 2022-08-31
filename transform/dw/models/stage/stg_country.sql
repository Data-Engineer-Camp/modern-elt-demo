select * 
from 
    {{ source('dvd_rental', 'country') }}

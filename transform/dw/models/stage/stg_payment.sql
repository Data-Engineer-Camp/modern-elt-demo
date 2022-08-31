select * 
from 
    {{ source('dvd_rental', 'payment') }}

select * 
from 
    {{ source('dvd_rental', 'address') }}

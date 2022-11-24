select * 
from 
    {{ source('dvd_rental', 'staff') }}

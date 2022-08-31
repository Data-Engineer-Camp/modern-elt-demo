select * 
from 
    {{ source('dvd_rental', 'store') }}

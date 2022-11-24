select * 
from 
    {{ source('dvd_rental', 'actor') }}

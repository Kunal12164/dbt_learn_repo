select 
user,
name,
row_number() over (order by user asc) as dim_empid_key
from {{source('stg_brownz_layer','hosts')}}
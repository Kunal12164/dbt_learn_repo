{{config( 
    materialized = 'incremental',
    unique_key = ['id','name'],
    merge_update_columns = ['location','product','order_date','last_modified']
)}}

select * from {{source('stg_brownz_layer','host_incre')}}
where location is not null
{% if is_incremental() %}
and order_date > (select max(order_date) from {{this}})
{% endif %}
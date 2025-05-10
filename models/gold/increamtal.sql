{{config( 
    materialized = 'incremental',
    incremental_strategy = 'append'
)}}

select * from {{source('stg_brownz_layer','host_incre')}}
{% if is_incremental() %}
where order_date > (select max(order_date) from {{this}})
{% endif %}
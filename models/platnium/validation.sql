{{config( 
    materialized = 'view'
)}}

select * from {{source('stg_brownz_layer','host_incre')}}
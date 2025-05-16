{{config( 
    materialized = 'view',schema= 'platnium'
)}}

select * from {{source('stg_brownz_layer','host_incre')}}
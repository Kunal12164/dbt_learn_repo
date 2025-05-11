{% snapshot order_snip %}

{{config(
    schema = 'snapshot',
    unique_key = 'id',
    strategy = 'check',
    check_cols = ['location','product','order_date'],
    invalidate_hard_deletes = False
)}}

select * from {{source('stg_brownz_layer','host_incre')}}

{% endsnapshot %}
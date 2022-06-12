with source_data as (
    select
        order_id  
        , product_id
        , unit_price
        , quantity
        , discount
        , case 
            when discount != 0 then 'yes'
            else 'no'
          end as is_discounted 
        , (quantity * unit_price) as total_order
        , ((quantity * unit_price) - ((quantity * unit_price) * discount)) as total_liquid
    from {{ source('Northwind_erp','public_orders_details') }}
)

select *
from source_data
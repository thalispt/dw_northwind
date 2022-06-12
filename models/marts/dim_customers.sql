with customers as (

    select *
    from {{ ref('stg_customers') }}
)

, transformed as (
    select  
        row_number() over (order by customer_id) as customer_sk -- incremental surrougate key
        , customer_id
        , company_name				
        , contact_name				
        , contact_title				
        , customer_address			
        , city				
        -- , region				
        , postal_code				
        , country				
        , phone				
        , fax		
    from customers
)

select * from transformed
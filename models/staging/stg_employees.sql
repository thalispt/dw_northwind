with source_data as (
    select 
        employee_id				
        , last_name				
        , first_name				
        , title				
        , title_of_courtesy				
        , birth_date				
        , hire_date				
        , 'address' as employee_adress				
        , city				
        , region				
        , postal_code				
        , country				
        , home_phone				
        , 'extension' as phone_extension				
        , photo				
        , notes				
        , reports_to				
        , photo_path					
    from {{ source('Northwind_erp','public_employees') }}
     
)

select * 
from source_data
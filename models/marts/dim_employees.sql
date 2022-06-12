with employees as (
    select *
    from {{ ref('stg_employees') }}
)

, transformed as (
    select 
        row_number() over( order by employee_id) as employee_sk --incremental surrougate key for employees
        , employee_id				
        , last_name				
        , first_name				
        , title				
        , title_of_courtesy				
        , birth_date				
        , hire_date				
        , employee_adress				
        , city				
        -- , region				
        , postal_code				
        , country				
        , home_phone				
        , phone_extension				
        , photo				
        , notes				
        , reports_to				
        , photo_path
    from employees		
)

select * from transformed
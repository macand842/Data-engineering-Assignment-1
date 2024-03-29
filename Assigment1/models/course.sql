{{ config(materialized='external', location='output/dim_course.csv') }}

with result as (
  select s.id_student,s.date_registration,s.date_unregistration,v.activity_type
  FROM {{source('raw_data', 'studentRegistration')}} s
  inner join {{source('raw_data','vle')}} v
  on s.code_module = v.code_module
  
)
select *
from result
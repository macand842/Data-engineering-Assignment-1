{{ config(materialized='external', location='output/student.csv') }}

SELECT id_student,gender,region,highest_education,imd_band,age_band,num_of_prev_attempts,studied_credits,disability,final_result
FROM {{source('raw_data', 'studentInfo')}}
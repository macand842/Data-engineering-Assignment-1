{{ config(materialized='external', location='output/fact_grades.csv') }}

SELECT id_assessment,id_student, score, code_module
FROM {{source('raw_data', 'studentAssessment')}} full outer join {{source('raw_data', 'assessments')}} using(id_assessment)
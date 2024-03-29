{{ config(materialized='external', location='output/dim_assessments.csv') }}

SELECT sass.id_student, ass.id_assessment, ass.assessment_type,sass.date_submitted, sass.is_banked, ass.weight
FROM {{source('raw_data', 'assessments')}} as ass
INNER JOIN {{source('raw_data', 'studentAssessment')}} as sass ON ass.id_assessment=sass.id_assessment
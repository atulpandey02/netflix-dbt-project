WITH rating as  (
    SELECT * FROM {{ ref('src_rating')}}
),

tags as (
    SELECT * FROM {{ ref('src_tags')}}
)

SELECT DISTINCT user_id 
FROM (
    SELECT * FROM rating 
    UNION 
    SELECT * FROM tags
)
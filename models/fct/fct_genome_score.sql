WITH src_scores AS (
    SELECT * FROM {{ ref('src_genome_score')}}
)

SELECT 
    movie_id,
    tag_id,
    ROUND(relevance,4) as relevance
FROM src_scores
WHERE relevance > 0
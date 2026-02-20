WITH src_genome_scores AS (
    SELECT * FROM {{ ref('src_genome_score') }}
)

SELECT
    movie_id,
    tag_id,
    relevance AS relevance_score
FROM src_genome_scores
WHERE relevance IS NOT NULL
  AND relevance >= 0
  AND relevance <= 1

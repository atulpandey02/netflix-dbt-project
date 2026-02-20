-- Singular test: returns rows where relevance_score is invalid (< 0 or > 1) or columns have nulls
-- If any rows are returned, the test fails

SELECT movie_id, tag_id, relevance_score
FROM {{ ref('fct_genome_scores') }}
WHERE relevance_score < 0
   OR relevance_score > 1
   OR relevance_score IS NULL
   OR movie_id IS NULL
   OR tag_id IS NULL

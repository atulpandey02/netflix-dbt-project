{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH movies AS (
    SELECT * FROM {{ ref('dim_movies')}}
),
tags AS (
    SELECT * FROM {{ ref('dim_genome_tags')}}

),
scores AS (
    SELECT * FROM {{ ref('fct_genome_score')}}
),

SELECT 
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag_name,
    s.relevance
FROM movies m
LEFT JOIN tags t ON m.movie_id = t.movie_id
LEFT JOIN scores s ON m.movie_id = s.movie_id

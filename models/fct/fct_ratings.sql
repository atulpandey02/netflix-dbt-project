{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}

WITH src_ratings AS (
    SELECT * FROM {{ ref('src_rating') }}
),
dim_movies AS (
    SELECT movie_id FROM {{ ref('dim_movies') }}
)

SELECT
    r.user_id,
    r.movie_id,
    r.rating,
    r.rating_timestamp
FROM src_ratings r
INNER JOIN dim_movies m ON r.movie_id = m.movie_id
WHERE r.rating IS NOT NULL
{% if is_incremental() %}
  AND r.rating_timestamp > (SELECT MAX(rating_timestamp) FROM {{ this }})
{% endif %}

{{ config(materialized = 'table')}}


with raw_ratings as (
    SELECT * FROM MOVIELENS.RAW.RAW_RATINGS
)
SELECT 
    userID as user_id ,
    movieID as movie_id,
    rating,
    TO_TIMESTAMP_LTZ(timestamp) as rating_timestamp
FROM raw_ratings
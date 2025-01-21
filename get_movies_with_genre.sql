SELECT movies.title, GROUP_CONCAT(genres.name) as genre FROM movies
JOIN movie_genres ON movies.id = movie_genres.movie_id
JOIN genres ON movie_genres.genre_id = genres.id
WHERE genres.name = "Drama"


GROUP BY movies.id
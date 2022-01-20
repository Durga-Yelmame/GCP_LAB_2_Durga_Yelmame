SELECT
  user.id as id_user,
 count(answer.id) as count
FROM `bigquery-public-data.stackoverflow.users` as user
JOIN `bigquery-public-data.stackoverflow.posts_answers` as answer
  ON user.id=answer.owner_user_id
  where EXTRACT(YEAR from answer.creation_date)=2010
  GROUP BY user.id
  order by count(answer.id) DESC 
  LIMIT 10;
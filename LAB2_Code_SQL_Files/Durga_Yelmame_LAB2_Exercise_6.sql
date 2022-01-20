SELECT
  user.id as id_user,
 count(stackoverflow.accepted_answer_id) as count
FROM `bigquery-public-data.stackoverflow.users` as user
JOIN `bigquery-public-data.stackoverflow.posts_answers` as answer
  ON user.id=answer.owner_user_id
JOIN `bigquery-public-data.stackoverflow.stackoverflow_posts` as stackoverflow
  ON answer.id=stackoverflow.accepted_answer_id
  where EXTRACT(YEAR from stackoverflow.creation_date)=2010
  GROUP BY user.id
  order by count(stackoverflow.accepted_answer_id) DESC 
  LIMIT 10;
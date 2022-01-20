
SELECT 
committer.name as name,
count(*) as count,
 FROM `bigquery-public-data.github_repos.sample_commits` 
 where repo_name IN (Select repo_name from `bigquery-public-data.github_repos.languages` ,UNNEST (language) as language where language.name="Java" )
 and EXTRACT (YEAR from committer.date) =2016
GROUP BY committer.name
order by count(*) Desc
LIMIT 10;

 
 
SELECT  
language.name as language_name,
count(*) as count
FROM `bigquery-public-data.github_repos.languages` ,
UNNEST(language) as language
group by language.name
order by count(*) DESC LIMIT 1 ;
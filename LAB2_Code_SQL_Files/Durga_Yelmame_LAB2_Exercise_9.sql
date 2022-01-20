SELECT repo_name,
difference.new_path as file,
committer.date as date,
LAG(commit)  OVER ( PARTITION BY difference.new_path order by committer.date asc) as previous, 
commit as Current_commit ,
LEAD(commit)  OVER ( PARTITION BY difference.new_path order by committer.date asc) as next 
FROM `bigquery-public-data.github_repos.sample_commits`,
UNNEST(difference) as difference
where difference.new_path like "kernel/%.c"
order by difference.new_path asc,committer.date asc;
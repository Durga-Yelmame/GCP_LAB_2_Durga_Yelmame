SELECT  CONCAT(SUBSTRING(date, 1, 4),'-', SUBSTRING(date,5,2),'-',SUBSTRING(date, 7, 2)) as date,
hits.page.pagePath as pagePath,
count(*) as counter
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`, unnest(hits) as hits 
WHERE hits.type = "PAGE" and  totals.newVisits=1 
GROUP BY date,hits.page.pagePath
ORDER BY date asc, counter DESC;
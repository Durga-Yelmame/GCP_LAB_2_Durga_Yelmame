SELECT visitId ,
visitStartTime,
h.page.pageTitle as PageTitle,
h.page.pagePath as PagePath,
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`,
UNNEST(hits) as h
WHERE date = "20170801";
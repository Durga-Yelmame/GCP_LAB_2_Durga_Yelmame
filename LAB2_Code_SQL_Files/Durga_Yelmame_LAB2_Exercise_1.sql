CREATE TABLE uc1_19.Movie as
SELECT * FROM(
SELECT EXTRACT(YEAR from Release_Date) as year,
Movie_Title as Movie_Title,
Production_Budget as Production_Budget,
RANK() OVER(PARTITION BY EXTRACT(YEAR from Release_Date) ORDER  BY Production_Budget DESC) as rank 
FROM `nttdata-c4e-bde.uc1_19.top_4000_movies_data`
WHERE Release_Date Between "2016-01-01" AND "2020-12-31")
where rank<=10
ORDER BY year Desc;



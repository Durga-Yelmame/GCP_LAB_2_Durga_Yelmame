SELECT * FROM(
SELECT geoNetwork.country as country,
 ARRAY_AGG(device.operatingSystem) OVER ( PARTITION BY geoNetwork.country
 ORDER BY (

 SELECT count(*)
 FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801` as iq
 WHERE iq.geoNetwork.country=oq.geoNetwork.country and  iq.device.operatingSystem=oq.device.operatingSystem and iq.device.browser=oq.device.browser
 group by geoNetwork.country, device.operatingSystem, device.browser

 ) ASC    ) AS operatingSystem,
  ARRAY_AGG(device.browser) OVER ( PARTITION BY geoNetwork.country 
  ORDER BY (

 SELECT count(*)
 FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801` as iq
 WHERE iq.geoNetwork.country=oq.geoNetwork.country and  iq.device.operatingSystem=oq.device.operatingSystem and iq.device.browser=oq.device.browser
 group by geoNetwork.country, device.operatingSystem, device.browser

  ) asc ) AS browser,

 FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801` as oq 
 WHERE device.isMobile=true and geoNetwork.country!="(not set)" and device.operatingSystem!="(not set)" and   device.browser!="(not set)"
 GROUP BY geoNetwork.country, device.operatingSystem, device.browser)
 ORDER BY country ASC



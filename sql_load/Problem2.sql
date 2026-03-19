SELECT
   COUNT(j.job_id) AS number_of_jobs,
    CASE
        WHEN j.job_location = 'Anywhere' THEN 'Remote'
        WHEN j.job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
        END AS location_category
FROM job_postings_fact AS j
WHERE j.job_title_short = 'Data Analyst'
GROUP BY location_category
;
/*  
Label new column as follows:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as 'Local'
- Otherwise 'Onsite'
*/

 


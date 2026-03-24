/* Get the unique (distinct) job locations in the jo_posting_fact 
table, order in alphabetical order (ascending order).
*/
SELECT DISTINCT
    job_location
FROM job_postings_fact
ORDER BY job_location ASC
;


/* In the job_posting_fact table get the collumns job_id, job_tittle_short, job_location and job_via
collumn. And order in ascending order by job_location.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via
FROM job_postings_fact
ORDER BY job_location ASC
;

/* In the job_posting_fact table get the collumns job_id, job_tittle_short, job_location, job_via
collumn and salary_year_avg. And only look at rows where job_ttitle_short is 'Data Engineer'.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Engineer'
;


-- Use WHERE with OR and AND and also IN, remember that IN specifies multiple valies in a WHERE clause
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg > 500000 
    AND salary_year_avg IS NOT NULL
    OR job_location IN('Boston, MA','New York')
ORDER BY salary_year_avg DESC
;

SELECT DISTINCT
	job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM
	job_postings_fact
WHERE
	 job_title_short IN ('Data Analyst','Data Engineer')
ORDER BY
job_title_short ASC
;
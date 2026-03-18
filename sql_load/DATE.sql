SELECT
    '2023-02-19'::DATE,
    '123'::INTEGER,
    'true'::BOOLEAN,
    '3.14'::REAL;

SELECT
j.job_title_short AS title,
j.job_location AS location,
j.job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM
    job_postings_fact AS j
LIMIT 5;


-- Problem 1: query to find both yearly and hourly average salary 
-- for each job schedule type for jobs posted after June 1, 2023, ordered by yearly average salary in descending order.
SELECT
    j.job_schedule_type,
    AVG(j.salary_year_avg) AS avg_year_salary,
    AVG(j.salary_hour_avg) AS avg_hour_salary
FROM job_postings_fact AS j
WHERE j.job_posted_date ::DATE > '2023-06-01'
GROUP BY j.job_schedule_type
ORDER BY avg_year_salary DESC NULLS LAST;

-- Problem 2: query to count the number of job postings for each month in 2023.
SELECT
EXTRACT(MONTH FROM j.job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS month,
COUNT(*) AS job_count
FROM job_postings_fact AS j
GROUP BY month
ORDER BY month;

-- Problem 3: query to find companies including name that have posted jobs offering health insurance.
-- where these postings were made in the second quater of 2023. Use date extraction functions.
SELECT DISTINCT
    c.name,
    j.job_posted_date ::DATE
FROM job_postings_fact j
JOIN company_dim c
    ON j.company_id = c.company_id
WHERE j.job_health_insurance = 'true'
AND EXTRACT(QUARTER FROM j.job_posted_date) = 2
AND EXTRACT(YEAR FROM j.job_posted_date) = 2023;

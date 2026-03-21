/*
            Question to answer 
4. What are the top skills based on salary?
    - Look at the avarege salary associated with each skill for Data Analyst positions.
    - Focuses on roles with specified salaries, regardless of location.
    - Why? It reveals how different skills impact salary level for Data Analyst and helps identify
        the most financially reqarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary --ROUND(collumn), number you want to round to).
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
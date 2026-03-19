SELECT 
    sd.skills,
    top_skills.skill_count
FROM skills_dim AS sd
JOIN (
    SELECT 
        sjd.skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim AS sjd
    GROUP BY sjd.skill_id
    ORDER BY skill_count DESC
    LIMIT 5
) AS top_skills
ON sd.skill_id = top_skills.skill_id
ORDER BY top_skills.skill_count DESC;

SELECT 
    c.name,
    cj.total_jobs,
    CASE
        WHEN cj.total_jobs < 10 THEN 'Small'
        WHEN cj.total_jobs BETWEEN 10 AND 50 THEN 'Medium'
        WHEN cj.total_jobs > 50 THEN 'Large'
    END AS company_size
FROM (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
) AS cj
JOIN company_dim c
ON c.company_id = cj.company_id;
/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for data analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salart levels for data analysts and
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
        skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary,
        COUNT(job_postings_fact.job_id) count_of_jobs
FROM
        job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
GROUP BY
        skills
ORDER BY
        avg_salary DESC
LIMIT 25;
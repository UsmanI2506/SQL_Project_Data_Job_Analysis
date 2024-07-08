/*
Quesiton: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying data analyst jobs from first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs dmand certain skills,
    helping job seekers understand which skills to develop that align with the top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
            job_id,
            name AS company_name,
            job_title,
            salary_year_avg
    FROM
            job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
            job_title_short = 'Data Analyst' AND
            job_location = 'Anywhere' AND
            salary_year_avg IS NOT NULL
    ORDER BY
            salary_year_avg DESC
    LIMIT 10
)

SELECT
        top_paying_jobs.*,
        skills_dim.skills
FROM
        top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
        salary_year_avg DESC;
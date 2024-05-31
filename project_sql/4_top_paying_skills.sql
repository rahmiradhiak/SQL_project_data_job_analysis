/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analyst and
    helps identify the most financially rewarding skills to acquire to improve
*/

SELECT 
    skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
   avg_salary DESC
LIMIT 25

/*
1. High Demand for Data Processing and Machine Learning Tools:
   - Skills like PySpark, DataRobot, Jupyter, Pandas, NumPy, and scikit-learn
    are highly valued, reflecting the importance of big data processing, 
    machine learning, and data analysis.

2. Proficiency in Development and Collaboration Platforms:
   - Version control and collaboration tools such as Bitbucket, GitLab, Atlassian,
    and Notion command high salaries, emphasizing the need for effective 
    project management and teamwork in data analytics.

3. Expertise in Cloud and DevOps Technologies:
   - Skills in cloud platforms (GCP), container orchestration (Kubernetes),
    and CI/CD tools (Jenkins, Airflow) are crucial, highlighting the demand 
    for scalable, automated, and efficient data operations.
*/
/*
Question-What skills are required for the top paying data analyst jobs?
-Use the top 10 highest paying skill from Q1
-Add the specific skill required for the roles
-It provides detailed look at which skills to develop that allign with top salaries
*/


with top_paying_jobs as
    (select
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date::date,
        name as company_name
    from 
        job_postings_fact
    left join company_dim
    on  job_postings_fact.company_id = company_dim.company_id
    where 
        job_title_short = 'Data Analyst'
        and job_location = 'Anywhere'
        and salary_year_avg is not null
    order by 
        salary_year_avg DESC 
)
select
    top_paying_jobs.*,
    skills
from top_paying_jobs
inner join skills_job_dim
    on top_paying_jobs.job_id = skills_job_dim.job_id
inner join skills_dim
    on skills_job_dim.skill_id = skills_dim.skill_id
order by salary_year_avg desc;


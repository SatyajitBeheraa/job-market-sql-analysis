/*---       Query we will go through     ---
Question : What are the top paying data_analyst jobs?
- Identify the top 10 highest paying jobs that are available remotely
-Focuses on job_postings with specific salaries(removes null)
-Why?Highlight the top -paying oppurtunities for data analysts,offering insights into employement oppurtunities
*/


select
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
limit 10;
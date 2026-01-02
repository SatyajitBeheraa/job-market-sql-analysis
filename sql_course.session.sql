select q1_job_postings.job_title_short,
        q1_job_postings.job_location,
        q1_job_postings.job_via,
        q1_job_postings.job_posted_date::DATE
        from 
        (select * 
        FROM january_jobs

        union all

        select * 
        from february_jobs

        union all

        select *
        from march_jobs) as q1_job_postings
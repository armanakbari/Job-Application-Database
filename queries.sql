-- q1

set @user_id = 6
SELECT 
    advance 
FROM 
    user_advances
WHERE
    user_advances.user_id = @user_id
    
    

-- q2
SELECT
    j.id
FROM
    users
LEFT JOIN cities c ON
    users.city = c.name
INNER JOIN companies c2 ON
    c.name = c2.location
INNER JOIN jobs j ON
    c2.id = j.owner


-- q3
SELECT id FROM (
    SELECT id, COUNT(ja.advance) - COUNT(ua.advance) as missing_advances FROM
    (
        SELECT advance FROM
            (SELECT id FROM users WHERE id = 6) selected_user
            LEFT JOIN user_advances aua
            on selected_user.id = aua.user_id
    ) ua
    RIGHT JOIN (
        SELECT id, owner, advance
        FROM (
            jobs j
            LEFT JOIN (
                SELECT * FROM job_advances WHERE is_required=true
            ) ja
            ON j.id = ja.job_id
        )
    ) ja

    ON ja.advance = ua.advance
    GROUP BY id HAVING missing_advances = 0
) result;



-- q4: all matching jobs with additional advances
SELECT id, additional_advances FROM (
    SELECT
           id,
           COUNT(ja.advance AND is_required) - COUNT(ua.advance AND is_required) as missing_advances,
           COUNT(ua.advance AND NOT is_required) as additional_advances
    FROM
    (
        SELECT advance FROM
            (SELECT id FROM users WHERE id = 6) selected_user
            LEFT JOIN user_advances aua
            on selected_user.id = aua.user_id
    ) ua
    RIGHT JOIN (
        SELECT id, owner, advance, is_required
        FROM (
            jobs j
            LEFT JOIN job_advances ja
            ON j.id = ja.job_id
        )
    ) ja

    ON ja.advance = ua.advance
    GROUP BY id HAVING missing_advances = 0
) result


-- q5: all matching jobs in same city
SET @user_id=6;
SET @user_city=(SELECT city FROM users WHERE id=@user_id);
SELECT id, additional_advances FROM (
    SELECT
           id,
           COUNT(ja.advance AND is_required) - COUNT(ua.advance AND is_required) as missing_advances,
           COUNT(ua.advance AND NOT is_required) as additional_advances
    FROM
    (
        SELECT advance, city FROM
            (SELECT id, city FROM users WHERE id = @user_id) selected_user
            LEFT JOIN user_advances aua
            on selected_user.id = aua.user_id
    ) ua
    RIGHT JOIN (
        SELECT _ja.id as id, location, advance, is_required FROM
        (
           SELECT id, owner, advance, is_required
           FROM (
                 jobs j
                    LEFT JOIN job_advances ja
                              ON j.id = ja.job_id
               )
        ) _ja
        LEFT JOIN companies
        ON companies.id = _ja.owner
        WHERE location = @user_city
    ) ja
    ON ja.advance = ua.advance
    GROUP BY id HAVING missing_advances = 0
) result;

-- q6: all user that have the appropriate skills for a specific job
SET @job_id=6
SELECT name, resume, phone_number, email, city FROM applications LEFT JOIN users ON users.id = applications.user_id WHERE 
applications.job_id = @job_id and applications.status = "created" 

	همه کارجویانی که برای یکی از کارهای یک کمپانی مشخص اپلایی کرده اند
SET @company_id=1
SELECT title, name, resume, email, city FROM 
  applications INNER JOIN (
    SELECT jobs.id as id, jobs.title as title FROM jobs 
    	LEFT JOIN companies 
    	ON jobs.owner = companies.id 
    	WHERE companies.id = @company_id
    )selecter_jobs 
  ON applications.job_id = selecter_jobs.id
  LEFT JOIN users 
  ON users.id = applications.user_id 
  WHERE applications.status = "created" 
  
  

-- q7 all users that has applied for a specific job
SET @job_id=6
SELECT 
    name, resume, phone_number, email, city 
FROM 
    applications 
LEFT JOIN 
    users 
ON users.id = applications.user_id 
WHERE 
    applications.job_id = @job_id and applications.status = "created" 





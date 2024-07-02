-- 3. Write a SQL query to find the daily spend for all employees in 2010

-- answer
SELECT employee.emp_name, t.daily_rate,t.start_date
FROM employee
INNER JOIN (
    SELECT emp_id, daily_rate, max(salary.start_date) AS start_date FROM salary WHERE start_date <= '2010-01-01' GROUP BY emp_id
    UNION
    SELECT emp_id, daily_rate, start_date FROM salary WHERE start_date > '2010-01-01' AND start_date < '2011-01-01' GROUP BY emp_id
) as t
ON employee.emp_id = t.emp_id;
WHERE '2010-01-01' <= employee.end_date OR employee.end_date IS NULL;

-- Explain:
-- "SELECT emp_id, daily_rate, max(salary.start_date) AS start_date FROM salary WHERE start_date <= '2010-01-01' GROUP BY emp_id;"
    -- is to query all salaries start before or equal than 2010-01-01, they may still active in part of 2010 for each people
-- "SELECT emp_id, daily_rate, start_date FROM salary WHERE start_date > '2010-01-01' AND start_date < '2011-01-01';"
    -- is to query all salaries started in 2010 for each people
-- Union above two queryset together, we got all salaries once worked in 2010 for each people
-- "WHERE '2010-01-01' <= employee.end_date OR employee.end_date IS NULL;" is to make sure only return active staffs


-- Tested on mysql
-- mysql> SELECT employee.emp_name, t.daily_rate,t.start_date
--     -> FROM employee
--     -> INNER JOIN (
--     ->     SELECT emp_id, daily_rate, max(salary.start_date) AS start_date FROM salary WHERE start_date <= '2010-01-01' GROUP BY emp_id
--     ->     UNION
--     ->     SELECT emp_id, daily_rate, start_date FROM salary WHERE start_date > '2010-01-01' AND start_date < '2011-01-01'
--     -> ) as t
--     -> ON employee.emp_id = t.emp_id;
-- +----------+------------+------------+
-- | emp_name | daily_rate | start_date |
-- +----------+------------+------------+
-- | Alice    |         50 | 2010-01-01 |
-- | Bob      |         60 | 2009-05-15 |
-- | Bob      |         70 | 2010-06-01 |
-- | Charlie  |         70 | 2010-01-01 |
-- | David    |         80 | 2010-07-01 |
-- +----------+------------+------------+
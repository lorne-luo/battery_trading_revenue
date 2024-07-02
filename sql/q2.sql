-- 2.Write a SQL query to find everyone’s daily rate for 10/10/2010

select employee.emp_name, daily_rate, salary.start_date
from salary
INNER JOIN (
    SELECT emp_id, MAX(start_date) AS max_date FROM salary WHERE start_date < '2010-10-10' GROUP BY emp_id
) AS max -- group by emp_id and find the max start_date ealier than 2010-10-10
ON salary.emp_id = max.emp_id and salary.start_date = max.max_date
INNER JOIN employee ON employee.emp_id = salary.emp_id;

-- tested on mysql
-- mysql> select employee.emp_name, daily_rate, salary.start_date
--     -> from salary
--     -> INNER JOIN (
--     ->   SELECT emp_id, MAX(start_date) AS max_date FROM salary WHERE salary.start_date < '2010-10-10' GROUP BY emp_id
--     -> ) AS max
--     -> ON salary.emp_id = max.emp_id and salary.start_date = max.max_date
--     -> INNER JOIN employee ON employee.emp_id = salary.emp_id;
-- +----------+------------+------------+
-- | emp_name | daily_rate | start_date |
-- +----------+------------+------------+
-- | Alice    |         50 | 2010-01-01 |
-- | Bob      |         70 | 2010-06-01 |
-- | Charlie  |         70 | 2010-01-01 |
-- | David    |         80 | 2010-07-01 |
-- +----------+------------+------------+
-- 4 rows in set (0.02 sec)
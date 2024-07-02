-- 2.Write a SQL query to find everyone’s daily rate for 10/10/2010

SELECT employee.emp_name, daily_rate
FROM salary
INNER JOIN (
    SELECT emp_id, MAX(start_date) AS max_date FROM salary WHERE start_date <= '2010-10-10' GROUP BY emp_id
) AS m
ON salary.emp_id = m.emp_id AND salary.start_date = m.max_date
INNER JOIN employee ON employee.emp_id = salary.emp_id
WHERE '2010-10-10' <= employee.end_date OR employee.end_date IS NULL;

-- Explain:
-- "SELECT emp_id, MAX(start_date) AS max_date FROM salary WHERE start_date < '2010-10-10' GROUP BY emp_id" is get everyone's active salary records in 2010-10-10
-- "WHERE '2010-10-10' <= employee.end_date OR employee.end_date IS NULL;" is to ensure only active employees are queried

-- Tested on Mysql
-- mysql> SELECT employee.emp_name, daily_rate
--     -> FROM salary
--     -> INNER JOIN (
--     ->     SELECT emp_id, MAX(start_date) AS max_date FROM salary WHERE start_date <= '2010-10-10' GROUP BY emp_id
--     -> ) AS m
--     -> ON salary.emp_id = m.emp_id AND salary.start_date = m.max_date
--     -> INNER JOIN employee ON employee.emp_id = salary.emp_id
--     -> WHERE '2010-10-10' <= employee.end_date OR employee.end_date IS NULL;
-- +----------+------------+
-- | emp_name | daily_rate |
-- +----------+------------+
-- | Alice    |         50 |
-- | Charlie  |         70 |
-- +----------+------------+
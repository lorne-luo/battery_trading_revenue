-- 1.Write a SQL query to find out Bob's daily rate on 15/06/2010

SELECT emp_name, daily_rate
FROM  salary
INNER JOIN employee ON employee.emp_id = salary.emp_id
WHERE emp_name = 'bob' AND salary.start_date <= '2010-06-15' AND ('2010-06-15' <= employee.end_date OR employee.end_date is NULL)
ORDER BY salary. start_date DESC limit 1;

-- Explain:
-- " AND ('2010-06-15' <= employee.end_date OR employee.end_date is NULL)" is to ensure that Bob is still active employee by 15/06/2010


-- Tested on Mysql
-- mysql> SELECT emp_name, daily_rate
--     -> FROM  salary
--     -> INNER JOIN employee ON employee.emp_id = salary.emp_id
--     -> WHERE emp_name = 'bob' AND salary.start_date <= '2010-06-15' AND ('2010-06-15' <= employee.end_date OR employee.end_date is Null)
--     -> ORDER BY salary.start_date DESC limit 1;
-- +----------+------------+
-- | emp_name | daily_rate |
-- +----------+------------+
-- | Bob      |         70 |
-- +----------+------------+

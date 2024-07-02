-- 1.Write a SQL query to find out Bob's daily rate on 15/06/2010

SELECT daily_rate
FROM salary
INNER JOIN employee ON employee.emp_id = salary.emp_id
WHERE emp_name = 'bob' AND salary.start_date < '2010-06-15'
ORDER BY salary.start_date DESC limit 1;

-- tested on mysql
-- mysql> SELECT daily_rate
--     -> FROM salary
--     -> INNER JOIN employee ON employee.emp_id = salary.emp_id
--     -> WHERE emp_name = 'bob'AND salary.start_date < '2010-06-15'
--     -> ORDER BY salary.start_date DESC limit 1;
-- +------------+
-- | daily_rate |
-- +------------+
-- |         70 |
-- +------------+
-- 1 row in set (0.01 sec)
/*
You are given three tables: Students, Friends and Packages. Students contains two columns: 
ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend).
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
Write a query to output the names of those students whose best friends got offered a higher
salary than them. Names must be ordered by the salary amount offered to the best friends.
It is guaranteed that no two students got same salary offer.
*/
--my solution query
WITH f_salpack AS (SELECT f.id AS id,s.salary AS salary
                 FROM friends f
                 LEFT JOIN Packages s
                 ON f.friend_id = s.id),
       salpack AS(SELECT s.id AS id,p.salary AS salary
                 FROM students s
                 LEFT JOIN Packages p
                 ON s.id = p.id) 
SELECT s.name
FROM Students s
JOIN f_salpack f ON s.id = f.id
JOIN salpack m ON s.id =m.id
WHERE f.salary>m.salary
ORDER BY f.salary;
/*
A company just acquired some new companies. Each of the companies 
follows this hierarchy: 
Founder -> Lead Manager -> senior manager -> manager -> employee
Based on the given  table schemas
write a query to print the company_code, founder name, total number of lead managers, total 
number of senior managers, total number of managers, and total number of employees.
Order your output by ascending company_code.
*/
SELECT c.company_code, c.founder, COUNT(DISTINCT e.lead_manager_code) AS Total_lead_manager,
    COUNT(DISTINCT e.senior_manager_code) AS total_senior_manager,
    COUNT(DISTINCT e.manager_code) AS Total_managers,
    COUNT(DISTINCT e.employee_code) AS total_Employees
FROM company c
LEFT JOIN employee e ON c.company_code = e.company_code
GROUP By c.company_code, c.founder
ORDER BY c.company_code;
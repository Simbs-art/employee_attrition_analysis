-- 1. Is there a difference in attrition between departments?
-- This query is to count the number of employees who left or stayed in each department.
SELECT Department, Attrition, COUNT(*) AS DepartmentCount
FROM EmployeeAttrition
GROUP BY Department, Attrition;

-- 2. Do employees who work overtime leave more often?
-- This query is to show the attrition count for employees who do or do not work overtime.
SELECT OverTime, Attrition, COUNT(*) AS OvertimeCount
FROM EmployeeAttrition
GROUP BY OverTime, Attrition;

-- 3. How does job satisfaction relate to attrition?
-- This query is to group employees by their job satisfaction level and attrition status.
SELECT JobSatisfaction, COUNT(*) AS Total, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount, ROUND(100.0*SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS AttritionRate
FROM EmployeeAttrition
GROUP BY JobSatisfaction
ORDER BY AttritionRate ASC;

-- 4. Is there a pattern between years at company and attrition?
-- This query is to show the attrition across different lengths of time at the company.
SELECT YearsAtCompany, Attrition, COUNT(*) AS TimeCount
FROM EmployeeAttrition
GROUP BY YearsAtCompany, Attrition
ORDER BY YearsAtCompany ASC;

-- 5. Do younger employees leave more often than older ones?
-- This query is to count the attrition occurrences grouped by age.
SELECT Age, Attrition, COUNT(*) AS AgeCount
FROM EmployeeAttrition
GROUP BY Age, Attrition
ORDER BY Age ASC;

-- 6. Is there a relationship between income and attrition?
-- This query is to check if monthly income correlates with employee attrition.
SELECT MonthlyIncome, Attrition, COUNT (*) AS IncomeCount
FROM EmployeeAttrition
GROUP BY MonthlyIncome     
ORDER BY MonthlyIncome ASC;

-- 7. Which job roles have the highest attrition rates?
-- This is to calculate the attrition rate per job role.
SELECT JobRole, COUNT(*) AS Total, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount, ROUND(100.0*SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS AttritionRate
FROM EmployeeAttrition
GROUP BY JobRole
ORDER BY AttritionRate DESC;

-- 8. Do people with more job involvement tend to stay?
-- This is to show attrition distribution across levels of job involvement.
SELECT JobInvolvement, Attrition, COUNT (*) AS InvolvementCount
FROM EmployeeAttrition
GROUP BY JobInvolvement, Attrition
ORDER BY JobInvolvement;

-- 9. How does work-life balance affect attrition?
-- This shows the attrition count by work-life balance ratings.
SELECT WorkLifeBalance, Attrition, COUNT(*) AS BalanceCount
FROM EmployeeAttrition
GROUP BY WorkLifeBalance, Attrition
ORDER BY WorkLifeBalance;

-- 10. Are employees who have worked at more companies more likely to leave?
-- This query is to evaluate attrition proportion based on the number of companies worked at in a group.
SELECT NumCompaniesWorked, SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS attrition_rate, COUNT(*) AS total_employees
FROM EmployeeAttrition
GROUP BY NumCompaniesWorked
ORDER BY NumCompaniesWorked;


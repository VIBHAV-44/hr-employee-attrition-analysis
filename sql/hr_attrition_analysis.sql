-- SQLite-compatible. Import CSV as hr_employee_data.
-- 1 Overall attrition
SELECT COUNT(*) total_employees,
 SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) employees_left,
 ROUND(100.0*SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) attrition_rate_pct
FROM hr_employee_data;

-- 2 By department
SELECT department,COUNT(*) employees,
 SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) employees_left,
 ROUND(100.0*SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) attrition_rate_pct
FROM hr_employee_data GROUP BY department ORDER BY attrition_rate_pct DESC;

-- 3 By job role
SELECT job_role,COUNT(*) employees,
 SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) employees_left,
 ROUND(100.0*SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) attrition_rate_pct
FROM hr_employee_data GROUP BY job_role ORDER BY attrition_rate_pct DESC;

-- 4 By overtime
SELECT overtime,COUNT(*) employees,
 ROUND(100.0*SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) attrition_rate_pct
FROM hr_employee_data GROUP BY overtime;

-- 5 By satisfaction
SELECT job_satisfaction,COUNT(*) employees,
 ROUND(100.0*SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) attrition_rate_pct
FROM hr_employee_data GROUP BY job_satisfaction ORDER BY job_satisfaction;

-- 6 By tenure band
SELECT CASE WHEN years_at_company<2 THEN '0-1 years'
 WHEN years_at_company<5 THEN '2-4 years' WHEN years_at_company<10 THEN '5-9 years'
 ELSE '10+ years' END tenure_band,COUNT(*) employees,
 ROUND(100.0*SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) attrition_rate_pct
FROM hr_employee_data GROUP BY tenure_band ORDER BY attrition_rate_pct DESC;

-- 7 By income band
SELECT CASE WHEN monthly_income<4000 THEN 'Under 4000'
 WHEN monthly_income<8000 THEN '4000-7999' ELSE '8000+' END income_band,COUNT(*) employees,
 ROUND(100.0*SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) attrition_rate_pct
FROM hr_employee_data GROUP BY income_band;

-- 8 Department + overtime
SELECT department,overtime,COUNT(*) employees,
 ROUND(100.0*SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) attrition_rate_pct
FROM hr_employee_data GROUP BY department,overtime;

-- 9 Average income by attrition status
SELECT attrition,COUNT(*) employees,ROUND(AVG(monthly_income),2) avg_monthly_income
FROM hr_employee_data GROUP BY attrition;

-- 10 Satisfaction by attrition
SELECT attrition,job_satisfaction,COUNT(*) employees
FROM hr_employee_data GROUP BY attrition,job_satisfaction ORDER BY attrition,job_satisfaction;

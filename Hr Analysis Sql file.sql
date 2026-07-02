-- 1 Total Employees
SELECT COUNT("Employee_ID")AS Total_employee
FROM employee_attriton

-- 2 Total Attrition Count
SELECT COUNT("Attrition") AS Total_Attrition
FROM employee_attriton
WHERE "Attrition"='Yes'

-- 3 Attrition Rate %
SELECT
    ROUND(
        COUNT(*) FILTER (WHERE "Attrition" = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attriton;

-- 4 Gender Distribution
SELECT "Gender",
COUNT(*) AS Total_employee
FROM employee_attriton
GROUP BY "Gender"

-- 5 Department-wise Employees
SELECT "Department",
COUNT(*) AS Total_employee
FROM employee_attriton
GROUP BY "Department"
ORDER BY Total_employee DESC

-- 6 Marital Status Distribution
SELECT "Marital_Status",
COUNT(*) AS Total_employee
FROM employee_attriton
GROUP BY "Marital_Status"

-- 7 Job Level Distribution
SELECT "Job_Level",
COUNT(*) AS Total_employee
FROM employee_attriton
GROUP BY "Job_Level"

-- 8 Average Monthly Income
SELECT ROUND(AVG("Monthly_Income")) AS Avrage_Monthly_Income
FROM employee_attriton

-- 9 Average Age
SELECT ROUND(AVG("Age")) AS Average_Age
FROM employee_attriton

-- 10 Average Years at Company
SELECT ROUND(AVG("Years_at_Company"),2) AS avergae_years
FROM employee_attriton

-- 11 Department-wise Attrition Rate
SELECT "Department",
ROUND(COUNT(*) FILTER (WHERE "Attrition" = 'Yes') * 100.0 / COUNT(*),2) AS attrition_rate
FROM employee_attriton
GROUP BY "Department";

-- 12 Job Role-wise Attrition Rate
SELECT "Job_Role",
ROUND(COUNT(*) FILTER(WHERE "Attrition"='Yes')*100/COUNT(*),2) AS attrition_rate
FROM employee_attriton
GROUP BY "Job_Role"

-- 13 Gender-wise Attrition Rate
SELECT "Gender",
ROUND(COUNT(*) FILTER(WHERE "Attrition"='Yes')*100/COUNT(*),2) AS attrition_rate
FROM employee_attriton
GROUP BY "Gender"

-- 14 Overtime vs Attrition
SELECT
    "Overtime",
    COUNT(CASE WHEN "Attrition"='Yes' THEN 1 END) AS attrition_count,
    COUNT(*) AS total_employees,
    ROUND(
        COUNT(CASE WHEN "Attrition"='Yes' THEN 1 END)*100.0/COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attriton
GROUP BY "Overtime";

-- 15 Average Income by Department
SELECT "Department",
ROUND(AVG("Monthly_Income"),2) AS Average_income
FROM employee_attriton
GROUP BY "Department"

-- 16 Average Income by Job Level
SELECT "Job_Level",
ROUND(AVG("Monthly_Income"),2)AS Average_income
FROM employee_attriton
GROUP BY "Job_Level"

-- 17 Average Job Satisfaction by Department
SELECT "Department",
ROUND(AVG("Job_Satisfaction"),2)AS Avg_Job_Satisfaction
FROM employee_attriton
GROUP BY "Department"

-- 18 Average Work Life Balance by Department
SELECT "Department",
ROUND(AVG("Work_Life_Balance"),2) AS avg_work_life_balance
FROM employee_attriton
GROUP BY "Department"
-- 19 Average Performance Rating by Department
SELECT "Department",
ROUND(AVG("Performance_Rating"),2) AS Avg_Performance_Rating
FROM employee_attriton
GROUP BY "Department"
ORDER BY Avg_Performance_Rating DESC

-- 20. What is the average years at company by department?
SELECT
    "Department",
    ROUND(AVG("Years_at_Company"),2) AS avg_years_at_company
FROM employee_attriton
GROUP BY "Department"
ORDER BY avg_years_at_company DESC;

-- 21 Top 5 Job Roles with Highest Attrition
SELECT "Job_Role",
COUNT(*) FILTER (WHERE "Attrition" = 'Yes') AS Total_Attrition
FROM employee_attriton
GROUP BY "Job_Role"
ORDER BY Total_Attrition DESC
LIMIT 5

-- 22. Rank departments based on attrition rate.
with depart_attraction AS(
      SELECT "Department",
	  ROUND(COUNT(CASE WHEN "Attrition"='Yes' THEN 1 END )*100/COUNT(*),2) AS Attraciton_rate
	  FROM employee_attriton
	  GROUP BY "Department"
)
SELECT  "Department",
		 Attraciton_rate,
		RANK() OVER(ORDER BY  Attraciton_rate DESC) AS Department_rank
		FROM depart_attraction

-- 23. What is the employee distribution by salary band?
SELECT CASE
		WHEN "Monthly_Income"<3000 THEN 'Low Salary'
		WHEN "Monthly_Income" BETWEEN 3000 AND 7000 THEN 'Medium Salary'
		ELSE 'Highest Salary'
		END AS Salary_band,
		COUNT(*) AS Total_employees
FROM employee_attriton
GROUP BY Salary_band
ORDER BY Total_employees DESC;
		

-- 24. What is the attrition rate across different salary bands?
SELECT CASE 
	WHEN "Monthly_Income"<3000 THEN 'Low Salary'
		WHEN "Monthly_Income" BETWEEN 3000 AND 7000 THEN 'Medium Salary'
		ELSE 'Highest Salary' END AS Salary_band,
COUNT(CASE WHEN "Attrition"='Yes' THEN 1 END)AS Total_Attraction,
COUNT(*) AS Total_employees,
ROUND(COUNT(CASE WHEN "Attrition"='Yes' THEN 1 END)*100.0/COUNT(*),2)AS Total_attrition_rate
FROM employee_attriton
GROUP BY Salary_band
ORDER BY Total_attrition_rate

-- 25. Which age group has the highest attrition rate?
SELECT CASE
WHEN "Age" BETWEEN 19 AND 30 THEN 'Young adults'
WHEN "Age" BETWEEN 31 AND 40 THEN  'Adults'
WHEN "Age" BETWEEN 40 AND 50 THEN 'Middle-aged'
ELSE 'Senior' END AS Age_group,
COUNT(CASE WHEN "Attrition"='Yes' THEN 1 END)AS Total_Attraction,
COUNT(*) AS Total_employees,
ROUND(COUNT(CASE WHEN "Attrition"='Yes' THEN 1 END)*100.0/COUNT(*),2)AS Total_attrition_rate
FROM employee_attriton
GROUP BY Age_group
ORDER BY Total_attrition_rate DESC

-- 26. Which experience group has the highest attrition rate?
SELECT CASE
WHEN "Years_at_Company"<3 THEN '0-2 Years'
WHEN "Years_at_Company" BETWEEN 3 AND 5 THEN '3-5 Years'
WHEN "Years_at_Company" BETWEEN 6 AND 10 THEN '6-10 Years'
ELSE '10+ Years' END AS Group_of_experiance,
COUNT(CASE WHEN "Attrition"='Yes' THEN 1 END)AS Total_Attraction,
COUNT(*) AS Total_employees,
ROUND(COUNT(CASE WHEN "Attrition"='Yes' THEN 1 END)*100.0/COUNT(*),2)AS Total_attrition_rate
FROM employee_attriton
GROUP BY Group_of_experiance
ORDER BY Total_attrition_rate DESC


-- 27. Who is the highest-paid employee in each department?
WITH Salary_rank AS (
SELECT "Employee_ID","Department","Job_Role","Monthly_Income",
RANK()OVER(PARTITION BY "Department" ORDER BY "Monthly_Income" DESC) AS Salary_rank
FROM employee_attriton
)
SELECT * FROM Salary_rank
LIMIT 1

-- 28. Which departments have an average salary higher than the company's average salary?
SELECT "Department",
ROUND(AVG("Monthly_Income"),2) AS Average_salary
FROM employee_attriton
GROUP BY "Department"
HAVING AVG("Monthly_Income")>(SELECT  AVG("Monthly_Income")
FROM employee_attriton
)

ORDER BY Average_salary DESC;

-- 29. Which employees earn more than the average salary of their own department?
SELECT "Employee_ID","Department","Job_Role","Monthly_Income"
FROM employee_attriton
WHERE "Monthly_Income">(
SELECT AVG("Monthly_Income") 
FROM employee_attriton
)
ORDER BY "Department";



-- 30. Who are the top 10 highest-paid employees in the company?
SELECT "Employee_ID","Department","Monthly_Income"
FROM employee_attriton
ORDER BY "Monthly_Income" DESC
LIMIT 10

-- Q1) Write an SQL query to find the details of employees under attrition having 5+ years of experience in between the age group of 27-35

select * from hr_employee_attrition 
where TotalWorkingYears >= 5 
and age between '27' and '35';

-- Q2) Fetch the details of employees having maximum and minimum salary working in different departments who received less than 13%  salary hike

select max(MonthlyIncome), min(MonthlyIncome), Department from hr_employee_attrition 
where PercentSalaryHike < 13 
group by Department 
order by max(MonthlyIncome) desc;

-- Q3) Calculate the average monthly income of all employees who worked more than 3 years and whose education background is medical

select avg(MonthlyIncome) from hr_employee_attrition 
where YearsAtCompany > 3 
and EducationField = 'medical';

-- Q4) Identify the total no of male and female employees under attrition whose marital status is married and haven't received promotion in the last 2 years

select gender, count(*) from hr_employee_attrition 
where MaritalStatus = 'Married' 
and YearsSinceLastPromotion = 2 
and Attrition = 'Yes' 
group by gender;

-- Q5) Employees with max performance rating but no promotion for 4 years and above

select * from hr_employee_attrition 
where performancerating = (select max(performancerating) from hr_employee_attrition) 
and YearsSinceLastPromotion >= 4;

-- Q6) Who has max and min percentage salary hike

select yearsatcompany, performancerating, yearssincelastpromotion, max(percentsalaryhike), min(percentsalaryhike) 
from hr_employee_attrition 
group by YearsAtCompany, PerformanceRating, YearsSinceLastPromotion 
order by max(percentsalaryhike) desc, min(PercentSalaryHike) asc;

-- Q7) Employees working overtime but given min salary hike and are more than 5 years with company

select * from hr_employee_attrition where overtime = 'ýes' 
and PercentSalaryHike = (select min(PercentSalaryHike) from hr_employee_attrition) 
and YearsAtCompany > 5;

-- Q8) Employees working overtime but given max salary hike and are less than 5 years with company

select * from hr_employee_attrition where OverTime = 'yes' 
and PercentSalaryHike = (select max(PercentSalaryHike) from hr_employee_attrition) 
and YearsAtCompany < 5;

-- Q9) Employees not working overtime but given max salary hike and are less than 5 years with company

select * from hr_employee_attrition where OverTime = 'no' 
and PercentSalaryHike = (select max(PercentSalaryHike) from hr_employee_attrition) 
and YearsAtCompany < 5;

-- Q10) Identify the average level of job satisfaction according to gender

select Gender, avg(JobSatisfaction) from hr_employee_attrition 
group by Gender;


 
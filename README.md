# HR Analytics: Employee Attrition & Workforce Analysis

An end-to-end HR data analysis project exploring employee attrition patterns, workforce demographics, compensation, and satisfaction metrics using **PostgreSQL**, **Python (Jupyter Notebook)**, and **MS Excel**.

![HR Analytics Dashboard](Dashboard_image.png)

---

## 📌 Project Overview

This project analyzes a dataset of **10,000 employee records** to uncover key drivers of attrition, identify at-risk departments and job roles, and understand the relationship between compensation, satisfaction, work-life balance, and employee turnover.

The workflow covers the complete analytics pipeline:
1. **Data Import & Cleaning** – Python (Pandas) + PostgreSQL (SQLAlchemy)
2. **Exploratory & Business Analysis** – 30 SQL queries (Basic → Advanced)
3. **Interactive Dashboard** – MS Excel

---

## 🗂️ Dataset

**File:** `employee_attrition_dataset_10000.csv`
**Records:** 10,000 employees
**Columns:** 26

| Category | Columns |
|---|---|
| Demographics | Employee_ID, Age, Gender, Marital_Status |
| Job Info | Department, Job_Role, Job_Level, Years_at_Company, Years_in_Current_Role, Years_Since_Last_Promotion |
| Compensation | Monthly_Income, Hourly_Rate |
| Satisfaction & Engagement | Job_Satisfaction, Work_Life_Balance, Work_Environment_Satisfaction, Relationship_with_Manager, Job_Involvement |
| Performance & Work | Performance_Rating, Training_Hours_Last_Year, Project_Count, Average_Hours_Worked_Per_Week, Overtime, Absenteeism |
| Other | Distance_From_Home, Number_of_Companies_Worked |
| Target | Attrition (Yes/No) |

---

## 🛠️ Tools & Technologies

- **Python** – Pandas, SQLAlchemy (data cleaning & database loading)
- **PostgreSQL** – Business analysis using SQL
- **MS Excel** – Interactive dashboard & visualization
- **Jupyter Notebook** – Documented analysis workflow

---

## 📁 Project Structure

```
HR-Analytics-Employee-Attrition/
│
├── Hr_Data_analysis.ipynb          # Data import & cleaning notebook
├── Hr_Analysis_Sql_file.sql        # 30 SQL business analysis queries
├── Hr_Analysis.xlsx                # Excel dashboard & source data
├── employee_attrition_dataset_10000.csv   # Raw dataset (CSV format)
├── Dashboard_image.png             # Excel dashboard screenshot
└── README.md                       # Project documentation
```

---

## 🧹 Data Cleaning (Python)

- Loaded raw CSV using `latin1` encoding to avoid character errors
- Verified data types, checked for duplicates and null values (0 duplicates, 0 nulls found)
- Loaded the cleaned dataset into PostgreSQL using SQLAlchemy (`employee_attriton` table)
- Generated summary statistics with `df.describe()` for a quick data health check

---

## 🧮 SQL Analysis Highlights

The SQL file (`Hr_Analysis_Sql_file.sql`) contains **30 business questions**, progressing from basic aggregations to advanced window functions and subqueries:

**Basic**
- Total employees, total attrition count, overall attrition rate
- Gender, department, marital status, and job level distribution
- Average income, age, and tenure

**Intermediate**
- Department-wise, job role-wise, and gender-wise attrition rate
- Overtime vs. attrition relationship
- Average income, satisfaction, work-life balance, and performance rating by department
- Top 5 job roles with highest attrition

**Advanced**
- Department ranking by attrition rate (`RANK() OVER`)
- Employee distribution & attrition rate by salary band
- Attrition rate by age group and experience group
- Highest-paid employee per department (window functions)
- Departments with above-average salary (subquery)
- Employees earning above their department's average salary
- Top 10 highest-paid employees company-wide

---

## 📊 MS Excel Dashboard

The dashboard (built in `Hr_Analysis.xlsx`) provides an interactive view of workforce and attrition trends, including:

- **KPI Cards:** Average Monthly Income, Average Age, Attrition Count, Total Employees, Average Distance From Home
- **Overtime vs Attrition** comparison
- **Department-wise & Gender-wise** employee and attrition breakdown
- **Marital Status vs Attrition**
- **Department distribution** (donut chart)
- **Slicers:** Job Role, Gender, Marital Status for dynamic filtering

### Key Insights
- Overall attrition rate is around **21.4%** of the workforce
- Employees working **overtime** show a noticeably higher attrition tendency
- **Marketing and Sales** departments have relatively higher headcount and attrition exposure
- Attrition is fairly balanced across gender, with a slightly higher count among females

---

## 🚀 How to Reproduce

1. Clone the repository
2. Load `employee_attrition_dataset_10000.csv` into PostgreSQL (or run `Hr_Data_analysis.ipynb` to automate this)
3. Run the queries in `Hr_Analysis_Sql_file.sql` against the `employee_attriton` table
4. Open `Hr_Analysis.xlsx` in MS Excel to explore the interactive dashboard

---

## 👤 Author

**Nazmul**
GitHub: [nazmul23423](https://github.com/nazmul23423)

---

## 📄 License

This project is open-source and available for learning and portfolio purposes.

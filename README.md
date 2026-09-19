# Project 03: HR Employee Attrition & Workforce Analytics
**Portfolio project | Excel, SQL, Power BI, DAX | Fresher-friendly**

## Business scenario
HR wants to understand attrition patterns across department, role, tenure, satisfaction, income and overtime.

## Questions
1. What is the overall attrition rate?
2. How does attrition vary by department and job role?
3. How does attrition vary by overtime status?
4. What patterns appear across tenure and satisfaction groups?

## Dataset
`data/hr_employee_data.csv` is **synthetic demo data**, not IBM employee data and not real employee information.

## Run in VS Code (Windows)
Extract/open this folder → Terminal → New Terminal:
```powershell
py -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
python python/run_analysis.py
```
Outputs are saved in `outputs/`. Import the CSV as a SQL table named `hr_employee_data` to run SQL queries.

## Power BI
Import the CSV, follow `powerbi/Dashboard_Build_Guide.md`, create measures from `powerbi/DAX_Measures.dax`, and save the PBIX in `powerbi/`.

## Ethics
Synthetic data is unsuitable for employment decisions. Attrition differences are descriptive associations, not proof of cause.

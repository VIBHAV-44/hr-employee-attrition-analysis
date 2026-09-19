from pathlib import Path
import pandas as pd
ROOT=Path(__file__).resolve().parents[1]
df=pd.read_csv(ROOT/"data"/"hr_employee_data.csv")
OUT=ROOT/"outputs"; OUT.mkdir(exist_ok=True)
assert df.employee_id.is_unique
assert df.attrition.isin(["Yes","No"]).all()
assert df.monthly_income.ge(0).all()

total=len(df); left=int(df.attrition.eq("Yes").sum())
kpis=pd.DataFrame([["Total Employees",total],["Employees Left",left],
 ["Attrition Rate (%)",round(left/total*100,2) if total else 0],
 ["Average Monthly Income",round(df.monthly_income.mean(),2)],
 ["Average Tenure (Years)",round(df.years_at_company.mean(),2)]],columns=["metric","value"])
kpis.to_csv(OUT/"hr_kpi_summary.csv",index=False)
for col,filename in [("department","attrition_by_department.csv"),("job_role","attrition_by_job_role.csv"),
 ("overtime","attrition_by_overtime.csv"),("job_satisfaction","attrition_by_satisfaction.csv"),
 ("years_at_company","attrition_by_tenure.csv")]:
    result=df.groupby(col,as_index=False).agg(employees=("employee_id","count"),
       employees_left=("attrition",lambda s:(s=="Yes").sum()))
    result["attrition_rate_pct"]=(result.employees_left/result.employees*100).round(2)
    result.to_csv(OUT/filename,index=False)
print("Analysis complete. Check outputs/.")
print(kpis.to_string(index=False))

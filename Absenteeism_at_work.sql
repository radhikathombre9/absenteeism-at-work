--Create a Join table
select * from Absenteeism_at_work as A
left join compensation as C
on A.ID = C.ID
left join Reasons as R
on A.Reason_for_absence=R.Number

--find Healthieast
select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker=0
and Body_mass_index < 25 and Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

--compensation rate increase for non smokers

select count(*) as non_smoker from Absenteeism_at_work
where Social_smoker=0

--optimize the query
Select 
A.ID,
R.Reason,
Month_of_absence,
Body_mass_index,
case when Body_mass_index < 18.5 then 'Underweight'
     when Body_mass_index between 18.5 and 25 then 'healthy weight'
	 when Body_mass_index between 25 and 30  then 'overweight'
	 when Body_mass_index > 30 then 'obese'
	 else 'unknown'
	 end as BMI_category,
case when month_of_absence IN(12,1,2) Then 'winter'
     when month_of_absence IN(3,4,5) Then 'Spring'
	 when month_of_absence IN(6,7,8) Then 'summer'
	 when month_of_absence IN(9,10,11) Then 'fall'
	 else 'unknown'
	 end as season_names,
Seasons,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work as A
left join compensation as C
on A.ID = C.ID
left join Reasons as R
on A.Reason_for_absence=R.Number

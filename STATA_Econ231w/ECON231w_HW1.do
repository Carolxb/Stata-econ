clear
use "/Users/carol/Downloads/NSCG_15.dta"
drop if hrswk==98
replace wkslyr=52 if wksyr=="1"
bysort gender: sum hrswk
bysort gender: sum wkslyr
bysort gender: sum earn
histogram hrswk if gender=="M", width(10) color(green) title("Distribution of hours worked per week for Male")
histogram hrswk if gender=="F", width(10) title("Distribution of hours worked per week for Female")
gen lnhourwage = log(earn/hrswk/wkslyr)
drop if lnhourwage<0
bysort gender: sum lnhourwage, detail
egen count_emsmi=count(emsmi)
egen count_emsmi_1=count(emsmi) if emsmi=="1"
gen prop=count_emsmi_1/count_emsmi
sum prop
egen share_degree_gender=mean(lnhourwage), by(nbamemg gender)
bysort nbamemg gender: sum share_degree_gender
bysort gender: reg lnhourwage educ
gen ptlexper = age-educ-6
gen ptlexper_sqd = ptlexper^2
bysort gender: reg lnhourwage educ ptlexper ptlexper_sqd

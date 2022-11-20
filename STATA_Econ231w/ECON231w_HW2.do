cls
clear all
// Part a
use HW2a.dta
/* Answer for part a */
//(a)
gen race = 1 if black==0 & hispan==0
replace race = 0 if black==1 | hispan==1
bysort race: sum narr86 qemp86 inc86 tottime
//(b)
reg narr86 pcnv avgsen tottime ptime86 qemp86
//(c)         
sum(avgsen)
reg avgsen pcnv tottime ptime86  qemp86
gen se2_help=(narr86-0.7060607-pcnv*(-0.1512246)-(-0.0070487)*avgsen-0.0120953*tottime-(-0.0392585)*ptime86-(-0.1030909)*qemp86)^2
sum(se2_help)
//(e)
reg narr86 pcnv avgsen tottime ptime86 qemp86
rvfplot, yline(0)
//(f)
gen avgsen2=avgsen^2
reg narr86 pcnv avgsen avgsen2 tottime ptime86 qemp86
//(g)
reg narr86 pcnv avgsen avgsen2 ptime86 qemp86 inc86 race tottime,r

//clear data
clear

// Part b
use HW2b.dta                 
/* Answer for part b */
//(a)
bysort train: sum age educ black married lre74 lre75 lre78
//(b)
reg lre78 train
//(c)
sum(train)
gen se2b_help=(lre78-1.03377-0.2454107*train)^2
sum(se2b_help)
//(d)
reg lre78 train re74 re75 educ age black hisp
//(e)
gen minor=1 if black==1 | hisp==1
replace minor=0 if black==0 & hisp==0
gen train_minor=train*minor
reg lre78 train re74 re75 educ age black hisp train_minor
//(f)
reg lre78 train re74 re75 educ age black hisp unem74 unem75
//(g)
reg unem78 train re74 re75 educ age black hisp unem74 unem75

//Econ231W_Final project

clear all
//import data
use "/Users/carol/Downloads/Clean_Dataset.dta"

// Data cleaning notes
replace Culture = -89.82 if Culture == -8981784
replace Precipit = Precipit/1000 if Precipit >=1000 | Precipit <= -1000
replace Spectators = Spectators/1000 if Spectators >=1000
gen Precipit_abs = abs(Precipit)
gen Altitude_abs = abs(Altitude)
gen Temperature_abs = abs(Temperature)
gen Wealth_abs = abs(Wealth)

egen Travel_m = mean(Travel)
gen Home_Travel = Home*(Travel-Travel_m)
egen Altitude_m = mean(Altitude)
gen Home_Altitude = Home*(Altitude-Altitude_m)
egen Temperature_m = mean(Temperature)
gen Home_Temperature = Home*(Temperature-Temperature_m)
egen Precipit_m = mean(Precipit)
gen Home_Precipit = Home*(Precipit-Precipit_m)
egen Culture_m = mean(Culture)
gen Home_Culture = Home*(Culture-Culture_m)
egen Wealth_m = mean(Wealth)
gen Home_Wealth = Home*(Wealth-Wealth_m)
egen Spectators_m = mean(Spectators)
gen Home_Spectators = Home*(Spectators-Spectators_m)
egen Derby_m = mean(Derby)
gen Home_Derby = Home*(Derby-Derby_m) 
egen Balkans_m = mean(Balkans) 
gen Home_Balkans = Home*(Balkans-Balkans_m)
egen North_Eur_m = mean(North_Eur)
gen Home_North_Eur = Home*(North_Eur-North_Eur_m)
egen Rel_Strenght_m = mean(Rel_Strenght)
gen Home_Rel_Strenght = Home*(Rel_Strenght-Rel_Strenght_m)

reg(Goal_diff Home Home_Travel Home_Altitude Home_Temperature Home_Precipit Home_Culture Home_Wealth Home_Spectators Home_Derby Home_Balkans Home_North_Eur Home_Rel_Strenght),vce(cluster Pair_ID)
																	  
reg(Home_Spectators Home_Balkans)

gen Home_balkans_spectators = Home * (Balkans-Balkans_m) * (Spectators-Spectators_m)

reg(Goal_diff Home Home_Travel Home_Altitude Home_Temperature Home_Precipit Home_Culture Home_Wealth Home_Spectators Home_Derby Home_Balkans Home_North_Eur Home_Rel_Strenght Home_balkans_spectators),vce(cluster Pair_ID)





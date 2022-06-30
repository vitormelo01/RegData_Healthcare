clear
cd "C:\Users\vitor\OneDrive\Research_Resources\RegData_Healthcare\Data"

* saving data in dta format:
clear
insheet using "federal_regdata_4_0_3digit_naics.csv"
save federal_regdata_4_0_3digit_naics.dta, replace

clear
insheet using "federal_regdata_4_0_4digit_naics.csv"
save federal_regdata_4_0_4digit_naics.dta, replace

clear
insheet using "federal_regdata_4_0_documents.csv"
save federal_regdata_4_0_documents.dta, replace

*******************************************************************************
* 3 digit data
*******************************************************************************

* Keeping only 90% or more probability of being in that industry
clear
use federal_regdata_4_0_3digit_naics.dta

keep if probability >= 0.9

merge m:m year document_reference using federal_regdata_4_0_documents.dta
keep if _merge==3
drop _merge

fillin naics year
collapse (sum) restrictions_2_0, by (naics year industry_description)

* destring year variable
gen year_nonstring = substr(year,1,4)
destring year_nonstring, replace
drop year
rename year_nonstring year 

order naics industry_description year restrictions_2_0

save federal_3digit_90pct.dta, replace

*******************************************************************************
* 4 digit data
*******************************************************************************

* Keeping only 90% or more probability of being in that industry
clear
use federal_regdata_4_0_4digit_naics.dta

keep if probability >= 0.9

merge m:m year document_reference using federal_regdata_4_0_documents.dta
keep if _merge==3
drop _merge

fillin naics year
collapse (sum) restrictions_2_0, by (naics year industry_description)

* destring year variable
gen year_nonstring = substr(year,1,4)
destring year_nonstring, replace
drop year
rename year_nonstring year 

order naics industry_description year restrictions_2_0

save federal_4digit_90pct.dta, replace

















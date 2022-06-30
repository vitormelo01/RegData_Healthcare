clear
cd "C:\Users\vitor\OneDrive\Research_Resources\RegData_Healthcare\Data"

********************************************************************************
* 2021 data
********************************************************************************

* saving data in dta format:
clear
insheet using "state_regdata_industry_2021.csv"
save state_regdata_industry_2021.dta, replace

clear
insheet using "state_regdata_restrictions_2021.csv"
save state_regdata_restrictions_2021.dta, replace


* NAICS 3 digit healthcare codes: 
* 111 112 113 114 115 211 212 213 221 236 237 238 311 312 313 314 321 322 323 324 325 326 327 331 332 333 334 335 336 337 339 423 424 425 441 443 444 445 446 447 448 451 452 453 454 481 482 483 484 485 486 487 488 493 511 512 515 517 518 519 521 522 523 524 525 531 532 541 551 561 562 611 621 622 623 624 711 712 713 721 722 811 812 813 814 921 922 924 928

* Keeping only 90% or more probability of being in that industry

clear 
use state_regdata_industry_2021.dta

keep if probability >= 0.9

merge m:m state document_id using state_regdata_restrictions_2021.dta
keep if _merge == 3
drop _merge

* Creating fips code for states

	gen id = .
replace id = 1 if state=="alabama"
replace id = 2 if state=="alaska"
replace id = 4 if state=="arizona"
replace id = 5 if state=="arkansas"
replace id = 6 if state=="california"
replace id = 8 if state=="colorado"
replace id = 9 if state=="connecticut"
replace id = 10 if state=="delaware"
replace id = 11 if state=="dc"
replace id = 12 if state=="florida"
replace id = 13 if state=="georgia"
replace id = 15 if state=="hawaii"
replace id = 16 if state=="idaho"
replace id = 17 if state=="illinois"
replace id = 18 if state=="indiana"
replace id = 19 if state=="iowa"
replace id = 20 if state=="kansas"
replace id = 21 if state=="kentucky"
replace id = 22 if state=="louisiana"
replace id = 23 if state=="maine"
replace id = 24 if state=="maryland"
replace id = 25 if state=="massachusetts"
replace id = 26 if state=="michigan"
replace id = 27 if state=="minnesota"
replace id = 28 if state=="mississippi"
replace id = 29 if state=="missouri"
replace id = 30 if state=="montana"
replace id = 31 if state=="nebraska"
replace id = 32 if state=="mevada"
replace id = 33 if state=="new_hampshire"
replace id = 34 if state=="new_jersey"
replace id = 35 if state=="new_mexico"
replace id = 36 if state=="new_york"
replace id = 37 if state=="north_carolina"
replace id = 38 if state=="north_dakota"
replace id = 39 if state=="ohio"
replace id = 40 if state=="oklahoma"
replace id = 41 if state=="oregon"
replace id = 42 if state=="pennsylvania"
replace id = 44 if state=="rhode_island"
replace id = 45 if state=="south_carolina"
replace id = 46 if state=="south_dakota"
replace id = 47 if state=="tennessee"
replace id = 48 if state=="texas"
replace id = 49 if state=="utah"
replace id = 50 if state=="vermont"
replace id = 51 if state=="virginia"
replace id = 53 if state=="washington"
replace id = 54 if state=="west_virginia"
replace id = 55 if state=="wisconsin"
replace id = 56 if state=="wyoming"

* Collapsing data 
fillin industry id
collapse (sum) restrictions, by (industry id)

sort id industry
drop if industry == .

* Generating state name variable

gen state = "."
replace state = "Alabama" if id == 1
replace state = "Alaska" if id == 2
replace state = "Arizona" if id == 4
replace state = "Arkansas" if id == 5
replace state = "California" if id == 6
replace state = "Colorado" if id == 8
replace state = "Connecticut" if id == 9
replace state = "Delaware" if id == 10
replace state = "Washington DC" if id == 11
replace state = "Florida" if id == 12
replace state = "Georgia" if id == 13
replace state = "Hawaii" if id == 15
replace state = "Idaho" if id == 16
replace state = "Illinois" if id == 17
replace state = "Indiana" if id == 18
replace state = "Iowa" if id == 19
replace state = "Kansas" if id == 20
replace state = "Kentucky" if id == 21
replace state = "Louisiana" if id == 22
replace state = "Maine" if id == 23
replace state = "Maryland" if id == 24
replace state = "Massachusetts" if id == 25
replace state = "Michigan" if id == 26
replace state = "Minnesota" if id == 27
replace state = "Mississippi" if id == 28
replace state = "Missouri" if id == 29
replace state = "Montana" if id == 30
replace state = "Nebraska" if id == 31
replace state = "Nevada" if id == 32
replace state = "New Hampshire" if id == 33
replace state = "New Jersey" if id == 34
replace state = "New Mexico" if id == 35
replace state = "New York" if id == 36
replace state = "North Carolina" if id == 37
replace state = "North Dakota" if id == 38
replace state = "Ohio" if id == 39
replace state = "Oklahoma" if id == 40
replace state = "Oregon" if id == 41
replace state = "Pennsylvania" if id == 42
replace state = "Rhode Island" if id == 44
replace state = "South Carolina" if id == 45
replace state = "South Dakota" if id == 46
replace state = "Tennessee" if id == 47
replace state = "Texas" if id == 48
replace state = "Utah" if id == 49
replace state = "Vermont" if id == 50
replace state = "Virginia" if id == 51
replace state = "Washington" if id == 53
replace state = "West Virginia" if id == 54
replace state = "Wisconsin" if id == 55
replace state = "Wyoming" if id == 56

* Generating year variable
gen year = 2021

save restrictions_2021_90pct, replace

********************************************************************************
* 2020 dataset 
********************************************************************************

* saving data in dta format:
clear
insheet using "state_regdata_industry_2020.csv"
save state_regdata_industry_2020.dta, replace

clear
insheet using "state_regdata_restrictions_2020.csv"
save state_regdata_restrictions_2020.dta, replace

* Keeping only 90% or more probability of being in that industry

clear 
use state_regdata_industry_2020.dta

keep if probability >= 0.9

merge m:m state document_id using state_regdata_restrictions_2020.dta
keep if _merge == 3
drop _merge

* Creating fips code for states

	gen id = .
replace id = 1 if state=="alabama"
replace id = 2 if state=="alaska"
replace id = 4 if state=="arizona"
replace id = 5 if state=="arkansas"
replace id = 6 if state=="california"
replace id = 8 if state=="colorado"
replace id = 9 if state=="connecticut"
replace id = 10 if state=="delaware"
replace id = 11 if state=="dc"
replace id = 12 if state=="florida"
replace id = 13 if state=="georgia"
replace id = 15 if state=="hawaii"
replace id = 16 if state=="idaho"
replace id = 17 if state=="illinois"
replace id = 18 if state=="indiana"
replace id = 19 if state=="iowa"
replace id = 20 if state=="kansas"
replace id = 21 if state=="kentucky"
replace id = 22 if state=="louisiana"
replace id = 23 if state=="maine"
replace id = 24 if state=="maryland"
replace id = 25 if state=="massachusetts"
replace id = 26 if state=="michigan"
replace id = 27 if state=="minnesota"
replace id = 28 if state=="mississippi"
replace id = 29 if state=="missouri"
replace id = 30 if state=="montana"
replace id = 31 if state=="nebraska"
replace id = 32 if state=="mevada"
replace id = 33 if state=="new_hampshire"
replace id = 34 if state=="new_jersey"
replace id = 35 if state=="new_mexico"
replace id = 36 if state=="new_york"
replace id = 37 if state=="north_carolina"
replace id = 38 if state=="north_dakota"
replace id = 39 if state=="ohio"
replace id = 40 if state=="oklahoma"
replace id = 41 if state=="oregon"
replace id = 42 if state=="pennsylvania"
replace id = 44 if state=="rhode_island"
replace id = 45 if state=="south_carolina"
replace id = 46 if state=="south_dakota"
replace id = 47 if state=="tennessee"
replace id = 48 if state=="texas"
replace id = 49 if state=="utah"
replace id = 50 if state=="vermont"
replace id = 51 if state=="virginia"
replace id = 53 if state=="washington"
replace id = 54 if state=="west_virginia"
replace id = 55 if state=="wisconsin"
replace id = 56 if state=="wyoming"

* Collapsing data 
fillin industry id
collapse (sum) restrictions, by (industry id)

sort id industry
drop if industry == .

* Generating state name variable

gen state = "."
replace state = "Alabama" if id == 1
replace state = "Alaska" if id == 2
replace state = "Arizona" if id == 4
replace state = "Arkansas" if id == 5
replace state = "California" if id == 6
replace state = "Colorado" if id == 8
replace state = "Connecticut" if id == 9
replace state = "Delaware" if id == 10
replace state = "Washington DC" if id == 11
replace state = "Florida" if id == 12
replace state = "Georgia" if id == 13
replace state = "Hawaii" if id == 15
replace state = "Idaho" if id == 16
replace state = "Illinois" if id == 17
replace state = "Indiana" if id == 18
replace state = "Iowa" if id == 19
replace state = "Kansas" if id == 20
replace state = "Kentucky" if id == 21
replace state = "Louisiana" if id == 22
replace state = "Maine" if id == 23
replace state = "Maryland" if id == 24
replace state = "Massachusetts" if id == 25
replace state = "Michigan" if id == 26
replace state = "Minnesota" if id == 27
replace state = "Mississippi" if id == 28
replace state = "Missouri" if id == 29
replace state = "Montana" if id == 30
replace state = "Nebraska" if id == 31
replace state = "Nevada" if id == 32
replace state = "New Hampshire" if id == 33
replace state = "New Jersey" if id == 34
replace state = "New Mexico" if id == 35
replace state = "New York" if id == 36
replace state = "North Carolina" if id == 37
replace state = "North Dakota" if id == 38
replace state = "Ohio" if id == 39
replace state = "Oklahoma" if id == 40
replace state = "Oregon" if id == 41
replace state = "Pennsylvania" if id == 42
replace state = "Rhode Island" if id == 44
replace state = "South Carolina" if id == 45
replace state = "South Dakota" if id == 46
replace state = "Tennessee" if id == 47
replace state = "Texas" if id == 48
replace state = "Utah" if id == 49
replace state = "Vermont" if id == 50
replace state = "Virginia" if id == 51
replace state = "Washington" if id == 53
replace state = "West Virginia" if id == 54
replace state = "Wisconsin" if id == 55
replace state = "Wyoming" if id == 56

* Generating year variable
gen year = 2020

save restrictions_2020_90pct, replace


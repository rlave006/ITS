***KidsOR Interrupted Time Series 070121***

/* General settings */
version 17
capture log close
set more off
clear all
clear matrix

cd "/Users/pjypark/Desktop/sf475997_GRP"

********************************************************************************

*** SINGLE GROUP ITSA ***

/* ALL SITES */

* Total
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "national_hospital" | ///
redcap_data_access_group == "hospital_de_los_va" | ///
redcap_data_access_group == "university_teachin" | ///
redcap_data_access_group == "chu_pediatrique_ch"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend replace
graph save "ITSA_total_allsite", replace

// Autocorrelation
actest, lags(12) // lag 0

********************************************************************************

* Elective
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "national_hospital" | ///
redcap_data_access_group == "hospital_de_los_va" | ///
redcap_data_access_group == "university_teachin" | ///
redcap_data_access_group == "chu_pediatrique_ch"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==0

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend
graph save "ITSA_elective_allsite", replace

// Autocorrelation
actest, lags(12) // lag 0

********************************************************************************

* Emergency
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "national_hospital" | ///
redcap_data_access_group == "hospital_de_los_va" | ///
redcap_data_access_group == "university_teachin" | ///
redcap_data_access_group == "chu_pediatrique_ch"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==1

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(4) ///
figure ///
posttrend
graph save "ITSA_emergency_allsite", replace

// Autocorrelation
actest, lags(12) // lag 4


********************************************************************************

/* Burkina Faso */

* Total
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "chu_pediatrique_ch"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(4) ///
figure ///
posttrend replace
graph save "ITSA_total_burkina", replace

// Autocorrelation
actest, lags(12) // lag 4


* Elective
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "chu_pediatrique_ch"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==0

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(3) ///
figure ///
posttrend
graph save "ITSA_elective_burkina", replace

// Autocorrelation
actest, lags(12) // lag 3


* Emergency
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "chu_pediatrique_ch"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==1

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(4) ///
figure ///
posttrend
graph save "ITSA_emergency_burkina", replace

// Autocorrelation
actest, lags(12) // lag 4

********************************************************************************

/* Ecuador */

* Total
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "hospital_de_los_va"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend replace
graph save "ITSA_total_ecuador", replace

// Autocorrelation
actest, lags(12) // lag 0


* Elective
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "hospital_de_los_va"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==0

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(3) ///
figure ///
posttrend
graph save "ITSA_elective_ecuador", replace

// Autocorrelation
actest, lags(12) // lag 3


* Emergency
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "hospital_de_los_va"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==1

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly
tsfill, full
replace countrecord_id=0 if countrecord_id == .

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend
graph save "ITSA_emergency_ecuador", replace

// Autocorrelation
actest, lags(12) // lag 0


********************************************************************************

/* Nigeria */

* Total
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "national_hospital"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend replace
graph save "ITSA_total_nigeria", replace

// Autocorrelation
actest, lags(12) // lag 0


* Elective
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "national_hospital"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==0

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend
graph save "ITSA_elective_nigeria", replace

// Autocorrelation
actest, lags(12) // lag 0


* Emergency
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "national_hospital"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==1

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend
graph save "ITSA_emergency_nigeria", replace

// Autocorrelation
actest, lags(12) // lag 0


********************************************************************************

/* Zambia */

* Total
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "university_teachin"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend replace
graph save "ITSA_total_zambia", replace

// Autocorrelation
actest, lags(12) // lag 0


* Elective
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "university_teachin"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==0

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend
graph save "ITSA_elective_zambia", replace

// Autocorrelation
actest, lags(12) // lag 0


* Emergency
use "KidsORCombinedV2_DATA_cleaned_070121.dta", clear

keep if redcap_data_access_group == "university_teachin"

drop if surgdate_mdy <= date("20190101","YMD")
drop if surgdate_mdy > date("20210430","YMD")
drop if elective==1

// Set up the data by month
gen surgery_date_month = mofd(surgdate_mdy)
format surgery_date_month %tm

// Collapse data by month
foreach var of varlist record_id{
bysort surgery_date_month: egen count`var'=count(`var')
}

keep surgery_date_month count* 
duplicates drop surgery_date_month, force

tsset surgery_date_month, monthly
tsfill, full
replace countrecord_id=0 if countrecord_id == .

// ITSA
itsa countrecord_id, trperiod(2020m3) ///
single lag(0) ///
figure ///
posttrend
graph save "ITSA_emergency_zambia", replace

// Autocorrelation
actest, lags(12) // lag 0


********************************************************************************
********************************************************************************

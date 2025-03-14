//1.
import excel "/Users/mq/Desktop/delivery_data.xlsx", sheet("Sheet1") firstrow
//data structure
tabstat Rating Price DeliveryTime Competition Rain, stats(mean min max) col(stat)
//fe
xtset RestaurantID Month  
xtreg Rating Price DeliveryTime Competition, fe
//2sls
ivreg2 Rating Price Competition i.RestaurantID (DeliveryTime = Rain)
//visualization
twoway (scatter Rating DeliveryTime) (lfit Rating DeliveryTime), ///
title(" DeliveryTime and Rating")

//2.

//Table 3
use composer_data
xtset composer_name
global city vie lon mil flo rom ber ven bol col pra bud wei bon man sal str 

xtreg negemo age age_2 age_3 age_4 output tenure touring  marriage_cohabitation death_of_relative illness letters_annual  relationship?  , fe
xtreg negemo posemo age age_2 age_3 age_4 output tenure touring  marriage_cohabitation death_of_relative illness letters_annual  relationship*  , fe
xtreg negemo age age_2 age_3 age_4 output tenure touring  marriage_cohabitation death_of_relative illness letters_annual  relationship* decade* $city, fe
xtreg posemo age age_2 age_3 age_4 output tenure touring  marriage_cohabitation death_of_relative illness letters_annual  relationship*  ,fe
xtreg posemo age age_2 age_3 age_4 output tenure touring  marriage_cohabitation death_of_relative illness letters_annual  relationship* decade* $city, fe
//Table 4
xtset composer_name
xtreg output negemo age age_2 age_3 age_4  
xtreg output negemo age age_2 age_3 age_4 tenure touring  marriage_cohabitation illness letters_annual  relationship*   , fe 
xtreg negemo death_of_relative age age_2 age_3 age_4 
xtreg negemo death_of_relative age age_2 age_3 age_4 tenure touring  marriage_cohabitation illness letters_annual  relationship*    , fe 
xtivreg output age age_2 age_3 age_4    (negemo = death_of_relative ),fe
xtivreg output age age_2 age_3 age_4 tenure touring  marriage_cohabitation illness letters_annual   relationship*   (negemo = death_of_relative )  , fe 

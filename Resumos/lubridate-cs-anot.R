library(lubridate)
# LUBRIDATE-SECTION -------------------------------------------------------

#PARSE DATE-TIMES
date_1<- ymd_hms("2017-11-28T14:02:00")
class(date_1)

date_2 <- ("11/28/2017 1:02:03") 
mdy_hms(date_2)

date_3<-("4th of July '99")
TEST<- dmy(date_3)
yq('2001:Q1')


date_decimal(2020.01)
date_decimal(2020.5)
date_decimal(2020)
now()
today()
class(fast_strptime('9/1/01', '%y/%m/%d'))




#GET AND SET COMPONENTS
date_1<- ymd_hms("2017-11-28T14:02:00")
date(date_1)
year(date_1)
month(date_1)
day(date_1)
wday(date_1)
qday(date_1)
hour(date_1)
week(date_1)
isoweek(date_1)
epiweek(date_1)
am(date_1) #bool
pm(date_1) #bool
dst(date_1) # daylight savings
leap_year(date_1)
date_1<- update(date_1,second=37)


#ROUND DATE-TIMES

##nearest unit
round_date(date_1,'minute')

##down to nearest unit
floor_date(date_1,'hour')

##up
ceiling_date(date_1,'minute')



#STAMP DATE-TIMES

#1. Derive a template, create a function
sf <- stamp("Created Sunday, Jan 17, 1999 3:34")
#2. Apply the template to dates
sf(ymd("2010-04-05"))
## [1] "Created Monday, Apr 05, 2010 00:00"



#TIME ZONES
OlsonNames() 
"Brazil/West" 
with_tz(date_1,"Brazil/West")
force_tz(date_1,"Poland")


#PERIODS
p<-months(2)+days(10)
p
years(2)
hours(4)
period(4,unit='years')
as.period()

period_to_seconds(p)
seconds_to_period(60)




#DURATIONS/DIFF
dd<-ddays(14)
dd
dweeks(10)
dyears(3)
duration(3,'year')


make_difftime(60)


#INTERVALS

date_2<-ymd("2017-01-01")
date_3<-ymd("2020-06-01")

interval<- date_2 %--% date_3
interval_2<- date_1 %--% date_3

interval

date_2 %within% date_3
now() %within% interval









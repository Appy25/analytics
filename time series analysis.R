#Handling and creating Dates in R

#date in yyyy-mm-dd
dates1a = c('2018-21-4', '2018-29-4')
class(dates1a)
?as.Date
as.Date(dates1a)  # error
dates1a
dates1b = as.Date(dates1a, format='%Y-%d-%m')
class(dates1b)
dates1b
dates1b + 1
as.Date('2018-04-29') + 1

#default format %Y-%m-%d
dates2a = c('2018-4-21')
class(dates2a)  # character so far
(dates2b = as.Date(dates2a))  # convert to date
class(dates2b)  # date now
format(dates2b, format=('%d-%m-%Y')) # print in different format
format(dates2b, format=('%d / %B - %Y')) # print in different format
dates2b


#Format Types ----
#%Y: 4-digit year (1982),%y: 2-digit year (82)
#%m: 2-digit month (01)
#%B: month (January), %b: abbreviated month (Jan)
#, %d: 2-digit day of the month (13)
#%A: weekday (Wednesday), %a: abbreviated weekday (Wed)

format(dates2b, format="%A  %d  %m  %y") # another format

seminardates = c('09-07-1993', '08-08-1994', '04-11-1994')
class(seminardates)
seminardates1 = as.Date(seminardates, '%d-%m-%Y')
format(seminardates1, '%A')

format(as.Date('14-05-1998', '%d-%m-%Y'), '%A') #to calculate the day for any particular date

#System Date
Sys.Date()
format(Sys.Date(), format="%A: %d %B")

#increment/ decrement dates 
dates2b
(course = dates2b + 0:11) # start : 11 days course

cat(format(course, format="%B-%d"))
months(course)
weekdays(course)
quarters(course)
paste(quarters(course),'2018',sep='-')




#Date to character
dates2b; class(dates2b)
(dtoc = as.character(dates2b))
class(dtoc)

#one more practise on date format
dates3a =as.Date('30Apr18',format("%d%b%y"))
class(dates3a)

#Difference in dates
course
min(course)  # first date
max(course)  # last date
range(course) # start to end
mean(course)  # avg date ?
median(course) # middle date
course
course[c(1,5)] # 1st & 5th date 
course[1] ; course[9]
(duration = course[8] - course[1])

#Date of Birth
dob = as.Date('14-08-1994', '%d-%m-%Y')
dob
dob1= dob + seq(1,1000,30)  # create 1000 dates
length(dob1)
Sys.Date()
as.numeric((Sys.Date() - dob)/365)  #: Years
#par(mfrow=c(1,1))
boxplot(as.numeric((Sys.Date() - dob1)/365))# : Years
as.numeric((Sys.Date() - dob1)/365)# : Years
mean(as.numeric((Sys.Date() - dob1)/365))# : Years
(duration2 = max(course) - min(course))

#Sequence of Dates----
seq(1,10,2)
#seq(from, to, by, length.out = NULL, along.with = NULL, ...)
?seq
#by years : from start date to end date
seq(as.Date("2016/1/1"), as.Date("2018/5/1"), "years")
seq(as.Date("2016/1/1"), as.Date("2018/5/1"), "months")
seq(as.Date("2017/1/1"), by = "days", length.out = 6)
(students = c('ashish','chirag'))

## by month : 6 months
seq(as.Date("2017/1/1"), by = "month", length.out = 6)
seq(as.Date("2017/1/1"), by = "month", along.with = c(3,2,43,5,6,7))  # 
seq(as.Date("2017/1/1"), by = "month", along.with = students)  # 
seq(as.Date("2017/1/1"), by = "quarter", along.with = students)  # 

seq(as.Date("2017/1/1"), by = "month", length.out = length(c(3,2,43))) 


## quarters
seq(as.Date("2017/1/1"), as.Date("2018/1/1"), by = "quarter")

#Find 7th of all months between two dates
(dateseqF = seq(as.Date("2017/1/7"), as.Date("2018/1/7"), by = "1 month"))  # order
# dates in opposite order
(dateseq = seq(as.Date("2018/1/7"), as.Date("2017/1/7"), by = "-2 month"))  # reverse order
# then reverse them
rev(dateseq)# correct the order
format(rev(dateseq), "%A : %d-%b")

#another Sequence : using another package
library(chron)
chron::seq.dates("01/01/2017", "12/31/2017", by = "months")
chron::seq.dates("01/01/2017", "12/31/2017", by = "weeks")


# Time Series

# Create Time Series data of Finance Sales
sales = c(18, 33, 41, 7, 34, 35, 24, 25, 24, 21, 25, 20,
          22, 31, 40, 29, 25, 21, 22, 54, 31, 25, 26, 35)
length(sales)
sales ; class(sales)  # vector of sales values

#put in TS without any dates : format of TS
?ts  # help
#ts(data = NA, start = 1, end = numeric(), frequency = 1)
#start - time of 1st obsv - single no / vector of 2 integers
#frequency - no of obvsv per unit of time
#No of obsv per unit time
(tsales2a = ts(sales, start=1, end=12)) #only first 12 considered
(ts(sales, start=1, end=12, freq=1)) #only first 12 considered
(ts(sales, start=1, end=12, freq=2)) #
(ts(sales, start=1, end=12, freq=3)) #
(ts(sales, start=1, end=12, freq=4)) # Qtrly series
(ts(sales, start=1, end=12, freq=5)) #
(ts(sales, start=1, end=12, freq=6)) #
(ts(sales, start=1, end=12, freq=12)) #  12 months * 12 years


(tsales2b = ts(sales, start=1, end=6)) #only first 6
(tsales2c = ts(sales, start=1, end=24)) #all 24 freq=1
(tsales2d = ts(sales, start=1, end=12, frequency = 1))
(tsales2e = ts(sales, start=1, end=12, frequency = 2)) # 1 to 12 : 1 unit divided into 2 : so 24 observations

#Specify data periods in start and end
#specify only start dates & freq
(tsales3a = ts(sales, start=c(2017, 1), frequency=12)) # years 2017 to 2018, 24 values, monthwise 24 observations spread to 2 years
ts(sales, start=c(2017, 4), end=c(2018,3), frequency=12)
ts(sales, start=c(2017, 2), frequency=12)  # different start month
ts(sales, start=c(2017, 2), frequency=4)  # different start month
plot(ts(sales, start=c(2017,1), frequency=1))  # different start month



?ts
#Specify start and end date periods
(tsales3b = ts(sales, start=c(2016,4), end=12) ) #error start and end to be of same format
(tsales3b = ts(sales, start=c(2016), end=c(2018))) # default freq=1 once a year 1st 3 values becomes year sales value
# R understands that 2016 is year

(tsales3c = ts(sales, start=c(2016,4), end=c(2018,4), frequency=12)) # period diveded into 24 equal intervals
tsales3c
plot(tsales3c)

# Daily Sales Data
sales2 = ceiling(runif(365, 50,100))
sales2
(dailyTSdata = ts(sales2, start=c(2017,1), frequency=365))
plot(dailyTSdata)
start(dailyTSdata)
end(dailyTSdata)

#Weekly Sales Data  52 weeks in a year
sales3 = ceiling(runif(52, 50,100))
(weeklyTSdata = ts(sales3, start=c(2017,3), frequency=52))
weeklyTSdata
plot(weeklyTSdata)
start(weeklyTSdata); end(weeklyTSdata) ;frequency(weeklyTSdata)

?ts
#Yearly Sales Data : 2000 to 2017 
seq(1,10,2)
?seq
seq(1,20, along.with = c(1:5))
seq(1,20, along.with = sales)  # 24 values

(values= trunc(seq(1,20, along.with = c(2000:2017))))  # take length from 2000 to 2017

(sales4 = floor(rnorm(values, mean=50, sd=10)) ) #pick up length from values

(yearlyTSdata = ts(sales4, start=c(2000), end=c(2017)))
plot(yearlyTSdata)

start(yearlyTSdata); end(yearlyTSdata) ;frequency(yearlyTSdata)

#diff and lag & window in ts
tsales3c
tsales = tsales3c
tsales
range(tsales)
diff(tsales)
diff(tsales,lag=1)
diff(tsales,lag=2)
diff(tsales,lag=6)

cycle(tsales)

tsales
tsales
#subset Time Series with range of dates
(tsales.subset = window(tsales, start=c(2003, 5), end=c(2004, 6))) #error due to range period incorrect

tsales
(tsales.subset = window(tsales, start=c(2016, 5), end=c(2017, 8))) 
#5th month of 2016 to 8th month of 2016

#Another TS with different freq


#dataset---- 
#available for TS Analysis - understand them, they are used for TS analysis
AirPassengers  #passengers travel data - seasonal data
?AirPassengers
plot(AirPassengers)
class(AirPassengers)
JohnsonJohnson  #stock price prediction
nhtemp  # temp variations
Nile  # river level variations
sunspots  #Temp of sun spots variations
ds = list(AirPassengers,JohnsonJohnson,nhtemp,Nile,sunspots)
sapply(ds, class)  # check type of class of each dataset


#end here - do time series analysis - SMA / EXP/ ARIMA

# Move to doing TS analysis - 
# other packages zoo, xts






# Time Series ts1
#https://www.analyticsvidhya.com/blog/2015/12/complete-tutorial-time-series-modeling/

data(AirPassengers)
class(AirPassengers)
#This tells you that the data series is in a time series format
str(AirPassengers)
head(AirPassengers); tail(AirPassengers)
start(AirPassengers)
#This is the start of the time series
end(AirPassengers)
#[1] 1960 12
#This is the end of the time series
frequency(AirPassengers)  # $[1] 12
#The cycle of this time series is 12months in a year
summary(AirPassengers)


# Sec 2 -------------------------------------------------------------------

#The number of passengers are distributed across the spectrum
plot(AirPassengers)
#This will plot the time series
abline(reg=lm(AirPassengers~time(AirPassengers)))
# This will fit in a line


# Sec3 --------------------------------------------------------------------

cycle(AirPassengers)
#This will print the cycle across years.
plot(aggregate(AirPassengers,FUN=mean))
#This will aggregate the cycles and display a year on year trend
boxplot(AirPassengers~cycle(AirPassengers))
#Box plot across months will give us a sense on seasonal effect


plot(aggregate(AirPassengers,FUN=mean))
plot(log(AirPassengers))
abline(reg=lm(log(AirPassengers) ~ time(AirPassengers)))

plot(diff (log(AirPassengers)))
abline(h=0, col='red')
abline(reg=lm(diff(log(AirPassengers)) ~ time(AirPassengers)))


#Model
acf(AirPassengers)
acf(diff (log(AirPassengers)))
pacf(diff (log(AirPassengers)))

fit = arima(log(AirPassengers), c(0,1,1), seasonal = list(order = c(0,1,1), period = 12) )
pred = predict(fit, n.ahead = 10 * 12)
pred1 = 2.718 * pred$pred
ts.plot(AirPassengers, pred1, log='y', lty=c(1,3))
monthplot(AirPassengers)













# Time Series Case Study - Decomposition

#https://rpubs.com/emb90/137525
# Data Set - AirPassengers
x=c(9.23221232,5.3430000)
x
options(digits=2)
x

?AirPassengers
head(AirPassengers)
AirPassengers
str(AirPassengers)
class(AirPassengers)

#The decomposition of time series is a statistical task that deconstructs a time series into several components, each representing one of the underlying categories of patterns
# TS data components : Level + Irregular + Seasonal

#stl(x, s.window, t.window = ) # command to do decomp
stl(AirPassengers, s.window = 'periodic') # seasons to be considered periodic ie not changing over time
# save it in an object

plot(AirPassengers) # Pattern of data : see increasing seasonal values suggesting multiplicative Model
#no cyclic here - only seasonal, trend, irregual
#s.window - specifies seasonal effects to be identical across years
#can handle on additive models

stl1 = stl(AirPassengers, s.window = 'periodic')
plot(stl1) # actual data, seasonal, long term trends, remainder/ irregular

class(stl1)

stl1$time.series
#(df = stl1$time.series)
#df = as.data.frame(df)
#write.csv(df, './data/airpsng.csv')


#Additive Model Y = Trend + Seasonal + Irregular
#sales increase by 300 qty in month of Nov
#Multiplicative Model Y = Trend * Seasonal * Irregular
#sales increase by 10% in month of Nov


#dataset
AirPassengers
class(AirPassengers)

# Plot
plot(AirPassengers)
#variability increases with level. at low values of passengers variations are less, at later years seasonal variations seem to be more -> Multiplicative model suggested

#stabilise the plot
LogAirPassengers = log(AirPassengers)  # make it additive because stl handles only additive models

# YA = T + S + I  : 
#YM= T * S * I  : take log of this
# log(YM) = log(T) + log(S) +log(I)

plot(LogAirPassengers)  #stabilises variation due to multiplication
#looks like additive : no increase of seasonsal component now over years

(m1 = matrix(1:2, nrow=1, byrow = F))
layout(m1)
plot(AirPassengers); plot(LogAirPassengers)  # see again the change


#STL
fit = stl(LogAirPassengers, s.window = 'periodic' )
#Seasonal components constrainted to be same across years : periodic

plot(fit)
fit$time.series  #decompose the data into S, T, R/I 

#december of all months same value for seasonal
#this was after taking log : so take antilog
#toprow = actual data with all series
exp(fit$time.series)

head(exp(fit$time.series),n=20)  # first 20 values see them

# df= exp(fit$time.series)
# names(df) = c('S','T','I')
# head(AirPassengers)
# head(cbind(AirPassengers, df))

#Various Plots - Monthwise, quarter, 
layout(matrix(1,nrow=1))
#Avg of each month
monthplot(AirPassengers) #max traffic in Jun/ Jul across years
monthplot(fit, choice='seasonal') # less in winters, more in summers
monthplot(fit, choice='trend')  #slight increase from Jan to Dec
#trend increasing for each month, highest passengers in Jul
monthplot(fit, choice='remainder') # irregular components

# see combined plots
(m2 = matrix(1:3, nrow=3, byrow = T))
layout(m2)  # change layout of plots
monthplot(fit, choice='seasonal')
monthplot(fit, choice='trend')
monthplot(fit, choice='remainder')


# Practise with different methods - Self Practise

#Decompose another way
AP.decompM = decompose(AirPassengers, type = "multiplicative")
plot(AP.decompM)

library(forecast)
# Forecast # adjust for multiplicative model
fit2b = ets(AirPassengers, model='MAM')
fit2b
(f2b=forecast(fit2b, 12))
head(f2b)$mean

library(data.table)

library(zoo)

x <- c(3, 4, 1, 4, 8)
dt <- seq(as.Date("2018-01-01"), as.Date("2018-01-05"), by = "days")

ts <- zoo(x, dt)
print(ts)

library(xts)

ts <- xts(x, dt)
print(ts)

prices <- c(132.45, 130.85, 130.00, 129.55, 130.85)
dates <- as.Date(c(
  "2010-01-04", "2010-01-05", "2010-01-06",
  "2010-01-07", "2010-01-08"
))
ibm.daily <- zoo(prices, dates)
print(ibm.daily)

prices <- c(131.18, 131.20, 131.17, 131.15, 131.17)
seconds <- c(9.5, 9.500278, 9.500556, 9.500833, 9.501111)
ibm.sec <- zoo(prices, seconds)
print(ibm.sec)

ts <- zoo(x, dt)

coredata(ts)

coredata(ibm.daily)

index(ibm.daily)

# load data
IBM = data.table::fread("C:/Users/syedi/time-series-analysis/data/sp500data.csv")


# create new variables
price = IBM$Close
price_AdjC = IBM$`Adj Close`
dt = as.Date(IBM$Date)
dt = na.omit(dt)
dt = append(dt,as.Date('2000-01-02'))
price = append(price, 1,399.42)
# let's create a TS object as in the lecture notes:
library(xts)
# xts ()
ts = xts(price,dt)

# Plot the xts object
#main_title = "IBM: Historical Data"
#plot(ts, main = main_title, lty = "solid")

first(ts,"2 week") # first two weeks
last(ts,"month")


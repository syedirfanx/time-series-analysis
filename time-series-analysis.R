library(quantmod)
library(ggplot2)
library(forecast)
library(tseries)


getSymbols('^GSPC', src="yahoo", from = '2009-01-01', to = '2020-12-31')
head(GSPC$GSPC.Close)
class(GSPC$GSPC.Close)

plot(GSPC$GSPC.Close)
acf(GSPC$GSPC.Close)
pacf(GSPC$GSPC.Close)
adf.test(GSPC$GSPC.Close)
model = auto.arima(GSPC$GSPC.Close, ic = 'aic', trace = TRUE)
model
acf(ts(model$residuals))
pacf(ts(model$residuals))
myforecast = forecast(model, level = c(95), h=5*4)
plot(myforecast)

GSPC.returns <- diff(log(GSPC$GSPC.Close), na.rm=TRUE)
plot(GSPC.returns, main="Daily S&P500", xlab="Time")
head(GSPC.returns, na.rm=TRUE)

head(GSPC.returns)
#head(GSPC.whiteN)
Box.test(GSPC$GSPC.Close,lag=10,type="Ljung-Box")
Box.test(GSPC.returns,lag=10,type="Ljung-Box")

library(fBasics)
options(scipen = 999)
library(tseries)
basicStats(GSPC)
adf.test(GSPC$GSPC.Close)
lnclose = log(GSPC$GSPC.Close)
View(lnclose)
adf.test(lnclose)

install.packages('dplyr')
install.packages('ggpubr')

library(dplyr)
library(ggpubr)
ggdensity(as.vector(GSPC$GSPC.Close))
ggqqplot(as.vector(GSPC$GSPC.Close))
shapiro.test(as.vector(GSPC$GSPC.Close))


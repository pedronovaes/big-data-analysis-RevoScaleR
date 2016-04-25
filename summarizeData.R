# applying some standard R fuctions to get basic information about the xdf object
nrow(fileXdf)
ncol(fileXdf)
head(fileXdf)

# disabling scientific notation
option(scipen=999)

# rxGetVarInfo provides addition variable information, like:
# 1) variable type
# 2) factor levels
# 3) low and high incidence
rxGetVarInfo(fileXdf)

# rxSummary function is used to obtain descriptive statistics, like:
# 1) mean
# 2) standard deviation
# 3) min and max value
# 4) number of valid observations
# 5) number of missing observations

# getting descriptive statistics for all variables of the ADS.xdf
adsSummary <- rxSummary(~ArrDelay+CRSDepTime+DayOfWeek,
                        data = fileXdf)

# computing summary statistics on Arrival Delay by Day of Week
ArrDelayByDayWk <- rxSummary(~ArrDelay:DayOfWeek,
                             data = fileXdf)

# drawing histograms for each variable
options("device.ask.default" = T)
rxHistogram(~ArrDelay, data = fileXdf)
rxHistogram(~CRSDepTime, data = fileXdf)
rxHistogram(~DayOfWeek, data = fileXdf)

# using rxDataStep to extract a subsample of the data into a data frame in memory
subSample <- rxDataStep(inData = fileXdf,
                        rowSelection = ArrDelay > 240 & ArrDelay <= 300,
                        varsToKeep = c("ArrDelay", "DayOfWeek"))
rxHistogram(~ArrDelay, data = subSample)

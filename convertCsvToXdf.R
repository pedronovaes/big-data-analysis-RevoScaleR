# xdf (eXtensible Data Formats) is a file format designed for large files
# this code convert csv file to xdf file

# rxGetOption is used to retrieve the data directory
# "sampleDataDir" is the directory that stores the csv file
dataDir <- rxGetOption("sampleDataDir")
getwd()
inputFile <- file.path(dataDir, "AirlineDemoSmall.csv")

# rxImport is used to convert a text file into the .xdf data format
# fileXdf is an object that represents the file.xdf
fileXdf <- rxImport(inData = inputFile,
                    outFile = "ADS.xdf",
                    missingValueString = "NA",
                    stringAsFactors = TRUE,
                    overwrite = TRUE)

# if it's necessary to convert the variable type to categorical or factor variable, the code below do this
# setting levels specification for DayOfWeek variable
colInfo <- list(DayOfWeek = list(type = "factor",
                                 levels = c("Monday",
                                            "Tuesday",
                                            "Wednesday",
                                            "Thursday",
                                            "Friday",
                                            "Saturday",
                                            "Sunday")))

fileXdf <- rxImport(inData = inputFile,
                    outFile = "ADS.xdf",
                    missingValueString = "NA",
                    colInfo = colInfo,
                    overwrite = TRUE)

# applying some standard R fuctions to get basic information about the xdf object
nrow(fileXdf)
ncol(fileXdf)
head(fileXdf)

# rxGetVarInfo provides addition variable information
rxGetVarInfo(fileXdf)

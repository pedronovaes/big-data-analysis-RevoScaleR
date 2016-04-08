# xdf (eXtensible Data Formats) is a file format designed for large files
# this code convert csv file to xdf file
# its the first step in the workflow

# rxGetOption is used to retrieve the data directory
# "data_directory" is the directory that stores the csv file
dataDir <- rxGetOption("data_directory")
getwd()
inputFile <- file.path(dataDir, "file.csv")

# rxImport is used to convert a text file into the .xdf data format
# fileXdf is an object that represents the file.xdf
fileXdf <- rxImport(inData = inputFile,
                    outFile = "file.xdf",
                    missingValueString = "NA",
                    stringAsFactors = TRUE,
                    overwrite = TRUE)

# we can apply some standard R fuctions to get basic information about the xdf object
nrow(fileXdf)
ncol(fileXdf)
head(fileXdf)

# rxGetVarInfo provides addition variable information
rxGetVarInfo(fileXdf)

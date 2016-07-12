Some codes to analyse a data set (600,000 rows) containing information on flight arrival and departure details for all commercial flights within the USA, from October 1987 to April 2008.

For this big data analysis, I used RevoScale R, an R package that provides functions for performing scalable and extremely high performance data managemente, analysis and visualization.

RevoScale R are particularly useful in three common situations:

a) to analyze data sets that are too big to fit in memory and,
b) to perform computation distributed over several cores, processors, or nodes in a cluster, or
c) to create scalable data analysis routines that can be developed locally with smaller data sets, then deployed to large data and/or a cluster of computers.

The following tasks are performed at this work:

1) Convert text data to the .xdf data file format																		
2) Summarize the .xdf data

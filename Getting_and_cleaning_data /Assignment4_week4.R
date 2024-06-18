FileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(FileUrl,destfile = "Survey.csv",method="curl")
SurveyData=read.csv("Survey.csv")
names(SurveyData)
Splitnames=strsplit(names(SurveyData),"\\wgtp")
Splitnames[123]

FileUrl2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(FileUrl2,destfile = "GDP.csv",method="curl")
GDPData=read.csv("GDP.csv")
GDPData <- GDPData[,c(1, 2, 4, 5)]
colnames(GDPData) <- c("CountryCode", "Rank", "Country", "Total")
GDPData$Total=as.integer(gsub(",","",GDPData$Total))
GDPData$otal
mean(GDPData$Total,na.rm=TRUE)

FileUrl3<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(FileUrl3,destfile = "Education.csv",method="curl")
EducationData=read.csv("Education.csv")
names(EducationData)
library(data.table)
Total=merge(GDPData,EducationData,by= "CountryCode")
Count=grep("Fiscal year end: June",Total$Special.Notes)
NROW(Count)

library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN", auto.assign=FALSE)
sampleTimes = index(amzn)
amzn2012 <- sampleTimes[grep("^2012", sampleTimes)]
NROW(amzn2012)
NROW(amzn2012[weekdays(amzn2012) == "Monday"])

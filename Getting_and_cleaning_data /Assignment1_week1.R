fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL,destfile="./Data.csv",method="curl") #to download a file from a website, method curl when https mac
namedata<-read.table("./Data.csv",sep=",",quote="",header=TRUE)
sum(namedata$VAL==24,na.rm=TRUE)


fileURL2<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx" 
download.file(fileURL2,destfile="./Data.xlsx",method="curl") #to download a file from a website, method curl when https mac
colIndex<-7:15
rowIndex<-18:23
dat<-read.xlsx("./Data.xlsx",sheetIndex=1,colIndex=colIndex,rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xData<-getURL(fileURL)
doc<-xmlParse(xData)
zip<-xpathSApply(doc,"//zipcode",xmlValue)
sum(zip==21231)

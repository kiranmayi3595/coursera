#Setting working directory
getwd()
setwd()
setwd("../") #back folder
setwd("./Users") #takes you forward to Users
setwd("/Users/kiranmayivedantham") #absolute path
file.exists("name") #checks if the dir name exists in current dir
dir.create("")
setwd("~/Documents/DataCleaning ") #will take you forward to your dir

#to download a file from a website, method curl when https mac
download.file(fileURL,destfile="./Data/foldername",method="curl") 

#Read csv into R
read.table() #not for large datasets
namedata<-read.table("./sampledatainsurance.csv",sep=",",quote="",header=TRUE,skip=2,nrows=10)
head(namedata)
print(namedata)


colIndex<-2:3
rowIndex<-3:4
xldata<-read.xlsx("./sampledatainsurance.xlsx",sheetIndex=2,colIndex=colIndex,rowIndex = rowIndex)
print(xldata)
read.csv()

#Scraping data
library(XML)
url="http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
con=htmlTreeParse(url,useInternalNodes = T)
xpathSApply(con,"//title",xmlValue)
#Accessing data from website with username and password
pg=get("https://httpbin.org/basic-auth/user/passwd")#,authenticate("user","passwd"))
pg

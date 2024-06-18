#Creating sequences
a=seq(1,10,by=3)
restData$nearMe=restData$neighborhood %in% c("Boulevard","Ranchlane") #Helps identify particular elements of a var and assign in a new var
restData$zipGroups=cut(restData$neighborhood,breaks=quantile(restData$neighborhood)) #creates a new var that contains the quantile distribution of one var
table(restData$zipGroups,restData$neighborhood)
#or
library(Hmisc)
restData$zipGroup=cut2(restData$neighborhood,g=4)
#Creating factor variables
restData$zpf=factor(restData$zipcode)

#Week3_Reshaping data
library(reshape2)
head(mtcars)
mtcars$carnames=rownames(mtcars)
carMelt=melt(mtcars,id="carnames",measure.vars = c("mpg","hp"))
head(carMelt,n=3)
carCast=dcast(carMelt,carnames~variable)
head(carCast,n=4)
#arranging data according to multiple variables
tapply()
lapply()
sapply()
#split, apply , sum everything done by ddply()

split()

#Subsetting and sorting
X=data.frame("var1"=1:5,"var2"=6:10,"var3"=11:15)
X$var2[c(1,2)]=NA #To put NA in 1st and 2nd elements of var2 field
X[,1] #Next three commands give var1 field
X$var1
X[,"var1"]
X[1:2,1]
X[(X$var1<=3&X$var3>11),]
#sorting fields
sort(X$var1,decreasing=TRUE)
sort(X$var2,na.last=TRUE)
X[order(X$var1),] #To order a dataframe by a particular variable
install.packages(plyr)
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))
X$var4=rnorm(5)
Y=cbind(X,rnorm(5))

#Summarise
fileURL="https://data.baltimorecity.gov/datasets/restaurants/explore?location=39.286100%2C-76.620500%2C11.98&showTable=true"

download.file(fileURL,destfile="./sampledatainsurance.csv",method="curl") #to download a file from a website, method curl when https mac

data=read.csv("./sampledatainsurance.csv")
summary(data)
str(data)
quantile(data$Policy)
sum(is.na(data$Policy))
#Crosstabs
data(UCSAdmissions)
df=as.data.frame(UCBAdmissions)
summary(df)
str(df)
xt=xtabs(Freq~Gender+Dept,data=df) #Helps identify relationships among variables 
xt=xtabs(Freq~.,data=df) #Relationship of freq to all other variables in data frame
xt
ftable(xt) #Helps summarize in table in compact form


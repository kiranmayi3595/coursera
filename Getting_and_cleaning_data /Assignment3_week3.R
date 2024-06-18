
SurveyData=read.csv("Survey.csv")
agricultureLogical=SurveyData$ACR==3&SurveyData$AGS==6
which(agricultureLogical)

library(jpeg)
FileUrl<-" https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg "
download.file(FileUrl,destfile = "Image.jpg",mode='wb')
ImageData=readJPEG ("Image.jpg",native=TRUE)
quantile(ImageData,probs=c(0.3,0.8))

Total=merge(GDPData,EducationData,by= "CountryCode")
Total_new=arrange(Total,desc(Rank))
Total_new$Country[13]
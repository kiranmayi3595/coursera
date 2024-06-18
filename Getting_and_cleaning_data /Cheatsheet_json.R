library(XML)
library(RCurl)
fileURL<- "https://www.w3schools.com/xml/simple.xml"
xData<-getURL(fileURL)
doc<-xmlParse(xData) #reads xml file  into R
#rootNode<-xmlRoot(doc) #xmlRoot gives wrapper element (rootnode) of entire document
#xmlName(rootNode) #prints the name of that wrapper root
#names(rootNode) #tells you what the nested elements within those rootnode are
#rootNode[1] #prints first element of the rootnode, all info of that element
#rootNode[[1]][[1]]
xpathSApply(doc,"//name",xmlValue) #prints the names of the elements in the rootnode. name is the label


library(jsonlite)
library(tidyverse)
library(httr)
library(stringr)
doc<-fromJSON("https://api.github.com/users/kiranmayi3595/repos")
names(doc)
names(ddoc$owner)
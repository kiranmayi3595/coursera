cameradata<-read.csv("Cameras.csv")
names(cameradata)
tolower(names(cameradata))
sub("_","",names(cameradata))
grep("Alameda",cameradata$intersection_much)
table(grepl("Alameda",cameradata$intersection_much))
grep("Alameda",cameradata$intersection_much,value=TRUE)

test<-"This_is_a_test"
sub("_","",test)
gsub("_","",test)

mylist<-list(letters=c("a","b","c"),numbers=1:3,matrix=1:25)
mylist$letters
mylist[2]
mylist[[2]]

#Stringfunctions
name="KiranmayiVedantham"
nchar(name)
substr(name,1,5)
paste(name,"Singbal")
paste0(name,"Singbal")
str_trim("Kiranmayi    ")

#Dates
d1=date()
d2=Sys.Date()
format(d2,"%a %b %d")
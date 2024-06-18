install.packages("RMySQL")
library(RMySQL)
ucscDB=dbConnect(MySQL(),user="genome",host="genome-mysql.soe.ucsc.edu") #Connects to the mySQL server, user and host from website
result=dbGetQuery(ucscDB,"show databases;");dbDisconnect(ucscDB); #gets all databases from the given server into result, important to disconnect

hg19=dbConnect(MySQL(),db="hg19",user="genome",host="genome-mysql.soe.ucsc.edu") #Connects to hg19 database in this server
alltables=dbListTables(hg19) #Lists all the tables in that database
length(alltables)

dbListFields(hg19,"HInv") #lists all fields (column names) in the particular table in the database
dbGetQuery(hg19,"select count(*) from HInv") #Tells number of rows in the table
InvDATA=dbReadTable(hg19,"HInv") #Gets HInv table from hg19 database

query=dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3") #query to gets rows where the values of the column:misMatches are between 1 and 3
affymis=fetch(query) #fetches the query result to R
length(affymis) 
affymisSmall=fetch(query,n=10)
dbClearResult(query)

dbDisconnect(hg19)
dat_in=seq(10,100,10)
dat_in
library(dplyr)
seq(10,100,10) %>%
  mean()

#Assume there is a dataset with four columns- year, gender, age group, income#
data=data.frame("year"=c(2018,2018,2018,2018),"gender"=c("Male","Female","Male","Male"),
"age_group"=c("<18","18-31","31-50","18-31"),"income"=c(22000,22000,30000,40000))
data
data%>%
  filter(year==2018) %>%
  group_by(age_group) %>%
  summarize(mean=mean(income))






#Tidyverse core packages- readr, tidyr, dply,ggplot2#
library(tidyverse)
library(readxl)
untidy_df=read_excel("/Users/kiranmayivedantham/Documents/R_programming/untidy_df.xlsx", col_names = TRUE, col_types = NULL, na = "", skip = 0)
tidy_df=untidy_df %>%
  gather(gender_year,income,male_2016:male_2018) %>%  #Helps data formate change from wide to long. spread() does from long to wide
  separate(gender_year,into=c("gender","year"))
untidy_df

#dplyr package- filter, arrange, select, mutate, group_by, summarise
library(dplyr)
mtcars
mtcars=as_tibble(mtcars)
mtcars
head(mtcars,5)
tail(mtcars,5)
slice(mtcars,1:3)
slice(mtcars,1,3,5)
glimpse(mtcars)
filter(mtcars,cyl==8)
mtcars %>%
  filter(cyl %in% c(4,6))
mtcars %>%
  filter(cyl !=4)
mtcars %>%
  arrange(mpg)
mtcars %>%
  arrange(desc(mpg))
mtcars %>%
 arrange(desc(mpg),desc(hp))
mtcars %>%
  select(cyl,hp)%>%
  glimpse()
mtcars %>%
  select(cyl,hp,everything())%>%
  glimpse()
mtcars %>%
  select(starts_with("c"),starts_with("q"))%>%
  glimpse()
mtcars %>%
  mutate(cyl=factor(cyl,
                    levels=c(4,6,8),
                    labels=c("4 Cyl","6 Cyl","8 Cyl")))%>%
  select(cyl)%>%
  glimpse()
mtcars %>%
  group_by(cyl) %>%
  slice(1)
mtcars %>%
  group_by(cyl) %>%
  filter(hp==max(hp))
mtcars %>%
  group_by(cyl) %>%
  count()
mtcars %>%
  summarize(mean=mean(mpg))
mtcars %>%
  group_by(cyl) %>%
  summarize(mean_mpg=mean(mpg),sd_mpg=sd(mpg),n=n())

mtcars%>%
  mutate_at(.vars=vars(cyl,am),factor)%>%
  select(cyl,am)%>%
  glimpse()







#Tidyr= gather, spread, seperate, unite (combines multiple columns into one)#
library(tidyr)
untidy_df
tidy_df=untidy_df %>%
  gather(gender_year,income,male_2016:male_2018)%>%
  separate("gender_year",c("gender","year"))

tidy_df%>%
  unite("gender_year",c("gender","year"),sep="_")%>%
  spread(gender_year,income)





#ggplot2- plotting and graphing libs#
#ggplot(data= <DATA>, mapping=aes(<MAPPINGS>))+<GEOM_FUNCTION>#
ggplot(mtcars, aes(x=cyl,y=mpg)) + geom_point()

install.packages("gapminder")
library("gapminder")
data("gapminder")
glimpse(gapminder)
head(gapminder,5)

gapminder%>%
  filter(country=="Afghanistan")%>%
  ggplot(aes(x=year,y=lifeExp))+
  geom_line(colour="#1380A1",size=0.5)+
  geom_point(size=1)

gapminder%>%
  filter(country=="Afghanistan"|country=="Malawi"|country=="India")%>%
  ggplot(aes(x=year,y=lifeExp,colour=country))+
  geom_line(size=1)+geom_point(size=1)

gapminder%>%
  filter(country=="Afghanistan"|country=="Malawi"|country=="India")%>%
  ggplot(aes(x=year,y=lifeExp,colour=country,size=lifeExp))+
  geom_point()

bar_df=gapminder%>%
  filter(year==2007 & continent=="Asia")%>%
  arrange(desc(lifeExp))%>%
  head(5)

bar_df%>%
  ggplot(aes(x=country,y=lifeExp))+
  geom_bar(stat="identity")

hist_plot <- gapminder %>%
  filter(year == 2007) %>%
  ggplot(aes(x = lifeExp)) +
  geom_histogram(binwidth=5,color="blue")
  
hist_plot<-hist_plot+labs(x="Life Expectancy", 
               y="count",
               title="Life Expectancy",
               subtitle="Year=2007",
               caption="Source:Gapminder")
ggsave("Life-expectancy.png",)






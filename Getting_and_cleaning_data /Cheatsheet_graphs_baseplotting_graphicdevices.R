#ggplot2 basics
library(datasets)
data(cars)
with(cars, plot(speed, dist))

#BLatticePlotting
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1)) # instead of multiple lines of with() statement
#ggplot2
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)


#Exploratory graphs
pollution <- read.csv("ExploDataAnalysis/avgpm25.csv", colClasses = c("numeric", "character",
                                                         "factor", "numeric", "numeric"))
head(pollution)
summary(pollution$pm25)
boxplot(pollution$pm25,col="pink")
hist(pollution$pm25,col="blue")
hist(pollution$pm25,col="blue",breaks=100)
#abline(h=12,col="red")
abline(v=12,col="pink")
abline(v = median(pollution$pm25), col = "magenta", lwd = 2)
barplot(table(pollution$region), col="red", main = "Number of Counties in Each Region")

boxplot(pm25 ~ region,data=pollution,col="pink") #plot against specific region

hist(subset(pollution, region == "east")$pm25, col = "green") #subset on region
hist(subset(pollution, region == "west")$pm25, col = "green")

#scatterplot
with(pollution, plot(latitude, pm25,col=region))
abline(h = 12, lwd = 2, lty = 2)

#multiple scatterplots subset on region
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))

#Base plotting
par("lty")
par(mar=c(2,2,2,2)) #for adjusting size of margins on four sides
x=rnorm(100)
y=rnorm(100)
plot(x,y,pch=1) #pch is point type
#Base Plot with Annotation
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City",
                      type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

#Base Plot with Regression Line 
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City",
                      pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)
#Multiple Base Plots Multiple Base Plots
par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York City", outer = TRUE)
})

#Graphic devices
#Create a spcae to create a plot and then make the plot and close the file
pdf(file = "myplot.pdf") ## Open PDF device; create 'myplot.pdf' in my working directory
## Create plot and send to a file (no plot appears on screen)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data") ## Annotate plot; still nothing on screen
dev.off() ## Close the PDF file device
## Now you can view the file 'myplot.pdf' on your computer

#Copying plots
library(datasets)
with(faithful, plot(eruptions, waiting)) ## Create plot on screen device
title(main = "Old Faithful Geyser data") ## Add a main title
dev.copy(png, file = "geyserplot.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
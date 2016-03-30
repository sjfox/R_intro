###############################################
## Introduction to R
## These are the materials for the third coding session
## Making figures with ggplot2
## Spencer Fox
## March 31, 2016
###############################################

install.packages("ggplot2")
install.packages("cowplot")
library(ggplot2)
library(cowplot)

## First example
head(CO2)
ggplot(CO2, aes(x=Type, y=uptake))+geom_point()

ggplot(CO2, aes(x=Type, y=uptake))+geom_boxplot()

ggplot(CO2, aes(x=Type, y=uptake, color = Treatment))+ 
  geom_boxplot()

ggplot(CO2, aes(x=Type, y=uptake, color = Treatment))+ 
  geom_boxplot()

ggplot(CO2, aes(x=Type, y=uptake, color = Treatment))+ 
  geom_boxplot() + scale_color_brewer(type = "qual")

ggplot(CO2, aes(x=Type, y=uptake, fill = Treatment))+ 
  geom_boxplot() + scale_fill_brewer(type = "qual")


head(txhousing)
ggplot(txhousing, aes(date, median)) + geom_line()
ggplot(txhousing, aes(date, median)) + geom_point(size=.2)

ggplot(txhousing, aes(date, median, color = city)) + geom_line()

ggplot(txhousing, aes(date, median)) + 
  geom_point(size=.2,color="grey") + stat_smooth()

housing = txhousing[which(txhousing$city=="Austin"), ]
ggplot(housing, aes(date, median)) + geom_line()

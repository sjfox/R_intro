###############################################
## Introduction to R
## These are the materials for the third coding session
## Making figures with ggplot2
## Spencer Fox
## March 31, 2016
###############################################

install.packages("cowplot")
library(cowplot)

## Once again we will make use of the internal datasets in R
## CO2 contains data from a plant experiment where a number of plants
## from different locations were put in an experiment, and then their
## CO2 uptake was measured. This line makes it so the CO2 dataset isn't hidden:
CO2 = CO2

## Take a look at what the dataset looks like: You can also click on it in the environment panel --->
head(CO2)


## So we see that the columns "Type" contains the origin of the plant
## and 'uptake' contains data about the co2 uptake, so let's see how uptake
## changes with the type of the plant:
## In the ggplot function we first specify the data, then the aesthetics
## in this case we just have one x and y variable. Finally we specify the type 
## of geometry we want to use. Let's look at all the data points, so use geom_point()
## Notice that the functions are connected by a '+' sign, which links them together
ggplot(CO2, aes(x=Type, y=uptake))+geom_point()

## The points are not very descriptive, it seems like Quebec plants have higher uptake,
## but it's hard to tell from the plot. Let's change to plotting a boxplot, which
## summarizes the point data. Notice we only have to change the geom, and ggplot does the rest
ggplot(CO2, aes(x=Type, y=uptake))+geom_boxplot()

## If we look at the data again, we notice that there is a treatment column
head(CO2)

## Let's color the boxplots by the treatment, so we need to add a new aesthetic
## Adding color=Treatment, causes ggplot to know you want to split your data
## by that column, and then colors them according to the default colors
ggplot(CO2, aes(x=Type, y=uptake, color = Treatment))+ 
  geom_boxplot()

## Let's change the scale to pick new colors. ggplot automatically
## can generate pallettes from http://colorbrewer2.org/ which is
## an awesome website for selecting colors for your data
## to do so we use scale_color_brewer(), and we specify the argument
## type ="qual", which let's it know our data are qualitatively different,
## as opposed to (div)ergent or (seq)uential
ggplot(CO2, aes(x=Type, y=uptake, color = Treatment))+ 
  geom_boxplot() + scale_color_brewer(type = "qual")

## While I like those colors a lot more than the defaults, they are light,
## and kind of hard to differentiate. Let's try filling in the boxplots with black
## to make the colors stand out. Since this fill is not based on the data, we don't put it in
## the aesthetics, and instead enter it as an argument in geom_boxplot()
ggplot(CO2, aes(x=Type, y=uptake, color = Treatment))+ 
  geom_boxplot(fill="black") + scale_color_brewer(type = "qual")

## I don't like that either, let's actually just fill in the
## boxplots with the colors, and keep the outlines default.
## to do this we can simply substitute fill in for color:
ggplot(CO2, aes(x=Type, y=uptake, fill = Treatment))+ 
  geom_boxplot() + scale_fill_brewer(type = "qual")

## Try changing the color of the boxplot border:


## Now try plotting the concentration rather than the uptake
## Can you figure out what concentration comes from?


## Try changing the brewer fill to "div" or  "seq"



#################################################
# Second example
#################################################

## Now that's a nice looking plot that clearly shows the data!
## Okay let's look at some time-series data on texas housing market
txhousing=txhousing
head(txhousing)

## There's a lot of data here, but let's focus on the median,
## which is the median sale price of realty, and you notice
## that the data are monthly data for cities in Texas

## Let's see what the data look like, and plot time-series lines
ggplot(txhousing, aes(date, median)) + geom_line()

## What went wrong?
## Try plotting the points, rather than the lines to understand
ggplot(txhousing, aes(date, median)) + geom_point(size=.2)

## Since there are many y values for each x value (many cities), 
## ggplot doesn't know how to connect them all with a line
## To separate the cities properly, let's color the lines by city
## You may need to zoom out the plot to see it!
ggplot(txhousing, aes(date, median, color = city)) + geom_line()

## That's quite incomprehensible, let's say we just want to know general Texas trends
## if that's the case, we can plot just the points, and then a smoothed line through all the data
ggplot(txhousing, aes(date, median)) + 
  geom_point() + stat_smooth()

## Those points are too large, try changing their size to .5 or .2, choose a size you like
## Add it in the code below
ggplot(txhousing, aes(date, median)) + 
  geom_point() + stat_smooth()


## Now that you got the points the correct size, try changing the color of the points
## to "grey" so that the line is more apparent. add in the points size and color code below
ggplot(txhousing, aes(date, median)) + 
  geom_point() + stat_smooth()


## Finally, that line may not be the best color
## Change it to be red, and change the size to equal 2
## Hint: Treat the stat_smooth function as a geometric object
ggplot(txhousing, aes(date, median)) + 
  geom_point(size=.5, color="grey") + stat_smooth()

## Select only the texas housing data that corresponds to Austin
## Plot the median Austin housing prices, and change the colors
## to your liking. What's this saying about housing prices?



#################################################
# Challenge plots
#################################################
midwest=midwest

## Take a look at the midwest data supplied from ggplot
## These data contain demographic information of midwest counties
## Make a scatterplot of the population versus the population density



## Now make a scatterplot of the percent college graduate versus the percent below poverty
## These columns are titled "percollege" and "percbelowpoverty"



## If you do that, now color the points by state... and try color them by inmetro (whether or not in city)



## If you still have time, color the points by inmetro, and now find the smooth trend for both
## not city and city



## If you still have time, try playing around with the data to make something other than a scatterplot!
## Let me know if you need ideas.



###############################################
## Introduction to R
## These are the materials for the first coding session
## Introduction to R packages
## Spencer Fox
## March 31, 2016
###############################################

###############################################
## Running code in Rstudio -- basics
###############################################
## This is the first tutorial for the session.
## The objective is to get you used to running code in R and to 
## the way in which I present these tutorials. Don't worry if you don't understand
## everything going on with the code (we haven't talked about it yet), just try
## to run the code and play around with different lines to see how the output changes.
## The "#" at the beginning of the line means this is a comment code,
## and won't have any effect if you run it.

## There are several ways to run code. To get used to running code first try 
## Running this code-select the line of code and hit cmd+enter (mac) or ctrl+enter (windows):
## You should see the code line run in the console "> 5+5" and the output on the line after.
5+5

## Try moving your cursor to the console, and simply typing out this code as well
## You notice everything is the same if you just type directly into the console, 
## so why use the script? It helps for reproducibility, and to make sure everything is
## saved properly, so I always work in a script, and run things from the script

## You can select chunks of code and run them simultaneously like that,
## try running these 3 lines simultaneously:
x = 5
x = x*5
x

## You also don't need to select code to run, and can run line by line
## For example, move your blinking cursor so it's on line 39 (the first line of code)
## Now hit cmd+enter (mac) or ctrl+enter (windows), and see that it runs the whole line
## It also moves the cursor to the next line, which makes it easy to run lines sequentially
## Run these lines sequentially this way and see the output.
x = 3
x = x*10
x

###############################################
## First package testing
###############################################

## First install packages (PCL computers don't have them)
## If you are prompted in the console below, type 'y' to install properly
install.packages('ggmap')
install.packages('rgl')

## The library() function loads in the package functions (recipes) to use
## Load in rgl package which is used for plotting in 3D
library(rgl)

## First we open a blank plotting screen
open3d()

## Get Churyumov - Gerasimenko comet 3d data from online
## This is the comet the Philae lander successfully landed on in 2014!!
## It will take a long time to load, because it's a large data file
comet <- readOBJ(url("http://sci.esa.int/science-e/www/object/doc.cfm?fobjectid=54726"))

## Plot and color the comet gray
## remember we separate arguments for the function with a ','
## So this function takes the comet object and plots it on the 3d space, and also
## colors the object gray.
shade3d(comet, col="gray")

## Try moving the comet around. Also try changing the color of the comet 
## (hint, you need to rerun all 3 lines again with different color)


###############################################
## Second package testing
###############################################
## Load in map package which makes the functions in the package available
## ggmap is a wrapper around ggplot that adds mapping functionality
## This means ggmap includes ggplot, and even more functions
library(ggmap)

## Plot a map of texas -- Notice it searches an online database for maps matching "texas"
## Remember the commas separate arguments of the function. Try changing the zoom number
qmap("texas", zoom=6, color="bw")

## Plot a map of UT now, and now don't make it black and white
qmap("University of Texas at Austin", zoom=15)

## Pretty cool right?

## Now let's try to plot out where we are
## First store the location for PCL in a new variable
pcl_location = geocode("101 E 21st St, Austin, TX 78712", source = "google")

## Now use a ggmap function to plot the map with the point.
## This is a function that is strung together with a "+" 
ggmap(get_map("University of Texas at Austin", zoom = 15)) + geom_point(data=pcl_location, size = 7, shape = 13, color = "red")

## Try changing the size, shape, color in the geom_point() function
## See if you can understand what they are changing about the plot


###############################################
## First exercise!!!
## Plot your apartment on a map of austin
## First change the address to your apartment
your_address = geocode("808 W 29th st, Austin, TX 78705", source = "google")

## Now plot it on a map of austin
ggmap(get_map("Austin", zoom = 12)) + geom_point(data=your_address, size = 7, shape = 13, color = "red")

# Now copy the code above and try changing the function arguments. 
# Change the zoom number, what happens with smaller numbers?
# Change the size/shape/color values, and see if there are others you like more


## Let me know when you've finished. If you still have time try making maps of your favorite country, 
## and plotting other cities or points of interest on it. Try experimenting with the maptype argument
## the options are: "terrain", "terrain-background", "roadmap", "hybrid", 
## If you don't notice differences try changing the zoom levels



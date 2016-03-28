###############################################
## Introduction to R
## First coding session
## Spencer Fox
## March 31, 2016
###############################################

## First install packages (PCL computers don't have them)
install.packages('ggmap')
install.packages('rgl')

###############################################
## First package testing
###############################################
## Load in rgl package which is used for plotting in 3D
library(rgl)

## First open a blank plotting screen
open3d()

## Get Churyumov–Gerasimenko comet 3d data from online
## This is the comet the Philae lander successfully landed on in 2014!!
comet <- readOBJ(url("http://sci.esa.int/science-e/www/object/doc.cfm?fobjectid=54726"))

## Plot and color the comet
shade3d(comet, col="gray")

## Try moving the comet around. Also try changing the color of the comet 
## (hint, you may need to rerun all 3 lines again with different color)


###############################################
## Second package testing
###############################################
## Load in map package which makes the functions in the package available
library(ggmap)

## Plot a map of texas -- Notice it searches an online database for maps matching "texas"
qmap("texas", zoom=6, color="bw")

## Plot a map of UT now
qmap("University of Texas at Austin", zoom=15)

## First store the location for PCL in a new variable, then plot the UT map with PCL indicated
pcl_location = geocode("101 E 21st St, Austin, TX 78712", source = "google")
ggmap(get_map("University of Texas at Austin", zoom = 15)) +
  geom_point(data=pcl_location, size = 7, shape = 13, color = "red")


###############################################
## First exercise!!!
## Plot your apartment on a map of austin
## First change the address to your apartment
your_address = geocode("808 W 29th st, Austin, TX 78705", source = "google")

## Now plot it on a map of austin
ggmap(get_map("Austin", zoom = 12)) +
  geom_point(data=your_address, size = 7, shape = 13, color = "red")

# Now copy the code above and try changing the function arguments. 
# Change the zoom number, what happens with smaller numbers?
# Change the size/shape/color values, and see if there are others you like more





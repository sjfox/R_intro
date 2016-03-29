###############################################
## Introduction to R
## These are the materials for the second coding session
## Working with data structures
## Spencer Fox
## March 31, 2016
###############################################
## Run these lines to test out data structure creation
vector("numeric", 10)
1:10
seq(1, 10)
rep(1, 10)

## Extracting information from vectors ###
vec = c("a", "b", "c", "d", "b", "f")
vec

## get everything but the first element
vec[-1]

## get the third through sixth element
vec[3:6]

## new vector that is true where the value of vec is "b"
vec=="b"
indices = vec=="b"

## Now extract the elements
vec[indices]

## Matrix testing ###
mat = matrix(1:25, ncol=5)
mat
mat[2:5,3]
mat[1,]
mat[,1]

mat[,2]
mat[which(mat[,2]==6), ]

## Data frame creation/extraction ###
df = data.frame(temps = c(70,85,79,83, 90), water= c(1500, 1495, 1490,1450, 1400))
df
df$temps
df[,1]
which(df$water<1495)
## Make sure you understand these two lines
df$temps[which(df$water<1495)]
df[which(df$water<1495), "temps"]

## List creation/extraction ###
l = list(1:5, 3:10, 5:3)
l
l[1]
l[[1]]

###############################################
## Numbers and strings
###############################################
## set x and y variables to 13223 and 342 respectively 

## What's 13223 multiplied by 342?


## What's 13223 multiplied by 342 squared?


###############################################
## Vectors
###############################################
## Create a vector called sequence that holds the numbers 1 to 100


## Calculate 15 times every number from 1 to 100 and store it into a new vector, seq_multiplied


## Try this, and figure out what's happening
sequence * seq_multiplied


## Extract the third element from seq_multiplied


## Extract every number but the third element from seq_multiplied


## Extract the first 10 elements from seq_multiplied, and store it in a vector seq_subset


###############################################
## Data frames
###############################################
## R has many built-in datasets that are readily available
## mtcars is a dataset from motor trend car road tests
?mtcars

## Look at first few lines
head(mtcars)

## display the fourth row of the mtcars data frame 


## extract the qsec column


## extract the Valiant row (hint: you can use row names to extract rows)


## Which cars get over 30 mpg?


## What is the average weight of cars that get over 30 mpg?



###############################################
## Creating functions and using flow control
###############################################
## Few examples of running functions on vectors
vector = c(15, 30, 23, 23,12, 24, 54, 64, 23)
sum(vector)
mean(vector)
max(vector)
min(vector)

## Play around with this code and make sure you understand what's going on
x = 10
y = 10
if(x==10 & y==10){
  print("both x and y equal 10")
} else if ( x==10 & y !=10){
  print("Only x equals 10")
}else if ( x!=10 & y ==10){
  print("Only y equals 10")
} else{
  print("Neither x nor y equals 10")
}

## When looking at vectors, the functions any() and all() are often very useful
## Any returns true if any elements of vector satisfy expression, and all returns
## true if all of them do
## Do all of the cars have more than 50 horsepower?
mtcars$hp
all(mtcars$hp>50)

all(mtcars$hp < 300) ## How about less than 300?

## How do the returns of the any functions compare?
any(mtcars$hp > 300)
any(mtcars$hp > 400)

## Experiment with any and all functions using mtcars$qsec
## Are there cars with speeds lower than 14s? etc.



## Write an if statement that prints out if any of the mtcars$qsec are larger than 21s




## Here is a function that calculates the sum of all elements in a vector
my_sum = function(vec){
  count = 0
  for(ii in vec){
    count = count + ii
  }
  count
}
## Try running the function with this vector
test_vec = c(15,23,543,5,6,43,58,97,9,7,34,5,3,45)


## Now try changing the vector and making sure it's working properly.
## Now try changing the function to calculate the sum of only numbers less than 30?



###############################################
## Problem challenges
###############################################
## Write a function that takes in a data frame and returns the average value of the first column
## Test your function




## Write a function that takes in a vector of strings and returns the number of times the string "ate" appears
## test the function with the vector:
str_test <- c("late", "date", "ate", "now", "a", "c", "cat", "ate", "ate", "let", "fetch", "dog", "ate")



## Now returns the number of instances of the string "ate". e.g. late and date should count as well
## Hint use the grep function
?grep




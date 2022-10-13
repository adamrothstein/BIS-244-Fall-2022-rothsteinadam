# Start or Assignment 02 #

rm(list=is(all=TRUE))
cat("\014")

library(dplyr)
library(here)
library(tidyverse)

# Read the file "us-states.csv" into an R data frame. 
df <- read.csv("us-states.csv")
View(df)

#Process the data frame using dplyr functions to 
#keep only observations for Pennsylvania.
df_PA <- filter(df, state=="Pennsylvania")
view(df_PA)

#Create 2 new variables, "incr_cases" and "incr_deaths" 
#by calculating the CHANGES in the cases and deaths variables, respectively.
n <- length(df_PA$date)
df_PA$incr_cases <- 1
df_PA$incr_deaths <- 0

for (i in 2:n) {
  df_PA$incr_cases[i] <- (df_PA$cases[i]-df_PA$cases[i-1]) 
}

for (i in 2:n) {
  df_PA$incr_deaths[i] <- (df_PA$deaths[i]-df_PA$deaths[i-1]) 
}
view(df_PA)

#As a checksum to help grade this assignment, 
#have it calculate the sd() of all incr_cases in PA and print it in the Console. 
StndDev <- sd(df_PA$incr_cases,na.rm=FALSE)
print(sd)

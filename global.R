##-------- Global Script ---------

## package loading 
library(pacman)
p_load(tidyverse, shiny, shinydashboard, janitor, reactable)

## ------------------------ Data Showcases
features = c("Title", "Year", "Your_Rating", "IMDb_Rating", "Date_Rated", "Type", "Runtime_Mins", "Genres", "Num_Votes", "Release_Date", "Directors", "URL")

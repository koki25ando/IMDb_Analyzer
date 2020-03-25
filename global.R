##-------- Global Script ---------

## ------- PATH SETTING
COMPONENT_PATH = 'Components/'
PAGE_PATH = 'Pages/'

## package loading 
library(pacman)
p_load(tidyverse, shiny, shinydashboard, htmlwidgets, janitor, reactable, echarts4r, shinycssloaders, DT, data.table, plotly)

## ------------------------ Data Showcases
features = c("Title", "Year", "Your_Rating", "IMDb_Rating", "Date_Rated", "Type", "Runtime_Mins", "Genres", 
             "Num_Votes", "Release_Date", "Directors", "URL")


## --------------- Var Setting ----------------------
today = Sys.Date()
this_month = format(today, "%Y-%m")


## --------------- System Setting -------------------
Sys.setlocale('LC_ALL','C')
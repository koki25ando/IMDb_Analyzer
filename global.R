##-------- Global Script ---------

## ------- PATH SETTING
COMPONENT_PATH = 'Components/'
PAGE_PATH = 'Pages/'

## package loading 
# library(pacman)
# p_load(tidyverse, shiny, shinydashboard, htmlwidgets, janitor, reactable, echarts4r, shinycssloaders, DT, data.table, plotly)
library(tidyverse)
library(shiny)
library(shinydashboard)
library(htmlwidgets)
library(janitor)
library(reactable)
library(echarts4r)
library(shinycssloaders)
library(DT)
library(data.table)
library(plotly)


## ------------------------ Data Showcases
features = c("Title", "Year", "Your_Rating", "IMDb_Rating", "Date_Rated", "Type", "Runtime_Mins", "Genres", 
             "Num_Votes", "Release_Date", "Directors", "URL")


## --------------- Var Setting ----------------------
today = Sys.Date()
today_last_year = today - 365
this_month_last_year = format(today_last_year + 60, "%Y-%m")
this_month = format(today, "%Y-%m")


## --------------- System Setting -------------------
Sys.setlocale('LC_ALL','C')
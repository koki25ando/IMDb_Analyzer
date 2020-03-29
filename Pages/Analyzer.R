fluidPage(fluidRow(
  infoBoxOutput(outputId = "info_movies_reviewed") %>% withSpinner(color = "#DD4B39", type = 6, color.background = "white"),
  infoBoxOutput(outputId = "info_aerage_rating"),
  infoBoxOutput(outputId = "info_favorite_genre"),
  infoBoxOutput(outputId = "info_favorite_director")
  ),
fluidRow(
  fluidRow(
    box(title = "Rating Score Distribution",
               echarts4rOutput("rating_histogram")) %>% 
             withSpinner(color = "#DD4B39"),
    box(title = "Movie Genre Pie",
               echarts4rOutput("genre_pie")
               # plotlyOutput("genre_pie_plotly")
           )),
  fluidRow(
    box(title = "Viewing Activity",
        width = 12, 
        echarts4rOutput("viewing_activity")) %>% 
      withSpinner(color = "#DD4B39")
  ),
  fluidRow(
    box(title = "Monthly Review Numbers",
        width = 12,
        echarts4rOutput('monthly_review_nums')) %>%
      withSpinner(color = "#DD4B39")
  ),
  fluidRow(
    ## ----------- Scatter Plot -----------------
    box(title = "Your Rating vs IMDb Rating",
        # echarts4rOutput("rating_scatter")) %>% 
        plotlyOutput("rating_scatter_plotly")) %>% 
      withSpinner(color = "#DD4B39"),
    ## ------------------------------------------
    
    box(title = "Release Year",
        echarts4rOutput("release_year")) %>% 
      withSpinner(color = "#DD4B39")
  ),
  fluidRow(
    box(title = "Monthly Activity",
        ## ------------- YEAR_MONTH Selector -----------------------
        uiOutput("year_mon_selector"),
        ## ---------------------------------------------------------
        echarts4rOutput("monthly_activity")),
      box(title = "Monthly Activity Data Table",
          reactableOutput("monthly_activity_table"))
    )
))
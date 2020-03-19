fluidPage(fluidRow(
  infoBoxOutput(outputId = "info_movies_reviewed"),
  infoBoxOutput(outputId = "info_aerage_rating"),
  infoBoxOutput(outputId = "info_favorite_genre"),
  infoBoxOutput(outputId = "info_favorite_director")
  ),
fluidRow(
  box(title = "Rating Score Distribution",
      echarts4rOutput("rating_histogram")),
  box(title = "Movie Genre Pie",
      echarts4rOutput("genre_pie")),
  box(title = "Viewing Activity",
      width = 12, 
      echarts4rOutput("viewing_activity")),
  box(title = "Your Rating vs IMDb Rating",
      echarts4rOutput("rating_scatter")),
  box(title = "Monthly Activity",
      echarts4rOutput("monthly_activity"))
))
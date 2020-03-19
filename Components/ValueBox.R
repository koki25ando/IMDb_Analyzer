output$movie_count = renderValueBox({
  
  df = rowDataImport()
  
  if (is.null(df))
    movie_count_num = 0
  
  movie_count_num = nrow(df)
  
  valueBox(
    value = paste0(movie_count_num, " Movies"), 
    subtitle = "Movies You have reviewed", 
    icon = icon("film"),
    color = "yellow"
  )
})

output$average_rating = renderValueBox({
  
  df = rowDataImport()
  
  if (is.null(df))
    movie_count_num = 0
  
  average_rating_value = mean(df$Your_Rating, na.rm = T)
  
  valueBox(
    #title = "Movie Count", 
    value = round(average_rating_value, digits = 3), 
    subtitle = "Average Rating Value", 
    icon = icon("heart"),
    color = "maroon"
  )
})
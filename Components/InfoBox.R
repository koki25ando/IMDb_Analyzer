output$info_movies_reviewed = renderInfoBox({
  df = rowDataImport()
  if (is.null(df))
    return(NULL)
  info_review_num = nrow(df)
  infoBox(title = "Movies Reviewed", value = info_review_num, color = "red",
          icon = icon("film"))
})

output$info_aerage_rating = renderInfoBox({
  df = rowDataImport()
  if (is.null(df))
    return(NULL)
  info_avg_rating = mean(df$Your_Rating, na.rm = T)
  infoBox(title = "Average Rating", value = round(info_avg_rating, digits = 3), color = "red",
          icon = icon("heart"))
})

output$info_favorite_genre = renderInfoBox({
  df = rowDataImport()
  if (is.null(df))
    return(NULL)
  info_fav_genre = count(df, Genres) %>% 
    top_n(1) %>% 
    pull(Genres) %>% 
    as.character()
  infoBox(title = "Favorite Genre", value = as.character(info_fav_genre), color = "red",
          icon = icon("thumbs-up"))
})

output$info_favorite_director = renderInfoBox({
  df = rowDataImport()
  if (is.null(df))
    return(NULL)
  info_fav_director = count(df, Directors) %>% 
    top_n(1) %>% 
    pull(Directors) %>% 
    as.character()
  infoBox(title = "Favorite Director", value = as.character(info_fav_director), color = "red",
          icon = icon("user-tie"))
})
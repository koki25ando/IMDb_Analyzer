##-------- Server Script ---------
source(file = "global.R",
       local = TRUE,
       encoding = "UTF-8")

server = function(input, output) {
  
  output$showcase_content = renderReactable({
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    df = read.csv(inFile$datapath, fileEncoding = '', stringsAsFactors = TRUE)
    df = janitor::clean_names(df)
    names(df) = c("const", "Your_Rating", "Date_Rated", "Title", "URL", "Type", "IMDb_Rating", "Runtime_Mins", "Year", "Genres", 
                  "Num_Votes", "Release_Date", "Directors")
    df = df[, features]
    
    req(input$column_selector)
    selected_columns = input$column_selector
    
    req(input$release_year_slider, input$imdb_rating_slider, input$your_rating_slider)
    
    reactable_df = df %>% 
      filter(Year >= input$release_year_slider[1] & Year <= input$release_year_slider[2],
             IMDb_Rating >= input$imdb_rating_slider[1] & IMDb_Rating <= input$imdb_rating_slider[2],
             Your_Rating >= input$your_rating_slider[1] & Your_Rating <= input$your_rating_slider[2])
    
    reactable(reactable_df[, selected_columns],
              sortable = TRUE,  showSortable = TRUE
    )
    
  })
  
  # -------------------------- Value Box ------------------------------
  
  output$movie_count = renderValueBox({
    #req(input$file1)
    
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
  
  ## -------------------------- infoBoxoutput
  
  output$info_movies_reviewed = renderInfoBox({
    if (is.null(df))
      return(NULL)
    info_review_num = nrow(df)
    infoBox(title = "Movies Reviewed", value = info_review_num, color = "red",
            icon = icon("film"))
  })
  
  output$info_aerage_rating = renderInfoBox({
    if (is.null(df))
      return(NULL)
    info_avg_rating = mean(df$Your_Rating, na.rm = T)
    infoBox(title = "Average Rating", value = info_avg_rating, color = "red",
            icon = icon("heart"))
  })
  
  output$info_favorite_genre = renderInfoBox({
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
    if (is.null(df))
      return(NULL)
    info_fav_director = count(df, Directors) %>% 
      top_n(1) %>% 
      pull(Directors) %>% 
      as.character()
    infoBox(title = "Favorite Director", value = as.character(info_fav_director), color = "red",
            icon = icon("user-tie"))
  })
  
  output$rating_histogram = renderEcharts4r({
    if (is.null(df))
      return(NULL)
    
    df %>% 
      # count(Your_Rating) %>% 
      # head()
      e_charts() %>% 
      e_histogram(Your_Rating) %>% 
      e_y_axis(name = "count") %>% 
      e_theme("dark") %>% 
      e_x_axis(min = 1) %>% 
      e_tooltip(formatter = htmlwidgets::JS("
                                            function(params){
                                            return('Rating: ' + Math.floor(params.value[0]) + 
                                            '<br />count: ' + params.value[1]) 
                                            }
                                            "))
  })
  
  output$genre_pie = renderEcharts4r({
    
    genre_list = paste(df$Genres, collapse = ",")
    splitted_list = strsplit(genre_list, ",")[[1]]
    splitted_list = sapply(splitted_list, function(x) str_remove_all(x, " "))
    genre_table = table(splitted_list)
    data.table(genre_table) %>% 
      e_charts(splitted_list) %>% 
      e_pie(N) %>% 
      e_legend(FALSE) %>% 
      e_theme("dark")
    
  })
  
}

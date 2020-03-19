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
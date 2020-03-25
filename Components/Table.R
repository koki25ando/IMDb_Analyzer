rowDataImport = reactive({
  req(input$file1)
  inFile <- input$file1
  
  if (is.null(inFile))
    return(NULL)
  
  df = read.csv(inFile$datapath, fileEncoding = '', stringsAsFactors = TRUE)
  df = janitor::clean_names(df)
  names(df) = c("const", "Your_Rating", "Date_Rated", "Title", "URL", "Type", "IMDb_Rating", "Runtime_Mins", "Year", "Genres", 
                "Num_Votes", "Release_Date", "Directors")
  df = df[, features]
})



output$showcase_content = renderReactable({
  
  df = rowDataImport()
  
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

output$monthly_activity_table = renderReactable({
  df = get_selected_month_df()
  
  df %>% 
    head() %>% 
    # mutate(Date_Rated = as.Date(Date_Rated)) %>% 
    # filter(Date_Rated > as.Date(paste0(input$year_mon_rated, "-01"))) %>%
    # arrange(desc(Date_Rated)) %>% 
    # select(Date_Rated, Title, Your_Rating, IMDb_Rating, Runtime_Mins, Directors) %>% 
    reactable(sortable = TRUE,  showSortable = TRUE)
  
})
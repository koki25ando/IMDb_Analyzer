##-------- Server Script ---------
source(file = "global.R",
       local = TRUE,
       encoding = "UTF-8")

server = function(input, output) {
  
  output$showcase_contant = renderReactable({
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
    
    df = df %>% 
      filter(Year >= input$release_year_slider[1] & Year <= input$release_year_slider[2],
             IMDb_Rating >= input$imdb_rating_slider[1] & IMDb_Rating <= input$imdb_rating_slider[2],
             Your_Rating >= input$your_rating_slider[1] & Your_Rating <= input$your_rating_slider[2])
    
    reactable(df[, selected_columns],
              sortable = TRUE,  showSortable = TRUE
    )
    
  })
  
  output$movie_count = renderValueBox({
    #req(input$file1)
    
    if (is.null(df))
      movie_count_num = 0
    
    movie_count_num = nrow(df)
    
    valueBox(
      #title = "Movie Count", 
      value = paste0(movie_count_num, " Movies"), 
      subtitle = "Movies You have reviewed", 
      icon = icon("film"),
      color = "yellow"
    )
  })
  
}

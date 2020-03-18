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
    
    reactable(df[, selected_columns])
    
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

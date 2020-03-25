getGenreTable = reactive({
  df = rowDataImport()
  
  if (is.null(df))
    return(NULL)
  
  
  genre_list = paste(df$Genres, collapse = ",")
  splitted_list = strsplit(genre_list, ",")[[1]]
  splitted_list = sapply(splitted_list, function(x) str_remove_all(x, " "))
  genre_table = data.table(table(splitted_list))
})


# activate interactivity
output$genre_pie = renderEcharts4r({
  
  genre_df = getGenreTable()
  
  genre_df %>% 
    e_chart(splitted_list) %>% 
    e_pie(N) %>% 
    e_legend(FALSE) %>% 
    e_theme("dark") %>% 
    e_tooltip()
})

output$genre_pie_plotly = renderPlotly({
  genre_df = getGenreTable()
  p = genre_df %>% 
    plot_ly(labels = ~splitted_list, values = ~N, type = 'pie', 
            textposition = "inside") %>%
    layout(title = 'Movie Genres',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)) %>% 
    hide_legend()
  return(p)
})
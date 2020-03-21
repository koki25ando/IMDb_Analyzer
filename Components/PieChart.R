getGenreTable = reactive({
  df = rowDataImport()
  
  if (is.null(df))
    return(NULL)
  
  
  genre_list = paste(df$Genres, collapse = ",")
  splitted_list = strsplit(genre_list, ",")[[1]]
  splitted_list = sapply(splitted_list, function(x) str_remove_all(x, " "))
  genre_table = data.table(table(splitted_list))
})

output$genre_pie = renderEcharts4r({
  genre_df = getGenreTable()
  
  if (is.null(genre_df))
    return(NULL)
  
  genre_df %>% 
    e_charts(splitted_list) %>% 
    e_pie(N) %>% 
    e_legend(FALSE) %>% 
    e_theme("dark") %>% 
    e_tooltip()
  
})
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
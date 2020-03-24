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
    e_tooltip(formatter = htmlwidgets::JS("
                                          function(params){
                                          return('Genre: ' + params.value[0] + 
                                          '<br />Count: ' + params.value[1]) 
}
  "))
  
})
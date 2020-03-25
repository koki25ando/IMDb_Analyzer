# activate reactivity
output$rating_histogram = renderEcharts4r({
  df = rowDataImport()
  
  if (is.null(df))
    return(NULL)
  
  df %>% 
    e_chart() %>% 
    e_histogram(Your_Rating, width = "90%") %>% 
    e_theme("dark") %>% 
    e_x_axis(min = 1) %>% 
    e_tooltip(formatter = htmlwidgets::JS("
                                          function(params){
                                          return('Rating: ' + Math.floor(params.value[0]) + 
                                          '<br />count: ' + params.value[1]) 
                                          }
                                          "))
})
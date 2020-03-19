output$rating_histogram = renderEcharts4r({
  if (is.null(df))
    return(NULL)
  
  df %>% 
    # count(Your_Rating) %>% 
    # head()
    e_charts() %>% 
    e_histogram(Your_Rating) %>% 
    e_theme("dark") %>% 
    e_x_axis(min = 1) %>% 
    e_tooltip(formatter = htmlwidgets::JS("
                                          function(params){
                                          return('Rating: ' + Math.floor(params.value[0]) + 
                                          '<br />count: ' + params.value[1]) 
                                          }
                                          "))
})
# ui update
output$rating_scatter = renderEcharts4r({
  df = rowDataImport()
  df %>% 
    e_charts(IMDb_Rating) %>% 
    e_scatter(Your_Rating, Num_Votes) %>% 
    e_x_axis(min = min(df$Your_Rating)) %>% 
    e_y_axis(min = 1) %>% 
    e_theme("dark") %>%
    e_legend(FALSE) %>% 
    e_tooltip(formatter = htmlwidgets::JS("
                                          function(params){
                                          function kFormatter(num) {
                                          return Math.abs(num) > 999 ? Math.sign(num)*((Math.abs(num)/1000).toFixed(1)) +
                                          'k' : Math.sign(num)*Math.abs(num)
                                          }
                                          return('Rating: ' + Math.floor(params.value[0]) + 
                                          '<br />count: ' + params.value[1] +
                                          '<br />Num Votes: ' + kFormatter(params.value[2])) 
}"))
})
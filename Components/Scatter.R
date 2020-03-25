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


output$rating_scatter_plotly = renderPlotly({
  
  df = rowDataImport()
  
  df %>% 
    plot_ly(type = 'scatter', mode = 'markers') %>% 
    add_trace(x = ~IMDb_Rating, y = ~Your_Rating, 
              size = ~Num_Votes,
              marker = list(color = "rgba(236,116,111, 0.5)",
                            line = list(color = 'rgb(236,116,111)',
                                        width = 0.3)
              ),
              hoverinfo = "text",
              text = ~paste0(Title,
                             "<br>Director: ", Directors,
                             "<br>IMDb Rating: ", IMDb_Rating,
                             "<br>Your Rating: ", Your_Rating),
              showlegend = F) %>% 
    layout(plot_bgcolor = "rgb(51,51,51)",
           xaxis = list(title = "IMDb Rating",
                        gridcolor = "rgba(238, 238, 238, 0.3)"),
           yaxis = list(title = "Your Rating",
                        gridcolor = "rgba(238, 238, 238, 0.3)"))
})
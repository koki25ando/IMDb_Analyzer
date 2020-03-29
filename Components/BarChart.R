output$monthly_activity = renderEcharts4r({
  
  df = get_monthly_cumsum_runtime_df()
  
  df %>% 
    mutate(Daily_Watch_Time = Runtime_Mins_daily_sum,
           Monthly_Watch_Time = Runtim_monthly_cumsum) %>% 
    e_charts(Date_Rated) %>% 
    e_bar(Daily_Watch_Time,
          y_index = 1,
          itemStyle = list(normal = list(color = "#DD4B39")),
          areaStyle = list(opacity = 0.4)) %>%
    e_line(Monthly_Watch_Time,
           areaStyle = list(opacity = 0.4)) %>%
    e_legend(type = 'scroll', orient = 'vertical', left = '10%', top = '15%') %>%
    e_tooltip(trigger = 'axis')
})


output$release_year = renderEcharts4r({
  df = rowDataImport()
  
  if (is.null(df))
    return(NULL)
  
  df %>% 
    count(Year) %>% 
    e_chart(Year) %>% 
    e_bar(n, 
          breaks = "Sturges",
          bar_width = "100%",
          y_index = 1) %>% 
    e_x_axis(min = min(df$Year) - 2, max = max(df$Year) + 2,
             axisLabel = list(interval = 0, rotate = 45)) %>% 
    e_theme("dark") %>% 
    e_legend(FALSE) %>% 
    e_tooltip(formatter = htmlwidgets::JS("
                                          function(params){
                                          return('Rating: ' + Math.floor(params.value[0]) + 
                                          '<br />count: ' + params.value[1]) 
                                          }
                                          "))
  
})


output$monthly_review_nums = renderEcharts4r({
  df = rowDataImport()
  df %>% 
    select(Date_Rated) %>% 
    mutate(Date_Rated = format(as.Date(Date_Rated), "%Y-%m")) %>% 
    count(Date_Rated) %>% 
    e_charts(Date_Rated) %>% 
    e_bar(n) %>%
    e_line(n) %>% 
    e_tooltip() %>% 
    e_legend(FALSE) %>% 
    e_theme("dark")
})


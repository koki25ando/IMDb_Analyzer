output$monthly_activity = renderEcharts4r({
  
  df = rowDataImport()
  
  df %>% 
    select(Date_Rated, Runtime_Mins) %>% 
    mutate(Date_Rated = as.Date(Date_Rated)) %>% 
    filter(Date_Rated > as.Date(paste0(this_month, "-01"))) %>% 
    arrange(Date_Rated) %>% 
    group_by(Date_Rated) %>% 
    summarise(Runtime_Mins_daily_sum = sum(Runtime_Mins, na.rm = T)) %>% 
    mutate(Runtim_monthly_cumsum = cumsum(Runtime_Mins_daily_sum)) %>% 
    e_charts(Date_Rated) %>% 
    e_bar(Runtime_Mins_daily_sum,
          y_index = 1,
          itemStyle = list(normal = list(color = "#DD4B39")),
          areaStyle = list(opacity = 0.4)) %>% 
    e_line(Runtim_monthly_cumsum, 
           # itemStyle = list(normal = list(color = "#DD4B39")),
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
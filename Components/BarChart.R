output$monthly_activity = renderEcharts4r({
  dat %>% 
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
output$viewing_activity = renderEcharts4r({
  
  df = rowDataImport()
  
  runtime_calendar = df %>% 
    select(Date_Rated, Runtime_Mins) %>% 
    group_by(Date_Rated) %>%
    summarise(Runtime_Mins_sum = sum(Runtime_Mins)) %>% 
    ungroup()
  runtime_calendar$Date_Rated = as.Date(runtime_calendar$Date_Rated)
  dates <- seq.Date(min(runtime_calendar$Date_Rated), max(runtime_calendar$Date_Rated), by = "day")
  year <- data.frame(Date_Rated = dates)
  year$Date_Rated = as.Date(year$Date_Rated)
  calendar_df = left_join(year, runtime_calendar)
  
  calendar_df %>% 
    e_charts(Date_Rated) %>% 
    e_calendar(range = c(this_month_last_year, as.character(today))) %>% 
    e_heatmap(Runtime_Mins_sum, coord_system = "calendar") %>% 
    e_visual_map(max = 500, calculable = FALSE) %>%
    e_legend(FALSE) %>%
    # e_theme("dark") %>% 
    e_title("Last 12 Months Activities") %>% 
    e_tooltip(formatter = htmlwidgets::JS("
                                          function(params){
                                          return('Date: ' + params.value[0] + 
                                          '<br />count: ' + params.value[1] + ' mins') 
                                          }
                                          "))
})
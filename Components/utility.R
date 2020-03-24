get_selected_month_df = reactive({
  
  req(input$year_mon_input)
  
  if(is.null(input$year_mon_input))
    return(NULL)
  
  df = rowDataImport()
  
  
  selected_month_df = df %>% 
    mutate(Date_Rated = as.Date(Date_Rated, format="%Y-%m-%d"),
           month_rated = as.character(format(Date_Rated, "%Y-%m"))) %>% 
    filter(month_rated %in%  input$year_mon_input)
})


get_monthly_cumsum_runtime_df = reactive({
  month_dat = get_selected_month_df() 
  
  monthly_cumusumdf = month_dat %>% 
    arrange(Date_Rated) %>% 
    group_by(Date_Rated) %>% 
    summarise(Runtime_Mins_daily_sum = sum(Runtime_Mins, na.rm = T)) %>% 
    ungroup() %>% 
    mutate(Runtim_monthly_cumsum = cumsum(Runtime_Mins_daily_sum))
})
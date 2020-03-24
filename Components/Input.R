get_month_choices = reactive({
  df = rowDataImport()
  
  month_list = df %>% 
    mutate(Date_Rated = as.Date(Date_Rated)) %>% 
    mutate(Month_Rated = format(Date_Rated, "%Y-%m")) %>% 
    count(Month_Rated) %>% 
    pull(Month_Rated)
  return(month_list)
  
})



output$year_mon_selector = renderUI({
  
  select_choices = get_month_choices()
  
  selectInput(inputId = "year_mon_input",
              label = "Select: Year & Month",
              choices = select_choices,
              selected = as.character(this_month),
              multiple = FALSE)
  
})
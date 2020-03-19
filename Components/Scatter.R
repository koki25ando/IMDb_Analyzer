output$rating_scatter = renderEcharts4r({
  dat %>% 
    e_charts(IMDb_Rating) %>% 
    e_scatter(Your_Rating, Num_Votes) %>% 
    e_x_axis(min = min(dat$Your_Rating)) %>% 
    e_y_axis(min = 1) %>% 
    e_theme("dark") %>% 
    e_tooltip()
})
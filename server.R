##-------- Server Script ---------
source(file = "global.R",
       local = TRUE,
       encoding = "UTF-8")

server = function(input, output) {
  
  output$showcase_contant = renderReactable({
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    df = read.csv(inFile$datapath, fileEncoding = '', stringsAsFactors = TRUE)
    df = janitor::clean_names(df)
    reactable(df)
    
  })
  
}

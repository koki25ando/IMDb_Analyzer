##-------- Server Script ---------
source(file = "global.R",
       local = TRUE,
       encoding = "UTF-8")

server = function(input, output) {
  
  output$showcase_contant = renderTable({
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, fileEncoding = '', stringsAsFactors = TRUE)
    
    
  }) 
  
}

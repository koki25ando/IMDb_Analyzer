##-------- Server Script ---------
source(file = "global.R",
       local = TRUE,
       encoding = "UTF-8")

server = function(input, output) {
  
  ## Component: Table
  source(file = paste0(COMPONENT_PATH, 'Table.R'),
         local = TRUE,
         encoding = "UTF-8")
  
  ## Component: Table
  source(file = paste0(COMPONENT_PATH, 'ValueBox.R'),
         local = TRUE,
         encoding = "UTF-8")

  
  ## Component: Table
  source(file = paste0(COMPONENT_PATH, 'InfoBox.R'),
         local = TRUE,
         encoding = "UTF-8")
  
  ## Component: Histogram Chart
  source(file = paste0(COMPONENT_PATH, 'HistogramChart.R'),
         local = TRUE,
         encoding = "UTF-8")
  
  ## Component: Pie Chart
  source(file = paste0(COMPONENT_PATH, 'PieChart.R'),
         local = TRUE,
         encoding = "UTF-8")
  
  ## Component: Calendar
  source(file = paste0(COMPONENT_PATH, 'Calendar.R'),
         local = TRUE,
         encoding = "UTF-8")
  
  ## Component: Rating Scatter
  source(file = paste0(COMPONENT_PATH, 'Scatter.R'),
         local = TRUE,
         encoding = "UTF-8")
  
  ## Component: Bar plot
  source(file = paste0(COMPONENT_PATH, 'BarChart.R'),
         local = TRUE,
         encoding = "UTF-8")
  
}

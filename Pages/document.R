tabBox(
  width = 11,
  tabPanel(
    title = "IMDb Analyzer",
    icon = icon("film"),
    fluidRow(column(includeMarkdown("Document/Welcome.md"), width = 10, offset = 1))
    ),
  tabPanel(
    title = "Upload Data",
    icon = icon("file-upload"),
    fluidRow(column(includeMarkdown("Document/SetupProcedure.md"), width = 10, offset = 1))),
  tabPanel(
    title = "Movie Analysis",
    icon = icon("chart-pie"),
    fluidRow(column(includeMarkdown("Document/MovieAnalysis.md"), width = 10, offset = 1)))
)
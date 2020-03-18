##-------- UI Script ---------

###-------- Header ---------

header <- dashboardHeader(
  title = "IMDb Analyzer",
  dropdownMenu(
    type = "messages", 
    messageItem(
      from = "About Developer",
      message = "Check out GitHub", 
      href = "https://github.com/koki25ando",
      icon = icon('user')
      ),
    messageItem(
      from = "Source Code",
      message = "Available on GitHub", 
      href = "https://github.com/koki25ando/IMDb_Analyzer",
      icon = icon('file-code')
      ) 
    )
)

###-------- Sidebar ---------

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Upload Dataset", tabName = "data_upload", icon = icon("upload")),
    menuItem("IMDb Analyzer", tabName = "imdb_analyzer", icon = icon("chart-bar")),
    menuItem("Information", tabName = "information", icon = icon("info")),
    menuItem("Documentation", tabName = "documentation", icon = icon("book"))
  )
)

###-------- Body ---------

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "data_upload",
            ## ------------------------- Upload dataset
            fluidRow(tabBox(
              title = "Step 1",
              tabPanel(
                title = "Upload",
                icon = icon("cloud-upload-alt"),
                fileInput(inputId = "file1", label = "Choose CSV File",
                          multiple = FALSE,
                          accept = c("text/csv",
                                     "text/comma-separated-values,text/plain",
                                     ".csv")),
                tags$hr()
                ),
              tabPanel(
                title = "Instruction",
                icon = icon("question-circle")
              )
            ),
            infoBoxOutput(outputId = "movie_count"),
            ),
            fluidRow(
              ## ----------------------- Data Column Selector
            box(
              width= 3,
              checkboxGroupInput(
                input = "column_selector", label = "Columns",
                choices = features,
                selected = c("Title", "Your_Rating", "IMDb_Rating", "Release_Date", "Runtime_Mins", "Type")
                )
              ),

            ## ------------------------ Showcase of Rating dataset
            box(
              title = "Showcase of Rating Dataset",
              label = "rating_showcase",
              width = 9,
              reactableOutput(outputId = "showcase_contant")
            )
          )),
    
    tabItem(tabName = "imdb_analyzer"
            ),
    tabItem(tabName = "information"
            ),
    tabItem(tabName = "documentation"
    )
  )
)


##--------- Wrap Up --------

ui <- dashboardPage(header, sidebar, body)
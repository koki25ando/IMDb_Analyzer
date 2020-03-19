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
    menuItem("IMDb Analyzer", tabName = "imdb_analyzer", icon = icon("chart-bar")),
    menuItem("Upload Dataset", tabName = "data_upload", icon = icon("upload")),
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
              width = 4,
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
            infoBoxOutput(outputId = "average_rating")
            ),
            fluidRow(
              
            ## ----------------------- Data Column Selector
            box(
              width= 3,
              background = "black",
              checkboxGroupInput(
                input = "column_selector", label = h5("Columns"),
                choices = features,
                selected = c("Title", "Your_Rating", "IMDb_Rating", "Release_Date", "Runtime_Mins", "Type")
                ),
              sliderInput("release_year_slider", label = h5("Release Year Range"), 
                          min = 1920, max = 2020,
                          value = c(1960, 2020)),
              sliderInput("imdb_rating_slider", label = h5("IMDb Rating Range"), 
                          min = 1, max = 10,
                          value = c(4, 10)),
              sliderInput("your_rating_slider", label = h5("Your Rating Range"), 
                          min = 1, max = 10,
                          value = c(3, 10))
              ),

            ## ------------------------ Showcase of Rating dataset
            box(
              title = "Showcase of Rating Dataset",
              label = "rating_showcase",
              width = 9,
              reactableOutput(outputId = "showcase_content")
            )
          )),
    tabItem(tabName = "imdb_analyzer",
            fluidRow(
              infoBoxOutput(outputId = "info_movies_reviewed"),
              infoBoxOutput(outputId = "info_aerage_rating"),
              infoBoxOutput(outputId = "info_favorite_genre"),
              infoBoxOutput(outputId = "info_favorite_director")
            ),
            fluidRow(
              box(title = "Histogram of Your Rating Score",
                  # background = "black",
                  echarts4rOutput("rating_histogram")),
              box(title = "Movie Genre Pie",
                  echarts4rOutput("genre_pie"))
            )
            ),
    tabItem(tabName = "information"
            ),
    tabItem(tabName = "documentation"
    )
  )
)


##--------- Wrap Up --------

ui <- dashboardPage(header, sidebar, body)
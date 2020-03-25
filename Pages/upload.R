fluidPage(fluidRow(
tabBox(
    title = "Step 1", width = 4,
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
      icon = icon("question-circle"),
      h5("To analyze your data you need to upload your IMDb data."),
      h5("See the documentation and follow the setup procedures. Thanks!")
    )),
infoBoxOutput(outputId = "movie_count"),
infoBoxOutput(outputId = "average_rating")
),

fluidRow(
    box(
    width= 3,
    background = "black",
    checkboxGroupInput(
      input = "column_selector", label = h5("Columns"),
      choices = features,
      selected = c("Title", "Your_Rating", "IMDb_Rating", "Release_Date", "Runtime_Mins", "Type")
    ),
    sliderInput("release_year_slider", label = h5("Release Year Range"), 
                min = 1910, max = 2020,
                value = c(1960, 2020)),
    sliderInput("imdb_rating_slider", label = h5("IMDb Rating Range"), 
                min = 1, max = 10,
                value = c(4, 10)),
    sliderInput("your_rating_slider", label = h5("Your Rating Range"), 
                min = 1, max = 10,
                value = c(3, 10))
    ),
    box(
      title = "Showcase of Rating Dataset",
      label = "rating_showcase",
      width = 9,
      reactableOutput(outputId = "showcase_content") %>% withSpinner(color = "#DD4B39")
      )
    ))
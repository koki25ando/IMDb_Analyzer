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
            source(
              file = paste0(PAGE_PATH, 'upload.R'),
              local = T,
              encoding = 'UTF-8')$value
            ),
    tabItem(tabName = "imdb_analyzer",
            source(
              file = paste0(PAGE_PATH, 'Analyzer.R'),
              local = T,
              encoding = 'UTF-8')$value
            ),
    tabItem(tabName = "information"
            ),
    tabItem(tabName = "documentation"
    )
  )
)


##--------- Wrap Up --------

ui <- dashboardPage(header, sidebar, body)
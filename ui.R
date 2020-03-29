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
  collapsed = TRUE, 
  sidebarMenu(
    id = "sideBarTab",
    menuItem("Documentation", tabName = "documentation", icon = icon("book"),
             badgeLabel = "First!", badgeColor = "yellow"),
    menuItem("Upload Dataset", tabName = "data_upload", icon = icon("upload"),
             badgeLabel = "Step 0", badgeColor = "black"),
    menuItem("IMDb Analyzer", tabName = "imdb_analyzer", icon = icon("chart-bar"))
  )
)

###-------- Body ---------

body <- dashboardBody(
  
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "www/custom.css")),
  
  tabItems(
    tabItem(tabName = "documentation",
            source(
              file = paste0(PAGE_PATH, 'document.R'),
              local = T,
              encoding = 'UTF-8')$value
            ),
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
            )
  )
)


##--------- Wrap Up --------

ui <- dashboardPage(header, sidebar, body)


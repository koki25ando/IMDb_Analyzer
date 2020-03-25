app <- ShinyDriver$new("../../")
app$snapshotInit("mytest")

app$uploadFile(file1 = "ratings.csv") # <-- This should be the path to the file, relative to the app's tests/shinytests directory
app$setInputs(column_selector = c("Title", "Year", "Your_Rating", "IMDb_Rating", "Type", "Runtime_Mins", "Release_Date"))
app$setInputs(your_rating_slider = c(4, 10))
app$setInputs(release_year_slider = c(1937, 2020))
app$setInputs(year_mon_input = "2020-01")
app$snapshot()

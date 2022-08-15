library("debrowser")
app <- shinyApp( ui = shinyUI(debrowser::heatmapUI),
        server = shinyServer(debrowser::heatmapServer))

options(shiny.port = 7777)
shiny::runApp(app, launch.browser=FALSE)


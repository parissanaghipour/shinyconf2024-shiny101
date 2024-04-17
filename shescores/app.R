library(shiny)
library(bslib)

custom_theme <- bs_theme(
  version = 5,
  # for themes see: https://bootswatch.com
  preset = "quartz",
  base_font = font_google("PT Sans")
)

soccer_scorers <- readRDS("../data/soccer_scorers.rds")
soccer_matches <- readRDS("../data/soccer_matches.rds")
soccer_rank <- readRDS("../data/country_rank.rds")


ui <- page_navbar(
  theme = custom_theme,
  title = "SheScores: Women's International Soccer",
  nav_panel(
    title = "Overview",
    fluidRow(
      column(
       4,
       value_box(
         title = "Top scoring country",
         value = paste(
           head(soccer_rank$country, 1),
           head(soccer_rank$country_flag, 1)
         )
       )
      ),
      column(
       4,
       value_box(
         title = "Top score",
         value = paste(
           head(soccer_scorers$country, 1),
           head(soccer_scorers$country_flag, 1)
         )
       )
      ),
      column(
        4,
        value_box(
          title = "Top countries",
          value = length(unique(soccer_rank$country))
          )
      )
    )
  )
)

server <- function(input, output, session) {

}

shinyApp(ui, server)

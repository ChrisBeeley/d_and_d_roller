#' dice_roller UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_dice_roller_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    fluidRow(
      column(1,
             numericInput(ns("number_dice"), "Number of dice",
                          value = 2, min = 2, max = 20)
      ),
      column(1, selectInput(ns("dice"), "Dice",
                            choices = c("D4" = 4,
                                        "D6" = 6,
                                        "D8" = 8,
                                        "D12" = 12,
                                        "D20" = 20))
      ),
      column(10, 
             plotOutput(ns("distribution")))
    )
  )
}

#' dice_roller Server Functions
#'
#' @noRd 
mod_dice_roller_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$distribution <- renderPlot({
      
      cat(str(input$dice))
      
      cat(str(input$number_dice))
      
      x <- data.frame("x" = replicate(
        1000, sum(sample(as.numeric(input$dice), 
                         input$number_dice, replace = TRUE))
      ))
      
      x %>% 
        ggplot2::ggplot(ggplot2::aes(x = x)) +
        ggplot2::geom_density()
    })
    
  })
}

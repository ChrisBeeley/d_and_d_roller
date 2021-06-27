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
 
  )
}
    
#' dice_roller Server Functions
#'
#' @noRd 
mod_dice_roller_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}

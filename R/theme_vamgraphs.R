# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

theme_vamgraphs <- function(){
  font <- "Open Sans"

  theme_minimal() %+replace%

    theme(

      # grid elements
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.ticks = element_blank(),

      # text elements
      plot.title = element_text(
        family = font,
        size = rel(1),
        face = 'bold',
        colour = 'black',
        hjust = 0),

      #subtitle elements
      plot.subtitle = element_text(
        family = font,
        colour = 'grey',
        size = rel(.8),
        face = 'bold'),

      #legend elements
      legend.title = element_text(
        family = font,
        colour = 'black',
        size = rel(.8),
        face = 'bold'
      ),

      # caption elements
      plot.caption = element_text(
        family = font,
        size = rel(.6),
        hjust = 1),

      # axis title elements
      axis.title = element_text(
        family = font,
        size = rel(.75),
        face = 'bold'),

      # axis text elements
      axis.text = element_text(
        family = font,
        size = rel(.6)),

    )
}

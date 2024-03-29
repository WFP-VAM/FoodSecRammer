library(officer)
library(rvg)


graph2ppt <- function(d){

  listofplots <- list(graph1)

  #create_dml, converts the ggplot objects to dml objects.
  create_dml <- function(plot){
    rvg::dml(ggobj = plot)
  }
  #Apply this function to the list of ggplot objects to create a list of dml objects with the same dimension.
  plots_dml <- purrr::map(listofplots, create_dml)
  # function to export plot to PowerPoint ----
  create_pptx <- function(plot, path, left = 0.5, top = 0.5, width = 9, height = 7){
    # if file does not yet exist, create new PowerPoint ----
    if (!file.exists(path)) {
      out <- officer::read_pptx()
    }
    # if file exist, append slides to exisiting file ----
    else {
      out <- officer::read_pptx(path)
    }
    out %>%
      officer::add_slide() %>%
      officer::ph_with(plot, location = officer::ph_location(
        width = width, height = height, left = left, top = top)) %>%
      base::print(target = path)
  }
  ##now fire away!
  purrr::map(
    # dml plots to export ----
    plots_dml,
    # exporting function ----
    create_pptx,
    # additional fixed arguments in create_pptx ----
    path = "rCSIgraphics.pptx"
  )
}

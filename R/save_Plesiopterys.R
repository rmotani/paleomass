#' Save the silhouette images for Plesiopterys in a subfolder of the current directory
#'
#' @return None
#' @importFrom imager save.image
#' @export
#'
#' @examples save_Plesiopterys()

save_Plesiopterys <- function(){
  if(!dir.exists("./Plesiopterys")) dir.create("./Plesiopterys")
  data(Plesiopterys)
  nms <- names(Plesiopterys)
  for(i in 1:length(Plesiopterys)){
    imager::save.image(Plesiopterysx[[i]],file=paste0("./Plesiopterys/",nms[i],".png"))
  }
}

#' Save the silhouette images for Plesiopteryx in a subfolder of the current directory
#'
#' @return None
#' @importFrom imager save.image
#' @export
#'
#' @examples save_Plesiopteryx()

save_Plesiopteryx <- function(){
  if(!dir.exists("./Plesiopteryx")) dir.create("./Plesiopteryx")
  data(Plesiopteryx)
  nms <- names(Plesiopteryx)
  for(i in 1:length(Plesiopteryx)){
    imager::save.image(Plesiopteryx[[i]],file=paste0("./Plesiopteryx/",nms[i],".png"))
  }
}

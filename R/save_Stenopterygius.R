#' Save the silhouette images for Stenopterygius in a subfolder of the current directory
#'
#' @return None
#' @importFrom imager save.image
#' @export
#'
#' @examples save_Stenopterygius()

save_Stenopterygius <- function(){
  if(!dir.exists("./Stenopterygius")) dir.create("./Stenopterygius")
  data(Stenopterygius)
  nms <- names(Stenopterygius)
  for(i in 1:length(nms)){
    imager::save.image(Stenopterygius[[i]],file=paste0("./Stenopterygius/",nms[i],".png"))
  }
}

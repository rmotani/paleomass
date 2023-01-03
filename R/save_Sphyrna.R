#' Save the silhouette images for Sphyrna in a subfolder of the current directory
#'
#' @return None
#' @importFrom imager save.image
#' @export
#'
#' @examples save_Sphyrna()

save_Sphyrna <- function(){
  if(!dir.exists("./Sphyrna")) dir.create("./Sphyrna")
  data(Sphyrna)
  nms <- names(Sphyrna)
  for(i in 1:length(nms)){
    imager::save.image(Sphyrna[[i]],file=paste0("./Sphyrna/",nms[i],".png"))
  }
}

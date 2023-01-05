#' Save the silhouette images for Plesiosaurus in a subfolder of the current directory
#'
#' @return None
#' @importFrom imager save.image
#' @export
#'
#' @examples save_Plesiosaurus()

save_Plesiosaurus <- function(){
  if(!dir.exists("./Plesiosaurus")) dir.create("./Plesiosaurus")
  data(Plesiosaurus)
  nms <- names(Plesiosaurus)
  for(i in 1:length(Plesiosaurus)){
    imager::save.image(Plesiosaurus[[i]],file=paste0("./Plesiosaurus/",nms[i],".png"))
  }
}

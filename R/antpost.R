#' Digitize the left and right margins of a silhouette.
#'
#' @param Mx Black and white image in the form of a matrix filled with 0s and 1s.
#' @param Add.Tip Logical. Whether to add a tip to the ends of the silhouette.
#' @param tip.radius Radius of the tip added if Add.Tip = TRUE.
#' @param Origin Whether the top of the bottom is considered the origin.
#'
#' @return Five-column matrix containing y coordinates, silhouette left x coordinates, silhouette right x coordinates, silhouette center x coordinates, and the radius of the silhoutte at a given y.
#' @export
#'
#' @examples Used by paleomass()

antpost <- function(Mx,Add.Tip=T,tip.radius=0.0001,Origin=c("Bottom","Top")){
  Origin=match.arg(Origin)
  if(Origin=="Bottom") Mx <- Mx[nrow(Mx):1,]
  m.tmp <- NULL
  for(i in 1:nrow(Mx)){
    dtmp <- Mx[i,]
    dtmp2 <- dtmp[1:(length(dtmp)-1)] - dtmp[2:length(dtmp)]
    m.tmp <- rbind(m.tmp,match(c(1,-1),dtmp2)+c(0,1))
  }
  m.out <- na.omit(cbind(m.tmp,rowMeans(m.tmp,na.rm=T),abs(apply(m.tmp,1,diff)/2)))
  m.out <- cbind(seq(1,nrow(m.out)),m.out)
  colnames(m.out) <- c("coord","ant","post","center","radius")
  m.out <- as.data.frame(m.out)
  if(Add.Tip){
    m.out.front <- c(m.out[1,1],m.out[1,4]-tip.radius,m.out[1,4]+tip.radius,m.out[1,4],tip.radius)
    m.out.back <- c(m.out[nrow(m.out),1],m.out[nrow(m.out),4]-tip.radius,m.out[nrow(m.out),4]+tip.radius,m.out[nrow(m.out),4],tip.radius)
    m.out$coord[1] <- m.out$coord[1]+tip.radius
    m.out$coord[length(m.out$coord)] <- m.out$coord[length(m.out$coord)]-tip.radius
    m.out <- rbind(m.out.front,m.out,m.out.back)
  }
  return(m.out)
}

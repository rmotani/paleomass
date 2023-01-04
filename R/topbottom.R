#' Digitize the top and bottom outlines of a silhouette.
#'
#' @param Dat Black and white image in the form of a matrix filled with 0s and 1s.
#' @param Add.Tip Logical. Whether to add a tip to the ends of the silhouette.
#' @param tip.radius Radius of the tip added if Add.Tip = TRUE.
#' @param Origin Whether the top of the bottom is considered the origin.
#'
#' @return Five-column matrix containing x coordinates, silhouette bottom y coordinates, silhouette top y coordinates, silhouette center y coordinates, and the radius of the silhoutte at a given x.
#' @export
#'
#' @examples Used by paleomass()

topbottom <- function(Dat,Add.Tip=T,tip.radius=0.0001,Origin=c("Bottom","Top")){
  Origin=match.arg(Origin)
  if(Origin=="Bottom") Dat <- Dat[nrow(Dat):1,]
  m.tmp <- NULL
  for(i in 1:ncol(Dat)){
    dtmp <- Dat[,i]
    dtmp2 <- dtmp[1:(length(dtmp)-1)] - dtmp[2:length(dtmp)]
    iwb <- which(dtmp2 %in% 1)+1
    ibw <- which(dtmp2 %in% -1)
    if(length(ibw)*length(iwb) !=0) m.tmp <- rbind(m.tmp,c(min(iwb),max(ibw)))
  }
  m.out <- na.omit(cbind(m.tmp,rowMeans(m.tmp,na.rm=T),abs(apply(m.tmp,1,diff)/2)))
  m.out <- cbind(seq(1,nrow(m.out)),m.out)
  colnames(m.out) <- c("coord","top","bottom","center","radius")
  m.out <- as.data.frame(m.out)
  if(Add.Tip){
    m.out.front <- c(m.out[1,1],m.out[1,4]+tip.radius,m.out[1,4]-tip.radius,m.out[1,4],tip.radius)
    m.out.back <- c(m.out[nrow(m.out),1],m.out[nrow(m.out),4]+tip.radius,m.out[nrow(m.out),4]-tip.radius,m.out[nrow(m.out),4],tip.radius)
    m.out$coord[1] <- m.out$coord[1]+tip.radius
    m.out$coord[length(m.out$coord)] <- m.out$coord[length(m.out$coord)]-tip.radius
    m.out <- rbind(m.out.front,m.out,m.out.back)
  }
  return(m.out)
}

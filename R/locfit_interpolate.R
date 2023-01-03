#' Smooth the outline coordinates from topbottom() or antpost() using local regression.
#'
#' @param Mx Output matrix from topbottom() or antpost().
#' @param Nseg How to deal with the number of segments
#' @param n.out Number of segments if Nseg = "provided"
#' @param Use.Weight Whether to add weights to the tips
#' @param nn Nearest neighbor component of locfit()
#' @param h Constant component of locfit()
#'
#' @return Five-column matrix as in the input matrix but with smoothed outcome
#' @import locfit
#' @export
#'
#' @examples Used by paleomass()

locfit_interpolate <- function(Mx,Nseg=c("asis","round","provided"),
                               n.out=1000,Use.Weight=F,nn=0.1,h=0){
  Nseg <- match.arg(Nseg)
  if(Nseg == "asis") n.out <- nrow(Mx)
  if(Nseg == "round") n.out <- max(100,round(nrow(Mx)/100,0)*100)
  w = rep(1,nrow(Mx))
  if(Use.Weight) w[1] <- w[length(w)] <- 100000
  fit1 <- locfit::locfit(Mx[,2]~lp(Mx[,1],nn=nn,h=h),weights=w)
  fit2 <- locfit::locfit(Mx[,3]~lp(Mx[,1],nn=nn,h=h),weights=w)
  x1 <- seq(1,nrow(Mx),length.out=n.out)
  x2 <- predict(fit1,x1)
  x3 <- predict(fit2,x1)
  x4 <- rowMeans(cbind(x2,x3),na.rm=T)
  x5 <- abs(x2-x3)/2
  Mx.out <- cbind(x1,x2,x3,x4,x5)
  colnames(Mx.out) <- colnames(Mx)
  Mx.out[1,] <- as.double(Mx[1,])
  Mx.out[n.out,2:5] <- as.double(Mx[nrow(Mx),2:5])
  return(invisible(as.data.frame(Mx.out)))
}

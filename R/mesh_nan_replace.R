#' Remove NaNs from coordinates of a mesh3d object.
#'
#' @param Mesh A mesh3d object containing NaNs in coordinates
#' @param tip.radius radius of the tip when fixing tips
#' @param Fix.Tip Logical. Whether to fix the tips.
#' @param a.per.slice Number of angular segments in a cross-section.
#'
#' @return A mesh 3D objects with NaNs replaced by nearest coordinates
#' @export
#'
#' @examples Used by paleomass()

mesh_nan_replace <- function(Mesh,tip.radius=0.0001,Fix.Tip=F,a.per.slice=181){
  vb <- Mesh$vb
  nan.START <- NULL
  for(i in 1:4){
    dtmp <- vb[i,]
    nan.start <- match(1,is.na(dtmp))
    if(!is.na(nan.start)){
      nan.START <- min(nan.START,nan.start)
      nan.end <- match(0,is.na(dtmp))
      if(is.na(nan.end)) nan.end <- length(dtmp)
      n.nan.slice <- round((nan.end-nan.start)/a.per.slice)
      for(j in 1:n.nan.slice){
        nan.start <- match(1,is.na(dtmp))
        if(!is.na(nan.start)){
          dtmp2 <- dtmp[nan.start:length(dtmp)]
          nan.end <- match(0,is.na(dtmp2))
          if(nan.start==1){
            dfiller <- dtmp[(nan.end+1):(nan.end+a.per.slice)]
          }else{
            dfiller <- dtmp[(nan.start-a.per.slice):(nan.start-1)]
          }
          dtmp[nan.start:(nan.start+a.per.slice-1)] <- dfiller
        }
      }
      vb[i,] <- dtmp
    }
  }
  if(Fix.Tip){  ### Replacing with the tip
    if(!is.null(nan.START)){
      rlist <- seq(0,2*pi,length.out=a.per.slice)[-1]
      if(nan.START != 1){
        lastslice <- vb[,(ncol(vb)-(a.per.slice-1)):ncol(vb)]
        repl.one <- repl.center <- rowMeans(lastslice,na.rm=T)
        repl.one[1:2] <- repl.one[1:2] + c(tip.radius,tip.radius)
        for(k in 1:(a.per.slice-1)){
          repl.add <- repl.center + c(cos(rlist[k]*pi/180),sin(rlist[k]*pi/180),0,0)
          repl.one <- cbind(repl.one,repl.add)
        }
        vb[,(ncol(vb)-(a.per.slice-1)):ncol(vb)] <- repl.one
      }else{
        firstslice <- vb[,1:(a.per.slice-1)]
        repl.one <- repl.center <- rowMeans(firstslice,na.rm=T)
        repl.one[1:2] <- repl.one[1:2] + c(tip.radius,tip.radius)
        for(k in 1:(a.per.slice-1)){
          repl.add <- repl.center + c(cos(rlist[k]*pi/180),sin(rlist[k]*pi/180),0,0)
          repl.one <- cbind(repl.one,repl.add)
        }
        vb[,1:a.per.slice] <- repl.one
      }
    }
  }
  Mesh$vb <- vb
  return(invisible(Mesh))
}

#' Build a mesh3d model of fins using a planar silhouette and NACA 4-digit foil sections
#'
#' @param dat.fin Planar view silhouette of the fin processed by antpost() or locfit_interpolate().
#' @param tf Maximum thickness of the foil section relative to chord in percentage, e.g., tf=20 would result in NACA 0020 foil sections.
#' @param X.onset Global X coordinate of the fin onset.
#' @param Y.onset Global Y coordinate of the fin onset.
#' @param Z.onset Global Z coordinate of the fin onset.
#' @param tol Tolerance limit used by vcgClean().
#' @param Center Whether to Center the fin along Y axis or not.
#' @param Thickest Value between 0 and 1 indicating the thickest part of the fin along its span. 0 for bottom and 1 for top.
#' @param a.per.slice Number of angular segments in a cross-section.
#' @param Mesh.Col Mesh.Col Color of the resulting mesh3d object.
#' @param Cephalofoil Logical. If the mesh is for a cephalofoil or not.
#'
#' @return A mesh3d object representing the fin.
#' @import rgl
#' @import Rvcg
#' @importFrom plot3D mesh
#' @export
#'
#' @examples Used by paleomass()

mesh_foil <- function(dat.fin,tf=20,X.onset=0,Y.onset=0,Z.onset=0,
                      tol=0.0001,Center=T,Thickest=0.5,a.per.slice=181,Mesh.Col="royalblue",
                      Cephalofoil=F)
{
  # Foil Equations, assuming that foils span laterally along the X axis, while
  # the chord is along the Z axis. Y axis is the thickness of the foil.

  # dat.fin     Fin planar view outline coordinates from antpost()
  #             Pre-processing by locfit_interpolate() is acceptable.
  # X, Y, Z     Global coordinates for the fin
  # x, y, z     Local coordinates for the fin
  # .onset      Anterior margin center of the fin in global coordinate if
  #             Thick="Center". Otherwise, antero-ventral corner of the fin.
  # Mf          Base mesh for fin coordinates.
  # tf          Maximum thickness of fin as a percentage of chord
  # Thickest    Spanwise position of the thickest part, 0 for bottom and 1
  #             for top if the fin is vertical

  v <- dat.fin$coord
  n.left <- round(max(v)*Thickest,0)
  n.right <- length(v)-n.left
  v.thick <- c(seq(0,1,length.out=n.left),seq(1,0,length.out=n.right))
  if(Cephalofoil){
    n.left <- n.right <- round(length(v)*0.04)
    n.mid <- length(v)-n.left-n.right
    hn.mid <-n.mid %/% 2
    qn.mid <-n.mid %/% 4
    thin <- 0.7
    v.thick <- c(seq(0,1,length.out=n.left),seq(1,thin,length.out=qn.mid),
                 seq(thin,1,length.out=qn.mid),rep(thin,n.mid %% 4),
                 seq(1,thin,length.out=qn.mid),seq(thin,1,length.out=qn.mid),
                 seq(1,0,length.out=n.right))
  }
  if(Center) v <- v-mean(v)
  Mf <- plot3D::mesh(seq(-pi,pi,length.out=a.per.slice),seq(1,nrow(dat.fin)))
  u <- (cos(Mf$x)+1)/2
  y <- matrix(v[Mf$y],nrow(Mf$y),ncol(Mf$y))
  y.thick <- matrix(v.thick[Mf$y],nrow(Mf$y),ncol(Mf$y))
  z <- 2 * dat.fin$radius[Mf$y] * u + dat.fin$ant[Mf$y]
  # Tf <- tf * ((1-abs(y/max(y)))^0.5)
  # if(Thick=="Top") Tf <- tf * (abs(y/max(y)))^0.5
  Tf <- tf * (y.thick^0.5)
  x <- sign(sin(Mf$x)) * 5 * Tf * (0.2969 * (u^0.5) - 0.1260 * u -
                                     0.3516 * (u^2) + 0.2843 * (u^3) - 0.1036 * (u^4))

  X <- x + X.onset
  Y <- y + Y.onset
  Z <- z + Z.onset

  rgl::open3d()
  rgl::surface3d(X, Y, Z, col=Mesh.Col, smooth=TRUE,asp="iso")
  mesh_foil <- rgl::as.mesh3d()
  rgl::close3d()

  mesh_foil <- mesh_nan_replace(mesh_foil,a.per.slice=a.per.slice,
                                tip.radius=tip.radius)
  mesh_foil <- Rvcg::vcgClean(mesh_foil,sel=0:7,iterate=F,tol=tol)
  # mesh_foil <- vcgClean(mesh_foil,sel=c(6),iterate=F,tol=tol)
  # mesh_foil <- vcgClean(mesh_foil,sel=c(0:4,6:7),iterate=F)
  return(invisible(list(Mesh=mesh_foil,X=X,Y=Y,Z=Z)))
}

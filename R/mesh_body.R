#' Build a mesh3d object of the main body from two orthogonal silhouettes and superellipticla cross-sections
#'
#' @param dat.lat Lateral view silhouette processed by topbottom() or locfit_interpolate().
#' @param dat.dv Ventral view silhouette processed by topbottom() or locfit_interpolate().
#' @param nb Exponent of the superellipse to be used. nb=2 makes it a normal ellipse.
#' @param X.center Center of global X coordinate to anchor the mesh.
#' @param Y.center Center of global Y coordinate to anchor the mesh.
#' @param Z.onset Onset of global Z coordinate to anchor the mesh.
#' @param a.per.slice Number of angular segments in a cross-section.
#' @param Mesh.Col Color of the resulting mesh3d object.
#' @param tol Tolerance limit used by vcgClean().
#'
#' @return A mesh3d model of the main body.
#' @import rgl
#' @import Rvcg
#' @importFrom plot3D mesh
#' @export
#'
#' @examples Used by paleomass()

mesh_body <- function(dat.lat,dat.dv,nb=2,X.center=0,Y.center=0,Z.onset=0,
                      a.per.slice=181,Mesh.Col="royalblue",tol=0.0001)
{
  ### Build a body mesh with superelliptical cross-sections
  # dat.lat     Body lateral view outline coordinates from topbottom()
  #             Pre-processing by locfit_interpolate() is acceptable.
  # dat.dv      Body ventral view outline coordinates from topbottom()
  #             Pre-processing by locfit_interpolate() is acceptable.
  # X          Bilateral axis in global coordinates
  # Y          Dorso-ventral axis in global coordinates
  # Z          Antero-posterior axis in global coordinates
  # x, y, z  Body local coordinates
  # .center     X, Y, Z, coordinates of the center of object
  # rx, ry    Radius of body cross-section along x and y axis
  # nb          Superelliptical exponent. 2 for a circle.
  # Mb          Base mesh for body coordinates

  Mb  <- plot3D::mesh(seq(0, pi*2, length.out = a.per.slice),seq(1,nrow(dat.lat)))
  u <- Mb$x # Parameter for superellipse representing transverse body section
  v <- Mb$y
  rx <- dat.dv$radius[v]
  ry <- dat.lat$radius[v]
  x <- rx*sign(sin(u))*abs(sin(u))^(2/nb) #+ dat.dv[v+dat.dv[1,1]-1,4]
  y <- ry*sign(cos(u))*abs(cos(u))^(2/nb) + dat.lat[v+dat.lat[1,1]-1,4]
  z <- matrix(dat.lat$coord[v],nrow(v),ncol(v))

  X <- x + X.center
  Y <- y + Y.center
  Z <- z + Z.onset

  rgl::open3d()
  rgl::surface3d(X, Y, Z, col=Mesh.Col, smooth=TRUE)
  mesh_body <- rgl::as.mesh3d()
  rgl::close3d()

  mesh_body <- mesh_nan_replace(mesh_body,a.per.slice=a.per.slice,
                                tip.radius=tip.radius)
  mesh_body <- Rvcg::vcgClean(mesh_body,sel=c(6),iterate=F,tol=tol)
  mesh_body <- Rvcg::vcgClean(mesh_body,sel=c(0:4,6:7),iterate=F)
  return(invisible(mesh_body))
}

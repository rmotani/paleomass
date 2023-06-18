#' Main function to build two 3D models from silhouettes of a marine vertebrate in a trial to bracket the body volume and surface area between the two.
#'
#' @param a.per.slice  Number of angular division per superelliptical slice plus 1, that is, how many points are placed around a superellipse with one pair of redundant points. The default value is 181, i.e., there is a point every 2 degrees.
#' @param Add.Tip Logical. Whether to add tips and the two ends of an object. TRUE is recommended to close the holes generated at the tips. If TRUE, then a small circle of a radius specified by tip.radius (0.0001 pixel by default) is added, while the existing points are shifted inward by tip.radius. This affects the shape minimally while closing the tips.
#' @param afin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the anal fin, in pixels.
#' @param Afin.File Name of the image file for the planar silhouette of the anal fin, if any, without extension.
#' @param afin.onset Position adjustment along the Z axis (cranio-caudal axis) for the anal fin, in fraction, usually between 0 and 1.
#' @param afin.pitch Rotation angle of the anal fin around the X axis (bilateral axis).
#' @param afin.roll Rotation angle of the anal fin around Z axis (cranio-caudal axis). 0 for vertical, pi/2 for horizontal fins.
#' @param afin.thick Maximum thickness of the anal fin relative to the chord in percentage.
#' @param afin.yaw Yaw angle of anal fin around the Y axis (dorso-ventral axis).
#' @param body.axis.l Body axis length in the BodyL image in meters.
#' @param Body.Y.Centering Logical. Whether to center the body along the Y axis.
#' @param BodyL.File Name of the image file for the lateral silhouette of the body, without extension.
#' @param BodyV.File Name of the image file for the ventral silhouette of the body, without extension.
#' @param ceph.adj.up Position adjustment along the Y axis (dorso#-ventral axis) for the cephalofoil, in pixels.
#' @param Ceph.File Name of the image file for the planar silhouette of the cephalofoil, if any, without extension.
#' @param ceph.onset Position adjustment along the Z axis (cranio-caudal axis) for the cephalofoil, in fraction, usually between 0 and 1.
#' @param ceph.roll Rotation angle of the cephalofoil around Z axis (cranio-caudal axis). pi/2 for horizontal cephalfoil.
#' @param ceph.pitch Rotation angle of the cephalofoil around the X axis (bilateral axis).
#' @param ceph.thick Maximum thickness of the cephalofoil relative to the chord in percentage.
#' @param cfin.adj.lat Position adjustment along the X axis (bilateral axis) for the caudal fin, in pixels.
#' @param cfin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the caudal fin, in pixels.
#' @param Cfin.File  Name of the image file for the planar silhouette of the caudal fin, without extension.
#' @param cfin.onset Position adjustment along the Z axis (cranio-caudal axis) for the caudal fin, in fraction, usually between 0 and 1.
#' @param cfin.pitch Rotation angle of the caudal fin around the X axis (bilateral axis). Becomes a yaw angle when cfin.roll = pi/2.
#' @param cfin.roll Rotation angle of the caudal fin around Z axis (cranio-caudal axis). 0 for vertical, pi/2 for horizontal fins.
#' @param cfin.thick Maximum thickness of the caudal fin relative to the chord in percentage.
#' @param cfin.yaw Yaw angle of caudal fin around the Y axis (dorso-ventral axis).
#' @param d2fin.adj.up Position adjustment along the Y (dorso-ventral axis) axis for the second dorsal fin, in pixels.
#' @param D2fin.File Name of the image file for the planar silhouette of the second dorsal fin, if any, without extension.
#' @param d2fin.onset Position adjustment along the Z axis ( cranio-caudal axis) for the secod dorsal fin, in fraction, usually between 0 and 1.
#' @param d2fin.pitch Rotation angle of the second dorsal fin around the X axis (bilateral axis).
#' @param d2fin.roll Rotation angle of the second dorsal fin around the Z axis  (cranio-caudal axis).
#' @param d2fin.thick Maximum thickness of the second dorsal fin relative to the chord in percentage.
#' @param dens Arbitrary specific gravity of whole body in g/cm^3.
#' @param dfin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the dorsal fin, in pixels.
#' @param Dfin.File . Name of the image file for the planar silhouette of the dorsal fin, if any, without extension.
#' @param dfin.onset Position adjustment along the Z axis ( cranio-caudal axis) for the dorsal fin, in fraction, usually between 0 and 1.
#' @param dfin.pitch Rotation angle of the dorsal fin around the X axis (bilateral axis).
#' @param dfin.roll Rotation angle of the dorsal fin around Z axis ( cranio-caudal axis). 0 for vertical, pi/2 for horizontal fins.
#' @param dfin.thick Maximum thickness of the dorsal fin relative to the chord in percentage.
#' @param dfin.yaw Yaw angle of dorsal fin around the Y axis (dorso-ventral axis).
#' @param ffin.adj.lat Position adjustment along the X axis (bilateral axis) for the forefin, in pixels.
#' @param ffin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the forefin, in pixels.
#' @param Hfin.File Name of the image file for the planar silhouette of the forefin/pectoral fin/pectoral flipper.
#' @param ffin.onset Position adjustment along the Z axis ( cranio-caudal axis) for the forefin, in fraction, usually between 0 and 1.
#' @param ffin.roll Rotation angle of the forefin around the Z axis ( cranio-caudal axis).
#' @param ffin.pitch Rotation angle of the forefin around the X axis (bilateral axis).
#' @param ffin.thick Maximum thickness of the forefin relative to the chord in percentage.
#' @param ffin.yaw Yaw angle of forefin around the Y axis (dorso-ventral axis).
#' @param File.Ext File extension of the image file. Either ".bmp",".jpg",".png", or "", the last one for without extensions.
#' @param Folder Name of the sub-directory of the working directory storing image files.
#' @param hfin.adj.lat Position adjustment along the X axis (bilateral axis) for the hindfin, in pixels.
#' @param hfin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the hindfin, in pixels.
#' @param Hfin.File Name of the image file for the planar silhouette of the hindfin/pelvic fin/pelvic flipper, without extension.
#' @param hfin.onset Position adjustment along the Z axis ( cranio-caudal axis) for the hindfin, in fraction, usually between 0 and 1.
#' @param hfin.roll Rotation angle of the hindfin around the Z axis ( cranio-caudal axis).
#' @param hfin.pitch Rotation angle of the hindfin around the X axis (bilateral axis).
#' @param hfin.thick Maximum thickness of the hindfin relative to the chord in percentage.
#' @param hfin.yaw Yaw angle of hindfin around the Y axis (dorso-ventral axis).
#' @param Interpolate Logical. Whether to smooth the outline coordinates with local regression. TRUE is recommended.
#' @param Mesh.Col Color of the mesh in rgl window. Not reflected in the saved .ply files.
#' @param N.Body.Slice How to set the number of longitudinal segments. Possible values are: "asis" use the pixel count from input image; "round"(default) round the value to the closest 100; " provided" use the value provided in n.body.slice
#' @param n.body.slice Number of segments along the body axis. Moot unless N.Body.Slice = "provided".
#' @param N.Fin.Slice How to set the number of spanwise segments. Possible values are: "asis" use the pixel count from input image; "round"(default) round the value to the closest 100; " provided" use the value provided in n.fin.slice
#' @param n.fin.slice umber of segments along the span of the fin. Moot unless N.Fin.Slice = "provided".
#' @param N.Mesh.Window A string of "two" or "one". Whether to plot two models side by side in one window or not. One window would often kill R.
#' @param n1 Superelliptical exponent used in the first model. A value of 2.0 is recommended for marine tetrapods.
#' @param n2 Superelliptical exponent used in the second model. A value of 3.0 is recommended for marine tetrapods.
#' @param nn.b Nearest neighbor component of locfit() used for body reconstruction when interpolating.
#' @param nn.f Nearest neighbor component of locfit() used for fin/flipper reconstruction when interpolating.
#' @param Plot.Result.Mesh Logical. Whether to plot resulting meshes.
#' @param Save.Csv Logical. Whether to save a CSV file containing measurement results.
#' @param Save.Part.Mesh Logical. Whether to save .ply files of each body part
#' @param Save.Total.Mesh Logical. Whether to save .ply files of combined body parts.
#' @param Test.Run Whether to set the positions and rotations of fins for a test run
#' @param tip.radius Radius of the tip to be added. A value of 0.0001 is recommended.
#' @param Use.Weight Logical. Whether to add weight to the tips when using locfit()
#'
#' @return A matrix containing measurement results.
#' @import rgl
#' @import Rvcg
#' @importFrom imager load.image
#' @importFrom Morpho rotaxis3d
#' @export
#'
#' @examples # Ichthyosaur Example
#' @examples # Save the silhouette images for Stenopterygius in the current
#' @examples # directory and make 3D models using them.
#' @examples save_Stenopterygius()
#' @examples paleomass()
#' @examples #
#' @examples # Plesiosaur Example
#' @examples # Save the silhouette images for Plesiopterys and make 3D models using them
#' @examples save_Plesiopterys()
#' @examples paleomass(Folder = "Plesiopterys", n1 = 2, n2 = 2.5, body.axis.l = 2.94,
#' @examples     ffin.onset = 0.45, ffin.adj.up = 50, ffin.adj.lat = -100, ffin.pitch = pi/6, ffin.roll = pi/3,
#' @examples     hfin.onset = 0.65, hfin.adj.up = 150, hfin.adj.lat = -200, hfin.pitch =  pi/7,  hfin.roll = pi/4)
#' @examples #
#' @examples # Hammerhead Example
#' @examples # Save the silhouette images for Sphyrna and make 3D models using them
#' @examples save_Sphryna()
#' @examples paleomass(Folder = "Sphyrna", n1 = 1.8, n2 = 2, nn.f = 0.1, body.axis.l = 0.565,
#' @examples     cfin.onset = 0.78, cfin.adj.up = 200, cfin.adj.lat = 0,
#' @examples     cfin.pitch = -pi/4, cfin.thick = 20,
#' @examples     ffin.onset = 0.232, ffin.adj.up = 80, ffin.adj.lat = -120, ffin.thick = 20,
#' @examples     hfin.onset = 0.494, hfin.adj.up = 150, hfin.adj.lat = -100, hfin.thick = 20,
#' @examples     hfin.thick=10,hfin.pitch=pi*10/180,
#' @examples     dfin.onset = 0.274, dfin.adj.up = 0, dfin.thick = 20,
#' @examples     d2fin.onset = 0.626, d2fin.adj.up = 75, d2fin.thick = 10,
#' @examples     afin.onset = 0.603, afin.adj.up = 110, afin.thick = 10,
#' @examples     ceph.roll = pi/2, ceph.adj.up = 150)


paleomass <- function(
    Folder = "Stenopterygius", # Name of the subdirectory storing image files
    File.Ext = c(".png",".jpg",".jpeg",".bmp",""),
                          # file extension of image files. Use "" for no extension
    BodyL.File = "BodyL", # Image file name for body left lateral silhouette
    BodyV.File = "BodyV", # Image file name for body ventral silhouette, front
                          # to left
    Cfin.File = "Cfin",   # Image file name for caudal fin planar silhouette,
                          # front to left
    Dfin.File = "Dfin",   # Image file name for dorsal fin planar silhouette,
                          # front to left
    D2fin.File = "D2fin", # Image file name for second doral  fin planar
                          # silhouette, front to left
    Ffin.File = "Ffin",   # Image file name for forefin/pectoral flipper planar
                          # silhouette, front to left
    Hfin.File = "Hfin",   # Image file name for hindfin/pelvic flipper planar
                          # silhouette, front to left
    Afin.File = "Afin",   # Image file name for anal fin planar silhouette,
                          # front to left
    Ceph.File = "Ceph",   # Image file name for cephalofoil planar silhouette,
                          # front left
    Save.Csv = T,       # Whether to save results in .csv--T or F
    Save.Part.Mesh = F, # Whether to save .ply files of each body part.
    Save.Total.Mesh = T,# Whether to save .ply files of the combined body parts.
    Plot.Result.Mesh = T, # Whether to plot resulting 3D meshes in the end.
    N.Mesh.Window = c("two","one"),
                        # Whether to place two models in one or two windows.
                        # The "one.window" option will crash older computers.
    Mesh.Col="royalblue", # Color of body mesh 3D plot
    n1 = 2.0,           # First superelliptical exponent; 2.0 for ellipse
    n2 = 3.0,           # Second superelliptical exponent; 2.0 for ellipse
    body.axis.l = 1.19, # Actual length represented by body images provided, in m
    dens = 1.027,        # Arbitrary specific gravity of whole body in g/cm^3.
                        # A value of about 1.027 is expected in marine tetrapods
                        # that go up and down in water column, or stay afloat
                        # deeper than water surface.
    Interpolate = T,    # Whether to interpolate with local regression--T or F
    nn.b=0.1,           # Nearest neighbor value for locfit for the body
    nn.f=0.1,           # Nearest neighbor value for locfit for the fins
    Use.Weight = F,      # Whether to add weights to body tips during interpolation
    Add.Tip = T,        # Whether to add tips to body ends for watertightness
    tip.radius = 0.0001,# Arbitrary radius of body tips, if Add.Tip = T
    a.per.slice=181,    # How many vertices around a superellipse per slice
    Body.Y.Centering=T, # Whether to center the body vertically
    N.Body.Slice = c("round", "asis", "provided"),
                        # How to set the number of longitudinal segments.
                        #  * "asis"     Use the pixel count from BodyL.png
                        #  * "round"    (default) round the "asis" value to
                        #               the closest 100
                        #  *" provided" Use the value provided in n.body.slice
    n.body.slice = 3000,  # Arbitrary number of longitudinal segments along body
                        # axis. Determines longitudinal resolution of
                        # output. Moot unless N.Body.Slice is set to "provided".
    N.Fin.Slice = c("asis", "round", "provided"),
                        # How to set the number of longitudinal segments.
                        #  * "asis"     Use the pixel count from BodyL.png
                        #  * "round"    (default) round the "asis" value to
                        #               the closest 100
                        #  *" provided" Use the value provided in n.fin.slice
    n.fin.slice = 500,  # Arbitrary number of spanwise segments along fin
                        # axis. Determines longitudinal resolution of
                        # output. Moot unless N.Fin.Slice is set to "provided".
    cfin.adj.lat = 0,   # Caudal Fin lateral position adjustment, in pixels
    cfin.adj.up = 10,   # Caudal Fin upward position adjustment, in pixels
    cfin.onset = 0.87, # Caudal Fin posterior position adjustment, in fraction
    cfin.roll = 0,      # Caudal Fin rotation around body axis
    cfin.pitch = 0,     # Caudal Fin rotation angle around bilateral axis
    cfin.yaw = 0,       # Caudal fin rotation angle around dorsoventral axis
    cfin.thick = 20,    # Caudal fin maximum thickness percentage rel. chord
    dfin.adj.up = -45,    # Dorsal Fin vertical position adjustment, in pixels
    dfin.onset = 0.501, # Dorsal Fin upward position adjustment, in fraction
    dfin.roll = 0,      # Dorsal Fin rotation around body axis
    dfin.pitch = 0,     # Dorsal Fin rotation angle around bilateral axis
    dfin.yaw = 0,       # Dorsal fin rotation angle around dorsoventral axis
    dfin.thick = 20,    # Dorsal fin maximum thickness percentage rel. chord
    d2fin.adj.up = 0,   # 2nd Dorsal Fin vertical position adjustment, in pixels
    d2fin.onset = 0.6,  # 2nd Dorsal Fin upward position adjustment, in fraction
    d2fin.roll = 0,     # 2nd Dorsal Fin rotation around body axis
    d2fin.pitch = 0,    # 2nd Dorsal Fin rotation angle around bilateral axis
    d2fin.yaw = 0,      # 2nd Dorsal fin rotation angle around dorsoventral axis
    d2fin.thick = 10,   # 2nd Dorsal fin maximum thickness percentage rel. chord
    ffin.adj.lat = -200,# Forefin medial position adjustment, in pixels
    ffin.adj.up = 230 , # Forefin upward position adjustment, in pixels
    ffin.onset = 0.349, # Forefin posterior position adjustment, in pixels
    ffin.roll = pi/4,   # Forefin rotation around body axis
    ffin.pitch = pi/9,  # Forefin rotation angle around bilateral axis
    ffin.thick = 20,    # Forefin maximum thickness percentage rel. chord
    ffin.yaw = 0,       # Forefin rotation angle around dorsoventral axis
    hfin.adj.lat = -150,# Hindfin medial position adjustment, in pixels
    hfin.adj.up = 0,    # Hindfin upward position adjustment, in pixels
    hfin.onset = 0.653, # Hindfin posterior position adjustment, in fraction
    hfin.roll = pi/6,   # Hindfin rotation around body axis
    hfin.pitch = pi/7,  # Hindfin rotation angle around bilateral axis
    hfin.thick = 20,    # Hindfin maximum thickness percentage rel. chord
    hfin.yaw = 0,       # Hindfin rotation angle around dorsoventral axis
    afin.adj.up = 0,    # Anal Fin vertical position adjustment, in pixels
    afin.onset = 0.65,  # Anal Fin upward position adjustment, in fraction
    afin.roll = 0,      # Anal Fin rotation around body axis
    afin.pitch = 0,     # Anal Fin rotation angle around bilateral axis
    afin.thick = 10,    # Anal fin rotation angle around dorsoventral axis
    afin.yaw = 0,       # Anal fin maximum thickness percentage rel. chord
    ceph.adj.up = 0,    # Cephalofoil upward position adjustment, in pixels
    ceph.onset = -0.05, # Cephalofoil posterior position adjustment, in fraction
    ceph.roll = pi/2,   # Cephalofoil rotation angle around body axis
    ceph.pitch = 0,     # Cephalofoil rotation angle around bilateral axis
    ceph.thick = 30,    # Cephalofoil maximum thickness percentage rel. chord
    ceph.yaw = 0,       # Cephalofoil rotation angle around dorsoventral axis
    Test.Run = F)       # Whether to set all positions and rotations for a test
{
  ### Variable settings
  N.Body.Slice <- match.arg(N.Body.Slice)
  N.Fin.Slice <- match.arg(N.Fin.Slice)
  N.Mesh.Window <- match.arg(N.Mesh.Window)
  File.Ext <- match.arg(File.Ext)
  Fname.Add <- "voxelized"
  if(Interpolate) Fname.Add <- "interpolated"
  Clean.Tol <- 2 * (2^0.5) * tip.radius
  qtr.round.pos <- round(a.per.slice/4,0)
  qtr.round.neg <- a.per.slice-qtr.round.pos
  hlf.round <- round(a.per.slice/2,0)
  if(Test.Run) {ceph.onset = 0; ffin.onset = 50; dfin.onset=100;
      d2fin.onset = 150; hfin.onset = 800; afin.onset = 850; cfin.onset = 900;
      cfin.adj.up = 0; cfin.pitch = 0; cfin.roll = 0;
      dfin.adj.up = 0; dfin.pitch = 0;
      d2fin.adj.up = 0; d2fin.pitch = 0; d2fin.roll = 0;
      ffin.adj.lat = 0; ffin.adj.up = 0; ffin.pitch = 0; ffin.roll = 0;
      hfin.adj.lat = 0; hfin.adj.up = 0; hfin.pitch = 0; hfin.roll = 0;
      afin.adj.up = 0; afin.pitch = 0;
      ceph.adj.up = 0; ceph.pitch = 0; ceph.roll = pi/2;
  }

  ### Defining result-saving structure
  Chars <- c("volume [voxel]","area [pixel^2]")
  Chars.Complete <- c("volume [voxel]","area [pixel^2]","volume [m^3]",
                      "area [m^2]","mass.freshwater (kg)",paste0("mass.",dens," (kg)"))
  Parts <- c(paste0("body",n1),paste0("body",n2),"Cfin","Dfin","ffinR","ffinL",
             "hfinR","hfinL","D2fin","afin","ceph")
  Parts.Complete <- c(paste0("Body_n=",n1),paste0("Body_n=",n2),"Caudal_fin",
                      "Dorsal_fin","Forefin_R","Forefin_L","HinDfin_R","HinDfin_L",
                      "2nd_Dorsal_Fin","Anal_Fin","Cephalofoil",paste0("Total_n=",n1),
                      paste0("Total_n=",n2),"Total_mean")
  results <- matrix(,length(Parts),length(Chars),dimnames=(list(Parts,Chars)))

  ### Checking body parts that exist
  BodyL <- file.exists(paste0("./",Folder,"/",BodyL.File,File.Ext))
  BodyV <- file.exists(paste0("./",Folder,"/",BodyV.File,File.Ext))
  Ffin <- file.exists(paste0("./",Folder,"/",Ffin.File,File.Ext))
  Hfin <- file.exists(paste0("./",Folder,"/",Hfin.File,File.Ext))
  Cfin <- file.exists(paste0("./",Folder,"/",Cfin.File,File.Ext))
  Dfin <- file.exists(paste0("./",Folder,"/",Dfin.File,File.Ext))
  D2fin <- file.exists(paste0("./",Folder,"/",D2fin.File,File.Ext))
  Afin <- file.exists(paste0("./",Folder,"/",Afin.File,File.Ext))
  Ceph <- file.exists(paste0("./",Folder,"/",Ceph.File,File.Ext))
  if(BodyL) {print("Body lateral view found")}else{stop("No file for body lateral view")}
  if(BodyV) {print("Body ventral view found")}else{stop("No file for body ventral view")}
  if(Ffin) print("Forefin/pectoral fin/pectoral flipper found")
  if(Hfin) print("Hindfin/pelvic fin/pelvic flipper found")
  if(Cfin) print("Caudal fin found")
  if(Dfin) print("Dorsal fin found")
  if(D2fin) print("Second dorsal fin found")
  if(Afin) print("Anal fin found")
  if(Ceph) print("Cephalofoil found")

  ### Image Reading
  img.lat <- imager::load.image(paste0("./",Folder,"/",BodyL.File,File.Ext))
  img.dv <- imager::load.image(paste0("./",Folder,"/",BodyV.File,File.Ext))
  if(Ffin) img.ff <- imager::load.image(paste0("./",Folder,"/",Ffin.File,File.Ext))
  if(Hfin) img.hf <- imager::load.image(paste0("./",Folder,"/",Hfin.File,File.Ext))
  if(Cfin) img.cf <- imager::load.image(paste0("./",Folder,"/",Cfin.File,File.Ext))
  if(Dfin) img.df <- imager::load.image(paste0("./",Folder,"/",Dfin.File,File.Ext))
  if(D2fin) img.d2 <- imager::load.image(paste0("./",Folder,"/",D2fin.File,File.Ext))
  if(Afin) img.af <- imager::load.image(paste0("./",Folder,"/",Afin.File,File.Ext))
  if(Ceph) img.ce <- imager::load.image(paste0("./",Folder,"/",Ceph.File,File.Ext))

  ### Make the images black and white
  mx.lat <- t(round(img.lat[,,1,1],0))
  mx.dv <- t(round(img.dv[,,1,1],0))
  if(Ffin) mx.ff <- t(round(img.ff[,,1,1],0))
  if(Hfin) mx.hf <- t(round(img.hf[,,1,1],0))
  if(Cfin) mx.cf <- t(round(img.cf[,,1,1],0))
  if(Dfin) mx.df <- t(round(img.df[,,1,1],0))
  if(D2fin) mx.d2 <- t(round(img.d2[,,1,1],0))
  if(Afin) mx.af <- t(round(img.af[,,1,1],0))
  if(Ceph) mx.ce <- t(round(img.ce[,,1,1],0))

  ### Outline Digitization
  dat.lat <- topbottom(mx.lat,Add.Tip=Add.Tip,tip.radius=tip.radius)
  dat.dv <- topbottom(mx.dv,Add.Tip=Add.Tip,tip.radius=tip.radius)
  if(Ffin) dat.ff <- antpost(mx.ff,Add.Tip=Add.Tip,Origin="Bottom")
  if(Hfin) dat.hf <- antpost(mx.hf,Add.Tip=Add.Tip,Origin="Bottom")
  if(Cfin) dat.cf <- antpost(mx.cf,Add.Tip=Add.Tip)
  if(Dfin) dat.df <- antpost(mx.df,Add.Tip=Add.Tip)
  if(D2fin) dat.d2 <- antpost(mx.d2,Add.Tip=Add.Tip)
  if(Afin) dat.af <- antpost(mx.af,Add.Tip=Add.Tip,Origin="Bottom")
  if(Ceph) dat.ce <- antpost(mx.ce,Add.Tip=Add.Tip)

  ### Keeping a record of original body length in pixels
  bal.px <- nrow(dat.lat)
  px.L <- body.axis.l/nrow(dat.lat)
  if(Add.Tip) px.L <- body.axis.l/nrow(dat.lat-2)

  ### Whether to translate all elements vertically to center the body
  y.shift <- 0
  if(Body.Y.Centering) y.shift <- -mean(range(dat.lat[,2:3]))

  ### Interpolation, if Interpolate=TRUE
  if(Interpolate){
    dat.lat <- locfit_interpolate(dat.lat,Nseg=N.Body.Slice,Use.Weight=F,n.out=n.body.slice,nn=nn.b)
    dat.dv <-locfit_interpolate(dat.dv,Nseg=N.Body.Slice,Use.Weight=F,n.out=n.body.slice,nn=nn.b)
    if(Ffin) dat.ff <- locfit_interpolate(dat.ff,Nseg=N.Fin.Slice,n.out=n.fin.slice,nn=nn.f)
    if(Hfin) dat.hf <- locfit_interpolate(dat.hf,Nseg=N.Fin.Slice,n.out=n.fin.slice,nn=nn.f)
    if(Cfin) dat.cf <- locfit_interpolate(dat.cf,Nseg=N.Fin.Slice,n.out=n.fin.slice,nn=nn.f)
    if(Dfin) dat.df <- locfit_interpolate(dat.df,Nseg=N.Fin.Slice,n.out=n.fin.slice,nn=nn.f)
    if(D2fin) dat.d2 <- locfit_interpolate(dat.d2,Nseg=N.Fin.Slice,n.out=n.fin.slice,nn=nn.f)
    if(Afin) dat.af <- locfit_interpolate(dat.af,Nseg=N.Fin.Slice,n.out=n.fin.slice,nn=nn.f)
    if(Ceph) dat.ce <- locfit_interpolate(dat.ce,Nseg=N.Fin.Slice,n.out=n.fin.slice,nn=nn.f)
  }

  ### Body when n=n1
  mesh.body.1 <- mesh_body(dat.lat,dat.dv,nb=n1,X.center=0,Y.center=y.shift,
                           Z.onset=0,a.per.slice=a.per.slice,Mesh.Col=Mesh.Col,tol=Clean.Tol)
  if(Save.Part.Mesh) Rvcg::vcgPlyWrite(mesh.body.1,paste0("./",Folder,"/Body_",n1,"_",
                                 Fname.Add,".ply"),writeCol=F,writeNormals=T)
  results[1,2] <- Rvcg::vcgArea(mesh.body.1)
  try(results[1,1] <- Rvcg::vcgVolume(mesh.body.1))

  ### Body when n=n2
  mesh.body.2 <- mesh_body(dat.lat,dat.dv,nb=n2,X.center=0,Y.center=y.shift,
                           Z.onset=0,a.per.slice=a.per.slice,Mesh.Col=Mesh.Col,tol=Clean.Tol)
  if(Save.Part.Mesh) Rvcg::vcgPlyWrite(mesh.body.2,paste0("./",Folder,"/Body_",n2,"_",
                                 Fname.Add,".ply"),writeCol=F,writeNormals=T)
  results[2,2] <- Rvcg::vcgArea(mesh.body.2)
  try(results[2,1] <- Rvcg::vcgVolume(mesh.body.2))


  ### Caudal Fluke
  # Xc, Yc, Zc    Global coordinates for the caudal fluke.
  # .onset        Anterior margin center of the fluke in global coordinate
  if(Cfin){
    # cfin.atip.y <- floor(colMeans(dat.cf[dat.cf[,2]==min(dat.cf[,2]),])[1])
    cfin.atip.y <- dist(range(dat.cf[,1]))/2
    # cfin.atip.y <- dat.dv[nrow(dat.dv),4]
    cfin.base <- c(0, cfin.adj.up + cfin.atip.y + y.shift, cfin.onset * bal.px)
    Yc.onset <- cfin.base[2] #+dat.lat[nrow(dat.lat),4]
    Xc.onset <- cfin.base[1]
    Zc.onset <- cfin.base[3]
    mesh.cf <- mesh_foil(dat.cf,tf=cfin.thick,X.onset=Xc.onset,Y.onset=Yc.onset,
                         Z.onset=Zc.onset,tol=Clean.Tol,Thickest=0.5,Center=T,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.Cfin <- mesh.cf$Mesh
    ### Fin roll, pitch, and yaw
    #roll
    Mesh.Cfin <- Morpho::rotaxis3d(Mesh.Cfin,cfin.base+c(0,0,100),
                                   cfin.base+c(0,0,-100),cfin.roll)
    #pitch
    Mesh.Cfin <- Morpho::rotaxis3d(Mesh.Cfin,cfin.base+c(100,0,0),
                                   cfin.base+c(-100,0,0),cfin.pitch)
    #yaw
    Mesh.Cfin <- Morpho::rotaxis3d(Mesh.Cfin,cfin.base+c(0,100,0),
                                   cfin.base+c(0,-100,0),cfin.yaw)
    ### Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.Cfin,paste0("./",Folder,"/CaudalFluke_",
                         Fname.Add,".ply"),writeCol=F,writeNormals=F)
    ### Measure
    results[3,2] <- Rvcg::vcgArea(Mesh.Cfin)
    try(results[3,1] <- Rvcg::vcgVolume(Mesh.Cfin))
  }

  ### Dorsal Fin
  # Xd, Yd, Zd    Global coordinates for the dorsal fin.
  # .onset        Antero-ventral corner of the dorsal fin in global coordinate
  if(Dfin){
    dfin.atip.y <- floor(colMeans(dat.df[dat.df[,2]==min(dat.df[,2]),])[1])
    dfin.bheight <- -dat.lat[floor(dfin.onset*bal.px),2] - y.shift
    dfin.base <- c(0, dfin.adj.up + dfin.bheight -dfin.atip.y, dfin.onset * bal.px)
    Zd.onset <- dfin.base[3]
    Xd.onset <- dfin.base[1]
    Yd.onset <- dfin.base[2]
    mesh.df <- mesh_foil(dat.df,tf=dfin.thick,X.onset=Xd.onset,Y.onset=Yd.onset,
                         Z.onset=Zd.onset,tol=Clean.Tol,Thickest=0.1,Center=F,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.Dfin <- mesh.df$Mesh
    ### Fin roll, pitch, and yaw
    #roll
    Mesh.Dfin <- Morpho::rotaxis3d(Mesh.Dfin,dfin.base+c(0,0,100),
                                   dfin.base+c(0,0,-100),dfin.roll)
    #pitch
    Mesh.Dfin <- Morpho::rotaxis3d(Mesh.Dfin,dfin.base+c(100,0,0),
                                   dfin.base+c(-100,0,0),dfin.pitch)
    #yaw
    Mesh.Dfin <- Morpho::rotaxis3d(Mesh.Dfin,dfin.base+c(0,100,0),
                                   dfin.base+c(0,-100,0),dfin.yaw)

    ### Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.Dfin,paste0("./",Folder,"/DorsalFin_",
                         name.Add,".ply"),writeCol=F,writeNormals=F)
    ### Measure
    results[4,2] <- Rvcg::vcgArea(Mesh.Dfin)
    try(results[4,1] <- Rvcg::vcgVolume(Mesh.Dfin))
  }

  ### Dorsal Fin 2 (Second dorsal fin)
  if(D2fin){
    d2fin.atip.y <- floor(colMeans(dat.d2[dat.d2[,2]==min(dat.d2[,2]),])[1])
    d2fin.bheight <- -dat.lat[floor(d2fin.onset*bal.px),2] - y.shift
    d2fin.base <- c(0, d2fin.adj.up + d2fin.bheight -d2fin.atip.y, d2fin.onset * bal.px)
    Zd2.onset <- d2fin.base[3]
    Xd2.onset <- d2fin.base[1]
    Yd2.onset <- d2fin.base[2]
    mesh.d2 <- mesh_foil(dat.d2,tf=d2fin.thick,X.onset=Xd2.onset,Y.onset=Yd2.onset,
                         Z.onset=Zd2.onset,tol=Clean.Tol,Thickest=0.1,Center=F,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.D2fin <- mesh.d2$Mesh
    ### Fin roll, pitch, and yaw
    #roll
    Mesh.D2fin <- Morpho::rotaxis3d(Mesh.D2fin,d2fin.base+c(0,0,100),
                                   d2fin.base+c(0,0,-100),d2fin.roll)
    #pitch
    Mesh.D2fin <- Morpho::rotaxis3d(Mesh.D2fin,d2fin.base+c(100,0,0),
                                   d2fin.base+c(-100,0,0),d2fin.pitch)
    #yaw
    Mesh.D2fin <- Morpho::rotaxis3d(Mesh.D2fin,d2fin.base+c(0,100,0),
                                   d2fin.base+c(0,-100,0),d2fin.yaw)
    ### Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.D2fin,paste0("./",Folder,"/DorsalFin2_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)
    ### Measure
    results[9,2] <- Rvcg::vcgArea(Mesh.D2fin)
    try(results[9,1] <- Rvcg::vcgVolume(Mesh.D2fin))
  }

  ### Anal Fin
  # Xa, Ya, Za    Global coordinates for the anal fin.
  # .onset        Antero-ventral corner of the anal fin in global coordinate
  if(Afin){
    afin.atip.y <- floor(colMeans(dat.af[dat.af[,2]==min(dat.af[,2]),])[1])
    afin.bheight <- -dat.lat[floor(afin.onset*bal.px),3] - y.shift
    afin.base <- c(0, afin.adj.up + afin.bheight -afin.atip.y, afin.onset * bal.px)
    Za.onset <- afin.base[3]
    Xa.onset <- afin.base[1]
    Ya.onset <- afin.base[2]
    mesh.af <- mesh_foil(dat.af,tf=afin.thick,X.onset=Xa.onset,Y.onset=Ya.onset,
                         Z.onset=Za.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.Afin <- mesh.af$Mesh
    ### Fin roll, pitch, and yaw
    #roll
    Mesh.Afin <- Morpho::rotaxis3d(Mesh.Afin,afin.base+c(0,0,100),
                                   afin.base+c(0,0,-100),afin.roll)
    #pitch
    Mesh.Afin <- Morpho::rotaxis3d(Mesh.Afin,afin.base+c(100,0,0),
                                   afin.base+c(-100,0,0),afin.pitch)
    #yaw
    Mesh.Afin <- Morpho::rotaxis3d(Mesh.Afin,afin.base+c(0,100,0),
                                   afin.base+c(0,-100,0),afin.yaw)
    # Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite( Mesh.Afin,paste0("./",Folder,"/AnalFin_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)
    ### Measure
    results[10,2] <- Rvcg::vcgArea( Mesh.Afin)
    try(results[10,1] <- Rvcg::vcgVolume( Mesh.Afin))
  }

  ### Cephalofoil
  # Xe, Ye, Zec    Global coordinates for the cephalofoil
  # .onset        Anterior margin center cephalofoil in global coordinate
  if(Ceph){
    # ceph.atip.y <- floor(colMeans(dat.ce[dat.ce[,2]==min(dat.ce[,2]),])[1])
    # ceph.atip.y <- dist(range(dat.ce[,1]))/2
     ceph.atip.y <- dat.dv[1,4]
    ceph.base <- c(0, ceph.adj.up + ceph.atip.y + y.shift, ceph.onset * bal.px)
    Ye.onset <- ceph.base[2]
    Xe.onset <- ceph.base[1]
    Ze.onset <- ceph.base[3]
    mesh.ce <- mesh_foil(dat.ce,tf=ceph.thick,X.onset=Xe.onset,Y.onset=Ye.onset,
                         Z.onset=Ze.onset,tol=Clean.Tol,Thickest=0.5,Center=T,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col,Cephalofoil=T)
    Mesh.Ceph <- mesh.ce$Mesh
    ### Fin roll, pitch, and yaw
    #roll
    Mesh.Ceph <- Morpho::rotaxis3d(Mesh.Ceph,ceph.base+c(0,0,100),
                                   ceph.base+c(0,0,-100),ceph.roll)
    #pitch
    Mesh.Ceph <- Morpho::rotaxis3d(Mesh.Ceph,ceph.base+c(100,0,0),
                                   ceph.base+c(-100,0,0),ceph.pitch)
    #yaw
    Mesh.Ceph <- Morpho::rotaxis3d(Mesh.Ceph,ceph.base+c(0,100,0),
                                   ceph.base+c(0,-100,0),ceph.yaw)

    Mesh.whole <- merge(mesh.body.1,Mesh.Ceph)
    plot3d(Mesh.whole,col="royalblue",asp="iso")


    ### Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.Ceph,paste0("./",Folder,"/Cephalofoil_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)
    ### Measure
    results[11,2] <- Rvcg::vcgArea(Mesh.Ceph)
    try(results[11,1] <- Rvcg::vcgVolume(Mesh.Ceph))
  }

  ### Forefin
  # Xf, Yf, Zf    Global coordinates for the forefin.
  # .onset        Anterior margin center of the forefin in global coordinate.
  if(Ffin){
    ffin.atip.y <- max(dat.ff[,1])  # front end of the proximal end
    ffin.bheight <- -dat.lat[floor(ffin.onset*bal.px),3] - y.shift
    ffin.bwidth <- -dat.dv[floor(ffin.onset*bal.px),5]
    ffin.base <- c(0, ffin.adj.up + ffin.bheight - ffin.atip.y, ffin.onset * bal.px)
    Zf.onset <- ffin.base[3]
    Xfl.onset <- ffin.base[1] + ffin.bwidth - ffin.adj.lat
    Xfr.onset <- ffin.base[1] - ffin.bwidth + ffin.adj.lat
    Yf.onset <- ffin.base[2]
    mesh.ffr <- mesh_foil(dat.ff,tf=ffin.thick,X.onset=Xfr.onset,Y.onset=Yf.onset,
                          Z.onset=Zf.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                          a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    mesh.ffl <- mesh_foil(dat.ff,tf=ffin.thick,X.onset=Xfl.onset,Y.onset=Yf.onset,
                          Z.onset=Zf.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                          a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.Ffinr <- mesh.ffr$Mesh
    Mesh.Ffinl <- mesh.ffl$Mesh
    ### Left Fin roll, pitch, and yaw
    #roll
    Mesh.Ffinl <- Morpho::rotaxis3d(Mesh.Ffinl,ffin.base+c(0+ffin.bwidth,ffin.atip.y,100),
                                   ffin.base+c(0+ffin.bwidth,ffin.atip.y,-100),ffin.roll)
    #pitch
    Mesh.Ffinl <- Morpho::rotaxis3d(Mesh.Ffinl,ffin.base+c(100,ffin.atip.y,0),
                                   ffin.base+c(-100,ffin.atip.y,0),ffin.pitch)
    #yaw
    Mesh.Ffinl <- Morpho::rotaxis3d(Mesh.Ffinl,ffin.base+c(ffin.bwidth,100,0),
                                   ffin.base+c(ffin.bwidth,-100,0),ffin.yaw)
    ### Right Fin roll, pitch, and yaw
    #roll
    Mesh.Ffinr <- Morpho::rotaxis3d(Mesh.Ffinr,ffin.base+c(-ffin.bwidth,ffin.atip.y,100),
                                   ffin.base+c(-ffin.bwidth,ffin.atip.y,-100),-ffin.roll)
    #pitch
    Mesh.Ffinr <- Morpho::rotaxis3d(Mesh.Ffinr,ffin.base+c(100,ffin.atip.y,0),
                                   ffin.base+c(-100,ffin.atip.y,0),ffin.pitch)
    #yaw
    Mesh.Ffinr <- Morpho::rotaxis3d(Mesh.Ffinr,ffin.base+c(-ffin.bwidth,100,0),
                                   ffin.base+c(-ffin.bwidth,-100,0),-ffin.yaw)

    ### Mesh saving
    if(Save.Part.Mesh) vcgPlyWrite(Mesh.Ffinr,paste0("./",Folder,"/Forefin_R_",Fname.Add,".ply"),
                                   writeCol=F,writeNormals=F)
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.Ffinl,paste0("./",Folder,"/Forefin_L_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)

    ### Measure
    results[6,2] <- results[5,2] <- Rvcg::vcgArea(Mesh.Ffinr)
    try(results[6,1] <- results[5,1] <- Rvcg::vcgVolume(Mesh.Ffinr))
  }

  ### Hindfin
  # Xh, Yh, Zh    Global coordinates for the hinDfin.
  # .onset        Anterior margin center of the hinDfin in global coordinate
  if(Hfin){
    hfin.atip.y <- max(dat.hf[,1])  # front end of the proximal end
    hfin.bheight <- -dat.lat[floor(hfin.onset*bal.px),3] - y.shift
    hfin.bwidth <- -dat.dv[floor(hfin.onset*bal.px),5]
    hfin.base <- c(0, hfin.adj.up + hfin.bheight - hfin.atip.y, hfin.onset * bal.px)
    Zh.onset <- hfin.base[3]
    Xhl.onset <- hfin.base[1] + hfin.bwidth - hfin.adj.lat
    Xhr.onset <- hfin.base[1] - hfin.bwidth + hfin.adj.lat
    Yh.onset <- hfin.base[2]
    mesh.hfr <- mesh_foil(dat.hf,tf=hfin.thick,X.onset=Xhr.onset,Y.onset=Yh.onset,
                          Z.onset=Zh.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                          a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    mesh.hfl <- mesh_foil(dat.hf,tf=hfin.thick,X.onset=Xhl.onset,Y.onset=Yh.onset,
                          Z.onset=Zh.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                          a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.Hfinr <- mesh.hfr$Mesh
    Mesh.Hfinl <- mesh.hfl$Mesh

    ### Left Fin roll, pitch, and yaw
    #roll
    Mesh.Hfinl <- Morpho::rotaxis3d(Mesh.Hfinl,hfin.base+c(0+hfin.bwidth,hfin.atip.y,100),
                                    hfin.base+c(0+hfin.bwidth,hfin.atip.y,-100),hfin.roll)
    #pitch
    Mesh.Hfinl <- Morpho::rotaxis3d(Mesh.Hfinl,hfin.base+c(100,hfin.atip.y,0),
                                    hfin.base+c(-100,hfin.atip.y,0),hfin.pitch)
    #yaw
    Mesh.Hfinl <- Morpho::rotaxis3d(Mesh.Hfinl,hfin.base+c(hfin.bwidth,100,0),
                                    hfin.base+c(hfin.bwidth,-100,0),hfin.yaw)
    ### Right Fin roll, pitch, and yaw
    #roll
    Mesh.Hfinr <- Morpho::rotaxis3d(Mesh.Hfinr,hfin.base+c(-hfin.bwidth,hfin.atip.y,100),
                                    hfin.base+c(-hfin.bwidth,hfin.atip.y,-100),-hfin.roll)
    #pitch
    Mesh.Hfinr <- Morpho::rotaxis3d(Mesh.Hfinr,hfin.base+c(100,hfin.atip.y,0),
                                    hfin.base+c(-100,hfin.atip.y,0),hfin.pitch)
    #yaw
    Mesh.Hfinr <- Morpho::rotaxis3d(Mesh.Hfinr,hfin.base+c(-hfin.bwidth,100,0),
                                    hfin.base+c(-hfin.bwidth,-100,0),-hfin.yaw)

    ### Mesh saving
    if(Save.Part.Mesh) vcgPlyWrite(Mesh.Hfinr,paste0("./",Folder,"/HinDfin_R_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.Hfinl,paste0("./",Folder,"/HinDfin_L_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)

    ### Measure
    results[8,2] <- results[7,2] <- Rvcg::vcgArea(Mesh.Hfinr)
    try(results[8,1] <- results[7,1] <- Rvcg::vcgVolume(Mesh.Hfinr))
  }

  ### Combining measurements
  Results <- cbind(results,results[,1]*(px.L^3),results[,2]*(px.L^2))
  Results <- cbind(Results, Results[,3]*(10^3), Results[,3]*dens*(10^3))
  RESULTS <- rbind(Results, Total_1=colSums(Results[-2,],na.rm=T))
  RESULTS <- rbind(RESULTS, Total_2=colSums(Results[-1,],na.rm=T))
  RESULTS <- rbind(RESULTS, colMeans(tail(RESULTS,2),na.rm=T))
  RESULTS[,1:2] <- round(RESULTS[,1:2],1)
  RESULTS[,3] <- round(RESULTS[,3],6)
  RESULTS[,4] <- round(RESULTS[,4],4)
  RESULTS[,5:6] <- round(RESULTS[,5:6],3)
  dimnames(RESULTS) <- list(Parts.Complete,Chars.Complete)
  print(RESULTS)
  if(Save.Csv)write.csv(RESULTS, paste0("./",Folder,"/Results_",Folder,"_",Fname.Add,".csv"))

  ### Combining meshes and calculate centroids
  Mesh.whole.1 <- mesh.body.1
  if(Ffin) Mesh.whole.1 <- merge(Mesh.whole.1,Mesh.Ffinl,Mesh.Ffinr)
  if(Cfin) Mesh.whole.1 <- merge(Mesh.whole.1,Mesh.Cfin)
  if(Dfin) Mesh.whole.1 <- merge(Mesh.whole.1, Mesh.Dfin)
  if(Hfin) Mesh.whole.1 <- merge(Mesh.whole.1,Mesh.Hfinl,Mesh.Hfinr)
  if(D2fin) Mesh.whole.1 <- merge(Mesh.whole.1,Mesh.D2fin)
  if(Afin) Mesh.whole.1 <- merge(Mesh.whole.1, Mesh.Afin)
  if(Ceph) Mesh.whole.1 <- merge(Mesh.whole.1,Mesh.Ceph)
  Centroid.1 <- round(rowMeans(Mesh.whole.1$vb)[1:3],2)
  Mesh.whole.2 <- mesh.body.2
  if(Ffin) Mesh.whole.2 <- merge(Mesh.whole.2,Mesh.Ffinl,Mesh.Ffinr)
  if(Cfin) Mesh.whole.2 <- merge(Mesh.whole.2,Mesh.Cfin)
  if(Dfin) Mesh.whole.2 <- merge(Mesh.whole.2, Mesh.Dfin)
  if(Hfin) Mesh.whole.2 <- merge(Mesh.whole.2,Mesh.Hfinl,Mesh.Hfinr)
  if(D2fin) Mesh.whole.2 <- merge(Mesh.whole.2,Mesh.D2fin)
  if(Afin) Mesh.whole.2 <- merge(Mesh.whole.2, Mesh.Afin)
  if(Ceph) Mesh.whole.2 <- merge(Mesh.whole.2,Mesh.Ceph)
  Centroid.2 <- round(rowMeans(Mesh.whole.2$vb)[1:3],2)
  if(Save.Total.Mesh){
    Rvcg::vcgPlyWrite(Mesh.whole.1,paste0("./",Folder,"/Combined.",n1,".ply"),
              writeCol=F,writeNormals=F)
    Rvcg::vcgPlyWrite(Mesh.whole.2,paste0("./",Folder,"/Combined.",n2,".ply"),
              writeCol=F,writeNormals=F)
    print("3D meshes have been saved as .ply files.")
  }
  Centroids <-(rbind(Centroid.1,Centroid.2))
  colnames(Centroids) <- c("X","Y","Z")
  print(Centroids)
  if(Save.Csv) write.csv(Centroids,paste0("./",Folder,"/Centroids_",Folder,"_",Fname.Add,".csv"))

  ### 3D plotting of combined meshes
  if(Plot.Result.Mesh){
    rgl::open3d()
    if(N.Mesh.Window=="one"){
      rgl::par3d(windowRect = c(20, 30, 800, 500))
      rgl::layout3d(matrix(seq(1,2),1,2))
    }
    rgl::plot3d(Mesh.whole.1,asp="iso",col=Mesh.Col)
    if(N.Mesh.Window=="two") open3d()
    rgl::plot3d(Mesh.whole.2,asp="iso",col=Mesh.Col)
  }
  return(invisible(RESULTS))
}

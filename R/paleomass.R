#' Main function to build two 3D models from silhouettes of a marine vertebrate in a trial to bracket the body volume and surface area between the two.
#'
#' @param a.per.slice  Number of angular division per superelliptical slice plus 1, that is, how many points are placed around a superellipse with one pair of redundant points. The default value is 181, i.e., there is a point every 2 degrees.
#' @param Add.Tip Logical. Whether to add tips and the two ends of an object. TRUE is recommended to close the holes generated at the tips. If TRUE, then a small circle of a radius specified by tip.radius (0.0001 pixel by default) is added, while the existing points are shifted inward by tip.radius. This affects the shape minimally while closing the tips.
#' @param afin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the anal fin, in pixels.
#' @param Afin.File Name of the image file for the planar silhouette of the anal fin, if any, without extension.
#' @param afin.onset Position adjustment along the Z axis (cranio-caudal axis) for the anal fin, in pixels.
#' @param afin.sweep Sweep angle of the anal fin around the X axis (bilateral axis).
#' @param afin.thick Maximum thickness of the anal fin relative to the chord in percentage.
#' @param Body.Y.Centering Logical. Whether to center the body along the Y axis.
#' @param BodyL.File Name of the image file for the lateral silhouette of the body, without extension.
#' @param BodyV.File Name of the image file for the ventral silhouette of the body, without extension.
#' @param ceph.adj.up Position adjustment along the Y axis (dorso#-ventral axis) for the cephalofoil, in pixels.
#' @param Ceph.File Name of the image file for the planar silhouette of the cephalofoil, if any, without extension.
#' @param ceph.onset Position adjustment along the Z axis (cranio-caudal axis) for the cephalofoil, in pixels.
#' @param ceph.rot Rotation angle of the cephalofoil around Z axis (cranio-caudal axis). pi/2 for horizontal cephalfoil.
#' @param ceph.sweep Sweep angle of the cephalofoil around the X axis (bilateral axis).
#' @param ceph.thick Maximum thickness of the cephalofoil relative to the chord in percentage.
#' @param cfin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the caudal fin, in pixels.
#' @param Cfin.File  Name of the image file for the planar silhouette of the caudal fin, without extension.
#' @param cfin.onset Position adjustment along the Z axis ( cranio-caudal axis) for the caudal fin, in pixels.
#' @param cfin.rot Rotation angle of the caudal fin around Z axis ( cranio-caudal axis). 0 for #’ @param vertical, pi/2 for horizontal fins.
#' @param cfin.sweep Sweep angle of the caudal fin around the X axis (bilateral axis).
#' @param cfin.thick Maximum thickness of the caudal fin relative to the chord in percentage.
#' @param d2fin.adj.up Position adjustment along the Y (dorso-ventral axis) axis for the second dorsal fin, in pixels.
#' @param D2fin.File Name of the image file for the planar silhouette of the second dorsal fin, if any, without extension.
#' @param d2fin.onset Position adjustment along the Z axis ( cranio-caudal axis) for the secod dorsal fin, in pixels.
#' @param d2fin.sweep Sweep angle of the second dorsal fin around the X axis (bilateral axis).
#' @param d2fin.thick Maximum thickness of the second dorsal fin relative to the chord in percentage.
#' @param dens Arbitrary specific gravity of whole body in g/cm^3.
#' @param dfin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the dorsal fin, in pixels.
#' @param Dfin.File . Name of the image file for the planar silhouette of the dorsal fin, if any, without extension.
#' @param dfin.onset Position adjustment along the Z axis ( cranio-caudal axis) for the dorsal fin, in pixels.
#' @param dfin.sweep Sweep angle of the dorsal fin around the X axis (bilateral axis).
#' @param dfin.thick Maximum thickness of the dorsal fin relative to the chord in percentage.
#' @param ffin.adj.med Position adjustment along the X axis (bilateral axis) for the forefin, in pixels.
#' @param ffin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the forefin, in pixels.
#' @param Ffin.File Name of the image file for the planar silhouette of the forefin/pectoral fin/pectoral flipper.
#' @param ffin.onset Position adjustment along the Z axis ( cranio-caudal axis) for the forefin, in pixels.
#' @param ffin.spread Rotation angle of the forefin around the Z axis ( cranio-caudal axis).
#' @param ffin.sweep Sweep angle of the forefin around the X axis (bilateral axis).
#' @param ffin.thick Maximum thickness of the forefin relative to the chord in percentage.
#' @param File.Ext File extension of the image file. Either ".bmp",".jpg",".png", or "", the last one for without extensions.
#' @param Folder Name of the sub-directory of the working directory storing image files.
#' @param fork.l Fork length of the marine vertebrate in meters.
#' @param hfin.adj.med Position adjustment along the X axis (bilateral axis) for the hindfin, in pixels.
#' @param hfin.adj.up Position adjustment along the Y axis (dorso-ventral axis) for the hindfin, in pixels.
#' @param Hfin.File Name of the image file for the planar silhouette of the hindfin/pelvic fin/pelvic flipper, without extension.
#' @param hfin.onset Position adjustment along the Z axis ( cranio-caudal axis) for the hindfin, in pixels.
#' @param hfin.spread Rotation angle of the hindfin around the Z axis ( cranio-caudal axis).
#' @param hfin.sweep Sweep angle of the hindfin around the X axis (bilateral axis).
#' @param hfin.thick Maximum thickness of the hindfin relative to the chord in percentage.
#' @param Interpolate Logical. Whether to smooth the outline coordinates with local regression. TRUE is recommended.
#' @param Mesh.Col Color of the mesh in rgl window. Not reflected in the saved .ply files.
#' @param N.Body.Slice How to set the number of longitudinal segments. Possible values are: "asis"#’ @param #’ @param use the pixel count from input image; "round"(default)#’ @param #’ @param round the value to the closest 100; " provided"#’ @param #’ @param use the value provided in n.body.slice
#' @param n.body.slice Number of segments along the body axis. Moot unless N.Body.Slice = "provided".
#' @param N.Fin.Slice How to set the number of spanwise segments. Possible values are: "asis"#’ @param #’ @param use the pixel count from input image; "round"(default)#’ @param #’ @param round the value to the closest 100; " provided"#’ @param #’ @param use the value provided in n.fin.slice
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
#' @examples # Save the silhouette images for Plesiosaurus and make 3D models using them
#' @examples save_Plesiosaurus()
#' @examples paleomass(Folder="Plesiosaurus",fork.l=2.94,ffin.onset=450,
#' @examples     hfin.onset=650,ffin.adj.med=10,hfin.adj.med=40,ffin.adj.up=-160,
#' @examples     hfin.adj.up=-160,ffin.spread=pi/3,hfin.spread=pi/4)
#' @examples #
#' @examples # Hammerhead Example
#' @examples # Save the silhouette images for Sphyrna and make 3D models using them
#' @examples save_Sphryna()
#' @examples paleomass(Folder="Sphyrna",fork.l=2,n2=1.8,
#' @examples     ffin.onset=300, ffin.adj.up=-120,ffin.adj.med=40,ffin.spread=pi/4,
#' @examples     ffin.sweep=-pi*0/180,
#' @examples     hfin.onset=550,hfin.adj.up=10,hfin.adj.med=40,hfin.spread=pi/4,
#' @examples     hfin.thick=10,hfin.sweep=pi*5/180,
#' @examples     cfin.onset=920,cfin.adj.up=35,
#' @examples     dfin.onset=350,dfin.adj.up=190,dfin.sweep=pi*5/180,
#' @examples     d2fin.onset=800,d2fin.adj.up=200,,d2fin.sweep=pi*5/180,d2fin.thick=10,
#' @examples     afin.onset=800,afin.adj.up=60,afin.sweep=pi*20/180,afin.thick=10,
#' @examples     ceph.onset=-45,ceph.adj.up=120, ceph.rot=pi/2)


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
    n1 = 2.0,           # First superelliptical exponent; 2.0 for ellipse
    n2 = 3.0,           # Second superelliptical exponent; 2.0 for ellipse
    fork.l = 1.19,      # Actual length represented by body images provided, in m
    dens = 0.95,        # Arbitrary specific gravity of whole body in g/cm^3.
                        # A value of about 1 is expected in marine tetrapods
                        # that go up and down in water column, or stay afloat
                        # deeper than water surface.
    Save.Csv = T,       # Whether to save results in .csv--T or F
    Interpolate = T,    # Whether to interpolate with local regression--T or F
    nn.b=0.1,           # Nearest neighbor value for locfit for the body
    nn.f=0.6,           # Nearest neighbor value for locfit for the fins
    Use.Weight = F,      # Whether to add weights to body tips during interpolation
    Add.Tip = T,        # Whether to add tips to body ends for watertightness
    tip.radius = 0.0001,# Arbitrary radius of body tips, if Add.Tip = T
    a.per.slice=181,    # How many vertices around a superellipse per slice
    Plot.Result.Mesh = T, # Whether to plot resulting 3D meshes in the end.
    Save.Part.Mesh = F, # Whether to save .ply files of each body part.
    Save.Total.Mesh = T,# Whether to save .ply files of the combined body parts.
    N.Mesh.Window = c("two","one"),
                        # Whether to place two models in one or two windows.
                        # The "one.window" option will crash older computers.
    Mesh.Col="royalblue", # Color of body mesh 3D plot
    Body.Y.Centering=T, # Whether to center the body vertically
    N.Body.Slice = c("round", "asis", "provided"),
                        # How to set the number of longitudinal segments.
                        #  * "asis"     Use the pixel count from BodyL.png
                        #  * "round"    (default) round the "asis" value to
                        #               the closest 100
                        #  *" provided" Use the value provided in n.body.slice
    n.body.slice = 1000,  # Arbitrary number of longitudinal segments along body
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
    cfin.adj.up = -5,   # Caudal Fin upward position adjustment, in pixels
    cfin.onset = 870,   # Caudal Fin posterior position adjustment, in pixels
    cfin.rot = 0,       # Caudal Fin rotation around body axis
    cfin.sweep = 0,     # Caudal Fin posterior sweep angle
    cfin.thick = 20,    # Caudal fin maximum thickness percentage rel. chord
    dfin.adj.up = 175,  # Dorsal Fin vertical position adjustment, in pixels
    dfin.onset = 440,   # Dorsal Fin upward position adjustment, in pixels
    dfin.sweep = 0,     # Dorsal Fin posterior sweep angle
    dfin.thick = 20,    # Dorsal fin maximum thickness percentage rel. chord
    d2fin.adj.up = 165, # 2nd Dorsal Fin vertical position adjustment, in pixels
    d2fin.onset = 600,  # 2nd Dorsal Fin upward position adjustment, in pixels
    d2fin.sweep = 0,    # 2nd Dorsal Fin posterior sweep angle
    d2fin.thick = 10,   # 2nd Dorsal fin maximum thickness percentage rel. chord
    ffin.spread = pi/4, # Forefin lateral rotation angle
    ffin.sweep = pi/6,  # Forefin posterior rotation angle
    ffin.adj.med = 30,  # Forefin medial position adjustment, in pixels
    ffin.adj.up = -67,  # Forefin upward position adjustment, in pixels
    ffin.onset = 300,   # Forefin posterior position adjustment, in pixels
    ffin.thick = 20,    # Forefin maximum thickness percentage rel. chord
    hfin.spread = pi/6, # HinDfin lateral rotation angle
    hfin.sweep = pi/7,  # HinDfin posterior rotation angle
    hfin.adj.med = 30,  # HinDfin medial position adjustment, in pixels
    hfin.adj.up = -27,  # HinDfin upward position adjustment, in pixels
    hfin.onset = 600,   # HinDfin posterior position adjustment, in pixels
    hfin.thick = 20,    # HinDfin maximum thickness percentage rel. chord
    afin.adj.up = -25,  # Anal Fin vertical position adjustment, in pixels
    afin.onset = 650,   # Anal Fin upward position adjustment, in pixels
    afin.sweep = 0,     # Anal Fin posterior sweep angle
    afin.thick = 10,    # Anal fin maximum thickness percentage rel. chord
    ceph.adj.up = -5,   # Caudal Fin upward position adjustment, in pixels
    ceph.onset = 870,   # Caudal Fin posterior position adjustment, in pixels
    ceph.rot = 0,       # Caudal Fin rotation around body axis
    ceph.sweep = 0,     # Caudal Fin posterior sweep angle
    ceph.thick = 30,    # Cephalofoil maximum thickness percentage rel. chord
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
      cfin.adj.up = 0; cfin.sweep = 0; cfin.rot = 0;
      dfin.adj.up = 0; dfin.sweep = 0;
      d2fin.adj.up = 0; d2fin.sweep = 0; d2fin.spread = 0;
      ffin.adj.med = 0; ffin.adj.up = 0; ffin.sweep = 0; ffin.spread = 0;
      hfin.adj.med = 0; hfin.adj.up = 0; hfin.sweep = 0; hfin.spread = 0;
      afin.adj.up = 0; afin.sweep = 0;
      ceph.adj.up = 0; ceph.sweep = 0; ceph.rot = pi/2;
  }

  ### Defining result-saving structure
  Chars <- c("volume [voxel]","area [pixel^2]")
  Chars.Complete <- c("volume [voxel]","area [pixel^2]","volume [m^3]",
                      "area [m^2]","mass.neutral (kg)",paste0("mass.",dens," (kg)"))
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
  px.L <- fork.l/nrow(dat.lat)
  if(Add.Tip) px.L <- fork.l/nrow(dat.lat-2)

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
  results[1,1] <- Rvcg::vcgVolume(mesh.body.1)

  ### Body when n=n2
  mesh.body.2 <- mesh_body(dat.lat,dat.dv,nb=n2,X.center=0,Y.center=y.shift,
                           Z.onset=0,a.per.slice=a.per.slice,Mesh.Col=Mesh.Col,tol=Clean.Tol)
  if(Save.Part.Mesh) Rvcg::vcgPlyWrite(mesh.body.2,paste0("./",Folder,"/Body_",n2,"_",
                                 Fname.Add,".ply"),writeCol=F,writeNormals=T)
  results[2,2] <- Rvcg::vcgArea(mesh.body.2)
  results[2,1] <- Rvcg::vcgVolume(mesh.body.2)


  ### Caudal Fluke
  # Xc, Yc, Zc    Global coordinates for the caudal fluke.
  # .onset        Anterior margin center of the fluke in global coordinate
  if(Cfin){
    Yc.onset <- dat.lat[nrow(dat.lat),4] + cfin.adj.up + y.shift
    Xc.onset <- 0
    Zc.onset <- cfin.onset
    mesh.cf <- mesh_foil(dat.cf,tf=cfin.thick,X.onset=Xc.onset,Y.onset=Yc.onset,
                         Z.onset=Zc.onset,tol=Clean.Tol,Thickest=0.5,Center=T,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.Cfin <- mesh.cf$Mesh
    ### Fin sweep and rotation
    Xc <- mesh.cf$X
    Yc <- mesh.cf$Y
    Zc <- mesh.cf$Z
    hn.c <- round(ncol(Xc)/2,0)
    Mesh.Cfin <- Morpho::rotaxis3d(Mesh.Cfin,c(Xc[qtr.round.pos,hn.c],Yc[qtr.round.pos,
                         hn.c],Zc[qtr.round.pos,hn.c]),c(Xc[qtr.round.neg,hn.c],Yc[qtr.round.neg,
                                                                                                                           hn.c],Zc[qtr.round.neg,hn.c]),cfin.sweep)
    Mesh.Cfin <- Morpho::rotaxis3d(Mesh.Cfin,c(Xc[1,hn.c],Yc[1,hn.c],Zc[1,hn.c]),
                         c(Xc[hlf.round,hn.c],Yc[hlf.round,hn.c],Zc[hlf.round,hn.c]),cfin.rot)
    ### Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.Cfin,paste0("./",Folder,"/CaudalFluke_",
                         Fname.Add,".ply"),writeCol=F,writeNormals=F)
    ### Measure
    results[3,2] <- Rvcg::vcgArea(Mesh.Cfin)
    results[3,1] <- Rvcg::vcgVolume(Mesh.Cfin)
  }

  ### Dorsal Fin
  # Xd, Yd, Zd    Global coordinates for the dorsal fin.
  # .onset        Antero-ventral corner of the dorsal fin in global coordinate
  if(Dfin){
    Zd.onset <- dfin.onset
    Xd.onset <- 0
    Yd.onset <- dfin.adj.up + y.shift
    mesh.df <- mesh_foil(dat.df,tf=dfin.thick,X.onset=Xd.onset,Y.onset=Yd.onset,
                         Z.onset=Zd.onset,tol=Clean.Tol,Thickest=0.1,Center=F,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.Dfin <- mesh.df$Mesh
    ### Fin sweep and mesh saving
    Xd <- mesh.df$X
    Yd <- mesh.df$Y
    Zd <- mesh.df$Z
    hn.d <- round(ncol(Xd)/2,0)
    Mesh.Dfin <- Morpho::rotaxis3d(Mesh.Dfin,c(Xd[qtr.round.pos,hn.d],Yd[qtr.round.pos,
                         hn.d],Zd[qtr.round.pos,hn.d]),c(Xd[qtr.round.neg,hn.d],Yd[qtr.round.neg,
                                                                                                                           hn.d],Zd[qtr.round.neg,hn.d]),dfin.sweep)
    ### Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.Dfin,paste0("./",Folder,"/DorsalFin_",
                         name.Add,".ply"),writeCol=F,writeNormals=F)
    ### Measure
    results[4,2] <- Rvcg::vcgArea(Mesh.Dfin)
    results[4,1] <- Rvcg::vcgVolume(Mesh.Dfin)
  }

  ### Dorsal Fin 2 (Second dorsal fin)
  if(D2fin){
    Zd2.onset <- d2fin.onset
    Xd2.onset <- 0
    Yd2.onset <- d2fin.adj.up + y.shift
    mesh.d2 <- mesh_foil(dat.d2,tf=d2fin.thick,X.onset=Xd2.onset,Y.onset=Yd2.onset,
                         Z.onset=Zd2.onset,tol=Clean.Tol,Thickest=0.1,Center=F,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.D2fin <- mesh.d2$Mesh
    ### Fin sweep and mesh saving
    Xd2 <- mesh.d2$X
    Yd2 <- mesh.d2$Y
    Zd2 <- mesh.d2$Z
    hn.d2 <- round(ncol(Xd2)/2,0)
    Mesh.D2fin <- Morpho::rotaxis3d(Mesh.D2fin,c(Xd[qtr.round.pos,hn.d2],Yd[qtr.round.pos,
                                                                    hn.d2],Zd[qtr.round.pos,hn.d2]),c(Xd[qtr.round.neg,hn.d2],Yd[qtr.round.neg,
                                                                                                                                 hn.d2],Zd[qtr.round.neg,hn.d2]),dfin.sweep)
    ### Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.D2fin,paste0("./",Folder,"/DorsalFin2_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)
    ### Measure
    results[9,2] <- Rvcg::vcgArea(Mesh.D2fin)
    results[9,1] <- Rvcg::vcgVolume(Mesh.D2fin)
  }

  ### Anal Fin
  # Xa, Ya, Za    Global coordinates for the anal fin.
  # .onset        Antero-ventral corner of the anal fin in global coordinate
  if(Afin){
    Za.onset <- afin.onset
    Xa.onset <- 0
    Ya.onset <- afin.adj.up + y.shift
    mesh.af <- mesh_foil(dat.af,tf=afin.thick,X.onset=Xa.onset,Y.onset=Ya.onset,
                         Z.onset=Za.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.afin <- mesh.af$Mesh
    ### Fin sweep and mesh saving
    Xa <- mesh.af$X
    Ya <- mesh.af$Y
    Za <- mesh.af$Z
    hn.a <- round(ncol(Xa)/2,0)
    Mesh.afin <- Morpho::rotaxis3d(Mesh.afin,c(Xa[qtr.round.pos,hn.a],Ya[qtr.round.pos,
                                                                 hn.a],Za[qtr.round.pos,hn.a]),c(Xa[qtr.round.neg,hn.a],Ya[qtr.round.neg,
                                                                                                                           hn.a],Za[qtr.round.neg,hn.a]),dfin.sweep)
    # Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.afin,paste0("./",Folder,"/AnalFin_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)
    ### Measure
    results[10,2] <- Rvcg::vcgArea(Mesh.afin)
    results[10,1] <- Rvcg::vcgVolume(Mesh.afin)
  }

  ### Cephalofoil
  # Xe, Ye, Zec    Global coordinates for the cephalofoil
  # .onset        Anterior margin center cephalofoil in global coordinate
  if(Ceph){
    Ye.onset <- ceph.adj.up + y.shift
    Xe.onset <- 0
    Ze.onset <- ceph.onset
    mesh.ce <- mesh_foil(dat.ce,tf=ceph.thick,X.onset=Xe.onset,Y.onset=Ye.onset,
                         Z.onset=Ze.onset,tol=Clean.Tol,Thickest=0.5,Center=T,
                         a.per.slice=a.per.slice,Mesh.Col=Mesh.Col,Cephalofoil=T)
    Mesh.ceph <- mesh.ce$Mesh
    ### Cephalofoil sweep and rotation
    Xe <- mesh.ce$X
    Ye <- mesh.ce$Y
    Ze <- mesh.ce$Z
    hn.e <- round(ncol(Xe)/2,0)
    Mesh.ceph <- Morpho::rotaxis3d(Mesh.ceph,c(Xe[qtr.round.pos,hn.e],Ye[qtr.round.pos,
                                                                 hn.e],Ze[qtr.round.pos,hn.e]),c(Xe[qtr.round.neg,hn.e],Ye[qtr.round.neg,
                                                                                                                           hn.e],Ze[qtr.round.neg,hn.e]),ceph.sweep)
    Mesh.ceph <- Morpho::rotaxis3d(Mesh.ceph,c(Xe[1,hn.e],Ye[1,hn.e],Ze[1,hn.e]),
                           c(Xe[hlf.round,hn.e],Ye[hlf.round,hn.e],Ze[hlf.round,hn.e]),ceph.rot)
    ### Mesh saving
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.ceph,paste0("./",Folder,"/Cephalofoil_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)
    ### Measure
    results[11,2] <- Rvcg::vcgArea(Mesh.ceph)
    results[11,1] <- Rvcg::vcgVolume(Mesh.ceph)
  }

  ### Forefin
  # Xf, Yf, Zf    Global coordinates for the forefin.
  # .onset        Anterior margin center of the forefin in global coordinate.
  if(Ffin){
    Zf.onset <- ffin.onset
    zf.onset <- match(Zf.onset,round(dat.dv[,1],0))
    Xfl.onset <- dat.dv[zf.onset,3]-dat.dv[1,4]+ffin.adj.med
    Xfr.onset <- dat.dv[zf.onset,2]-dat.dv[1,4]-ffin.adj.med
    # Yf.onset <- dat.lat[zf.onset,3]+ffin.adj.up + y.shift
    Yf.onset <- ffin.adj.up + y.shift
    mesh.ffr <- mesh_foil(dat.ff,tf=ffin.thick,X.onset=Xfr.onset,Y.onset=Yf.onset,
                          Z.onset=Zf.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                          a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    mesh.ffl <- mesh_foil(dat.ff,tf=ffin.thick,X.onset=Xfl.onset,Y.onset=Yf.onset,
                          Z.onset=Zf.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                          a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.ffinr <- mesh.ffr$Mesh
    Mesh.ffinl <- mesh.ffl$Mesh
    Xfl <- mesh.ffl$X
    Xfr <- mesh.ffr$X
    Yf <- mesh.ffr$Y
    Zf <- mesh.ffr$Z
    n.ff <- ncol(Yf)

    ### Right fin sweep, rotation, and mesh saving
    Mesh.ffinr <- Morpho::rotaxis3d(Mesh.ffinr,c(Xfr[1,n.ff],Yf[1,n.ff],Zf[1,n.ff]),
                            c(Xfl[1,n.ff],Yf[1,n.ff],Zf[1,n.ff]),ffin.sweep)
    Mesh.ffinr <- Morpho::rotaxis3d(Mesh.ffinr,c(Xfr[1,n.ff],Yf[1,n.ff],Zf[1,n.ff]),
                            c(Xfr[91,n.ff],Yf[91,n.ff],Zf[91,n.ff]),ffin.spread)
    if(Save.Part.Mesh) vcgPlyWrite(Mesh.ffinr,paste0("./",Folder,"/Forefin_R_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)

    ### Left fin sweep, rotation, and mesh saving
    Mesh.ffinl <- Morpho::rotaxis3d(Mesh.ffinl,c(Xfl[1,n.ff],Yf[1,n.ff],Zf[1,n.ff]),
                            c(Xfr[1,n.ff],Yf[1,n.ff],Zf[1,n.ff]),-ffin.sweep)
    Mesh.ffinl <- Morpho::rotaxis3d(Mesh.ffinl,c(Xfl[1,n.ff],Yf[1,n.ff],Zf[1,n.ff]),
                            c(Xfl[91,n.ff],Yf[91,n.ff],Zf[91,n.ff]),-ffin.spread)
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.ffinl,paste0("./",Folder,"/Forefin_L_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)

    ### Measure
    results[6,2] <- results[5,2] <- Rvcg::vcgArea(Mesh.ffinr)
    results[6,1] <- results[5,1] <- Rvcg::vcgVolume(Mesh.ffinr)
  }

  ### HinDfin
  # Xh, Yh, Zh    Global coordinates for the hinDfin.
  # .onset        Anterior margin center of the hinDfin in global coordinate
  if(Hfin){
    Zh.onset <- hfin.onset
    zh.onset <- match(Zh.onset,round(dat.dv[,1],0))
    Xhl.onset <- dat.dv[zh.onset,3]-dat.dv[1,4]+hfin.adj.med
    Xhr.onset <- dat.dv[zh.onset,2]-dat.dv[1,4]-hfin.adj.med
    # Yh.onset <- dat.lat[zh.onset,3] + hfin.adj.up + y.shift
    Yh.onset <- hfin.adj.up + y.shift
    mesh.hfr <- mesh_foil(dat.hf,tf=hfin.thick,X.onset=Xhr.onset,Y.onset=Yh.onset,
                          Z.onset=Zh.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                          a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    mesh.hfl <- mesh_foil(dat.hf,tf=hfin.thick,X.onset=Xhl.onset,Y.onset=Yh.onset,
                          Z.onset=Zh.onset,tol=Clean.Tol,Thickest=0.9,Center=F,
                          a.per.slice=a.per.slice,Mesh.Col=Mesh.Col)
    Mesh.hfinr <- mesh.hfr$Mesh
    Mesh.hfinl <- mesh.hfl$Mesh
    Xhl <- mesh.hfl$X
    Xhr <- mesh.hfr$X
    Yh <- mesh.hfr$Y
    Zh <- mesh.hfr$Z
    n.hf <- ncol(Yh)

    #Right fin sweep, rotation, and mesh saving
    Mesh.hfinr <- Morpho::rotaxis3d(Mesh.hfinr,c(Xhr[1,n.hf],Yh[1,n.hf],Zh[1,n.hf]),
                            c(Xhl[1,n.hf],Yh[1,n.hf],Zh[1,n.hf]),hfin.sweep)
    Mesh.hfinr <- Morpho::rotaxis3d(Mesh.hfinr,c(Xhr[1,n.hf],Yh[1,n.hf],Zh[1,n.hf]),
                            c(Xhr[91,n.hf],Yh[91,n.hf],Zh[91,n.hf]),hfin.spread)
    if(Save.Part.Mesh) vcgPlyWrite(Mesh.hfinr,paste0("./",Folder,"/HinDfin_R_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)

    #Left fin sweep, rotation, and mesh saving
    Mesh.hfinl <- Morpho::rotaxis3d(Mesh.hfinl,c(Xhl[1,n.hf],Yh[1,n.hf],Zh[1,n.hf]),
                            c(Xhr[1,n.hf],Yh[1,n.hf],Zh[1,n.hf]),-hfin.sweep)
    Mesh.hfinl <- Morpho::rotaxis3d(Mesh.hfinl,c(Xhl[1,n.hf],Yh[1,n.hf],Zh[1,n.hf]),
                            c(Xhl[91,n.hf],Yh[91,n.hf],Zh[91,n.hf]),-hfin.spread)
    if(Save.Part.Mesh) Rvcg::vcgPlyWrite(Mesh.hfinl,paste0("./",Folder,"/HinDfin_L_",Fname.Add,".ply"),
                writeCol=F,writeNormals=F)

    ### Measure
    results[8,2] <- results[7,2] <- Rvcg::vcgArea(Mesh.hfinr)
    results[8,1] <- results[7,1] <- Rvcg::vcgVolume(Mesh.hfinr)
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
  Mesh.fins <- merge(Mesh.ffinl,Mesh.ffinr)
  if(Cfin) Mesh.fins <- merge(Mesh.fins,Mesh.Cfin)
  if(Dfin) Mesh.fins <- merge(Mesh.fins, Mesh.Dfin)
  if(Hfin) Mesh.fins <- merge(Mesh.fins,Mesh.hfinl,Mesh.hfinr)
  if(D2fin) Mesh.fins <- merge(Mesh.fins,Mesh.D2fin)
  if(Afin) Mesh.fins <- merge(Mesh.fins,Mesh.afin)
  if(Ceph) Mesh.fins <- merge(Mesh.fins,Mesh.ceph)
  Mesh.whole.1 <- merge(mesh.body.1,Mesh.fins)
  Centroid.1 <- round(rowMeans(Mesh.whole.1$vb)[1:3],2)
  Mesh.whole.2 <- merge(mesh.body.2,Mesh.fins)
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

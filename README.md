# Paleomass

R package for volume and surface area estimation of vertebrates through 3D models with superelliptical cross-sections

## What it does

This package first builds two 3D models of a marine vertebrate based on two orthogonal body silhouettes and planar views of the flippers and fins, supplied as image files. The true volume and surface area of the animal is expected to be bracketed between those of the two models. The two models have superelliptical cross-sections for the body but they differ in the superellipticla exponent. Flippers are modeled with NACA00XX foil sections. Details of the principle and its test are given in:

Motani, R. Estimating body mass from silhouettes: Testing the assumption of elliptical body cross-sections. Paleobiology 27, 735–750 (2001).   
[Link](https://doi.org/10.1666/0094-8373(2001)027%3C0735:EBMFST%3E2.0.CO;2)  
[PDF](./img/Motani_2001_Body_Mass.pdf)

## Quick Start

### Simplest Example Run

1. Load the paleomass package in R.  
`library(paleomass)`
2. If you haven't, move to the working directory that you want to use.  
`setwd("YourDirectory")`
3. Save example data on your hard drive.  
`save_Stenopterygius()`
4. Run paleomass.   
`paleomass()`
5. You will have the 3D models displayed and also saved as .ply files, so that  you can open it later in software of your choice.
![Image](./img/Stenopterygius.jpg "3D models displayed in an rgl window of R")
6. You will also get calculation results displayed and also save in .csv files.
![Image](./img/Stenopterygius_result.jpg "3D models displayed in an rgl window of R")  
![Image](./img/Stenopterygius_centroid.jpg "3D models displayed in an rgl window of R")


### Plesiosaur Example Run

1. As in the simplest example above.
2. As in the simplest example above.
3. Save Plesiosaurus example files.  
`save_Plesiosaurus()`
4. Run paleomass. You need to specify the data folder, length of the animal, and the positions/rotations of the flippers as below.  
`paleomass(Folder = "Plesiosaurus", fork.l = 2.94, Cfin = F, Dfin = F, ffin.onset = 450, hfin.onset = 650, ffin.adj.med = 10, hfin.adj.med = 40, ffin.adj.up = -160, hfin.adj.up = -160, ffin.sweep = pi/6, hfin.sweep =  pi/7, ffin.spread = pi/3, hfin.spread = pi/4)`
5. You will get estiamted volumes and surface areas, as well as the 3D models. Apart from being displayed in R, the values are saved in a .csv file while the models are saved as .ply files so that you can open it later in software of your choice.
![Image](./img/Plesiosaurus.jpg "3D models displayed in an rgl window of R")


### Hammerhead Example Run

1. As in the simplest example above.
2. As in the simplest example above.
3. Save Plesiosaurus example files.  
`save_Sphyrna()`
4. Run paleomass. You need to specify the data folder, length of the animal, and the positions/rotations of the paired fins, median fins, and cephalofoil as below.  
`paleomass(Folder="Sphyrna", fork.l = 2, n2 = 1.8, Afin = T, D2fin = T, Ceph = T, ffin.onset = 300, ffin.adj.up = -120, ffin.adj.med = 40, ffin.spread = pi/4, ffin.sweep = -pi*0/180, hfin.onset = 550, hfin.adj.up = 10, hfin.adj.med = 40, hfin.spread = pi/4, hfin.thick = 10, hfin.sweep = pi*5/180, cfin.onset = 920, cfin.adj.up = 35, dfin.onset = 350, dfin.adj.up = 190, dfin.sweep = pi*5/180, d2fin.onset = 800, d2fin.adj.up = 200, d2fin.sweep=pi*5/180, d2fin.thick=10, afin.onset = 800, afin.adj.up = 60, afin.sweep = pi*20/180, afin.thick = 10, ceph.onset = -45, ceph.adj.up = 120, ceph.rot = pi/2)`
5. You will get estiamted volumes and surface areas, as well as the 3D models. Apart from being displayed in R, the values are saved in a .csv file while the models are saved as .ply files so that you can open it later in software of your choice.
![Image](./img/Sphyrna.jpg "3D models displayed in an rgl window of R")

## Step by step guide
### 1. Prepare body silhouette images

Make sure of the following when preparing silhouette images.
- Draw all body parts at the right scale relative to each other.
- Orient all body parts so that the left is anterior and right is posterior.
- Orient lateral-view silhouettes so that the top is dorsal and bottom is ventral.
- When saving, adjust the resolution so that the body length is about 1000 pixels or greater. Save the fins with the same resolution,i.e., they are smaller than 1000 pixels across.

Motani (2001: Fig. 5) found that the accuracy improves up to about 1000 pixels and then the improvement slows down quickly.

Here is an examle of how the body parts of Plesiosaurus was separated. I used CorelDraw to do this but it can be any drawing software.
![Image](./img/Plesiosaurus_parts.jpg "Silhouettes of Plesiosaurus")

Anotehr example here, of how the hammer head body parts were separated. 
![Image](./img/Sphyrna_parts.jpg "Silhouettes of hammerhead")

Each of these body parts were exported an image file separately. When saving the images, it is easiest to name them following the convention below:
- BodyL.png .....Lateral silhouette of the body.
- BodyV.png .....Ventral silhouette of the body.
- Cfin.png ......Caudal fin planar silhouette.
- Dfin.png ......Dorsal fin planar silhouette.
- Ffin.png ......Forefin/pectoral fin/pectoral flipper planar silhouette.
- Hfin.png ......Hindfin/pelvic fin/pelvic flipper planar silhouette.
- D2fin.png .....Second doral fin planar silhouette.
- Afin.png ......Anal fin planar silhouette.
- Ceph.png ......Cephalofoil planar silhouette.

### 2. Place silhouette images in a sub-directory
Once the silhouette images are made, make a sub-directory within your working directory and place them there. The name of this directory becomes the folder name used in the paleomass() command.

### 3. Test run
Next step is to test run the files. For example, for Plesiosaurus, try:  
`paleomass(Folder = "Plesiosaurus", Dfin = F, Cfin = F)`

The last two options are there because Plesiosaurus lacks the dorsal and caudal fins. If you forget to specify them, paleomass will look for the images files for these fins and complain that there is no file. 

This command will result in a 3D model where all body parts are not placed in the right position or orientation.  

![Image](./img/Plesiosaurus_initial.jpg "Test run result")

As you can tell from this image, the flippers are placed and roated as in the default model of *Stenopterygius*. That is not very helpful in the next step, when you need to adjust positions and angles. So let us try another run, where all the positoin variables are set to 0:  
`paleomass(Folder = "Plesiosaurus", Dfin = F, Cfin = F, Test.Run=T)`

Note that all position and angle variables are set to 0 except the positions along the Z axis (=body axis), so as to make it easy for the next step. Fins are spread along the body axis for easier viewing. 

![Image](./img/Plesiosaurus_test.jpg "Test run result")

Don't close the 3D dsiplay window because you can eyeball the position of each elements with it in the next step.


### 4. Adjust the positions of body parts
Now you can adjust the position of the flippers and fins relative to the body. There are three kinds of options per fin, although not all three are available for all fins. These are:
- .onset .....Position adjustment along the Z axis (=body axis)
- .adj.up ....Position adjustment along the Y axis (=dorso-ventral axis)
- .adj.med ...Position adjustment along the X axis (=bilateral axis)

In the Plesiosaurus example, you can tell from the image above that the pectoral flipper should be placed around the z coordinate 450, and the pelvic flipper around 650. These values are counted in the pixels of the original input images. This results in two options:  
`ffin.onset = 450, hfin.onset = 650`

The flippers should move ventrally by about 160, resulting in the options:  
`ffin.adj.up = -160, hfin.adj.up = -160`

The flippers should move laterally, so:  
`ffin.adj.med = 10, hfin.adj.med = 40`

### 5. Adjust the angles of body parts
Nex is the adjustment of angles. You can adjust two kinds of angles per fin, although not both are available for all fins.
- .sweep .....Rotation along the X axis (=bilateral axis) that makes the fins sweep back and forth.
- .spread ....Rotation along the Z axis (=body axis) that makse the fins spread outwards or inwards.

The pectoral flippers should be swept back by about 30 degrees, and the pelvic ones a little less, resuting in the options  
`ffin.sweep = pi/6, hfin.sweep =  pi/7`

The pectoral flippers shoudl spread out by about 60 degrees and the pelvic ones about 45 degrees (your preference), resulting in teh options:  
`ffin.spread = pi/3, hfin.spread = pi/4` 

### 6. Run the command again with new options
Now that you have updated option values, let us try running paleomass again. Make sure to input everything you listed above.  
`paleomass(Folder = "Plesiosaurus", fork.l = 2.94, Cfin = F, Dfin = F, ffin.onset = 450, hfin.onset = 650, ffin.adj.med = 10, hfin.adj.med = 40, ffin.adj.up = -160, hfin.adj.up = -160, ffin.sweep = pi/6, hfin.sweep =  pi/7, ffin.spread = pi/3, hfin.spread = pi/4)`

### 7. Re-adjustment
After step 6, you probably found that the result is satisfactory. If not, it is up to you to adjust the position.

### 8. Final notes
Remember, positions and rotations do not affect the volume estimates at this point, since there is no R function to enable 3D union of meshes easily. There is a Linux-based package rvtkStatismo that implements such a funciton but it is not for everybody.

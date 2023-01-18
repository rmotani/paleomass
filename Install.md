# Installation of the Paleomass package

## Option 1.
Install from the pakcage file. 

-Windows binary package is available [here.](./paleomass_0.9.7.0000.zip)   

-Source package is available [here.](./paleomass_0.9.7.0000.tar.gz)

In RStudio, open the package installtion dialog. In the top pulldown menu named "Install from" choose "Package Archive File". Make sure to install dependencies. 

If dependencies are not installed automatically, make sure to have the following packages:
- imager
- locfit
- Morpho
- plot3D (note the captial D)
- rgl
- Rvcg


## Option 2.
Not available yet. Once the repository is public, try:

``` 
`library(devtools)
`devtools::install_github("rmotani/paleomass")`
```


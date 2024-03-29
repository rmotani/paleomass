% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mesh_nan_replace.R
\name{mesh_nan_replace}
\alias{mesh_nan_replace}
\title{Remove NaNs from coordinates of a mesh3d object.}
\usage{
mesh_nan_replace(Mesh, tip.radius = 1e-04, Fix.Tip = F, a.per.slice = 181)
}
\arguments{
\item{Mesh}{A mesh3d object containing NaNs in coordinates}

\item{tip.radius}{radius of the tip when fixing tips}

\item{Fix.Tip}{Logical. Whether to fix the tips.}

\item{a.per.slice}{Number of angular segments in a cross-section.}
}
\value{
A mesh 3D objects with NaNs replaced by nearest coordinates
}
\description{
Remove NaNs from coordinates of a mesh3d object.
}
\examples{
Used by paleomass()
}

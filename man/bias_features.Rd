% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bias_feature.R
\name{bias_features}
\alias{bias_features}
\title{Extract Bias Features from Occurrence Records}
\usage{
bias_features(
  x,
  species = "species",
  lon = "decimallongitude",
  lat = "decimallatitude",
  res = 0.5,
  ras = NULL,
  plot = TRUE
)
}
\arguments{
\item{x}{a data.frame of species occurrence records including three columns with
species name, longitudinal coordinates and latitudinal coordinates (both decimal).}

\item{species}{a character string. The name of the column with the species names.}

\item{lon}{a character string. The name of the column with the longitude.}

\item{lat}{a character string. The name of the column with the latitude.}

\item{res}{numeric. The resolution of the default resolution to calculate sampling bias. In decimal degrees.}

\item{ras}{a raster object. Alternative to res, a sample raster to calculate sampling bias. Needs to use the same CRS as
the coordinates in x.
'@param plot logical. Should the results of the sampbias analysis be plotted for diagnostics?}
}
\value{
a data.frame of bias features
}
\description{
Use the sampbias method to assess the geographic sampling bias at the locations where a species is collected and the range of
sampling bias for all records per species.Values summarized per species are the median and the 0.05 to 0.95 percentiles.
}
\details{
See the ?sampbias::calcualte_bias for details.
}
\examples{
\dontrun{
dat <- data.frame(species = "A",
                decimallongitude = runif (200,-5,5),
                decimallatitude = runif (200,-5,5))

bias_features(dat)
}


}
\seealso{
Other Feature preparation: 
\code{\link{biome_features}()},
\code{\link{bnn_load_data}()},
\code{\link{clim_features}()},
\code{\link{footprint_features}()},
\code{\link{geo_features}()}
}
\concept{Feature preparation}
\keyword{Feature}
\keyword{preparation}

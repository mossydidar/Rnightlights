% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stats.R
\name{fnAggRadGdal}
\alias{fnAggRadGdal}
\title{Calculate zonal statistics using GDAL}
\usage{
fnAggRadGdal(ctryCode, admLevel, ctryPoly, nlType,
  configName = pkgOptions(paste0("configName_", nlType)),
  multiTileStrategy = pkgOptions("multiTileStrategy"),
  multiTileMergeFun = pkgOptions("multiTileMergeFun"),
  removeGasFlares = pkgOptions("removeGasFlares"), nlPeriod,
  nlStats = pkgOptions("nlStats"),
  gadmVersion = pkgOptions("gadmVersion"),
  gadmPolyType = pkgOptions("gadmPolyType"), custPolyPath = NULL)
}
\arguments{
\item{ctryCode}{character string the ISO3 country code to be processed}

\item{admLevel}{character string The admin level to process. Should match
the \code{ctryPoly} given but no checks are made currently.}

\item{ctryPoly}{Polygon the loaded country polygon layer}

\item{nlType}{the nlType of interest}

\item{configName}{character the type of raster being processed}

\item{multiTileStrategy}{character How to handle multiple tiles per nlPeriod}

\item{multiTileMergeFun}{character The function to use to merge tiles}

\item{removeGasFlares}{logical Whether to perform gas flare removal pre-processing}

\item{nlPeriod}{character string the nlPeriod to be processed}

\item{nlStats}{character vector The stats to calculate}

\item{gadmVersion}{The GADM version to use}

\item{gadmPolyType}{The format of polygons to download from GADM}

\item{custPolyPath}{Alternative to GADM. A path to a custom shapefile zip}
}
\value{
data.frame of polygon attributes and the calculated stats, one column per stat
}
\description{
Calculate zonal statistics using GDAL. Alternative to fnAggRadRast and 
    faster. Modified from 
    \url{http://www.guru-gis.net/efficient-zonal-statistics-using-r-and-gdal/}
}
\examples{
#read the Kenya polygon downloaded from GADM and load the lowest admin level (ward)
\dontrun{
ctryPoly <- readCtryPolyAdmLayer(ctryCode="KEN", 
    Rnightlights:::getCtryShpLowestLyrNames(ctryCodes="KEN"))
    
#calculate the sum of radiances for the wards in Kenya
sumAvgRadRast <- Rnightlights:::fnAggRadGdal(ctryCode="KEN", ctryPoly=ctryPoly,
    nlType="VIIRS.M", nlPeriod="201401", nlStats=c("sum","mean"))
}

}

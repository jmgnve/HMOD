% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_wrapper.R
\name{gr4j_wrapper}
\alias{gr4j_wrapper}
\title{Wrapper for running hydrological model}
\usage{
gr4j_wrapper(indata)
}
\arguments{
\item{indata}{A list with the following items:

\itemize{
  \item \code{Prec} Vector with precipitation, dimensions Ntimes
  \item \code{PET} Vector with potential evapotranspiration, dimensions Ntimes
  \item \code{St} Initial state of storages
  \item \code{StUH1} Initial state of first unit hydrograph
  \item \code{StUH2} Initial state of second unit hydrograph
  \item \code{Param} Model parameters
}}
}
\value{
A list with state variables and simulated runoff
}
\description{
The hydrological model is the GR4J model.
}
\examples{

iwsh <- 3

indata = list(Prec   = rowMeans(sample_data[[iwsh]]$Prec),
              PET    = rep(0, nrow(sample_data[[iwsh]]$Prec)),
              St     = matrix(0, nrow = 2, ncol = 1),
              StUH1  = matrix(0, 20, ncol = 1),
              StUH2  = matrix(0, 40, ncol = 1),
              Param  = c(74.59, 0.81, 214.98, 1.24))

res_sim <- gr4j_wrapper(indata)

plot(res_sim$Q, col = 'red', type ="l")

}


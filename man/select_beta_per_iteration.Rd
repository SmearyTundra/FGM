% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extraction_JAGS.R
\name{select_beta_per_iteration}
\alias{select_beta_per_iteration}
\title{Select a specific sample iteration of beta}
\usage{
select_beta_per_iteration(output, index, n.iter)
}
\arguments{
\item{output}{The JAGS output.}

\item{index}{This indicates the sample unit which needs to be considered.}

\item{n.iter}{Iteration at which you want to extract the beta sampling.}
}
\value{
A 1xp dataframe with the desired draw of the simulation.
}
\description{
Function that extracts the sampling of beta related to the i-th curve at
a specific iteration.
}

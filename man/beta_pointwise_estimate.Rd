% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/beta_manipulation.R
\name{beta_pointwise_estimate}
\alias{beta_pointwise_estimate}
\title{Compute pointwise estimate of beta}
\usage{
beta_pointwise_estimate(beta, p)
}
\arguments{
\item{beta}{The list of beta coming from select_all_beta function or a
dataframe corresponding to a specific curve.}

\item{p}{The number of basis.}
}
\value{
An nxp matrix containing the pointwise estimate of each beta or
a p vector in case a single beta dataframe is passed as input.
}
\description{
This function provides the pointwise estimate of any beta w.r.t. the usual
quadratic loss function.
}

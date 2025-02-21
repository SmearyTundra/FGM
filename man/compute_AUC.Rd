% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_selection.R
\name{compute_AUC}
\alias{compute_AUC}
\title{Compute AUC Index}
\usage{
compute_AUC(x, y)
}
\arguments{
\item{x}{Numeric vector of length \code{n}}

\item{y}{Numeric vector of length \code{n}}
}
\value{
A numeric value which is the area under the ROC curve.
}
\description{
Function to compute the area under ROC curve exploiting trapezoidal rule.
}

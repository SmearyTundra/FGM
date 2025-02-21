% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_selection.R
\name{threshold_analysis}
\alias{threshold_analysis}
\title{Multiple a posteriori model selection}
\usage{
threshold_analysis(PL, G_true, tol = seq(0.1, 1, by = 0.05),  min_rate = 0.05, ROC = FALSE)
}
\arguments{
\item{PL}{The posterior probability of inclusion of each link according to \code{\link{FGM_sampler}}.
It should be an upper diagonal matrix.}

\item{G_true}{The true graph.}

\item{tol}{The sequence of thresholds, used to select a graph truncating PL at that value.}

\item{min_rate}{The upper bound for the false discoveries.}

\item{ROC}{Boolean parameter. If \code{TRUE}, the plot the ROC curve is showed.}
}
\value{
A list with the outputs of sensitivity, hamming distance and FDR analysis.
}
\description{
This function performs in a single call the sensitivity, the hamming distance,and the FDR analysis.
See \code{\link{misclass_analysis}}, \code{\link{hamming_distance_analysis}} and \code{\link{FDR_analysis}} for information.
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bdgraph.R
\name{bdgraph}
\alias{bdgraph}
\title{BDgraph function for sampling from GGM}
\usage{
bdgraph(
  data,
  n = NULL,
  method = "ggm",
  algorithm = "bdmcmc",
  iter = 5000,
  burnin = iter/2,
  not.cont = NULL,
  g.prior = 0.5,
  df.prior = 3,
  CCG_D = NULL,
  g.start = "empty",
  jump = NULL,
  save = FALSE,
  print = 1000,
  cores = NULL,
  threshold = 1e-08
)
}
\arguments{
\item{g.prior}{May take a single value, a full pxp matrix or a vector of length 2. The first two cases refer to a Bernoulli prior where the parameter is equal for all the possible links (first case)
or it is link specific (second case). The third case refers to the multiplicity correction prior (Bernoulli-Beta) and it takes the two Beta hyperparameters.}
}
\description{
BDgraph function for sampling from GGM
}

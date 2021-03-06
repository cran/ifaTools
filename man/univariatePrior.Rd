% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prior.R
\name{univariatePrior}
\alias{univariatePrior}
\title{Univariate priors commonly used in IFA models}
\usage{
univariatePrior(type, labels, mode, strength = NULL, name = "univariatePrior")
}
\arguments{
\item{type}{one of c("lnorm","beta","logit-norm")}

\item{labels}{a vector of parameters to which to apply the prior density}

\item{mode}{the mode of the prior density}

\item{strength}{a prior-specific strength (optional)}

\item{name}{the name of the mxModel returned}
}
\value{
an mxModel that evaluates to the prior density in deviance units
}
\description{
The returned model evaluates to the fit of the priors in deviance
(-2 log likelihood) units. The analytic gradient and Hessian are
included for quick optimization using Newton-Raphson.
}
\details{
Priors of type 'beta' and 'logit-norm' are commonly used for the
lower asymptote parameter of the 3PL model. Both of these priors
assume that the parameter is in logit units. The 'lnorm' prior
can be used for slope parameters.
}
\examples{
model <- univariatePrior("logit-norm", "x1", -1)
model$priorParam$values[1,1] <- -.6
model <- mxRun(model)
model$output$fit
model$output$gradient
model$output$hessian
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modeling.R
\name{get_activation}
\alias{get_activation}
\title{Map a string to a Python function}
\usage{
get_activation(activation_string)
}
\arguments{
\item{activation_string}{String name of the activation function.}
}
\value{
A function corresponding to the activation function. If
  \code{activation_string} is NA, empty, or "linear", this will return NA. If
  \code{activation_string} is not a string, it will return
  \code{activation_string}.
}
\description{
Example: "relu" => `tensorflow::tf$nn$relu`.
}
\examples{
\dontrun{
get_activation("gelu")
}
}

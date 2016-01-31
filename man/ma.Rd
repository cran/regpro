\name{ma}
\alias{ma}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Moving average of a time series
}
\description{
Computes a one-sided weighted moving average from a univariate time series.
The one-sided moving average can be used to predict the next value
of the sequence.
}
\usage{
ma(x, h=1, kernel="exp", k=length(x))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n vector; the observed values of the time series}
  \item{h}{a positive real number; the smoothing parameter of the moving average}
  \item{kernel}{a character; determines the kernel function; 
   either "exp", "uniform", "gauss", or "bart"}
  \item{k}{a positive integer; the moving average includes at most k observations}
}
%\details{}
\value{a real number}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{kernesti.regr}},
}
\examples{
set.seed(1)
n<-100
x<-runif(n)
ma(x)
}
\keyword{smooth}


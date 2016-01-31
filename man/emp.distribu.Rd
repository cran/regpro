\name{emp.distribu}
\alias{emp.distribu}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Empirical distribution function at one point
}
\description{
Computes the value of an empirical distribution function at one point.
}
\usage{
emp.distribu(arg, dendat)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arg}{d-vector; the point where the estimate is evaluated}
  \item{dendat}{n*d data matrix; the data matrix of n observations and d variables}
}
%\details{}
\value{a real number or a d vector; if d>1 the empirical distribution function
 is estimated for each column of the data matrix "dendat"}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{emp.quantile}},
}
\examples{
set.seed(2)
n<-100
d<-2 
x<-matrix(runif(n*d),n,d)

arg<-c(0,0)
emp.distribu(arg,x)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}


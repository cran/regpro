\name{quantil.emp}
\alias{quantil.emp}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Empirical p:th quantile 
}
\description{
Computes the value of the empirical p:th quantile.
}
\usage{
quantil.emp(y, p)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{n vector; the observed data}
  \item{p}{0<p<1: the p:th quantile will be estimated}
}
%\details{}
\value{a real number}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{emp.quantile}},
}
\examples{
set.seed(2)
n<-100
y<-matrix(runif(n),n,1)
quantil.emp(y,p=0.05)
}
\keyword{smooth}


\name{copula.trans}
\alias{copula.trans}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Makes a copula transformation
}
\description{
Transforms the data matrix so that the marginals follow approximately
standard Gaussian distribution. Alternatively, the marginals can be 
transformed to follow approximately the uniform distribution on [0,1].
}
\usage{
copula.trans(dendat, marginal=rep("gauss",dim(dendat)[2]), remna=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dendat}{n*d data matrix; the data matrix of n observations 
   and d variables}
  \item{marginal}{d-vector of character strings; the character strings can
   be "gauss" or "uniform"}
  \item{remna}{TRUE or FALSE; if remna=TRUE, then the rows containing a NA
   are removed}
}
%\details{}
\value{n*d data matrix}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }
%\seealso{
%\code{\link{emp.distribu}},
%}
\examples{
set.seed(2)
n<-100
d<-2 
dendat<-matrix(runif(n*d),n,d)
x<-copula.trans(dendat)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}


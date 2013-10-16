\name{loclin}
\alias{loclin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Multivariate local linear regression estimator at one point
}
\description{
Calculates the value of a multivariate local linear regression estimator 
at one point.
}
\usage{
loclin(arg, x, y, h=1, kernel="gauss", type=0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arg}{d-vector; the point where the estimate is evaluated}
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector; the values of the response variable}
  \item{h}{a positive real number; the smoothing parameter of the kernel estimate}
  \item{kernel}{a character; determines the kernel function; 
   either "gauss" or "uniform"; in the univariate case can also be "exp"}
  \item{type}{integer 0,...,d; if type=0, then the regression function is 
   estimated, otherwise the first partial derivative of the variable indicated 
   by type is estimated}
}
%\details{}
\value{a real number}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{pcf.loclin}},
}
\examples{
set.seed(1)
n<-100
d<-2 
x<-8*matrix(runif(n*d),n,d)-3
C<-(2*pi)^(-d/2)
phi<-function(x){ return( C*exp(-sum(x^2)/2) ) }
D<-3; c1<-c(0,0); c2<-D*c(1,0); c3<-D*c(1/2,sqrt(3)/2)
func<-function(x){phi(x-c1)+phi(x-c2)+phi(x-c3)}
y<-matrix(0,n,1)
for (i in 1:n) y[i]<-func(x[i,])+0.01*rnorm(1)

arg<-c(0,0)
loclin(arg,x,y,h=0.5)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}

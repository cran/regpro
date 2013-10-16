\name{kernesti.der}
\alias{kernesti.der}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
An estimator of a partial derivative of a regression function at one point
}
\description{
Calculates the value of a multivariate kernel estimator of a partial derivative
of a regression function at a one point.
}
\usage{
kernesti.der(arg, x, y, h=1, direc=1, kernel="gauss", vect=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{arg}{d-vector; the point where the estimate is evaluated}
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector; the values of the response variable}
  \item{h}{a positive real number; the smoothing parameter of the kernel estimate}
  \item{direc}{integer 1,...,d; indicates which partial derivative is estimated} 
  \item{kernel}{a character; determines the kernel function; can only be "gauss"}
  \item{vect}{TRUE or FALSE; an internal parameter related to the method of 
   calculation}
}
%\details{}
\value{a real number}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{pcf.kernesti.der}},
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
kernesti.der(arg,x,y,h=0.5)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}


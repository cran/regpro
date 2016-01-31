\name{pcf.kernesti.marg}
\alias{pcf.kernesti.marg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
An estimator of a marginal average of a regression function
}
\description{
Computes the values of an estimator of a marginal average
of a regression function on a regular grid.
Marginal averages are called also partial dependency functions.
}
\usage{
pcf.kernesti.marg(x, y, h, N, kernel="gauss", coordi=1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector; the values of the response variable}
  \item{h}{a positive real number; the smoothing parameter of the kernel estimate}
  \item{N}{vector of d positive integers; the number of grid points for each direction} 
  \item{kernel}{a character; determines the kernel function; 
   the only allowed value is "gauss"}
  \item{coordi}{integer 1,...,d; indicates which marginal average is calculated} 
}
%\details{}
\value{a piecewise constant function}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{pcf.kernesti}},
}
\examples{
n<-10
d<-2 
x<-8*matrix(runif(n*d),n,d)-3
C<-(2*pi)^(-d/2)
phi<-function(x){ return( C*exp(-sum(x^2)/2) ) }
D<-3; c1<-c(0,0); c2<-D*c(1,0); c3<-D*c(1/2,sqrt(3)/2)
func<-function(x){phi(x-c1)+phi(x-c2)+phi(x-c3)}
y<-matrix(0,n,1)
for (i in 1:n) y[i]<-func(x[i,])+0.01*rnorm(1)

num<-30  # number of grid points in one direction
pcf<-pcf.kernesti.marg(x,y,h=0.5,N=num)

dp<-draw.pcf(pcf,minval=min(y))
plot(dp$x,dp$y,type="l")
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}


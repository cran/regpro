\name{pcf.kernesti.slice}
\alias{pcf.kernesti.slice}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A slice of a multivariate kernel regression estimator 
}
\description{
Calculates the values of a univariate slice of multivariate kernel regression estimator 
(Nadaraya-Watson estimator) on a regular grid.
}
\usage{
pcf.kernesti.slice(x, y, h, N, kernel="gauss", coordi=1, p=0.5, 
center=NULL, direc=NULL, radius=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector; the values of the response variable}
  \item{N}{vector of d positive integers; the number of grid points for each direction} 
  \item{h}{a positive real number; the smoothing parameter of the kernel estimate}
  \item{kernel}{a character; determines the kernel function; either "gauss" or "uniform"}
  \item{coordi}{integer 1,...,d; the direction of the slice}
  \item{p}{0<p<1; the slice goes through the p:th quantile, estimated from data x; this 
   parameter is used if center=NULL}
  \item{center}{either NULL or a d-vector; gives the point which is intersected by the slice}
  \item{direc}{either NULL or a d-vector; gives the direction of the slice}
  \item{radius}{either NULL or a positive real number; gives the radius of the slice}
}
%\details{}
\value{a piecewise constant univariate function}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{kernesti.regr}},
}
\examples{
n<-100
d<-2 
x<-8*matrix(runif(n*d),n,d)-3
C<-(2*pi)^(-d/2)
phi<-function(x){ return( C*exp(-sum(x^2)/2) ) }
D<-3; c1<-c(0,0); c2<-D*c(1,0); c3<-D*c(1/2,sqrt(3)/2)
func<-function(x){phi(x-c1)+phi(x-c2)+phi(x-c3)}
y<-matrix(0,n,1)
for (i in 1:n) y[i]<-func(x[i,])+0.01*rnorm(1)

num<-30  # number of grid points in one direction
pcf<-pcf.kernesti.slice(x,y,h=0.5,N=num)

dp<-draw.pcf(pcf,minval=min(y))
plot(dp$x,dp$y,type="l")
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}

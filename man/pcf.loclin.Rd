\name{pcf.loclin}
\alias{pcf.loclin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Multivariate local linear estimator 
}
\description{
Computes the values of a multivariate local linear regression estimator 
on a regular grid.
}
\usage{
pcf.loclin(x, y, h, N, type=0, kernel="gauss", support=NULL, alt=FALSE, alt2=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector; the values of the response variable}
  \item{h}{a positive real number; the smoothing parameter of the kernel estimate}
  \item{N}{vector of d positive integers; the number of grid points for each 
   direction} 
  \item{type}{integer 0,...,d; if type=0, then the regression function is 
   estimated, otherwise the first partial derivative of the variable indicated 
   by type is estimated}
  \item{kernel}{a character; determines the kernel function; 
   either "gauss" or "uniform"}
  \item{support}{either NULL or a 2*d vector; the vector gives the d intervals of a 
   rectangular support in the form c(low_1,upp_1,...,low_d,upp_d)}
  \item{alt}{an internal parameter}
  \item{alt2}{an internal parameter}
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

num<-30  # number of grid points in one direction
pcf<-pcf.loclin(x,y,h=0.5,N=c(num,num))

dp<-draw.pcf(pcf,minval=min(y))
persp(dp$x,dp$y,dp$z,phi=30,theta=-30)
contour(dp$x,dp$y,dp$z,nlevels=30)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}


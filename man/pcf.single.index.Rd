\name{pcf.single.index}
\alias{pcf.single.index}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Regression function estimator in the single index model
}
\description{
Computes the values of a single index model regression estimator 
on a regular grid.
}
\usage{
pcf.single.index(x, y, h, N, kernel="gauss", support=NULL, method="poid",
argd=colMeans(x), type="si")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector; the values of the response variable}
  \item{h}{a positive real number; the smoothing parameter of the kernel estimate}
  \item{N}{vector of d positive integers; the number of grid points for each 
   direction} 
  \item{kernel}{a character; determines the kernel function; 
   either "gauss" or "uniform"}
  \item{support}{either NULL or a 2*d vector; the vector gives the d intervals of a 
   rectangular support in the form c(low_1,upp_1,...,low_d,upp_d)}
  \item{method}{character string; "poid", "aved", "iter", or "nume"; 
   if method="poid", then the direction vector is estimated using the reference 
   point optionally given in the argument "argd";
   if method="aved", then the average derivative method is used;
   if method="iter", then an iterative algorithm is used;
   if method="nume", then numerical optimization is used}
  \item{argd}{d vector; the point optionally used in the estimation of the 
   direction vector}
  \item{type}{character string; if type="si", then the direction vector is
   estimated once, and the same direction vector is used at every grid point,
   otherwise the estimate of the direction vector may depend on the point of 
   estimation}
}
%\details{}
\value{a piecewise constant function}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{single.index}},
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
pcf<-pcf.single.index(x,y,h=0.5,N=c(num,num))

dp<-draw.pcf(pcf,minval=min(y))
persp(dp$x,dp$y,dp$z,phi=30,theta=-30)
contour(dp$x,dp$y,dp$z,nlevels=30)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}


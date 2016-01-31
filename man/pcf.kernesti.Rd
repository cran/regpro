\name{pcf.kernesti}
\alias{pcf.kernesti}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Multivariate kernel regression estimator 
}
\description{
Computes the values of a multivariate kernel regression estimator 
(Nadaraya-Watson estimator) on a regular grid.
}
\usage{
pcf.kernesti(x, y, h, N, kernel="gauss", support=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector; the values of the response variable}
  \item{h}{a positive real number; the smoothing parameter of the kernel estimate}
  \item{N}{vector of d positive integers; the number of grid points for each direction} 
  \item{kernel}{a character; determines the kernel function; 
   either "gauss" or "uniform"; in the multivariate case can also be "bart"}
  \item{support}{either NULL or a 2*d vector; the vector gives the d intervals of a 
   rectangular support in the form c(low_1,upp_1,...,low_d,upp_d)}
}
%\details{}
\value{a piecewise constant function}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{kernesti.regr}},
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
pcf<-pcf.kernesti(x,y,h=0.5,N=c(num,num))

dp<-draw.pcf(pcf,minval=min(y))
persp(dp$x,dp$y,dp$z,phi=30,theta=-30)
contour(dp$x,dp$y,dp$z,nlevels=30)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}



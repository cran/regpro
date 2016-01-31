\name{single.index}
\alias{single.index}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Single index model regression estimator at one point
}
\description{
Computes the value of a single index model regression estimator 
at one point.
}
\usage{
single.index(x, y, arg=NULL, h=1, kernel="gauss", M=2, method="iter",
vect=FALSE, argd=arg, take=length(y), seed=1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector; the values of the response variable}
  \item{arg}{NULL or d vector; the point where the value of the regression
   function is estimated} 
  \item{h}{a positive real number; the smoothing parameter of the kernel estimate}
  \item{kernel}{a character; determines the kernel function; 
   either "gauss" or "uniform"}
  \item{M}{integer >=2; the number of iterations} 
  \item{method}{character string; "poid", "aved", "iter", or "nume"; 
   if method="poid", then the direction vector is estimated using the reference 
   point optionally given in the argument "argd";
   if method="aved", then the average derivative method is used;
   if method="iter", then an iterative algorithm is used;
   if method="nume", then numerical optimization is used}
  \item{vect}{TRUE or FALSE; internal parameter}
  \item{argd}{d vector; the point optionally used in the estimation of the 
   direction vector}
  \item{take}{positive integer}
  \item{seed}{real number; the seed for the random number generator}
}
%\details{}
\value{either d vector or a real value;
 if arg=NULL, then the estimated index is returned, otherwise the
 estimate at "arg" is returned}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{pcf.single.index}},
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

single.index(x,y)

arg<-c(0,0)
single.index(x,y,arg=arg)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}


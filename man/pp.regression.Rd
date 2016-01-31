\name{pp.regression}
\alias{pp.regression}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Projection pursuit regression
}
\description{
Computes the value of a projection pursuit regression estimator at one point.
}

\usage{
pp.regression(x, y=NULL, arg=NULL, residu=NULL, teet=NULL, h=1, kernel="gauss",
M=2, method="poid", argd=NULL, vect=FALSE, seed=1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector or NULL; the values of the response variable}
  \item{arg}{d vector or NULL; the point where the value of the regression
   function is estimated} 
  \item{residu}{NULL or n*M matrix of residuals; for each step the n vector of 
   residuals is given; the first residual is the vector of y-observations}
  \item{teet}{NULL or M*d matrix; for each step the direction vector 
   chosen by the optimizer}
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
  \item{argd}{d vector; the point optionally used in the estimation of the 
   direction vector}
  \item{vect}{TRUE or FALSE; internal parameter}
  \item{seed}{real number; the seed for the random number generator}
}
%\details{}
\value{list of eval, residu, teet, and value;
"eval" is a n*d matrix of the evaluations of the estimated component functions
at the data points; 
"residu" is n*M matrix which contains the sequence of estimates evaluated
at the observations;
"teet" is M*d matrix which gives for each iteration step the direction chosen 
by the optimization  procedure;
"value" is a real number giving the estimated value 
of the regression function at one point}
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

pp.regression(x,y)

arg<-c(0,0)
pp.regression(x,y,arg=arg)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}


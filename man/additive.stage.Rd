\name{additive.stage}
\alias{additive.stage}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Stagewise fitting of an additive model
}
\description{
Computes the value of an additive model regression estimator 
at one point using stagewise fitting
}
\usage{
additive.stage(x, y=NULL, arg=NULL, residu=NULL, deet=NULL, h=1, kernel="gauss",
M=2, vect=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector or NULL; the values of the response variable; if "residu"
   is given, then "y" is not used}
  \item{arg}{d-vector; the point where the estimate is evaluated}
  \item{residu}{NULL or n*M matrix of residuals; for each step the n vector of 
   residuals is given; the first residual is the vector of y-observations}
  \item{deet}{NULL or M vector of values 1,...,d; for each step the direction 
   chosen by the optimizer}
  \item{h}{a positive real number; the smoothing parameter of the kernel estimate}
  \item{kernel}{a character; determines the kernel function; 
   either "gauss" or "uniform"}
  \item{M}{integer >=2; the number of iterations}
  \item{vect}{TRUE or FALSE; internal parameter}
}
%\details{}
\value{list of eval, residu, deet, value, and valvec;
"eval" is a n*d matrix of the evaluations of the estimated component functions
at the data points; 
"residu" is n*M matrix which contains the sequence of estimates evaluated
at the observations;
"deet" is M vector of values 1,...,d which indicates for each step the 
direction chose by the optimization  procedure;
"value" is a real number giving the estimated value 
of the regression function at one point; 
"valvec" is d vector giving the 
estimated values of the component functions at one point}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{pcf.additive}},
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

as<-additive.stage(x,y) 

arg<-c(0,0)
additive.stage(x,arg=arg,residu=as$residu,deet=as$deet)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS
\keyword{smooth}

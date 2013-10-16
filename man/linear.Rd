\name{linear}
\alias{linear}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Multivariate linear ridge regression estimator
}
\description{
Calculates the parameter estimates in the linear least squares ridge regression.
}
\usage{
linear(x, y, eleg=TRUE, lambda=0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{n*d data matrix; the matrix of the values of the explanatory variables}
  \item{y}{n vector; the values of the response variable}
  \item{eleg}{TRUE or FALSE; an internal parameter related to the method of 
   calculation}
  \item{lambda}{nonnegative real number; the degree of penalization in ridge 
   regression; if lambda=0, then the usual linear least squares estimates are
   calculated}
}
%\details{}
\value{list of beta0 and beta1; beta0 is a real number and beta1 is a d vector;
 beta0 is the estimate of the intercept and beta1 is the vector containing the
 estimates of the coefficients}
%\references{}
\author{Jussi Klemela}
%\note{ ~~further notes~~ }

\seealso{
\code{\link{linear.quan}},
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

linear(x,y)
}
\keyword{multivariate}% at least one, from doc/KEYWORDS


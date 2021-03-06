% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{JSEvals}
\alias{JSEvals}
\title{Creates a list of keys whose values need to be evaluated on the client-side}
\usage{
JSEvals(list)
}
\arguments{
\item{list}{a list in which the elements that should be evaluated as
JavaScript are to be identified}
}
\description{
It works by transforming \code{list(foo = list(1, list(bar =
I('function(){}')), 2))} to \code{list("foo.2.bar")}. Later on the JS side,
the \code{window.HTMLWidgets.evaluateStringMember} function is called with
the JSON object and the "foo.2.bar" string, which is split to \code{['foo',
'2', 'bar']}, and the string at that location is replaced \emph{in-situ} with
the results of evaluating it. Note '2' (character) should have been 2
(integer) but it does not seem to matter in JS: x[2] is the same as x['2']
when all child members of x are unnamed, and ('2' in x) will be true even if
x is an array without names. This is a little hackish.
}
\details{
This function is intended mostly for internal use. There's generally no need
for widget authors or users to call it, as it's called automatically on the
widget instance data during rendering. It's exported in case other packages
want to add support for \code{\link{JS}} in contexts outside of widget
payloads.
}
\author{
Yihui Xie
}
\keyword{internal}

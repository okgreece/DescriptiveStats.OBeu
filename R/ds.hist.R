#' @title 
#' Histogram breaks and frequencies
#'  
#' @description
#' This function computes the histogram parameters of the numeric input vector. The default for 
#' breaks is the value resulted from Sturges algorithm.
#' 
#' @usage ds.hist(x, breaks="Sturges", tojson=F)
#' 
#' @param x The input numeric vector
#' @param breaks The method or the number of classes for the histogram
#' @param tojson If TRUE the results are returned in json format, default returns a list
#' 
#' @details 
#' The possible values for breaks are Sturges see \code{\link[grDevices]{nclass.Sturges}}, 
#' Scott see \code{\link[grDevices]{nclass.scott}} and FD or Freedman Diaconis \code{\link[grDevices]{nclass.FD}}
#' which are in package \pkg{grDevices}.
#' 
#' 
#' @return A list or json file with the following components:
#' 
#' \itemize{
#' \item cuts The boundaries of the histogram classes
#' \item density The density of each histogram class
#' \item normal.curve.x Abscissa of the normal curve 
#' \item normal.curve.y Ordinate of the normal curve 
#' \item fit.line.x Abscissa of the data density curve 
#' \item fit.line.y Ordinate of the data density curve 
#' \item mean The average value of the input vector
#' \item median The median value of the input data
#' } 
#' 
#' @author Kleanthis Koupidis
#' 
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @rdname ds.hist
#' @import jsonlite
#' @export

ds.hist <- function(x, breaks= "Sturges", tojson=F) {
  
  x = as.numeric(unlist(x))

  histog=graphics::hist(x,probability = T,plot = F,warn.unused = F)
  
  # norm line
  
  ynorm= stats::density(stats::rnorm(x, mean = mean(x), sd = stats::sd(x)))
  
  # prob line
  fit.line=stats::density(x)
  
  mean = mean(x)
  median = median(x)
  
  hist.param = list(
                 cuts = histog$breaks,
                 density = histog$density,
                 normal.curve.x = ynorm$x,
                 normal.curve.y = ynorm$y,
                 fit.line.x=fit.line$x,
                 fit.line.y=fit.line$y,
                 mean = mean,
                 median = median
               )
  
  if (tojson==T){
    
    hist.param=jsonlite::toJSON(hist.param)
  }
  
  return(hist.param)
}

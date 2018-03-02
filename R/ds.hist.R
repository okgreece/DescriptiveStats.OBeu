#' @title 
#' Histogram breaks and frequencies
#'  
#' @description
#' This function computes the histogram parameters of the numeric input vector. The default for 
#' breaks is the value resulted from Sturges algorithm.
#' 
#' @usage ds.hist(x, breaks= "Sturges", tojson=FALSE)
#' 
#' @param x The input numeric vector, matrix or data frame
#' @param breaks The method or the number of classes for the histogram
#' @param tojson If TRUE the results are returned in json format, default returns a list
#' 
#' @details 
#' The possible values for breaks are Sturges see \code{\link{nclass.Sturges}}, 
#' Scott see \code{\link{nclass.scott}} and FD or Freedman Diaconis \code{\link{nclass.FD}}
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
#' @author Kleanthis Koupidis, Charalampos Bratsas
#' 
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @examples 
#' # with a vector as an input and the defaults parameters
#' vec <- as.vector(iris$Sepal.Width)
#' ds.hist(vec)
#' 
#' # OpenBudgets.eu Dataset Example:
#' Wuppertal_df
#' ds.hist(Wuppertal_df$Amount, tojson = TRUE)
#' 
#' @rdname ds.hist
#' @export

ds.hist <- function(x, breaks= "Sturges", tojson=FALSE) {
  
  x = as.numeric(unlist(x))
  
  histog=graphics::hist(x,probability = F,plot = F,warn.unused = F)
  
  hist.param = list(
    cuts = histog$breaks,
    counts = histog$counts,
    mean = mean(x),
    median = stats::median(x)
  )
  
  if (tojson==T){
    
    hist.param=jsonlite::toJSON(hist.param)
  }
  
  return(hist.param)
}

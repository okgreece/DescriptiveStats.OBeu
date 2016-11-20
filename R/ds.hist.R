#' @title 
#' Histogram breaks and frequencies
#'  
#' @description
#' This function computes the histogram parameters of the numeric input vector. The default for 
#' breaks is the value resulted from "Sturges" algorithm.
#' 
#' @usage ds.hist(x, breaks="Sturges")
#' 
#' @param x The input numeric vector.
#' @param breaks The method or the number of classes for the histogram.
#' 
#' @details 
#' The possible values for breaks are "Sturges"(see nclass.Sturges), "Scott"(see nclass.scott),
#' "FD" / "Freedman-Diaconis" (see nclass.FD) and other integer value.
#' 
#' @return A list with the following components:
#' 
#' \itemize{
#' \item cuts The boundaries of the histogram classes
#' \item counts The frequency of each histogram class
#' \item normal.curve The normal curve 
#' \item mean The average value of the input vector
#' \item median The median value of the input data
#' } 
#' 
#' @author Kleanthis Koupidis
#' 
#' @seealso \code{\link{ds.analysis}},\code{\link{open_spending.ds}}
#' 
#' @rdname ds.hist
#' 
#' @export
###########################################################################################
ds.hist <- function(x, breaks= "Sturges") {

  x <- as.numeric(unlist(x))
  if (is.character(breaks)==F) {
    classes <- breaks 
  } else if (breaks=="Sturges") {
    classes <- grDevices::nclass.Sturges(x)
  } else if (breaks=="Scott") {
      classes<-grDevices::nclass.scott(x)
  } else if (breaks=="Freedman-Diaconis") {
        classes<-grDevices::nclass.FD(x)
        }
  
  range <- ceiling(max(x)/.5)*.5-floor((min(x)/.5))*.5
  width <- round((range/classes)/.5)*.5
  breaks <- seq(from= floor(min(x)/.5)*.5,to=ceiling(max(x)/.5)*.5, by=width)
  
  if (min(x)==floor((min(x)/.5))*.5) {
  hist.frequncies <- cut(x, breaks, right=F)
  } else {
    hist.frequncies <- cut(x, breaks, right=T)
  }

  hist.frequncies <- as.data.frame(table(hist.frequncies))
  
  #lines
  ynorm<-stats::dnorm(breaks,mean=mean(x),sd=stats::sd(x)) 
  ynorm <- ynorm*width*length(x) 
  
  mean <- mean(x)
  median <- median(x)
  
  hist.param <- list(
  cuts = breaks,
  counts = hist.frequncies$Freq,
  normal.curve = ynorm,
  mean = mean,
  median = median
  )
  return(hist.param)
}

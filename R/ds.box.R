#' @title 
#' Calculation of Statistics for the Boxplot
#'  
#' @description
#' This function calculates the statistics for the boxplot of the numeric vector for visualization purposes.
#' 
#' @usage ds.box(x, c=1.5, c.width = 0.15 , out = T)
#' 
#' @param x The input matrix or data frame 
#' @param c Determines the length of the "whiskers" plot.
#' If it is equal to zero no outliers will be returned.
#' @param c.width The width level is determined 0.15 times the square root of the size of the input vector
#' @param out If TRUE the outliers will be computed at the selected "c" level (default is 1.5 times the Interquartile Range). 
#' 
#' @details 
#' This function returns the statistics needed to visualize boxplot.
#' 
#' @author Kleanthis Koupidis
#' 
#' @return 
#' Returns a list with the following components:
#' \itemize{ 
#' \item lo.whisker The extreme of the lower whisker
#' \item lo.hinge The lower "hinge"
#' \item median The median
#' \item up.hinge The upper "hinge"
#' \item up.whisker The extreme of the upper whisker
#' \item box.width The width of the box (default is 0.15 times the 
#' square root of the size of the vector)
#' \item lo.out The values of any data points which lie below the extreme of the lower whisker
#' \item up.out The values of any data points which lie above the extreme of the upper whisker
#' \item n The non-NA observations of the vector
#' }
#' 
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @rdname ds.box
#' 
#' @export
######################################################################################

ds.box<-function(x, c=1.5, c.width = 0.15 , out = T){
  
  b <- grDevices::boxplot.stats(x, coef=c,  do.out = out)
  
  lo.whisker <- unname(unlist(b)[1])
  
  lo.hinge <- unname(unlist(b)[2])
  
  median <- unname(unlist(b)[3])
  
  up.hinge <- unname(unlist(b)[4])
  
  up.whisker <- unname(unlist(b)[5])
  
  n<-unname(unlist(b)[6])
  
  box.width <- round( c.width * sqrt(n) ,2)
  
  if (out==T & c!=0){
    lo.out <- x[x < lo.hinge - c * diff(c(lo.hinge,up.hinge))]
    
    up.out <- x[x > up.hinge + c * diff(c(lo.hinge,up.hinge))]
    } else {
      lo.out <- NULL
      up.out <- NULL
      }
  
 

  box<-list(lo.whisker=lo.whisker,
            lo.hinge=lo.hinge,
            median=median,
            up.hinge=up.hinge,
            up.whisker=up.whisker,
            box.width=box.width,
            lo.out=lo.out,
            up.out=up.out,
            n=n)
  
  return(box)
}

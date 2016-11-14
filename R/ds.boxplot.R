#' @title 
#' Calculation of Statistics for the Boxplot
#'  
#' @description
#' This function calculates the statistics for the boxplot of the input dataset.
#' 
#' @usage ds.boxplot(data, out.level=1.5)
#' 
#' @param data The input matrix or data frame 
#' @param out.level Determines the length of the "whiskers" plot.
#' If it is equal to zero no outliers will be returned.
#' 
#' @details 
#' This function returns the statistics needed to visualize boxplots.
#' 
#' @author Aikaterini Chatzopoulou, Kleanthis Koupidis
#' 
#' @return 
#' Returns a list with the following components:
#' \itemize{ 
#' \item Stats a vector with the extreme of the lower whisker, the lower "hinge", 
#' the median, the upper "hinge" and the extreme of the upper whisker.
#' \item n The number of non-NA observations of the data.
#' \item out The values of any data points which lie beyond the whiskers' extremes
#' }
#' 
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @rdname ds.boxplot
#' 
#' @export
###################################################################################################

ds.boxplot<-function(data, out.level=1.5){
  
  # Convert to data frame
  data<-as.data.frame(data)
  
  # Check if all are categorical
  stopifnot(all(sapply(data, is.factor) | sapply(data, is.character))==F)
  
  # only numeric data
  data.num<-nums(data)
  
  # Boxplot parameters
  box.data<-apply(data.num, 2, grDevices::boxplot.stats,coef=out.level, 
                  do.conf = F, do.out = T)
  
  box.data<-as.list(box.data)
  
  # Return
  return(box.data)
}

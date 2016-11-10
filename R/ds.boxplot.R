#' @title 
#' Boxplot
#'  
#' @description
#' Boxplot
#' 
#' @usage ds.boxplot(data, out.level=1.5)
#' 
#' @param data The input matrix or data frame 
#' @param out.level ...
#' 
#' @details 
#' This function returns the necessary statistics for bulding a boxplot
#' 
#' @author Aikaterini Chatzopoulou, Kleanthis Koupidis
#' 
#' @return 
#' Returns a list with the following components:
#' 
#' stats: a vector with the extreme of the lower whisker, the lower ‘hinge’, the median, the upper ‘hinge’ and the extreme of the upper whisker.
#' n: the number of non-NA observations in the sample.
#' conf: the lower and upper extremes of the ‘notch’ 
#' out: the values of any data points which lie beyond the extremes of the whiskers
#' 
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @rdname ds.boxplot
#' 
#' @import jsonlite
#'
#' @export
###################################################################################################

ds.boxplot<-function(data, out.level=1.5){
  
  # Convert to data frame
  data<-as.data.frame(data)
  
  # Check if all are categorical
  stopifnot(all(sapply(data, is.factor)|sapply(data, is.character))==F)
  
  # only numeric data
  data.num<-nums(data)
  
  # Boxplot parameters
  box.data<-apply(data.num, 2, grDevices::boxplot.stats,coef=out.level, 
                  do.conf = F, do.out = T)
  
  box.data<-as.list(box.data)
  
  # JSON output
  
  #box.json<-jsonlite::toJSON(box.data)
  
  # Return
  return(box.data)
}

#' @title 
#' Boxplot Parameters of a matrix or data frame
#'  
#' @description
#' This function calculates the statistics of the boxplot for the input matrix or data frame.
#' 
#' @usage ds.boxplot(data, out.level=1.5, width = 0.15 , outl = T)
#' 
#' @param data The input numeric matrix or data frame.
#' @param out.level Determines the length of the "whiskers" plot. If it is equal to zero or "outl" is set to F, 
#' no outliers will be returned.
#' @param width The width level is determined 0.15 times the square root of the size of the input data.
#' @param outl If TRUE the outliers will be computed at the selected "out.level" level (default is 1.5 times the Interquartile Range).
#' 
#' @details 
#' This function returns as a list object the statistical parameters needed to visualize boxplot.
#' 
#' @author Aikaterini Chatzopoulou, Kleanthis Koupidis
#' 
#' @return 
#' Returns a list with the extracted components of \code{\link{ds.box}} for each variable/column of the input data.
#' 
#' @seealso \code{\link{ds.box}}, \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @rdname ds.boxplot
#' 
#' @export

ds.boxplot<-function(data, out.level=1.5, width = 0.15 , outl = T){
  
  # Convert to data frame
  data<-as.data.frame(data)
  
  # Check if all are categorical
  stopifnot(all(sapply(data, is.factor) | sapply(data, is.character))==F)
  
  # only numeric data
  data.num<-nums(data)
  
  # Boxplot parameters
  box.data<-lapply(data.num, ds.box, c=out.level, c.width= width, out=outl)
  
  # Return
  return(box.data)
}

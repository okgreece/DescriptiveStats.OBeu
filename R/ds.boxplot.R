#' @title 
#' Boxplot Parameters of a matrix or data frame
#'  
#' @description
#' This function calculates the statistics of the boxplot for the input matrix or data frame.
#' 
#' @usage ds.boxplot(data, out.level=1.5, width = 0.15 , outl = TRUE, tojson=FALSE)
#' 
#' @param data The input numeric matrix or data frame.
#' @param out.level Determines the length of the "whiskers" plot. If it is equal to zero or "outl" is set to F, 
#' no outliers will be returned.
#' @param width The width level is determined 0.15 times the square root of the size of the input data.
#' @param outl If TRUE the outliers will be computed at the selected "out.level" level (default is 1.5 times the Interquartile Range).
#' @param tojson If TRUE the results are returned in json format
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
#' @examples 
#' # with matrix as an input and the default parameters
#' Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
#'          `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
#' ds.boxplot(Matrix, out.level=1.5, width = 0.15 , outl = TRUE, tojson=FALSE)
#' 
#' # with data frame as an input, different parameters and json output
#' data <- iris
#' ds.boxplot(data, out.level=2, width = 0.25 , outl = FALSE, tojson=TRUE)
#' 
#' @rdname ds.boxplot
#' 
#' @import jsonlite
#' @export

ds.boxplot<-function(data, out.level=1.5, width = 0.15 , outl = TRUE, tojson=FALSE){
  
  # Convert to data frame
  data<-as.data.frame(data)
  
  # only numeric data
  data.num<-nums(data)
  
  # Boxplot parameters
  box.data<-lapply(data.num, ds.box, c=out.level, c.width= width, out=outl)
  
  if (tojson==T){
    
    box.data=jsonlite::toJSON(box.data)
  }
  
  # Return
  return(box.data)
}

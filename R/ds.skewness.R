#' @title 
#' Skewness
#'  
#' @description
#' This functions calculates skewness of the input dataset.
#' 
#' @usage ds.skewness(x)
#' 
#' @param x A vector, matrix or data frame which includes at least one number.
#' 
#' @details 
#' This function returns a json output with the skewness of numbers of the input dataset.
#' 
#' @author Aikaterini Chatzopoulou
#' 
#' @seealso \code{\link{ds.kurtosis}, \code{\link{ds.statistics}}, 
#' \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @rdname ds.skewness
#' 
#' 
#' @import jsonlite
#'
#' @export
#####################################################################################################################################

ds.skewness <- function(x)
{
  data <- as.data.frame(x)
  stopifnot(all(sapply(x, is.factor)|sapply(x, is.character))==F)
  # only numeric data
  
  num <- sapply(x, is.numeric)
  
  data.num <- x[num]
  
  # calculation
  mean <- apply(data.num,2,mean)
  sd <- apply(data.num, 2, sd)
  sd3 <- apply(as.data.frame(sd),2,function(x) x^3)
  
  data.num[,1:ncol(data.num)] <- sweep(data.num,2,mean)
  mult <- data.num ^ 3
  
  sum <- apply(mult, 2, sum)
  m3 <- sum / nrow(data.num)
  skew <- m3/sd3
  
  # Names
  skew <- as.data.frame(skew)
  colnames(skew) <- "skewness"
  rownames(skew) <- colnames(data.num)
  
  # JSON output
  skew.json<-jsonlite::toJSON(skew)
  
  # Return
  return(skew.json)
}
#' @title 
#' Calculation of Kurtosis
#'  
#' @description
#' This functions calculates kurtosis of the input dataset.
#' 
#' @usage ds.kurtosis(x)
#' 
#' @param x A vector, matrix or data frame
#' 
#' @details 
#' This function returns the kurtosis of numbers of the input data
#' 
#' @author Aikaterini Chatzopoulou
#' 
#' @seealso \code{\link{ds.skewness}}, \code{\link{ds.statistics}}, 
#' \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @rdname ds.kurtosis
#' 
#' @import jsonlite
#'
#' @export
#########################################################################################

ds.kurtosis <- function(x)
{
  data <- as.data.frame(x)
  stopifnot(all(sapply(x, is.factor)|sapply(x, is.character))==F)
  # only numeric data
  data.num<-nums(data)
  
  # calculation
  
  mean <- apply(data.num,2,mean)
  sd <- apply(data.num, 2, sd)
  sd4 <- apply(as.data.frame(sd),2,function(x) x^4)
  
  #mean <- t(as.data.frame(mean))
  data.num[,1:ncol(data.num)] <- sweep(data.num,2,mean)
  mult <- data.num ^ 4
  
  sum <- apply(mult, 2, sum)
  m4 <- sum / nrow(data.num)
  kurtosis <- m4/sd4-3

  # Return
  return(kurtosis)
}
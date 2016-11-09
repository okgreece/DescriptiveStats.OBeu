#' @title 
#' Kurtosis
#'  
#' @description
#' This functions calculates kurtosis of the input dataset.
#' 
#' @usage ds.kurtosis(x)
#' 
#' @param x A vector, matrix or data frame which includes at least one number.
#' 
#' @details 
#' This function returns a json output with the kurtosis of numbers of the input dataset.
#' 
#' @author Kleanthis Koupidis
#' 
#' @rdname ds.kurtosis
#' 
#' @import jsonlite
#'
#' @export
#####################################################################################################################################

ds.kurtosis <- function(x)
{
  data <- as.data.frame(x)
  stopifnot(all(sapply(x, is.factor)|sapply(x, is.character))==F)
  # only numeric data
  
  num <- sapply(x, is.numeric)
  
  data.num <- x[num]
  
  # calculation
  
  mean <- apply(data.num,2,mean)
  sd <- apply(data.num, 2, sd)
  sd4 <- apply(as.data.frame(sd),2,function(x) x^4)
  
  #mean <- t(as.data.frame(mean))
  data.num[,1:ncol(data.num)] <- sweep(data.num,2,mean)
  mult <- data.num ^ 4
  
  sum <- apply(mult, 2, sum)
  m4 <- sum / nrow(data.num)
  kurto <- m4/sd4

  # Names
  kurto <- as.data.frame(kurto)
  colnames(kurto) <- "kurtosis"
  rownames(kurto) <- colnames(data.num)
 
  # JSON output
  kurt.json<-jsonlite::toJSON(kurto)
  
  # Return
  return(kurt.json)
}
#' @title 
#' Calculation of the Statistic Measures
#'  
#' @description
#' This function calculates the basic descriptive measures of the input dataset.
#' 
#' @usage ds.statistics(data)
#' 
#' @param data A numeric vector, matrix or data frame
#' 
#' @details 
#' This function returns the min, max, range, mean, median, 0\%,25\%,50\%,75\%,100\% quantiles variance,
#' standartdeviation, skewness and kurtosis of the input data.
#' @return 
#' A json file with the following components:
#' \itemize{
#' \item Min The minimum observed value of the input data
#' \item Max The maximum observed value of the input data
#' \item Range The range, defined as the difference of the maximum and the minimum value.
#' \item Mean The average value of the input data
#' \item Median The median value of the input data
#' \item Quantiles The 0\%,25\%,50\%,75\%,100\% percentiles
#' \item Variance The variance of the input data
#' \item StandardDeviation The standard deviation of the input data
#' \item Skewness The Skewness of the input data
#' \item Kurtosis The Kurtosis of the input data
#' }
#' 
#' @author Katerina Chatzopoulou, Kleanthis Koupidis
#' 
#' @seealso \code{\link{open_spending.ds}}
#' 
#' @rdname ds.statistics
#' 
#' @import jsonlite
#'
#' @export
###########################################################################################################
ds.statistics <- function(data)
{
  # Check if all are categorical
  stopifnot(!all(is.factor(data)) & !all(is.character(data)))
  
  #Convert to data frame
  data<-as.data.frame(data)
  
  # only numeric data
  data.num<-nums(data)
  
  # Calculation of statistics
  min <- lapply(data.num, min)

  max <- lapply(data.num, max)
  
  range <- as.list(unlist(max)-unlist(min))

  mean <- lapply(data.num, mean)
  
  median <- lapply(data.num, median)
  
  var <- lapply(data.num, var)
  
  stdev <- lapply(data.num, stats::sd)
  
  kurtosis <- ds.kurtosis(data.num)
  
  skewness <- ds.skewness(data.num)
  
  q <- lapply(data.num, stats::quantile, probs=c(0.25,0.75) ) 

  # construction of dataframe with all the statistics
  statistics<-list(Min=min, Max=max,Range=range, Mean=mean, Median=median, 
                   Quantiles=q,Variance=var, StandardDeviation=stdev,
                   Kurtosis=kurtosis, Skewness=skewness)

  # Return
  return(statistics)
}

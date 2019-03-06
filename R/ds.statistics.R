#' @title 
#' Calculation of the Statistic Measures
#'  
#' @description
#' This function calculates the basic descriptive measures of the input dataset.
#' 
#' @usage ds.statistics(data, tojson = FALSE)
#' 
#' @param data A numeric vector, matrix or data frame
#' @param tojson If TRUE the results are returned in json format, default returns a list
#' 
#' @details 
#' This function returns the following values of the input data: minimum, maximum, range, mean, median, first and third quantiles, variance,
#' standart deviation, skewness and kurtosis.
#' 
#' @return 
#' A list or json file with the following components:
#' \itemize{
#' \item Min The minimum observed value of the input data
#' \item Max The maximum observed value of the input data
#' \item Range The range, defined as the difference of the maximum and the minimum value.
#' \item Mean The average value of the input data
#' \item Median The median value of the input data
#' \item Quantiles The 25\% and 75\% percentiles
#' \item Variance The variance of the input data
#' \item Standard Deviation The standard deviation of the input data
#' \item Skewness The Skewness of the input data
#' \item Kurtosis The Kurtosis of the input data
#' }
#' 
#' @author Aikaterini Chatzopoulou, Kleanthis Koupidis, Charalampos Bratsas
#' 
#' @seealso \code{\link{open_spending.ds}}
#' 
#' @examples 
#' # with matrix as an input and json outpout
#' Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
#'         `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
#' ds.statistics(Matrix, tojson = TRUE)
#' 
#' # with vector as an input
#' vec <- as.vector(iris$Sepal.Width)
#' ds.statistics(vec, tojson = FALSE)
#' 
#' # with iris data frame as an input
#' ds.statistics(iris, tojson = FALSE)
#' 
#' # OpenBudgets.eu Dataset Example:
#' ds.statistics(Wuppertal_df$Amount, tojson = TRUE)
#' 
#' @rdname ds.statistics
#'
#' @export
#' 

ds.statistics <- function(data, tojson = FALSE) {
  
  #Convert to data frame
  data <- as.data.frame(data)
  
  # only numeric data
  data.num <- nums(data)
  
  # Calculation of statistics
  min <- lapply(data.num, min)
  max <- lapply(data.num, max)
  range <- as.list(unlist(max) - unlist(min))
  mean <- lapply(data.num, mean)
  median <- lapply(data.num, median)
  var <- lapply(data.num, var)
  stdev <- lapply(data.num, stats::sd)
  kurtosis <- ds.kurtosis(data.num)
  skewness <- ds.skewness(data.num)
  q <- lapply(data.num, stats::quantile, probs = c(0.25, 0.75)) 
  
  # construction of dataframe with all the statistics
  statistics <- list(
    Min = min,
    Max = max,
    Range = range, 
    Mean = mean,
    Median = median, 
    Quantiles = q, 
    Variance = var, 
    StandardDeviation = stdev,
    Kurtosis = kurtosis, 
    Skewness = skewness)
  
  if (tojson == TRUE) { 
    statistics <- jsonlite::toJSON(statistics)
  }
  # Return
  return(statistics)
}

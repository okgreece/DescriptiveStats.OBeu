#' @title 
#' Select the numeric columns of a given dataset
#'  
#' @description
#' Extract and return a data frame with the columns that include only numeric values
#' 
#' @usage nums(data)
#' 
#' @param data A numeric vector, matrix or data frame.
#' 
#' @return This function returns a data frame with the numeric columns of the input dataset.
#'
#' @author Kleanthis Koupidis
#' 
#' @examples 
#' # with data frame as input
#' nums(iris)
#' 
#' # with vector as input
#' vec <- as.vector(iris$Sepal.Width)
#' nums(vec)
#' 
#' # with matrix as input
#' Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
#'         `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
#' nums(Matrix)
#' 
#' # OpenBudgets.eu Dataset Example:
#' head(nums(Wuppertal_df))
#' 
#' @rdname nums
#' 
#' @export
#' 

nums <- function(data) {
  
  data <- as.data.frame(data)
  
  # Check if all are categorical
  stopifnot(all(sapply(data, is.factor) | sapply(data, is.character)) == FALSE)
  
  if(ncol(data) >= 2) {
    num <- sapply(data, is.numeric)
    data.num <- data[num]
    data.num <- as.data.frame(data.num)
  } else {
    data.num <- data
  }
  return(data.num)
}

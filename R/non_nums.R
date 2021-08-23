#' @title
#' Select the non numeric columns of a given dataset
#'
#' @description
#' Extract and return a data frame with the columns that include non numeric values
#'
#' @usage non_nums(data)
#'
#' @param data A vector, matrix or data frame.
#'
#' @return This function returns a data frame with the non numeric columns of the input dataset.
#'
#' @author Kleanthis Koupidis
#'
#' @examples
#' # with data frame as input
#' non_nums(iris)
#'
#'
#' # OpenBudgets.eu Dataset Example:
#' head(non_nums(Wuppertal_df))
#' @rdname non_nums
#'
#' @export
#'

non_nums <- function(data) {
  data <- as.data.frame(data)
  
  # Check if all are numeric
  # stopifnot(all(sapply(data, is.numeric) ) == FALSE)
  
  if (ncol(data) >= 2) {
    non_nums <- !sapply(data, is.numeric)
    data.non_nums <- data[non_nums]
    data.non_nums <- as.data.frame(data.non_nums)
  } else {
    data.non_nums <- data
  }
  return(data.non_nums)
}

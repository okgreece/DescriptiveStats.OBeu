#' @title
#' Calculation of Skewness
#'
#' @description
#' This function calculates skewness of the input vector, matrix or data frame.
#'
#' @usage ds.skewness(x, tojson = FALSE)
#'
#' @param x A numeric vector, matrix or data frame.
#' @param tojson If TRUE the results are returned in json format
#'
#' @details
#' This function returns the skewness, also known as Pearson's moment coefficient of skewness, of numbers of the input data.
#'
#' @author Aikaterini Chatzopoulou
#'
#' @seealso \code{\link{ds.kurtosis}}, \code{\link{ds.statistics}},
#' \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#'
#' @examples
#' # with a matrix as an input
#' Matrix <- cbind(
#'   Uni05 = (1:200) / 21, Norm = rnorm(200),
#'   `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2)
#' )
#' ds.skewness(Matrix, tojson = FALSE)
#'
#' # with iris data frame as an input
#' ds.skewness(iris, tojson = FALSE)
#'
#' # with a vector as an input and json output
#' vec <- as.vector(iris$Sepal.Width)
#' ds.skewness(vec, tojson = TRUE)
#'
#' # OpenBudgets.eu Dataset Example:
#' ds.skewness(Wuppertal_df, tojson = FALSE)
#' @rdname ds.skewness
#'
#' @export
#'

ds.skewness <- function(x, tojson = FALSE) {
  data <- as.data.frame(x)

  # only numeric data
  data.num <- nums(data)

  # calculation
  mean <- apply(data.num, 2, mean)
  sd <- apply(data.num, 2, sd)
  sd3 <- sapply(sd, function(x) x^3)
  data.num[, 1:ncol(data.num)] <- sweep(data.num, 2, mean)
  mult <- data.num^3
  sum <- apply(mult, 2, sum)
  m3 <- sum / nrow(data.num)
  skewness <- m3 / sd3

  if (tojson == TRUE) {
    skewness <- jsonlite::toJSON(skewness)
  }
  # Return
  return(skewness)
}

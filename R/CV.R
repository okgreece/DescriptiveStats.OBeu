#' @title
#' Coefficient of variation
#'
#' @description
#' Extract and return a data frame with the columns that include only numeric
#'  values
#'
#' @usage CV(x)
#'
#' @param x A numeric vector or matrix or dataframe
#'
#' @return This function returns a vector with the coefficient of variance for
#'  the input vector,matrix or data frame.
#'
#' @author Kleanthis Koupidis
#'
#' @rdname CV
#'
#' @export
#'

CV <- function(x) {
  if (isTRUE(is.data.frame(x) | is.matrix(x))) {
    cv <- apply(x, 2, function(i) stats::sd(i) / mean(i))
  } else {
    cv <- stats::sd(x) / mean(x)
  }

  return(cv)
}

#' @title 
#' Correlation Coefficient of a dataframe
#'  
#' @description
#' This functions calculates the correlation coefficient of the input vectors, matrix or data frame.
#' By default, the correlation coefficient of pearson is computed.
#' 
#' @usage ds.correlation(x, y = NULL, cor.method = "pearson", tojson = FALSE)
#' 
#' @param x A numeric vector, matrix or data frame
#' @param y A vector, matrix or data frame with same dimension as x. By default it is equal with NULL.
#' @param cor.method The correlation coefficient method to compute: "pearson" (default),
#' "kendall" or "spearman".
#' @param tojson If TRUE the results are returned in json format, default returns a data frame
#' 
#' @details 
#' This function returns an upper triangle matrix with the correlation coefficients 
#' of the input data. The correlation coefficient of pearson is computed, by default. 
#' Other options are "kendall" or "spearman".
#' 
#' @author Aikaterini Chatzopoulou, Kleanthis Koupidis, Charalampos Bratsas
#' 
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @examples 
#' # iris data frame as an input and the default parameters
#' ds.correlation(iris, cor.method = "pearson", tojson = FALSE)
#' 
#' # with matrix as an input , different parameters and json output
#' Matrix <- cbind(Uni05 = (1:200)/21, Norm = rnorm(200),
#'          `5T` = rt(200, df = 5), Gam2 = rgamma(200, shape = 2))
#' ds.correlation(Matrix, cor.method = "kendall", tojson = TRUE)
#' 
#'
#' @rdname ds.correlation
#' 
#' @export
#' 

ds.correlation <- function(x, y = NULL, cor.method = "pearson", tojson = FALSE) {
  
  # Convert to data frame
  if (is.null(y) == FALSE) {
    data <- as.data.frame(x, y)
  } else if (is.null(y)) {
    data <- as.data.frame(x)
  }
  
  data.num <- nums(data)
  
  # Check that the data frame has at least two numeric variables
  stopifnot(length(data.num) >= 2)
  
  # Correlation method
  cor.method <- match.arg(cor.method, c("pearson", "kendall", "spearman"))
  
  # Correlation
  correlation <- stats::cor(data.num, method = cor.method)
  correlation <- round(correlation, 2)
  correlation[lower.tri(correlation)] <- 0
  cor.matrix <- data.frame(correlation,row.names = rownames(correlation))  
  
  if (tojson == TRUE) {
    cor.matrix <- jsonlite::toJSON(cor.matrix)
  }
  
  # Return
  return(cor.matrix)
}

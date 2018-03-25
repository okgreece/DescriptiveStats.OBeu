#' @title 
#' Multiple replacement
#'  
#' @description
#' Extract and return a data frame with the columns that include only numeric values
#' 
#' @usage multisub(pattern, replacement, x, ...)
#' 
#' @param pattern Chararcter string vector containing a regular expression to be matched in the given character vector
#' @param replacement A character vector of equal length with the pattern to be replaced.
#' @param x A character vector or an object where the matches are
#' @param ... other parameters to pass
#' 
#' @return This function returns a character vector with the replacements.
#'
#' @author Kleanthis Koupidis
#' 
#' @rdname multisub
#' 
#' @export

multisub <- function(pattern, replacement, x, ...) {
  
  if (length(pattern)!=length(replacement)) {
    stop("The pattern and replacement vectors should have the same length.")
  }
  
  res = x
  
  for (i in 1:length(pattern)) {
    res = gsub(pattern[i], replacement[i], res, ...)
  }
  
  return(res)
}
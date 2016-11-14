#' @title 
#' Correlation Coefficient
#'  
#' @description
#' This functions calculates the correlation coefficient of the input vectors, matrix or data frame.
#' By default, the correlation coefficient of pearson is computed.
#' 
#' @usage ds.correlation(x, y=NULL, cor.method="pearson")
#' 
#' @param x A vector, matrix or data frame
#' @param y A vector, matrix or data frame
#' @param cor.method The correlation coefficient method to compute: "pearson" (default),
#' "kendall" or "spearman".
#' 
#' @details 
#' This function returns a symmetric matrix in json format with the correlation coefficients 
#' of the input data. The correlation coefficient of pearson is computed, by default. 
#' Other options are "kendall" or "spearman".
#' 
#' @author Aikaterini Chatzopoulou, Kleanthis Koupidis
#' 
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @rdname ds.correlation
#' 
#' @export
###########################################################################################

ds.correlation<-function(x, y=NULL, cor.method="pearson"){
  
  # Convert to data frame
  if (is.null(y)==F){
    
    data<-as.data.frame(x,y)
   
  } else if (is.null(y)){
    
      data <- as.data.frame(x)
  }
  
  data.num<-nums(data)
  
  # Check that the data frame has at least two numeric variables
  stopifnot( length(data.num) >= 2 )

  # Correlation method
  cor.method=match.arg(cor.method,c("pearson", "kendall", "spearman"))
  
  # Correlation
  correlation <- stats::cor(data.num, method=cor.method)

  correlation <- data.frame(correlation,row.names = rownames(correlation),
                            column=colnames(correlation) )

  # Return
  return(correlation)
}

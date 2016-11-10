#' @title 
#' Read and Calculate the Basic Information for Basic Descriptive Tasks from Open Spending API
#'  
#' @description
#' Extract and analyze the input data provided from Open Spending API, using the ds.analysis function.
#' 
#' @usage ds.analysis(data, box.out=1.5, corr.method= "pearson", fr.select=NULL)
#' 
#' @param data The input data
#' @param box.out ...
#' @param corr.method The correlation coefficient method to compute: "pearson" (default),
#' "kendall" or "spearman".
#' @param fr.select One or more nominal variables to calculate their corresponding frequencies.
#' 
#' @details 
#' This function is used to read data in json format from Open Spending API, in order to implement 
#' some basic descriptive tasks through \code{\link{ds.analysis}} function.
#' 
#' @return A json string with the resulted parameters of the \code{\link{ds.analysis}} function.
#'
#' @author Kleanthis Koupidis
#' 
#' @seealso \code{\link{open_spending.ds}}
#' 
#' @rdname open_spending.ds
#' 
#' @import jsonlite
#' 
#' @export
#####################################################################################################

ds.analysis <- function(data, box.out=1.5, corr.method= "pearson", fr.select=NULL){
      
    if(all(is.factor(data)) & !all(is.character(data))){
      freq <- ds.frequency(data)
    } else {
      
      descriptives <- ds.statistics(data)
      
      # If correlation can be calculated
      if (length(nums(data))>2) {
        correlation <- ds.correlation(data,y=NULL, cor.method=corr.method)
      }else {
        correlation <- NULL
      }
     
      boxplot <- ds.boxplot(data,out.level=box.out)
      
      frequencies <- ds.frequency(data,select=fr.select)
      
      #linear.model <- ds.glm(data)
      
      stat.plots <- list(
        descriptives=descriptives,
        correlation=correlation,
        boxplot= boxplot,
        frequencies= frequencies
        #linear.model= linear.model
      )
      #stat.plots <- jsonlite::toJSON(stat.plots)
      return(stat.plots)
    }
      
}

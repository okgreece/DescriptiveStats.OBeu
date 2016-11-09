#' @title 
#' Select the numeric columns of a given dataset
#'  
#' @description
#' Extract and return a dataframe with the columns that include only numeric values
#' 
#' @usage nums(data)
#' 
#' @param data The json string, URL or file from Open Spending API
#' 
#' @return This function returns a dataframe with the numeric columns of the input dataset.
#'
#' @author Kleanthis Koupidis
#' 
#' @rdname nums
#' 
#' @export
#####################################################################################################

nums<-function(data){

  num <- sapply(data, is.numeric)
  
  data.num <- data[num]
  
  data.num <- as.data.frame(data.num)
  
return(data.num)
}
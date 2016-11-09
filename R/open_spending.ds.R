#' @title 
#' Read and Calculate the Basic Information for Basic Descriptive Tasks from Open Spending API
#'  
#' @description
#' Extract and analyze the input data provided from Open Spending API, using the ds.analysis function.
#' 
#' @usage open_spending.ds(json_data,amount)
#' 
#' @param json_data The json string, URL or file from Open Spending API
#' @param amount Specify the amount label of the json input data
#' 
#' @details 
#' This function is used to read data in json format from Open Spending API, in order to implement 
#' some basic descriptive tasks through \code{\link{ds.analysis}} function.
#' 
#' @return A json string with the resulted parameters of the \code{\link{ds.analysis}} function.
#'
#' @author Kleanthis Koupidis
#' 
#' @seealso \code{\link{ds.analysis}}
#' 
#' @rdname open_spending.ds
#' 
#' @import jsonlite
#' 
#' @export
#####################################################################################################

open_spending.ds <- function(json_data,amount){
  
  dt <- jsonlite::fromJSON(json_data)
  
  dt<-dt["data"]
  
  dt2<-unique(as.data.frame(dt))
  
    ds.result <- ds.analysis(dt2)
  
  return(ds.result)  
}

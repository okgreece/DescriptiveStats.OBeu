#' @title 
#' Barplot parameters
#'  
#' @description
#' This function calculates the frequencies and the relative frequencies of factors/characters of the input dataset.
#' 
#' @usage ds.frequency(data, select=NULL, tojson=FALSE)
#' 
#' @param data A vector, matrix or data frame which includes at least one factor/character.
#' @param select Select one or more specific nominal variables to calculate their corresponding frequencies, 
#' if it's not specified the result corresponds to frequencies of every factor variable in the data.
#' @param tojson If TRUE the results are returned in json format, default returns a list
#' 
#' @details 
#' This function returns a list with the frequencies and relative frequencies of factors/characters 
#' of the input dataset.
#' 
#' @author Kleanthis Koupidis, Charalampos Bratsas
#'
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#'  
#' @examples 
#' # with data frame as an input and a selected column to calculate its frequencies
#' ds.frequency(iris, select = "Species", tojson = FALSE)
#' 
#' # with data frame as an input without a selected column and json output
#' ds.frequency(iris, tojson = TRUE)
#' 
#' # OpenBudgets.eu Dataset Example:
#' Wuppertal_df
#' ds.frequency(Wuppertal_df, select = "Produkt", tojson = FALSE)
#' 
#' @rdname ds.frequency
#' 
#' @export


ds.frequency <- function(data, select=NULL, tojson=FALSE){
  
  data <- as.data.frame(data)
  
  stopifnot(all(sapply(data, is.numeric))==F)
  
  factors <- which( sapply(data, is.factor) | sapply(data, is.character) )
  
  factors.names <- names(factors)
  
  if (is.null(select)){
    
    selection <- factors.names
    
  } else if (is.null(select)==F) {
    
    selection <- match.arg(select,factors.names,several.ok = T)
  }
  
  data <- data[selection]
  
  freq <-  lapply(data, table)
  
  relative.freq<- lapply(freq,prop.table)
  
  
  if(is.list(freq)){
    freq <- lapply(freq,as.data.frame)
    relative.freq <- lapply(relative.freq,as.data.frame)
  }else {
    freq <- as.data.frame(freq)
    relative.freq <- as.data.frame(relative.freq)
  }
  
  freq.parameters<-list(
    frequencies=freq,
    relative.frequencies=relative.freq
  )
  
  
  if (tojson==T){
    
    freq.parameters=jsonlite::toJSON(freq.parameters)
  }
  
  # Return
  return(freq.parameters)
}

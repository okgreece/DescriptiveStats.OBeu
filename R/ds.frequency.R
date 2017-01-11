#' @title 
#' Frequencies of nominal variables
#'  
#' @description
#' This function calculates frequencies and relative frequencies of factors/characters of the input dataset.
#' 
#' @usage ds.frequency(data, select=NULL)
#' 
#' @param data A vector, matrix or data frame which includes at least one factor/character.
#' @param select One or more nominal variables to calculate their corresponding frequencies.
#' 
#' @details 
#' This function returns a data frame with the frequencies and relative frequencies of factors/characters 
#' of the input dataset.
#' 
#' @author Kleanthis Koupidis
#'
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#'  
#' @rdname ds.frequency
#' 
#' @export
#####################################################################################################################################

ds.frequency <- function(data,select=NULL){

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
 
 # Return
 return(freq.parameters)
}


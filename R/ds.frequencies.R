#' @title 
#' frequencies
#'  
#' @description
#' This functions calculates frequencies of factors/characters of the input dataset.
#' 
#' @usage ds.frequencies(data,select=NULL)
#' 
#' @param data A matrix or data frame which includes at least one factor/character.
#' @param select ...
#' 
#' @details 
#' This function returns a list with the frequencies of factors/characters of the input dataset.
#' 
#' @author Kleanthis Koupidis
#' 
#' @rdname ds.frequencies
#' 
#' @import jsonlite
#'
#' @export
#####################################################################################################################################

ds.frequencies<-function(data,select=NULL){
  
  data<-as.data.frame(data)
  
  stopifnot(all(sapply(data, is.numeric))==F)
  
  factors <-which( sapply(data, is.factor) | sapply(data, is.character) )
  
  factors.names=names(factors)

  if (is.null(select)){
    
    selection<-factors.names
    
  } else if (is.null(select)==F) {

    selection<-match.arg(select,factors.names,several.ok = T)
  }
  
  data<-data[selection]

 freq <- as.data.frame ( sapply( data, table) )

 # JSON output
 frequencies<-jsonlite::toJSON(freq)
 
 # Return
 return(frequencies)
 }


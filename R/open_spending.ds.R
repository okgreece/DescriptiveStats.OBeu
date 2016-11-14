#' @title 
#' Read and Calculate the Basic Information for Basic Descriptive Tasks from Open Spending API
#'  
#' @description
#' Extract and analyze the input data provided from Open Spending API, using the ds.analysis function.
#' 
#' @usage open_spending.ds(json_data,  what=NULL, to.what=NULL, 
#' coef.outl=1.5, box.outliers=T, box.wdth=0.15,
#' cor.method= "pearson", select=NULL)
#' 
#' @param json_data The json string, URL or file from Open Spending API
#' @param what ...
#' @param to.what ...
#' @param coef.outl Determines the length of the "whiskers" plot.
#' If it is equal to zero no outliers will be returned.
#' @param box.outliers If TRUE the outliers will be computed at the selected "coef.outl" level 
#' (default is 1.5 times the Interquartile Range).
#' @param box.wdth The width level is determined 0.15 times the square root of the size of the input data.
#' @param cor.method The correlation coefficient method to compute: "pearson" (default),
#' "kendall" or "spearman".
#' @param freq.select One or more nominal variables to calculate their corresponding frequencies.
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
#' @import reshape
#' 
#' @export
############################################################################################################

open_spending.ds <- function(json_data,  
                             what=NULL, to.what=NULL, amount=NULL,
                             coef.outl=1.5, box.outliers=T, box.wdth=0.15,
                             cor.method= "pearson", freq.select=NULL){ 

  dt <- jsonlite::fromJSON(json_data)

  components <- c("data", "cells")
  
  select.comp <- match.arg(components, names(dt), several.ok = T)
  
  
  dt <- as.data.frame(dt[select.comp])

  if (select.comp=="data") names(dt) <- gsub("data.","",names(dt)) else names(dt) <- gsub("cells.","",names(dt))
  
  # Create data frame with the the selections of user

  dt2 <- unique(as.data.frame(dt))

  #dt2[id_variables] <- lapply(dt2[id_variables],factor)
  
  melt <- reshape::melt.data.frame(dt)

  formula <- paste(what,to.what,sep="~") 
  
  dt2 <- reshape::cast(melt,formula,sum,
                       subset=variable==amount) 

  dt2 <- stats::na.omit(dt2) 
  
  ds.result <- ds.analysis(dt2, c.out=coef.outl,outliers=box.outliers,box.width=box.wdth, 
                           corr.method= cor.method, fr.select=freq.select) 
  
  ds.results <- jsonlite::toJSON(ds.result)
  
  return(ds.results)  
  
} 

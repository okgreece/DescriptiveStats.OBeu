#' @title 
#' Read and Calculate the Basic Information for Basic Descriptive Tasks from Open Spending API
#'  
#' @description
#' Extract and analyze the input data provided from Open Spending API, using the ds.analysis function.
#' 
#' @usage open_spending.ds(json_data, box.outl=1.5, cor.method= "pearson", select=NULL)
#' 
#' @param json_data The json string, URL or file from Open Spending API
#' @param box.outl ...
#' @param cor.method The correlation coefficient method to compute: "pearson" (default),
#' "kendall" or "spearman".
#' @param select One or more nominal variables to calculate their corresponding frequencies.
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
#####################################################################################################

open_spending.ds <- function(json_data, box.outl=1.5, cor.method= "pearson", select=NULL){

  dt <- jsonlite::fromJSON(json_data)

  dimensions=c("data","cells")
  
  select.dim=match.arg(dimensions,names(dt),several.ok = T)
  
  dt<-dt[select.dim]

  dt2<-unique(as.data.frame(dt))
  
  if (select.dim=="cells"){
    melt <- reshape::melt.data.frame(dt2)
    dt2 <- reshape::cast(melt, 
                  "global__fiscalPeriod__28951.notation ~ global__budgetPhase__afd93.prefLabel",
                  sum)
    dt2 <- stats::na.omit(dt2)
    
  }
    ds.result <- ds.analysis(dt2, box.out=box.outl, corr.method= cor.method, fr.select=select)
  
  return(ds.result)  
}

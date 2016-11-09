#' @title 
#' Boxplot
#'  
#' @description
#' Boxplot
#' 
#' @usage ds.boxplot(data, q=1.5)
#' 
#' @param data The input matrix or data frame 
#' @param q ...
#' 
#' @details 
#' boxplot
#' 
#' @author Aikaterini Chatzopoulou, Kleanthis Koupidis
#' 
#' @return 
#' Description of the returns
#' 
#' @seealso \code{\link{ds.analysis}}, \code{\link{open_spending.ds}}
#' 
#' @rdname ds.boxplot
#' 
#' @import jsonlite
#'
#' @export
###################################################################################################

ds.boxplot<-function(data, q=1.5){
  
  # Convert to data frame
  data<-as.data.frame(data)
  
  # Check if all are categorical
  stopifnot(all(sapply(data, is.factor)|sapply(data, is.character))==F)
  
  # only numeric data
  data.num<-nums(data)
  
  # Boxplot parameters
  box.data<-apply(data.num, 2, grDevices::boxplot.stats,coef=2, 
                  do.conf = TRUE, do.out = TRUE)
  
  box.data<-as.list(box.data)
  
  # JSON output
  
  box.json<-jsonlite::toJSON(box.data)
  
  # Return
  return(box.json)
}

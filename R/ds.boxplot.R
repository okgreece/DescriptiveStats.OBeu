#' @title 
#' Boxplot
#'  
#' @description
#' Boxplot
#' 
#' @usage ds.boxplot(data, out.level=1.5)
#' 
#' @param data The input matrix or data frame 
#' @param out.level ...
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

ds.boxplot<-function(data, out.level=1.5){
  
  # Convert to data frame
  data<-as.data.frame(data)
  
  # Check if all are categorical
  stopifnot(all(sapply(data, is.factor)|sapply(data, is.character))==F)
  
  # only numeric data
  data.num<-nums(data)
  
  # Boxplot parameters
  box.data<-apply(data.num, 2, grDevices::boxplot.stats,coef=out.level, 
                  do.conf = F, do.out = T)
  
  box.data<-as.list(box.data)
  
  # JSON output
  
  box.json<-jsonlite::toJSON(box.data)
  
  # Return
  return(box.json)
}

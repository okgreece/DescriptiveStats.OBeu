#' @title 
#' Calculation of some Descriptive Tasks
#'  
#' @description
#' The function calculates the basic descriptive measures, the correlation and the boxplot parameters of all 
#' the numerical variables and the frequencies of all the nominal variables.
#' 
#' @usage ds.analysis(data, c.out=1.5, box.width=0.15, outliers=TRUE, hist.class="Sturges", 
#' corr.method= "pearson", fr.select=NULL, tojson=FALSE)
#' 
#' @param data The input data
#' @param c.out Determines the length of the "whiskers" plot.
#' If it is equal to zero no outliers will be returned.
#' @param box.width The width level is determined 0.15 times the square root of the size of the input data.
#' @param outliers If TRUE the outliers will be computed at the selected "c.out" level (default is 1.5 times the Interquartile Range).
#' @param hist.class The method or the number of classes for the histogram.
#' @param corr.method The correlation coefficient method to compute: "pearson" (default),
#' "kendall" or "spearman".
#' @param fr.select One or more nominal variables to calculate their corresponding frequencies.
#' @param tojson If TRUE the results are returned in json format
#' 
#' @details 
#' This function returns a list with the basic statistics, the parameters needed to visualize a boxplot
#' and a histogram, it also provides the frequencies of non numerical data of the input dataset and the correlation 
#' coefficient. The input of this function can be a matrix or data frame.
#' 
#' @return A list or json file with the following components:
#' 
#' \itemize{
#' \item descriptives The descriptive measures
#' \item boxplot The statistics of the boxplot
#' \item histogram The histogram parameters
#' \item frequencies The frequencies and the relative frequencies of factors/characters of the input dataset
#' \item correlation The correlation coefficient
#' } 
#'
#' @author Kleanthis Koupidis
#' 
#' @seealso \code{\link{open_spending.ds}}
#' 
#' @examples 
#' # with data frame as input with the default parameters
#' data <- iris
#' ds.analysis(data)
#'
#' # using the previous data frame with different parameters
#' ds.analysis(data, c.out = 1, box.width = 0.20, outliers = TRUE, tojson = TRUE)
#' 
#' # using the previous data frame with different parameters 
#' # fr.select parameter specified as Species
#' ds.analysis(data, c.out = 1, outliers = FALSE, fr.select = "Species", tojson = TRUE)
#' 
#' # OpenBudgets.eu Dataset Example:
#' df=Wuppertal_df
#' ds.analysis(df, c.out = 2, box.width = 0.15, outliers = FALSE, tojson = FALSE)
#'                 
#' @rdname ds.analysis
#' 
#' @export


ds.analysis <- function(data, c.out=1.5, box.width=0.15, outliers=TRUE, hist.class="Sturges", 
                        corr.method= "pearson", fr.select=NULL, tojson=FALSE){
      
    if(all(is.factor(data)) & !all(is.character(data))){
      freq <- ds.frequency(data)
    } else {
      
      descriptives <- ds.statistics(data)
      
      # If correlation can be calculated
      if (length(nums(data))>=2) {
        correlation <- ds.correlation(data,y=NULL, cor.method=corr.method)
      }else {
        correlation <- NULL
      }

      boxplot <- ds.boxplot(data, out.level=c.out, width = box.width , outl =outliers)
      data<-as.data.frame(data)
      histogram <- apply( nums(data), 2,ds.hist, breaks=hist.class)
      
      frequencies <- ds.frequency(data,select=fr.select) 
      
      
      stat.plots <- list(
        descriptives=descriptives,
        boxplot= boxplot,
        histogram=histogram,
        frequencies= frequencies,
        correlation=correlation
      ) 
      
      if (tojson==T){
        
        stat.plots=jsonlite::toJSON(stat.plots)
      }
      
      return(stat.plots)
    } 
      
}

#' @title 
#' Generalized Linear Models
#'  
#' @description
#' \code{\link{ds.glm}} is used to fit generalized linear models through glm from stats package and 
#' return some results in json format.
#' 
#' @usage ds.glm(x, dependent=NULL, independent=NULL, distr.family = "gaussian")
#' 
#' @param x The input matrix or data frame 
#' @param dependent The dependent variables of the model
#' @param independent The independent variables of the model
#' @param distr.family A character string naming a the error distribution 
#' and link function to be used in the model(See family for details of family functions.)
#
#' @details 
#' Generalized linear models are used to fit data, using glm stats package, by specifying the
#' dependent and independent variables and the description of the distribution error 
#' (default is gaussian). If user provides only the dependent variables, the rest 
#' variables are selected as independent. If user provides the independent variables, 
#' the rest variables are selected as dependent. If user provides the independent variables, 
#' the two variables with the highest correlation are selected.
#' 
#' @return 
#'  coefficients
#'  residuals
#'  fitted
#'  residuals.degfred
#'  qq.plot
#'  linear.predictors
#'  
#' @author Kleanthis Koupidis
#' 
#' @rdname ds.frequencies
#' 
#' @import jsonlite
#'
#' @export
###################################################################################################

ds.glm <- function(x, dependent=NULL, independent=NULL, distr.family = "gaussian"){
  
  stopifnot( c(dependent,independent) %in% names(x)== T )
  
  all.families=c("binomial","gaussian","Gamma","inverse.gaussian", "poisson","quasi",
                 "quasibinomial","quasipoisson")
  
  stopifnot( distr.family %in% all.families== T )
  
  # only numeric values
  x<-as.data.frame(x)
  num <- sapply(x, is.numeric)
  x <- x[num]
  
  # If user provides both dependent and independent variables
  
  if (is.null(dependent)==F & is.null(independent)==F){
    dependent <- paste(dependent,collapse="+")
    independent <- paste(independent,collapse="+")
    
    
    formula<-paste(dependent,independent,sep="~")
  }
  
  # If user provides the dependent variables
  
  if (is.null(dependent)==F & is.null(independent)==T){
    
    dependent <- paste(dependent,collapse="+")
    formula<-paste(dependent,"~.-",dependent)}
  
  # If user provides the independent variables
  
  if (is.null(dependent)==T & is.null(independent)==F){
    
    independent <- paste(independent,collapse="+")

    index<-which((names(x) %in% independent)== F)
    dependent<-names(x)[index]
    
    formula<-paste(dependent,independent,sep="~")
  }
  
  if (is.null(dependent)==T & is.null(independent)==T){
  
  # Find the variables with the highest correlation
  correlation<-as.data.frame(as.table(stats::cor(x)))
  
  proposed = correlation[correlation["Freq"]!=1,]  
  proposed=proposed[order(-proposed[,3]),]
  
  dependent<- paste(proposed[1,1])
  independent <- paste(proposed[1,2])
  
  formula<-paste(dependent,independent,sep="~")
  }
  
  # Model Implementation
  regression <- stats::glm(formula, data=x, family=distr.family) 
  
  # Returns
  names(regression$coefficients)[1] <- "intercept"
  
  coef <- as.list(regression$coefficients)
  
  residuals <- regression$residuals
  
  fitted <- regression$fitted.values
  
  res.degr.fred <- regression$df.residual
  
  qq.plot=stats::qqnorm(residuals,plot.it = F)
  
  linear.predictors=regression$linear.predictors
  
  details <- list(
    coefficients=coef, 
    residuals=residuals, 
    fitted=fitted,
    residuals.degfred=res.degr.fred,
    #Normal Q-Q Plot-y=Sample Quantiles(data),x=Theoretical Quantiles
    qq.plot=qq.plot,
    linear.predictors=linear.predictors
  )
  details<-jsonlite::toJSON(details)
  
  return(details)
}

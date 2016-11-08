ds.correlation<-function(x,y=NULL){
  
  # Convert to data frame
  
  if (is.null(y)==F){
    
    data<-as.data.frame(x,y)
    
  } else if (is.null(y)){
    
      data<-as.data.frame(x)
  }
  
  # Check the dimension of the data frame
  stopifnot(ncol(data)>=2)
  
  # Check if all categorical   
  stopifnot(all(sapply(data, is.factor)|sapply(data, is.character))==F)
  
  # only numeric values
  num <- sapply(data, is.numeric)
  data.num <- data[num]
  
  # correlation
  correlation <- stats::cor(data.num)
  correlation <- as.data.frame(correlation)
  
  # JSON output
  correlation.json <- jsonlite::toJSON(correlation)
  
  # Return
  return(correlation.json)
}
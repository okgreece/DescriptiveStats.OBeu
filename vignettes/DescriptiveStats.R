## ------------------------------------------------------------------------
library(DescriptiveStats.OBeu)
ds.statistics(Wuppertal_df[,-4])

## ------------------------------------------------------------------------
histogram <- ds.hist(Wuppertal_df$Amount)
histogram

## ------------------------------------------------------------------------
str(histogram)

## ------------------------------------------------------------------------
ds.boxplot(Wuppertal_df$Amount,out.level = 0)

## ------------------------------------------------------------------------
ds.correlation(Wuppertal_df)

## ------------------------------------------------------------------------
ds.frequency(Wuppertal_df[,2:3])

## ------------------------------------------------------------------------
ds.kurtosis(Wuppertal_df)

## ------------------------------------------------------------------------
ds.skewness(Wuppertal_df)

## ------------------------------------------------------------------------
Wuppertal_openspending

## ------------------------------------------------------------------------
descript = open_spending.ds(
  json_data =  Wuppertal_openspending, 
  dimensions ="functional_classification_3.Produktgruppe|date_2.Year",
  amounts = "Amount"
  )
# Pretty output using prettify of jsonlite library
jsonlite::prettify(descript,indent = 2)


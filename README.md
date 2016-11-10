DescriptiveStats.OBeu <img src="obeu_logo.png" align="right" />
================
Kleanthis Koupidis, Aikaterini Chatzopoulou, Charalampos Bratsas
November 7, 2016

[![Pending Pull-Requests](http://githubbadges.herokuapp.com/okgreece/DescriptiveStats.OBeu/pulls.svg)](https://github.com/okgreece/DescriptiveStats.OBeu/pulls) [![Github Issues](http://githubbadges.herokuapp.com/okgreece/DescriptiveStats.OBeu/issues.svg)](https://github.com/okgreece/DescriptiveStats.OBeu/issues)

This document describes the use of the functions implemented in DescriptiveStats.OBeu package both in R and OpenCPU environments.

Install:
========

Load *devtools* library or install it if not already:

Then install *DescriptiveStats.OBeu* from [Github](https://github.com/okgreece/DescriptiveStats.OBeu)

And load the library

``` r
library(DescriptiveStats.OBeu)
```

Use:
====

The basic function is:

``` r
ds.analysis(data, box.out=1.5, corr.method= "pearson", fr.select=NULL)
```

where *data*: The input data

*box.out*: The level of of outliers, default is 1.5\*sd

*corr.method*: The correlation coefficient method to compute: "pearson" (default), "kendall" or "spearman".

and *fr.select*: One or more nominal variables to calculate their corresponding frequencies.

### R Example

The package includes the following data:

``` r
# 1. data frame produced from rudolf:
sample_df_rudolf 
```

    ##    global__budgetPhase__afd93.prefLabel
    ## 1                               Revised
    ## 2                              Executed
    ## 3                              Approved
    ## 4                              Executed
    ## 5                              Approved
    ## 6                              Executed
    ## 7                              Approved
    ## 8                              Executed
    ## 9                               Revised
    ## 10                              Revised
    ## 11                             Reserved
    ## 12                              Revised
    ## 13                             Executed
    ## 14                             Executed
    ## 15                              Revised
    ## 16                             Reserved
    ## 17                             Reserved
    ## 18                             Approved
    ## 19                             Executed
    ## 20                             Approved
    ## 21                             Reserved
    ## 22                             Approved
    ## 23                             Approved
    ## 24                             Executed
    ## 25                             Reserved
    ## 26                             Executed
    ## 27                             Reserved
    ## 28                              Revised
    ## 29                                Draft
    ## 30                             Reserved
    ## 31                             Reserved
    ## 32                                Draft
    ## 33                                Draft
    ## 34                             Reserved
    ## 35                                Draft
    ## 36                              Revised
    ## 37                             Executed
    ## 38                                Draft
    ## 39                                Draft
    ## 40                              Revised
    ## 41                              Revised
    ## 42                             Reserved
    ## 43                             Reserved
    ## 44                                Draft
    ## 45                              Revised
    ## 46                                Draft
    ## 47                             Approved
    ## 48                                Draft
    ## 49                              Revised
    ## 50                                Draft
    ## 51                             Approved
    ## 52                             Executed
    ## 53                             Approved
    ## 54                              Revised
    ## 55                                Draft
    ## 56                             Approved
    ## 57                             Approved
    ## 58                             Executed
    ## 59                             Reserved
    ## 60                                Draft
    ##    global__fiscalPeriod__28951.notation global__amount__0397f.sum
    ## 1                                  2004                7776199431
    ## 2                                  2014                4561405226
    ## 3                                  2007                4528366008
    ## 4                                  2006                5137041789
    ## 5                                  2006                4576689407
    ## 6                                  2015                4350299388
    ## 7                                  2009                5240736006
    ## 8                                  2008                5727781327
    ## 9                                  2008                9471043516
    ## 10                                 2010               10897898000
    ## 11                                 2015                 397805068
    ## 12                                 2012                9511626156
    ## 13                                 2007                5048868478
    ## 14                                 2010                5382714318
    ## 15                                 2006                7151389509
    ## 16                                 2012                 459080674
    ## 17                                 2013                 474341545
    ## 18                                 2004                3653382033
    ## 19                                 2005                5048868478
    ## 20                                 2015                3807199209
    ## 21                                 2010                 678705028
    ## 22                                 2012                4259002229
    ## 23                                 2008                5032128560
    ## 24                                 2013                5194074957
    ## 25                                 2004                 369627311
    ## 26                                 2011                5648622872
    ## 27                                 2007                 544506971
    ## 28                                 2013               10020289289
    ## 29                                 2007                6718140000
    ## 30                                 2005                 544506971
    ## 31                                 2014                 415927816
    ## 32                                 2010               10367445000
    ## 33                                 2009                9760828000
    ## 34                                 2006                 522211280
    ## 35                                 2014                8506966105
    ## 36                                 2005                6862535009
    ## 37                                 2009                6051621219
    ## 38                                 2013                7337000000
    ## 39                                 2011                9892047000
    ## 40                                 2009               10643830406
    ## 41                                 2015                9163079890
    ## 42                                 2011                 528749813
    ## 43                                 2009                 681484245
    ## 44                                 2008                9175892000
    ## 45                                 2014                8968679270
    ## 46                                 2015                8354393751
    ## 47                                 2013                4510210535
    ## 48                                 2005                6718140000
    ## 49                                 2011                9910581362
    ## 50                                 2004                7554173000
    ## 51                                 2005                4528366008
    ## 52                                 2004                5215613860
    ## 53                                 2011                4902387038
    ## 54                                 2007                6862535009
    ## 55                                 2006                6632439000
    ## 56                                 2010                4597258144
    ## 57                                 2014                3999462730
    ## 58                                 2012                5025993560
    ## 59                                 2008                 626919079
    ## 60                                 2012                9020000000

``` r
# 2. json format file
sample_json_openspending
```

    ## [1] "{\n\"page\": 1,\n\"order\": [],\n\"page_size\": 20,\n\"status\": \"ok\",\n\"cell\": [],\n\"data\": [\n{\n  \"date_2.Year\": 2016,\n  \"Revised\": 322588100000,\n  \"Original\": 316532600000,\n  \"functional_classification_2.Function\": \"GENERAL PUBLIC SERVICE\",\n  \"functional_classification_2.Code\": \"01\"\n},\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 109003900000,\n  \"Original\": 99648900000,\n  \"functional_classification_2.Function\": \"DEFENSE\",\n  \"functional_classification_2.Code\": \"02\"\n  },\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 122930500000,\n  \"Original\": 109794000000,\n  \"functional_classification_2.Function\": \"PUBLIC ORDER AND SAFETY\",\n  \"functional_classification_2.Code\": \"03\"\n  },\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 331005000000,\n  \"Original\": 360226700000,\n  \"functional_classification_2.Function\": \"ECONOMIC AFFAIRS\",\n  \"functional_classification_2.Code\": \"04\"\n  },\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 11007200000,\n  \"Original\": 12087800000,\n  \"functional_classification_2.Function\": \"ENVIRONMENTAL PROTECTION\",\n  \"functional_classification_2.Code\": \"05\"\n  },\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 34340700000,\n  \"Original\": 34651100000,\n  \"functional_classification_2.Function\": \"HOUSING AND PUBLIC FACILITIES\",\n  \"functional_classification_2.Code\": \"06\"\n  },\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 66069800000,\n  \"Original\": 67213700000,\n  \"functional_classification_2.Function\": \"HEALTH\",\n  \"functional_classification_2.Code\": \"07\"\n  },\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 5868600000,\n  \"Original\": 7432700000,\n  \"functional_classification_2.Function\": \"TOURISM\",\n  \"functional_classification_2.Code\": \"08\"\n  },\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 9778400000,\n  \"Original\": 9785100000,\n  \"functional_classification_2.Function\": \"RELIGION\",\n  \"functional_classification_2.Code\": \"09\"\n  },\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 143262100000,\n  \"Original\": 150090000000,\n  \"functional_classification_2.Function\": \"EDUCATION\",\n  \"functional_classification_2.Code\": \"10\"\n  },\n  {\n  \"date_2.Year\": 2016,\n  \"Revised\": 150841700000,\n  \"Original\": 158088800000,\n  \"functional_classification_2.Function\": \"SOCIAL PROTECTION\",\n  \"functional_classification_2.Code\": \"11\"\n  }\n  ],\n  \"fields\": [\n  \"date_2.Year\",\n  \"functional_classification_2.Code\",\n  \"functional_classification_2.Function\",\n  \"Original\",\n  \"Revised\"\n  ],\n  \"total_fact_count\": 11\n  }"

``` r
# 3. a link to json file-openspending
sample_json_link_openspending
```

    ## [1] "http://next.openspending.org/api/3/cubes/21260d070eb5d63a121ea4c400dafbbb:apbn_fungsi_2016/facts?pagesize=20"

``` r
# 4. a link to json file-rudolf
sample_json_link_rudolf
```

    ## [1] "http://ws307.math.auth.gr/rudolf/public/api/v3/cubes/global/aggregate?drilldown=global__budgetPhase__afd93.prefLabel%7Cglobal__fiscalPeriod__28951.notation&cut=global__organization__0eba1.prefLabel:http://el.dbpedia.org/resource/%CE%94%CE%AE%CE%BC%CE%BF%CF%82_%CE%91%CE%B8%CE%B7%CE%BD%CE%B1%CE%AF%CF%89%CE%BD&aggregates=global__amount__0397f.sum"

We select for example the data frame produced from rudolf.

``` r
ds.analysis(sample_df_rudolf)
```

    ## $descriptives
    ## $descriptives$Min
    ## global__amount__0397f.sum 
    ##                 369627311 
    ## 
    ## $descriptives$Max
    ## global__amount__0397f.sum 
    ##               10897898000 
    ## 
    ## $descriptives$Range
    ## global__amount__0397f.sum 
    ##               10528270689 
    ## 
    ## $descriptives$Mean
    ## global__amount__0397f.sum 
    ##                5492485165 
    ## 
    ## $descriptives$Median
    ## global__amount__0397f.sum 
    ##                5204844409 
    ## 
    ## $descriptives$Quantiles
    ##     global__amount__0397f.sum
    ## 25%                4194117354
    ## 75%                7920748011
    ## 
    ## $descriptives$Variance
    ## global__amount__0397f.sum 
    ##              1.011777e+19 
    ## 
    ## $descriptives$StandartDeviation
    ## global__amount__0397f.sum 
    ##                3180844645 
    ## 
    ## $descriptives$Kurtosis
    ## global__amount__0397f.sum 
    ##                 -0.977687 
    ## 
    ## $descriptives$Skewness
    ## global__amount__0397f.sum 
    ##                -0.1769652 
    ## 
    ## 
    ## $correlation
    ## NULL
    ## 
    ## $boxplot
    ## {"global__amount__0397f.sum":{"stats":[369627311,4129232479.515,5204844408.5,8065296591,10897898000],"n":[60],"conf":{},"out":[]}} 
    ## 
    ## $frequencies
    ## {"global__budgetPhase__afd93.prefLabel":[{"Var1":"Approved","Freq":12},{"Var1":"Draft","Freq":12},{"Var1":"Executed","Freq":12},{"Var1":"Reserved","Freq":12},{"Var1":"Revised","Freq":12}],"global__fiscalPeriod__28951.notation":[{"Var1":"2004","Freq":5},{"Var1":"2005","Freq":5},{"Var1":"2006","Freq":5},{"Var1":"2007","Freq":5},{"Var1":"2008","Freq":5},{"Var1":"2009","Freq":5},{"Var1":"2010","Freq":5},{"Var1":"2011","Freq":5},{"Var1":"2012","Freq":5},{"Var1":"2013","Freq":5},{"Var1":"2014","Freq":5},{"Var1":"2015","Freq":5}]}

Also we can define the parameters of *box.out* to 2 and *corr.method* to "spearman"

``` r
ds.analysis(sample_df_rudolf,box.out=2,corr.method = "spearman")
```

    ## $descriptives
    ## $descriptives$Min
    ## global__amount__0397f.sum 
    ##                 369627311 
    ## 
    ## $descriptives$Max
    ## global__amount__0397f.sum 
    ##               10897898000 
    ## 
    ## $descriptives$Range
    ## global__amount__0397f.sum 
    ##               10528270689 
    ## 
    ## $descriptives$Mean
    ## global__amount__0397f.sum 
    ##                5492485165 
    ## 
    ## $descriptives$Median
    ## global__amount__0397f.sum 
    ##                5204844409 
    ## 
    ## $descriptives$Quantiles
    ##     global__amount__0397f.sum
    ## 25%                4194117354
    ## 75%                7920748011
    ## 
    ## $descriptives$Variance
    ## global__amount__0397f.sum 
    ##              1.011777e+19 
    ## 
    ## $descriptives$StandartDeviation
    ## global__amount__0397f.sum 
    ##                3180844645 
    ## 
    ## $descriptives$Kurtosis
    ## global__amount__0397f.sum 
    ##                 -0.977687 
    ## 
    ## $descriptives$Skewness
    ## global__amount__0397f.sum 
    ##                -0.1769652 
    ## 
    ## 
    ## $correlation
    ## NULL
    ## 
    ## $boxplot
    ## {"global__amount__0397f.sum":{"stats":[369627311,4129232479.515,5204844408.5,8065296591,10897898000],"n":[60],"conf":{},"out":[]}} 
    ## 
    ## $frequencies
    ## {"global__budgetPhase__afd93.prefLabel":[{"Var1":"Approved","Freq":12},{"Var1":"Draft","Freq":12},{"Var1":"Executed","Freq":12},{"Var1":"Reserved","Freq":12},{"Var1":"Revised","Freq":12}],"global__fiscalPeriod__28951.notation":[{"Var1":"2004","Freq":5},{"Var1":"2005","Freq":5},{"Var1":"2006","Freq":5},{"Var1":"2007","Freq":5},{"Var1":"2008","Freq":5},{"Var1":"2009","Freq":5},{"Var1":"2010","Freq":5},{"Var1":"2011","Freq":5},{"Var1":"2012","Freq":5},{"Var1":"2013","Freq":5},{"Var1":"2014","Freq":5},{"Var1":"2015","Freq":5}]}

OpenCPU Short Guide - DescriptiveStats.OBeu
===========================================

Go to: <http://okfnrg.math.auth.gr/ocpu/test/>

How to use functions:
---------------------

Type to the endpoint:

``` r
 ../library/ {name of the library} /R/ {function}
```

If you want to see the function parameters you should:

-   Select Method:

``` r
Get
```

and in order to run a function you should:

-   Select Method:

``` r
Post
```

Example \#1:
------------

1.  Go to <http://okfnrg.math.auth.gr/ocpu/test/>

2.  Copy and paste the following function to the endpoint

``` r
../library/DescriptiveStats.OBeu/R/ds.analysis
```

1.  *Select Method*:

``` r
 Post
```

1.  **Add parameters** and set:

Define the input time series data:

-   *Param Name*:

``` r
data
```

-   *Param Value* the following:

``` r
sample_df_rudolf
```

Define the level of boxplot outliers (*optional*),default is 1.5:

-   *Param Name*:

``` r
box.out
```

Define the correlation method (*corr.method*), default is *"pearson"*:

-   *Param Name*:

``` r
corr.method
```

-   *Param Value* -for example:

``` r
"spearman"
```

1.  Ready! Click on **Ajax request**!

2.  To see the results:

copy the */ocpu/tmp/{this}/R/.val* (the first choice on the right panel)

1.  and paste <http://okfnrg.math.auth.gr/ocpu/tmp/> {this} /R/.val on a new tab.

Example \#2 - Rudolf/Open Spending-DescriptiveStats
---------------------------------------------------

1.  Go to <http://okfnrg.math.auth.gr/ocpu/test/>

2.  Copy and paste the following function to the endpoint

``` r
../library/DescriptiveStats.OBeu/R/open_spending.ds
```

1.  *Select Method*:

``` r
Post
```

1.  **Add parameters** and set:

Define the input time series data:

-   *Param Name*:

``` r
json_data
```

-   *Param Value* -the following output from rudolf/ open spending api or you can provide the also **json URL**:

``` r
# 1. json format file
sample_json_openspending

# 2. a link to json file-openspending
sample_json_link_openspending

# 3. a link to json file-rudolf
sample_json_link_rudolf
```

Define the level of boxplot outliers (*optional*),default is 1.5:

-   *Param Name*:

``` r
box.out
```

Define the correlation method (*corr.method*), default is *"pearson"*:

-   *Param Name*:

``` r
corr.method
```

-   *Param Value* -for example:

``` r
"spearman" 
```

1.  Ready! Click on **Ajax request**!

2.  To see the results:

copy the */ocpu/tmp/{this}/R/.val* (the first choice on the right panel)

1.  and paste <http://okfnrg.math.auth.gr/ocpu/tmp/> {this} /R/.val on a new tab.

Further Details:
================

-   <https://www.opencpu.org/help.html>

-   <https://cran.r-project.org/web/packages/opencpu/vignettes/opencpu-server.pdf>

-   <https://www.opencpu.org/jslib.html>

Github:
=======

-   <https://github.com/okgreece/DescriptiveStats.OBeu>

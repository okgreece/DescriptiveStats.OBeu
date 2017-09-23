DescriptiveStats.OBeu <img src="okfgr2.png" align="right" />
================
Kleanthis Koupidis, Aikaterini Chatzopoulou, Charalampos Bratsas

[![Build Status](https://travis-ci.org/okgreece/DescriptiveStats.OBeu.svg?branch=master)](https://travis-ci.org/okgreece/DescriptiveStats.OBeu) [![Pending Pull-Requests](http://githubbadges.herokuapp.com/okgreece/DescriptiveStats.OBeu/pulls.svg)](https://github.com/okgreece/DescriptiveStats.OBeu/pulls) [![Github Issues](http://githubbadges.herokuapp.com/okgreece/DescriptiveStats.OBeu/issues.svg)](https://github.com/okgreece/DescriptiveStats.OBeu/issues) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![packageversion](https://img.shields.io/badge/Package%20version-1.2.1-orange.svg?style=flat-square)](commits/master) [![minimal R version](https://img.shields.io/badge/R%3E%3D-3.1-6666ff.svg)](https://cran.r-project.org/) [![Licence](https://img.shields.io/badge/licence-GPL--2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)

Εstimate and return the necessary parameters for descriptive statistics visualizations, used in [OpenBudgets.eu](http://openbudgets.eu/). It includes functions for measuring central tendency and dispersion of amount variables along with their distributions and correlations and the frequencies of categorical variables for Budget data of municipalities across Europe, according to the [OpenBudgets.eu data model](https://github.com/openbudgets/data-model).

This package can generally be used to extract visualization parameters convert them to JSON format and use them as input in a different graphical interface. Most functions can have general use out of the [OpenBudgets.eu data model](https://github.com/openbudgets/data-model).

``` r
# install DescriptiveStats.OBeu- cran stable version
install.packages(DescriptiveStats.OBeu) 
# or
# alternatively install the development version from github
devtools::install_github("okgreece/DescriptiveStats.OBeu")
```

Load library `DescriptiveStats.OBeu` <img src="obeu_logo.png" align="right" />

``` r
library(DescriptiveStats.OBeu)
```

Descriptive Statistics in a call
================================

`ds.analysis` is used to estimate *minimum*, *maximum*, *range*, *mean*, *median*, *first and third quantiles*, *variance*, *standart deviation*, *skewness* and *kurtosis*, *boxplot*, *histogram parameters* needed for visualization of numeric variables and *frequencies* of factor variables of a given vector, matrix or data frame of data.

`ds.analysis` returns by default a list object, we set `tojson` parameter `TRUE`, `outliers` parameter `FALSE`, `fr.select = "Produktbereich"`. Τhere is one numeric variable, correlation will be empty.

``` r
wuppertalanalysis = ds.analysis(Wuppertal_df,outliers=FALSE, fr.select = "Produktbereich", tojson=TRUE) # json string format
jsonlite::prettify(wuppertalanalysis) # use prettify of jsonlite library to add indentation to the returned JSON string
```

    ## {
    ##     "descriptives": {
    ##         "Min": {
    ##             "Amount": [
    ##                 -2040680.54
    ##             ]
    ##         },
    ##         "Max": {
    ##             "Amount": [
    ##                 507995000
    ##             ]
    ##         },
    ##         "Range": {
    ##             "Amount": [
    ##                 510035680.54
    ##             ]
    ##         },
    ##         "Mean": {
    ##             "Amount": [
    ##                 6171229.3658
    ##             ]
    ##         },
    ##         "Median": {
    ##             "Amount": [
    ##                 736038.09
    ##             ]
    ##         },
    ##         "Quantiles": {
    ##             "Amount": [
    ##                 243696.13,
    ##                 2653000
    ##             ]
    ##         },
    ##         "Variance": {
    ##             "Amount": [
    ##                 777106882358169
    ##             ]
    ##         },
    ##         "StandardDeviation": {
    ##             "Amount": [
    ##                 27876636.8552
    ##             ]
    ##         },
    ##         "Kurtosis": [
    ##             160.1519
    ##         ],
    ##         "Skewness": [
    ##             11.4762
    ##         ]
    ##     },
    ##     "boxplot": {
    ##         "Amount": {
    ##             "lo.whisker": [
    ##                 -2040680.54
    ##             ],
    ##             "lo.hinge": [
    ##                 243696.13
    ##             ],
    ##             "median": [
    ##                 736038.09
    ##             ],
    ##             "up.hinge": [
    ##                 2653000
    ##             ],
    ##             "up.whisker": [
    ##                 6243113.59
    ##             ],
    ##             "box.width": [
    ##                 11.83
    ##             ],
    ##             "lo.out": {
    ## 
    ##             },
    ##             "up.out": {
    ## 
    ##             },
    ##             "n": [
    ##                 6225
    ##             ]
    ##         }
    ##     },
    ##     "histogram": {
    ##         "Amount": {
    ##             "cuts": [
    ##                 -50000000,
    ##                 0,
    ##                 50000000,
    ##                 100000000,
    ##                 150000000,
    ##                 200000000,
    ##                 250000000,
    ##                 300000000,
    ##                 350000000,
    ##                 400000000,
    ##                 450000000,
    ##                 500000000,
    ##                 550000000
    ##             ],
    ##             "counts": [
    ##                 46,
    ##                 6032,
    ##                 83,
    ##                 30,
    ##                 10,
    ##                 0,
    ##                 1,
    ##                 11,
    ##                 2,
    ##                 4,
    ##                 4,
    ##                 2
    ##             ],
    ##             "mean": [
    ##                 6171229.3658
    ##             ],
    ##             "median": [
    ##                 736038.09
    ##             ]
    ##         }
    ##     },
    ##     "frequencies": {
    ##         "frequencies": {
    ##             "Produktbereich": [
    ##                 {
    ##                     "Var1": "Allgemeine Finanzwirtschaft",
    ##                     "Freq": 101
    ##                 },
    ##                 {
    ##                     "Var1": "Bauen und Wohnen",
    ##                     "Freq": 193
    ##                 },
    ##                 {
    ##                     "Var1": "Gesundheitsdienste",
    ##                     "Freq": 207
    ##                 },
    ##                 {
    ##                     "Var1": "Innere Verwaltung",
    ##                     "Freq": 1737
    ##                 },
    ##                 {
    ##                     "Var1": "Kinder-, Jugend- u. Familienhilfe",
    ##                     "Freq": 373
    ##                 },
    ##                 {
    ##                     "Var1": "Kultur und Wissenschaft",
    ##                     "Freq": 346
    ##                 },
    ##                 {
    ##                     "Var1": "Natur- und Landschaftspflege",
    ##                     "Freq": 256
    ##                 },
    ##                 {
    ##                     "Var1": "Räuml.Planung, Entw., Geoinfo.",
    ##                     "Freq": 463
    ##                 },
    ##                 {
    ##                     "Var1": "Schulträgeraufgaben",
    ##                     "Freq": 364
    ##                 },
    ##                 {
    ##                     "Var1": "Sicherheit und Ordnung",
    ##                     "Freq": 591
    ##                 },
    ##                 {
    ##                     "Var1": "Soziale Leistungen",
    ##                     "Freq": 663
    ##                 },
    ##                 {
    ##                     "Var1": "Sportförderung",
    ##                     "Freq": 224
    ##                 },
    ##                 {
    ##                     "Var1": "Stiftungen",
    ##                     "Freq": 31
    ##                 },
    ##                 {
    ##                     "Var1": "Umweltschutz",
    ##                     "Freq": 128
    ##                 },
    ##                 {
    ##                     "Var1": "Ver- und Entsorgung",
    ##                     "Freq": 155
    ##                 },
    ##                 {
    ##                     "Var1": "Verkehrsflächen/-anlagen,ÖPNV",
    ##                     "Freq": 261
    ##                 },
    ##                 {
    ##                     "Var1": "Wirtschaft und Tourismus",
    ##                     "Freq": 132
    ##                 }
    ##             ]
    ##         },
    ##         "relative.frequencies": {
    ##             "Produktbereich": [
    ##                 {
    ##                     "Var1": "Allgemeine Finanzwirtschaft",
    ##                     "Freq": 0.0162
    ##                 },
    ##                 {
    ##                     "Var1": "Bauen und Wohnen",
    ##                     "Freq": 0.031
    ##                 },
    ##                 {
    ##                     "Var1": "Gesundheitsdienste",
    ##                     "Freq": 0.0333
    ##                 },
    ##                 {
    ##                     "Var1": "Innere Verwaltung",
    ##                     "Freq": 0.279
    ##                 },
    ##                 {
    ##                     "Var1": "Kinder-, Jugend- u. Familienhilfe",
    ##                     "Freq": 0.0599
    ##                 },
    ##                 {
    ##                     "Var1": "Kultur und Wissenschaft",
    ##                     "Freq": 0.0556
    ##                 },
    ##                 {
    ##                     "Var1": "Natur- und Landschaftspflege",
    ##                     "Freq": 0.0411
    ##                 },
    ##                 {
    ##                     "Var1": "Räuml.Planung, Entw., Geoinfo.",
    ##                     "Freq": 0.0744
    ##                 },
    ##                 {
    ##                     "Var1": "Schulträgeraufgaben",
    ##                     "Freq": 0.0585
    ##                 },
    ##                 {
    ##                     "Var1": "Sicherheit und Ordnung",
    ##                     "Freq": 0.0949
    ##                 },
    ##                 {
    ##                     "Var1": "Soziale Leistungen",
    ##                     "Freq": 0.1065
    ##                 },
    ##                 {
    ##                     "Var1": "Sportförderung",
    ##                     "Freq": 0.036
    ##                 },
    ##                 {
    ##                     "Var1": "Stiftungen",
    ##                     "Freq": 0.005
    ##                 },
    ##                 {
    ##                     "Var1": "Umweltschutz",
    ##                     "Freq": 0.0206
    ##                 },
    ##                 {
    ##                     "Var1": "Ver- und Entsorgung",
    ##                     "Freq": 0.0249
    ##                 },
    ##                 {
    ##                     "Var1": "Verkehrsflächen/-anlagen,ÖPNV",
    ##                     "Freq": 0.0419
    ##                 },
    ##                 {
    ##                     "Var1": "Wirtschaft und Tourismus",
    ##                     "Freq": 0.0212
    ##                 }
    ##             ]
    ##         }
    ##     },
    ##     "correlation": {
    ## 
    ##     }
    ## }
    ## 

`ds.analysis` uses internally the functions `ds.statistics`,`ds.hist`,`ds.boxplot`,`ds.correlation` and `ds.frequency`. However, these functions can be used independently and depends on the user requirements (see package manual or vignettes).

Descriptive Statistics on OpenBudgets.eu platform
=================================================

`open_spending.ds` is designed to estimate and return the basic descriptive measures, the correlation and the boxplot parameters of all the numerical variables and the frequencies of all factor variables of [OpenBudgets.eu](http://openbudgets.eu/) datasets.

The input data must be a JSON link according to the [OpenBudgets.eu data model](https://github.com/openbudgets/data-model). There are different parameters that a user could specify, e.g. `dimensions`, `measured.dimensions` and `amounts` should be defined by the user, to form the dimensions of the dataset. Then the basic descriptive measures of tendency and spread, boxplot and histogram parameters are estimated in order to describe and visualize the distribution characteristics of the desired dataset.

`open_spending.ds` estimates and returns the json data that are described with the [OpenBudgets.eu data model](https://github.com/openbudgets/data-model), using `ds.analysis` function.

``` r
descript = open_spending.ds(
  json_data =  Wuppertal_openspending, 
  dimensions ="functional_classification_3.Produktgruppe|date_2.Year",
  amounts = "Amount"
  )
# Pretty output using prettify of jsonlite library
jsonlite::prettify(descript,indent = 2)
```

    ## {
    ##   "descriptives": {
    ##     "Min": {
    ##       "Amount": [
    ##         533.21
    ##       ]
    ##     },
    ##     "Max": {
    ##       "Amount": [
    ##         2997043.49
    ##       ]
    ##     },
    ##     "Range": {
    ##       "Amount": [
    ##         2996510.28
    ##       ]
    ##     },
    ##     "Mean": {
    ##       "Amount": [
    ##         659132.4457
    ##       ]
    ##     },
    ##     "Median": {
    ##       "Amount": [
    ##         476400.565
    ##       ]
    ##     },
    ##     "Quantiles": {
    ##       "Amount": [
    ##         313924.26,
    ##         656962.815
    ##       ]
    ##     },
    ##     "Variance": {
    ##       "Amount": [
    ##         469375540712.697
    ##       ]
    ##     },
    ##     "StandardDeviation": {
    ##       "Amount": [
    ##         685109.8749
    ##       ]
    ##     },
    ##     "Kurtosis": [
    ##       5.7675
    ##     ],
    ##     "Skewness": [
    ##       2.5221
    ##     ]
    ##   },
    ##   "boxplot": {
    ##     "Amount": {
    ##       "lo.whisker": [
    ##         533.21
    ##       ],
    ##       "lo.hinge": [
    ##         306296.49
    ##       ],
    ##       "median": [
    ##         476400.565
    ##       ],
    ##       "up.hinge": [
    ##         658308.4
    ##       ],
    ##       "up.whisker": [
    ##         1185907.2
    ##       ],
    ##       "box.width": [
    ##         1.5
    ##       ],
    ##       "lo.out": [
    ## 
    ##       ],
    ##       "up.out": [
    ##         2954238.51,
    ##         2979998.49,
    ##         2992244.95,
    ##         2916160.36,
    ##         2885816.5,
    ##         2997043.49,
    ##         2875275.56,
    ##         1252420.49,
    ##         1248584.45
    ##       ],
    ##       "n": [
    ##         100
    ##       ]
    ##     }
    ##   },
    ##   "histogram": {
    ##     "Amount": {
    ##       "cuts": [
    ##         0,
    ##         500000,
    ##         1000000,
    ##         1500000,
    ##         2000000,
    ##         2500000,
    ##         3000000
    ##       ],
    ##       "counts": [
    ##         54,
    ##         32,
    ##         7,
    ##         0,
    ##         0,
    ##         7
    ##       ],
    ##       "mean": [
    ##         659132.4457
    ##       ],
    ##       "median": [
    ##         476400.565
    ##       ]
    ##     }
    ##   },
    ##   "frequencies": {
    ##     "frequencies": {
    ##       "functional_classification_3.Produktgruppe": [
    ##         {
    ##           "Var1": "",
    ##           "Freq": 2
    ##         },
    ##         {
    ##           "Var1": "(entfallen in 2013) Geschäftsbereichsleitung GB 1.1 ",
    ##           "Freq": 5
    ##         },
    ##         {
    ##           "Var1": "Beschäftigtenvertretung",
    ##           "Freq": 1
    ##         },
    ##         {
    ##           "Var1": "Bezirksvertretungen",
    ##           "Freq": 7
    ##         },
    ##         {
    ##           "Var1": "Geschäftsbereichsleitung GB 1",
    ##           "Freq": 15
    ##         },
    ##         {
    ##           "Var1": "Geschäftsbereichsleitung GB 2.1",
    ##           "Freq": 7
    ##         },
    ##         {
    ##           "Var1": "Geschäftsbereichsleitung GB 2.2",
    ##           "Freq": 7
    ##         },
    ##         {
    ##           "Var1": "Geschäftsbereichsleitung GB 4",
    ##           "Freq": 28
    ##         },
    ##         {
    ##           "Var1": "Gleichstellung von Frau und Mann",
    ##           "Freq": 7
    ##         },
    ##         {
    ##           "Var1": "Politische Gremien",
    ##           "Freq": 7
    ##         },
    ##         {
    ##           "Var1": "Verwaltungsführung",
    ##           "Freq": 14
    ##         }
    ##       ],
    ##       "date_2.Year": [
    ##         {
    ##           "Var1": "2009",
    ##           "Freq": 16
    ##         },
    ##         {
    ##           "Var1": "2010",
    ##           "Freq": 15
    ##         },
    ##         {
    ##           "Var1": "2011",
    ##           "Freq": 14
    ##         },
    ##         {
    ##           "Var1": "2012",
    ##           "Freq": 14
    ##         },
    ##         {
    ##           "Var1": "2013",
    ##           "Freq": 15
    ##         },
    ##         {
    ##           "Var1": "2014",
    ##           "Freq": 13
    ##         },
    ##         {
    ##           "Var1": "2015",
    ##           "Freq": 13
    ##         }
    ##       ]
    ##     },
    ##     "relative.frequencies": {
    ##       "functional_classification_3.Produktgruppe": [
    ##         {
    ##           "Var1": "",
    ##           "Freq": 0.02
    ##         },
    ##         {
    ##           "Var1": "(entfallen in 2013) Geschäftsbereichsleitung GB 1.1 ",
    ##           "Freq": 0.05
    ##         },
    ##         {
    ##           "Var1": "Beschäftigtenvertretung",
    ##           "Freq": 0.01
    ##         },
    ##         {
    ##           "Var1": "Bezirksvertretungen",
    ##           "Freq": 0.07
    ##         },
    ##         {
    ##           "Var1": "Geschäftsbereichsleitung GB 1",
    ##           "Freq": 0.15
    ##         },
    ##         {
    ##           "Var1": "Geschäftsbereichsleitung GB 2.1",
    ##           "Freq": 0.07
    ##         },
    ##         {
    ##           "Var1": "Geschäftsbereichsleitung GB 2.2",
    ##           "Freq": 0.07
    ##         },
    ##         {
    ##           "Var1": "Geschäftsbereichsleitung GB 4",
    ##           "Freq": 0.28
    ##         },
    ##         {
    ##           "Var1": "Gleichstellung von Frau und Mann",
    ##           "Freq": 0.07
    ##         },
    ##         {
    ##           "Var1": "Politische Gremien",
    ##           "Freq": 0.07
    ##         },
    ##         {
    ##           "Var1": "Verwaltungsführung",
    ##           "Freq": 0.14
    ##         }
    ##       ],
    ##       "date_2.Year": [
    ##         {
    ##           "Var1": "2009",
    ##           "Freq": 0.16
    ##         },
    ##         {
    ##           "Var1": "2010",
    ##           "Freq": 0.15
    ##         },
    ##         {
    ##           "Var1": "2011",
    ##           "Freq": 0.14
    ##         },
    ##         {
    ##           "Var1": "2012",
    ##           "Freq": 0.14
    ##         },
    ##         {
    ##           "Var1": "2013",
    ##           "Freq": 0.15
    ##         },
    ##         {
    ##           "Var1": "2014",
    ##           "Freq": 0.13
    ##         },
    ##         {
    ##           "Var1": "2015",
    ##           "Freq": 0.13
    ##         }
    ##       ]
    ##     }
    ##   },
    ##   "correlation": {
    ## 
    ##   }
    ## }
    ##

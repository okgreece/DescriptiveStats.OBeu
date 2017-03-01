DescriptiveStats.OBeu
================
2017-03-01

Intoduction
===========

This package was created in order to enable the calculation of descriptive statistical measures, for the needs of a European project. This document introduces you to DescriptiveStats.OBeu's basic set of tools.

Input
-----

The parameters: “dimensions”, “measured.dimensions” and “amounts” should be defined by the user, to form the dataset. Then an automated process calculates the basic descriptive measures of tendency and spread, boxplot and histogram parameters in order to describe and visualize the distribution characteristics of the desired dataset.

<table>
<caption>A sort description about the inputs.</caption>
<colgroup>
<col width="18%" />
<col width="81%" />
</colgroup>
<thead>
<tr class="header">
<th>Input</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>json_data</p></td>
<td><p>The json string, URL or file from Open Spending API</p></td>
</tr>
<tr class="even">
<td><p>dimensions</p></td>
<td><p>The dimensions of the input data</p></td>
</tr>
<tr class="odd">
<td><p>amounts</p></td>
<td><p>The measures of the input data</p></td>
</tr>
<tr class="even">
<td><p>measured.dimensions</p></td>
<td><p>The dimensions to which correspond amount/numeric variables</p></td>
</tr>
<tr class="odd">
<td><p>coef.outl</p></td>
<td><p>Determines the length of the &quot;whiskers&quot; plot. Default is 1.5.</p></td>
</tr>
<tr class="even">
<td><p>box.outliers</p></td>
<td><p>If TRUE the outliers will be computed at the selected &quot;coef.outl&quot; level</p></td>
</tr>
<tr class="odd">
<td><p>box.width</p></td>
<td><p>The width level is determined 0.15 times the square root of the size of the input data.</p></td>
</tr>
<tr class="even">
<td><p>cor.method</p></td>
<td><p>The correlation coefficient method to compute: &quot;pearson&quot; (default),&quot;kendall&quot; or &quot;spearman&quot;.</p></td>
</tr>
<tr class="odd">
<td><p>freq.select</p></td>
<td><p>One or more nominal variables to calculate their corresponding frequencies.</p></td>
</tr>
</tbody>
</table>

#### Pre-processing of input

**DescriptiveStats.OBeu** includes functions that automatically calculates the central tendency and spread measures, the boxplot, histogram and barplot visualization parameters and the correlation matrix of the input fiscal dataset.

The final returns are the parameters needed for forming summary tables of central tendency and dispersion measures and visualizing boxplot, histogram, barplot and correlation matrix of the input data.

#### Central Tendency Measures

Central Tendency Measures describe the central position of a [distribution](https://en.wikipedia.org/wiki/Probability_distribution) for a group of data. The basic measures are the mean and the median.

#### Dispersion Measures (Measures of Spread)

Dispersion measures describe how similar or varied the data are. The range, quartiles and the interquartile range, variance and standard deviation are measures of spread.

Output
------

The output of this process is a list in json format divided into four components of parameters and results with the first subcomponents. Here is a sort description of the outputs in each function:

<table>
<caption>Output descriptions in each function.</caption>
<colgroup>
<col width="15%" />
<col width="24%" />
<col width="59%" />
</colgroup>
<thead>
<tr class="header">
<th>Function</th>
<th>Output</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>statistics</p></td>
<td><ul>
<li>Min</li>
<li>Max</li>
<li>Range</li>
<li>Mean</li>
<li>Median</li>
<li>Quantiles</li>
<li>Variance</li>
<li>StandardDeviation</li>
<li>Skewness</li>
<li>Kurtosis</li>
</ul></td>
<td><ul>
<li>The minimum observed value of the input data</li>
<li>The maximum observed value of the input data</li>
<li>The difference between maximum and minimum</li>
<li>The average value of the input data</li>
<li>The median value of the input data</li>
<li>The 25%, 75% percentiles</li>
<li>The variance of the input data</li>
<li>The standard deviation of the input data</li>
<li>The Skewness of the input data</li>
<li>The Kurtosis of the input data</li>
</ul></td>
</tr>
<tr class="even">
<td><p>boxplot</p></td>
<td><ul>
<li>lo.whisker</li>
<li>lo.hinge</li>
<li>median</li>
<li>up.hinge</li>
<li>up.whisker</li>
<li>box.width</li>
<li>lo.out</li>
<li>up.out</li>
<li>n</li>
</ul></td>
<td><ul>
<li>Lower horizontal line out of the box</li>
<li>Lower horizontal line of the box</li>
<li>Horizontal line in the box</li>
<li>Upper horizontal line of the box</li>
<li>Upper horizontal line out of the box</li>
<li>The box width of each variable</li>
<li>Lower outliers</li>
<li>Upper outliers</li>
<li>The number of non-NA observations</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>histogram</p></td>
<td><ul>
<li>cuts</li>
<li>counts</li>
<li>normal.curve</li>
<li>mean</li>
<li>median</li>
</ul></td>
<td><ul>
<li>The boundaries of the histogram classes</li>
<li>The frequency of each histogram class</li>
<li>The normal curve</li>
<li>The average value of the input vector</li>
<li>The median value of the input data</li>
</ul></td>
</tr>
<tr class="even">
<td><p>frequencies</p></td>
<td><ul>
<li>Variable name</li>
<li>frequencies</li>
<li>&quot;_row&quot;</li>
<li>relative.frequencies</li>
</ul></td>
<td><ul>
<li>The name of the calculated variable</li>
<li>The frequency value</li>
<li>Name of the categories of the variable</li>
<li>Relative frequency values</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>correlation</p></td>
<td><ul>
<li>Variable name</li>
<li>Correlation value</li>
<li>&quot;_row&quot;</li>
</ul></td>
<td><ul>
<li>The name of the calculated variable</li>
<li>The correlation value</li>
<li>The corresponding correlation variable</li>
</ul></td>
</tr>
</tbody>
</table>

Examples
--------

Simple examples for each function are provided, in order for the user to understand the use and how to deal with these functions.

In same examples specific columns of the dataset are selected in order for smaller amount of results to be presented. The dataset that is being used is available in DescriptiveStats.OBeu package and represents the data .....

### Statistics

We often need the basic descriptive statistics for the data we are working with. `ds.statistics()` can provide us with these results.

``` r
library(DescriptiveStats.OBeu)
ds.statistics(Wuppertal_df[,-4])
```

    ## $Min
    ## $Min$Amount
    ## [1] -2040681
    ## 
    ## $Min$ProduktbereichNR
    ## [1] 11
    ## 
    ## $Min$ProduktgruppeNR
    ## [1] 1101
    ## 
    ## 
    ## $Max
    ## $Max$Amount
    ## [1] 507995000
    ## 
    ## $Max$ProduktbereichNR
    ## [1] 71
    ## 
    ## $Max$ProduktgruppeNR
    ## [1] 7101
    ## 
    ## 
    ## $Range
    ## $Range$Amount
    ## [1] 510035681
    ## 
    ## $Range$ProduktbereichNR
    ## [1] 60
    ## 
    ## $Range$ProduktgruppeNR
    ## [1] 6000
    ## 
    ## 
    ## $Mean
    ## $Mean$Amount
    ## [1] 6171229
    ## 
    ## $Mean$ProduktbereichNR
    ## [1] 30.11422
    ## 
    ## $Mean$ProduktgruppeNR
    ## [1] 3020.384
    ## 
    ## 
    ## $Median
    ## $Median$Amount
    ## [1] 736038.1
    ## 
    ## $Median$ProduktbereichNR
    ## [1] 31
    ## 
    ## $Median$ProduktgruppeNR
    ## [1] 3103
    ## 
    ## 
    ## $Quantiles
    ## $Quantiles$Amount
    ##       25%       75% 
    ##  243696.1 2653000.0 
    ## 
    ## $Quantiles$ProduktbereichNR
    ## 25% 75% 
    ##  11  51 
    ## 
    ## $Quantiles$ProduktgruppeNR
    ##  25%  75% 
    ## 1130 5102 
    ## 
    ## 
    ## $Variance
    ## $Variance$Amount
    ## [1] 7.771069e+14
    ## 
    ## $Variance$ProduktbereichNR
    ## [1] 313.2779
    ## 
    ## $Variance$ProduktgruppeNR
    ## [1] 3116183
    ## 
    ## 
    ## $StandardDeviation
    ## $StandardDeviation$Amount
    ## [1] 27876637
    ## 
    ## $StandardDeviation$ProduktbereichNR
    ## [1] 17.69966
    ## 
    ## $StandardDeviation$ProduktgruppeNR
    ## [1] 1765.272
    ## 
    ## 
    ## $Kurtosis
    ##           Amount ProduktbereichNR  ProduktgruppeNR 
    ##       160.151906        -1.413781        -1.412865 
    ## 
    ## $Skewness
    ##           Amount ProduktbereichNR  ProduktgruppeNR 
    ##       11.4762126        0.2965627        0.2976537

### Boxplot

`ds.boxplot()` gives the statistics needed for a boxplot to be drawn.

``` r
ds.boxplot(Wuppertal_df$Amount,out.level = 0)
```

    ## $data
    ## $data$lo.whisker
    ## [1] -2040681
    ## 
    ## $data$lo.hinge
    ## [1] 243696.1
    ## 
    ## $data$median
    ## [1] 736038.1
    ## 
    ## $data$up.hinge
    ## [1] 2653000
    ## 
    ## $data$up.whisker
    ## [1] 507995000
    ## 
    ## $data$box.width
    ## [1] 11.83
    ## 
    ## $data$lo.out
    ## NULL
    ## 
    ## $data$up.out
    ## NULL
    ## 
    ## $data$n
    ## [1] 6225

### Correlation

This function calculates the correlation coefficient of the input data.

``` r
ds.correlation(Wuppertal_df)
```

    ##                  Year Amount ProduktbereichNR ProduktgruppeNR
    ## Year                1   0.02             0.01            0.01
    ## Amount              0   1.00             0.15            0.15
    ## ProduktbereichNR    0   0.00             1.00            1.00
    ## ProduktgruppeNR     0   0.00             0.00            1.00

### Frequency

`ds.frequency()` provides the frequencies and the relative frequencies of factors/characters of the input dataset.

``` r
ds.frequency(Wuppertal_df[,2:3])
```

    ## $frequencies
    ## $frequencies$Kontotyp
    ##         Var1 Freq
    ## 1 Aufwendung 3197
    ## 2     Ertrag 3028
    ## 
    ## $frequencies$Art
    ##       Var1 Freq
    ## 1 Ergebnis 2739
    ## 2     Plan 3486
    ## 
    ## 
    ## $relative.frequencies
    ## $relative.frequencies$Kontotyp
    ##         Var1      Freq
    ## 1 Aufwendung 0.5135743
    ## 2     Ertrag 0.4864257
    ## 
    ## $relative.frequencies$Art
    ##       Var1 Freq
    ## 1 Ergebnis 0.44
    ## 2     Plan 0.56

### Kurtosis

This function calculates kurtosis of the input data.

``` r
ds.kurtosis(Wuppertal_df)
```

    ##             Year           Amount ProduktbereichNR  ProduktgruppeNR 
    ##       -0.8371997      160.1519064       -1.4137810       -1.4128654

### Skewness

This function calculates skewness of the input data.

``` r
ds.skewness(Wuppertal_df)
```

    ##             Year           Amount ProduktbereichNR  ProduktgruppeNR 
    ##        0.1669875       11.4762126        0.2965627        0.2976537

Conclusion
==========

These six functions provide the basic statistics of data. Even inexperienced users can handle them, in order to evaluate their data and visualize them.

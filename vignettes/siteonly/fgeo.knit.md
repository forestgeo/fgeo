---
title: "Get started"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Get started}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



This article shows some of the key features of __fgeo__ applied to an exploratory data analysis. For a deeper and general approach to exploratory data analysis, see [this book section](http://r4ds.had.co.nz/exploratory-data-analysis.html). A version adapted for ForestGEO is available [here](https://forestgeo.github.io/fgeo/articles/siteonly/eda.html).

## Packages 

In every new R session you need to "open" __fgeo__ with `library`().


```r
library(fgeo)
#> -- Attaching packages ------------------------------------------- fgeo 0.0.0.9002 --
#> v fgeo.abundance  0.0.0.9006     v fgeo.tool       0.0.0.9004
#> v fgeo.demography 0.0.0.9103     v fgeo.x          0.0.0.9000
#> v fgeo.map        0.0.0.9402
#> 
library(fgeo.data)
```

## Data

You may load your own data. Here we will use data from the __fgeo.data__ package -- which comes with __fgeo__.

```R
fgeo_help("datasets")
```

We will use a dataset of stems censused in one hectare from the forest plot in Luquillo, Puerto Rico (https://forestgeo.si.edu/sites/north-america/luquillo).


```r
stem <- luquillo_stem_random
str(stem)
#> Classes 'tbl_df', 'tbl' and 'data.frame':	7920 obs. of  19 variables:
#>  $ treeID   : int  104 119 180 180 180 180 602 631 647 1086 ...
#>  $ stemID   : int  143 158 222 223 224 225 736 775 793 1339 ...
#>  $ tag      : chr  "10009" "100104" "100171" "100171" ...
#>  $ StemTag  : chr  "10009" "100104" "100095" "100096" ...
#>  $ sp       : chr  "DACEXC" "MYRSPL" "CASARB" "CASARB" ...
#>  $ quadrat  : chr  "113" "1021" "921" "921" ...
#>  $ gx       : num  10.3 182.9 164.6 164.6 164.6 ...
#>  $ gy       : num  245 410 410 410 410 ...
#>  $ MeasureID: int  143 158 222 223 224 225 736 775 793 1339 ...
#>  $ CensusID : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ dbh      : num  115 16 17.2 11.7 80 19.4 24.1 100 146 165 ...
#>  $ pom      : chr  "1.2" "1.3" "1.3" "1.3" ...
#>  $ hom      : num  1.2 1.3 1.3 1.3 1.3 1.3 1.3 1.3 1.3 1.3 ...
#>  $ ExactDate: Date, format: "1991-06-11" "1993-07-28" ...
#>  $ DFstatus : chr  "alive" "alive" "alive" "alive" ...
#>  $ codes    : chr  "MAIN;A" "MAIN;A" "SPROUT;A" "SPROUT;A" ...
#>  $ countPOM : num  1 1 1 1 1 1 1 1 1 1 ...
#>  $ status   : chr  "A" "A" "A" "A" ...
#>  $ date     : num  11484 12262 12263 12263 12263 ...
```

For a description of the columns, see `?data_dictionary`.


```r
str(data_dictionary)
#> Classes 'tbl_df', 'tbl' and 'data.frame':	242 obs. of  3 variables:
#>  $ table      : chr  "Census" "Census" "Census" "Census" ...
#>  $ column     : chr  "CensusID" "PlotID" "PlotCensusNumber" "StartDate" ...
#>  $ description: chr  "Primary key, an integer  automatically generated to uniquely identify a census." "Foreign Key to Site table." "Integer census number for an individual plot, 1=first census, 2=second census, etc. If there are more than one "| __truncated__ "Date on which the first measurement of the census was taken." ...

cols <- names(stem)
filter(data_dictionary, column %in% cols)
#> # A tibble: 20 x 3
#>    table           column   description                                   
#>    <chr>           <chr>    <chr>                                         
#>  1 Census          CensusID Primary key, an integer  automatically genera~
#>  2 CensusQuadrat   CensusID Foreign Key to Census table.                  
#>  3 DataCollection  CensusID Foreign Key to Census table.                  
#>  4 DBH             CensusID Foreign Key to Census table.                  
#>  5 DBH             ExactDa~ Date on which the measurement was taken.      
#>  6 DBHAttributes   CensusID Foreign Key to Census table.                  
#>  7 Measurement     Measure~ Primary key, an integer  automatically genera~
#>  8 Measurement     CensusID Foreign Key to Census table.                  
#>  9 Measurement     ExactDa~ "Date on which measurement has been done  (fo~
#> 10 MeasurementAtt~ Measure~ Foreign Key to Measurement table.             
#> 11 MeasurementAtt~ CensusID Foreign Key to Census table.                  
#> 12 RemeasAttribs   CensusID Foreign Key to Census table.                  
#> 13 Remeasurement   CensusID Foreign Key to  Census table.                 
#> 14 Remeasurement   ExactDa~ "Date of remeasurement.  (format is yyyy-mm-d~
#> 15 SpeciesInvento~ CensusID Foreign Key to  Census table.                 
#> 16 Stem            StemTag  The stem tag used in the field to identify th~
#> 17 TreeAttributes  CensusID Foreign Key to  Census table.                 
#> 18 ViewFullTable   StemTag  The stem tag used in the field to identify th~
#> 19 ViewFullTable   CensusID Foreign Key to  Census table.                 
#> 20 ViewFullTable   ExactDa~ Date on which the measurement was taken (form~
```

This dataset comes with multiple censuses. We will pick only the latest one.


```r
unique(stem$CensusID)
#> [1] 1 2 3 4 5 6

# `pick_top()` with n < 0 from the bottom rank of `var`. See ?pick_top().
stem6 <- pick_top(stem, var = CensusID, n = -1)
unique(stem6$CensusID)
#> [1] 6
```

## Exploring the distribution of status and tree diameter

Two columns that are commonly useful in ForestGEO datasets are `status` and `dbh` (diameter at breast height). We will begin by better understanding what type of variables they are. For this, base R provides useful functions.

`status` is a categorical variable. 


```r
summary(stem6$status)
#>    Length     Class      Mode 
#>      1320 character character
```

We can count the number of observations in each category with `table()`, then visualize the result with `barplot()`.


```r
by_category <- table(stem6$status)
barplot(by_category)
```

![](C:/Users/LeporeM/AppData/Local/Temp/1/Rtmp8O4gAH/preview-4b9c498367b8.dir/fgeo_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

`dbh` is a continuous numeric variable.


```r
summary(stem6$dbh)
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#>    10.2    27.2    98.5   110.3   155.0   992.0     480
```

(Note the missing values (`NA`s).)

And we can visualize its distribution with `hist()`. 


```r
hist(stem6$dbh)
```

![](C:/Users/LeporeM/AppData/Local/Temp/1/Rtmp8O4gAH/preview-4b9c498367b8.dir/fgeo_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

Unfortunately `hist()` dropped missing values silently. But we can better understand how missing values of `dbh` relate to `status` by extracting only the columns `dbh` and `status`, and picking only the rows where `dbh` is missing.


```r
dbh_status <- stem6[c("dbh", "status")]
missing <- filter(dbh_status, is.na(dbh))
unique(missing)
#> # A tibble: 2 x 2
#>     dbh status
#>   <dbl> <chr> 
#> 1    NA G     
#> 2    NA D
```

Another approach is to count missing values.


```r
missing <- transform(stem6, na = ifelse(is.na(dbh), TRUE, FALSE))
table(missing$na, missing$status)
#>        
#>           A   D   G
#>   FALSE 840   0   0
#>   TRUE    0 166 314
```

We learn that `dbh` is missing where a tree is dead (`status = D`) or gone (`status = G`). This makes sense and, depending on the type of analysis we want to do, we may want to keep or remove missing values.

## Determining tree status based on stem status

Now we are ready to clean the data. For example, we can pick trees which status is "A" (alive). At ForestGEO, working with `status` is so common that __fgeo__ provides a specialized function.

```R
fgeo_help("status")
```

In `stem6`, the variable `status` records the status of each individual stem. How can we determine the status of a tree based on the status of each of its stems? That is the job of `add_status_tree()`.


```r
stem6 <- add_status_tree(stem6, status_a = "A", status_d = "D")
alive_trees <- filter(stem6, status_tree == "A")

# Note that alive trees may have some missing, gone or dead stems
some_cols <- c( "treeID", "status_tree", "stemID", "status")
example_tree <- 46
example_rows <- filter(alive_trees, treeID == example_tree)
select(example_rows, some_cols)
#> # A tibble: 0 x 4
#> # ... with 4 variables: treeID <int>, status_tree <chr>, stemID <int>,
#> #   status <chr>
```

## Picking a `dbh` range

Another very common task when working with ForestGEO data is to pick stems of a particular `dbh` range.

```R
fgeo_help("dbh")
```

Pick stems of 10 mm or more.


```r
ten_plus <- pick_dbh_min(alive_trees, 10)
range(ten_plus$dbh, na.rm = TRUE)
#> [1]  10.2 992.0
```

## Calculating abundance

Calculate the total abundance of stems and trees.


```r
# Drop missing values of `dbh`
non_missing <- filter(ten_plus, !is.na(dbh))

# Stem abundance
abundance(non_missing)
#> Warning: `treeid`: Duplicated values were detected. Do you need to pick
#> main stems?
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1   840

# Tree abundance (picking main stems -- with highest `hom` and largest `dbh`)
main_stems <- pick_main_stem(non_missing)
abundance(main_stems)
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1   786
```

Calculate the abundance of trees by species.


```r
by_sp <- group_by(main_stems, sp)
n_by_sp <- abundance(by_sp)
n_by_sp
#> # A tibble: 65 x 2
#> # Groups:   sp [65]
#>    sp         n
#>    <chr>  <int>
#>  1 ALCFLO     3
#>  2 ANDINE     2
#>  3 ARDGLA     2
#>  4 ARTALT     1
#>  5 BUCTET     7
#>  6 BYRSPI    10
#>  7 CALCAL     1
#>  8 CASARB    66
#>  9 CASSYL    26
#> 10 CECSCH    29
#> # ... with 55 more rows
```

## Picking the most abundant species

What are the three most abundant tree species?


```r
top3 <- pick_top(n_by_sp, n, -3)
top3
#> # A tibble: 4 x 2
#> # Groups:   sp [4]
#>   sp         n
#>   <chr>  <int>
#> 1 CASARB    66
#> 2 MANBID    45
#> 3 PREMON   234
#> 4 SLOBER    66
```

Now we can pick the `alive_trees` of only the `top3` species.


```r
picked_stems <- filter(alive_trees, sp %in% top3$sp)
```

## Mapping the distribution of tree species

__fgeo__ includes some functions specialized in mapping ForestGEO's data.

```R
fgeo_help("map")
```

Map the most abundant species.


```r
# luquillo_elevation comes with fgeo
species_elevation <- sp_elev(picked_stems, luquillo_elevation)
autoplot(species_elevation)
```

![](C:/Users/LeporeM/AppData/Local/Temp/1/Rtmp8O4gAH/preview-4b9c498367b8.dir/fgeo_files/figure-html/unnamed-chunk-17-1.png)<!-- -->

Tweak to focus on the hectare available in the data.


```r
autoplot(species_elevation, xlim = c(100, 200), ylim = c(400, 500))
```

![](C:/Users/LeporeM/AppData/Local/Temp/1/Rtmp8O4gAH/preview-4b9c498367b8.dir/fgeo_files/figure-html/unnamed-chunk-18-1.png)<!-- -->

## Determine species-habitat associations

We will determine the species-habitat associations using a torus translation test.

```R
fgeo_help("torus")
```

This test should use individual trees, not multiple stems of individual trees. This test only makes sense at the population level. We are interested in knowing whether individuals of a species are aggregated on a habitat. Multiple stems of an individual do not represent population level processes but individual level processes. We will then use a ForestGEO _tree_ table, `luquillo_tree6_random`, which contains a small sample of randomly chosen trees across the entire plot (see `?luquillo_tree6_random`). 


```r
tree <- luquillo_tree6_random
```

We will pick alive trees of 10 mm or more (for details see previous sections). The variable `status` of _tree_ tables directly represent the status of each tree (see `?census_description`). We will focus on trees with status "A" (alive).


```r
dbh10plus <- pick_dbh_min(tree, 10)
chosen_trees <- pick_status(dbh10plus, "A")
unique(chosen_trees$status)
#> [1] "A"
```

Note that `tt_test()` is recommended for sufficiently abundant species:

> You should only try to determine the habitat association for sufficiently abundant species. In a 50-ha plot, a minimum abundance of 50 trees/species has been used.

-- `?tt_test()`


```r
# Find sufficiently abundant species
by_sp <- group_by(tree, sp)
n_by_sp <- abundance(by_sp)
n_by_sp
#> # A tibble: 73 x 2
#> # Groups:   sp [73]
#>    sp         n
#>    <chr>  <int>
#>  1 ALCFLO     3
#>  2 ALCLAT     1
#>  3 ANDINE     2
#>  4 ARDGLA     2
#>  5 ARTALT     1
#>  6 BRUPOR     1
#>  7 BUCTET     8
#>  8 BYRSPI    11
#>  9 CALCAL     1
#> 10 CASARB    94
#> # ... with 63 more rows

n_sp50plus <- filter(n_by_sp, n > 50)
n_sp50plus
#> # A tibble: 3 x 2
#> # Groups:   sp [3]
#>   sp         n
#>   <chr>  <int>
#> 1 CASARB    94
#> 2 PREMON   252
#> 3 SLOBER    84
```

We need habitat data. Bad habitat data is a common cause of errors. The safest way to create it is with `fgeo_habitat()` (see `?fgeo_habitat()`).


```r
habitat <- fgeo_habitat(luquillo_elevation, gridsize = 20, n = 4)
str(habitat)
#> Classes 'fgeo_habitat', 'tbl_df', 'tbl' and 'data.frame':	400 obs. of  3 variables:
#>  $ gx      : num  0 0 0 0 0 0 0 0 0 0 ...
#>  $ gy      : num  0 20 40 60 80 100 120 140 160 180 ...
#>  $ habitats: int  1 1 1 1 1 1 1 1 1 1 ...
```

You can visualize the habitats with `plot()`.


```r
autoplot(habitat)
```

![](C:/Users/LeporeM/AppData/Local/Temp/1/Rtmp8O4gAH/preview-4b9c498367b8.dir/fgeo_files/figure-html/unnamed-chunk-23-1.png)<!-- -->

FYI, `habitats` result from hierarchical clustering on three variables computed from the elevation dataset: mean elevation, convexity and slope.


```r
fgeo_topography(luquillo_elevation, gridsize = 20, n = 4)
#> # A tibble: 400 x 5
#>       gx    gy meanelev convex slope
#>  * <dbl> <dbl>    <dbl>  <dbl> <dbl>
#>  1     0     0     365. -0.390  8.87
#>  2     0    20     365. -0.285 13.7 
#>  3     0    40     367.  0.210 14.4 
#>  4     0    60     367.  0.34  15.9 
#>  5     0    80     362. -0.255 20.8 
#>  6     0   100     358. -0.510 12.4 
#>  7     0   120     359. -0.28  17.1 
#>  8     0   140     360. -0.265 22.1 
#>  9     0   160     362.  0.055 24.3 
#> 10     0   180     364.  0.415 15.2 
#> # ... with 390 more rows
```

And now we are ready to run the test.
















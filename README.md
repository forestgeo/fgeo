
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/vTLlhbp.png" align="right" height=88 /> Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage
status](https://coveralls.io/repos/github/forestgeo/fgeo/badge.svg)](https://coveralls.io/r/forestgeo/fgeo?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)

**fgeo** installs and loads multiple R packages, functions and datasets
to analyze trees’ abundance, demography, and habitats
(<a href=https://forestgeo.github.io/fgeo.abundance>fgeo.abundance</a>,
<a href=https://forestgeo.github.io/fgeo.demography>fgeo.demography</a>,
<a href=https://forestgeo.github.io/fgeo.habitat>fgeo.habitat</a>). It
also includes general-purpose functions to simplify the visualization
(<a href=https://forestgeo.github.io/fgeo.map>fgeo.map</a>) and
manipulation
(<a href=https://forestgeo.github.io/fgeo.base>fgeo.base</a>,
<a href=https://forestgeo.github.io/fgeo.tool>fgeo.tool</a>) of
ForestGEO datasets (e.g.
<a href=https://forestgeo.github.io/bciex>bciex</a>,
<a href=https://forestgeo.github.io/fgeo.data>fgeo.data</a>).

[Quick
search](https://forestgeo.github.io/fgeo/articles/quick-search.html)

[Questions and
Answers](https://forestgeo.github.io/fgeo/articles/questions-and-answers.html)

## Installation

To install **fgeo** run this code in R:

    # May take a several minutes
    if (!requireNamespace("fgeo", quietly = TRUE)) {
      if (!requireNamespace("remotes", quietly = TRUE)) {
        install.packages("remotes")
      }
      remotes::install_github("forestgeo/fgeo")
    }

[How to install packages from GitHub?](https://goo.gl/dQKEeg)

## Example

Load all **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages ----------------------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.demography 0.0.0.9000
#> v fgeo.abundance  0.0.0.9004     v fgeo.habitat    0.0.0.9006
#> v fgeo.base       0.0.0.9001     v fgeo.map        0.0.0.9204
#> v fgeo.data       0.0.0.9002     v fgeo.tool       0.0.0.9003
#> -- Conflicts ------------------------------------------------------------- fgeo_conflicts() --
#> x fgeo.tool::filter() masks stats::filter()
```

Find everything.

``` r
fgeo_help()
```

![](https://i.imgur.com/L9n9QAo.png)

Find something.

``` r
fgeo_help("map")
```

![](https://i.imgur.com/4aIOOeu.png)

Datasets.

``` r
fgeo_data <- fgeo_index_datasets()
subset(fgeo_data, grepl("luquillo", dataset))
#>         package                   dataset
#> 23    fgeo.base luquillo_stem_random_tiny
#> 24    fgeo.base        luquillo_vft_4quad
#> 26    fgeo.data        luquillo_elevation
#> 27    fgeo.data          luquillo_habitat
#> 28    fgeo.data          luquillo_species
#> 29    fgeo.data         luquillo_stem_1ha
#> 30    fgeo.data      luquillo_stem_random
#> 31    fgeo.data luquillo_stem_random_tiny
#> 32    fgeo.data        luquillo_stem6_1ha
#> 33    fgeo.data     luquillo_stem6_random
#> 34    fgeo.data             luquillo_taxa
#> 35    fgeo.data        luquillo_tree6_1ha
#> 36    fgeo.data     luquillo_tree6_random
#> 37    fgeo.data        luquillo_vft_4quad
#> 38 fgeo.habitat        luquillo_elevation
#> 39 fgeo.habitat          luquillo_habitat
#> 40 fgeo.habitat     luquillo_stem6_random
#> 41 fgeo.habitat          luquillo_top3_sp
#> 42 fgeo.habitat     luquillo_tree6_random

# Short name
stem <- luquillo_stem_1ha
# This dataset comes with multiple censuses.
unique(stem$CensusID)
#> [1] 1 2 3 4 5 6
stem
#> # A tibble: 72,618 x 19
#>    treeID stemID tag    StemTag sp     quadrat    gx    gy MeasureID
#>     <int>  <int> <chr>  <chr>   <chr>  <chr>   <dbl> <dbl>     <int>
#>  1     46     46 100001 100001  PSYBRA 921      164.  416.        46
#>  2     47     47 100008 100002  PSYBRA 921      165.  416         47
#>  3     47     48 100008 100003  PSYBRA 921      165.  416         48
#>  4     47     49 100008 100004  PSYBRA 921      165.  416         49
#>  5     47     50 100008 100005  PSYBRA 921      165.  416         50
#>  6     47     51 100008 100006  PSYBRA 921      165.  416         51
#>  7     47     52 100008 100007  PSYBRA 921      165.  416         52
#>  8     47     53 100008 100008  PSYBRA 921      165.  416         53
#>  9     47     54 100008 100009  PSYBRA 921      165.  416         54
#> 10     47     55 100008 100010  PSYBRA 921      165.  416         55
#> # ... with 72,608 more rows, and 10 more variables: CensusID <int>,
#> #   dbh <dbl>, pom <chr>, hom <dbl>, ExactDate <dbl>, DFstatus <chr>,
#> #   codes <chr>, countPOM <dbl>, status <chr>, date <dbl>
```

Do something useful.

Pick the data you
want.

``` r
# Pick one census from the bottom (n < 0) rank of CensusID. See ?pick_top().
stem6 <- pick_top(stem, var = CensusID, n = -1)
unique(stem6$CensusID)
#> [1] 6
```

Determine the status of each tree based on the status of each stem.

``` r
stem6 <- add_status_tree(stem6, status_a = "A", status_d = "D")
alive_trees <- subset(stem6, status_tree == "A")

# Note that alive trees may have some missing, gone or dead stems
some_cols <- c( "treeID", "status_tree", "stemID", "status")
example_tree <- 46
subset(alive_trees, treeID == example_tree, some_cols)
#> # A tibble: 2 x 4
#>   treeID status_tree stemID status
#>    <int> <chr>        <int> <chr> 
#> 1     46 A               46 D     
#> 2     46 A           114033 G
```

Pick stems of 10 mm or more.

``` r
ten_plus <- pick_dbh_min(alive_trees, 10)
range(ten_plus$dbh, na.rm = TRUE)
#> [1]   10 1405
```

Drop missing values of `dbh` with an informative warning.

``` r
non_missing <- drop_if_na(ten_plus, "dbh")
#> Warning: Dropping 5261 rows with missing `dbh` values.
```

Calculate abundance of stems and trees.

``` r
abundance_stem(non_missing)
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1  2564

abundance_tree(non_missing)
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1  2319
```

Trees’ abundance by species.

``` r
by_sp <- group_by(non_missing, sp)
abundance_tree(by_sp)
#> # A tibble: 70 x 2
#>    sp         n
#>    <chr>  <int>
#>  1 ALCFLO    11
#>  2 ALCLAT    15
#>  3 ANDINE     1
#>  4 ANTOBT     1
#>  5 ARDGLA     1
#>  6 BUCTET    11
#>  7 BYRSPI    25
#>  8 CALCAL     2
#>  9 CASARB   489
#> 10 CASSYL    58
#> # ... with 60 more rows
```

[Get
started](https://forestgeo.github.io/fgeo/articles/fgeo.html#get-started)

[Try **fgeo** on rstudio.cloud](http://bit.ly/fgeo-demo)

## Related projects

(Not maintained by ForestGEO)

  - [CTFS-R Package](http://ctfs.si.edu/Public/CTFSRPackage/): The
    original package of CTFS functions. No longer supported by
    ForestGEO.

  - [**BIOMASS**](https://CRAN.R-project.org/package=BIOMASS): An R
    package to estimate above-ground biomass in tropical
        forests.
    
      - [Description](https://CRAN.R-project.org/package=BIOMASS)
      - [Manual](https://cran.r-project.org/web/packages/BIOMASS/BIOMASS.pdf)
      - [Vignette](https://cran.r-project.org/web/packages/BIOMASS/vignettes/VignetteBiomass.html)

## R code from recent publications by ForestGEO partners

Data have been made available as required by the journal to enable
reproduction of the results presented in the paper. Please do not share
these data without permission of the ForestGEO plot Principal
Investigators. If you wish to publish papers based on these data you are
also required to get permission from the PIs of the corresponding
ForestGEO plots.

  - [Soil drivers of local-scale tree growth in a lowland tropical
    forest (Zemunik et
    al., 2018).](https://github.com/SoilLabAtSTRI/Soil-drivers-of-tree-growth)

  - [Plant diversity increases with the strength of negative density
    dependence at the global scale (LaManna et
    al., 2018)](https://github.com/forestgeo/LaManna_et_al_Science)
    
      - Response \#1: LaManna et al. 2018. Response to Comment on “Plant
        diversity increases with the strength of negative density
        dependence at the global scale” Science Vol. 360, Issue 6391,
        eaar3824. DOI: 10.1126/science.aar3824
    
      - Response \#2: LaManna et al. 2018. Response to Comment on “Plant
        diversity increases with the strength of negative density
        dependence at the global scale”. Science Vol. 360, Issue 6391,
        eaar5245. DOI: 10.1126/science.aar5245

## Information

  - [Getting help](SUPPORT.md).
  - [Contributing](CONTRIBUTING.md).
  - [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

## Acknowledgments

Thanks to all partners of ForestGEO, for sharing their ideas and code.

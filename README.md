
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/vTLlhbp.png" align="right" height=88 /> Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage
status](https://codecov.io/gh/forestgeo/fgeo/branch/master/graph/badge.svg)](https://codecov.io/github/forestgeo/fgeo?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)

**fgeo** install and loads multiple R packages to analyze forest
diversity and dynamics. It allows you to more easily access, manipulate,
and plot [ForestGEO](https://forestgeo.si.edu/) datasets, and to analyze
abundance, demography, and species-habitats associations.

  - [Search functions and
    datasets](https://forestgeo.github.io/fgeo/articles/siteonly/reference.html)
  - [Try **fgeo** online](https://bit.ly/fgeo-demo)
  - [Ask questions, report bugs, or propose
    features](https://github.com/forestgeo/fgeo/issues/new)

## Installation

**Expected R environment**

  - R version is recent
  - All packages are updated (run `update.packages()`)
  - No other R session is running
  - Current R session is clean (click *Session \> Restart R*)

**Option 1: Install directly**

``` r
install.packages("devtools")
devtools::install_github("forestgeo/fgeo", upgrade = "never")
```

(If you reach GitHub’s rate limit see
[`usethis::browse_github_pat()`](https://usethis.r-lib.org/reference/browse_github_pat.html)).

**Option 2: Install via
[**fgeo.install**](https://github.com/forestgeo/fgeo.install#-fgeoinstall)**

``` r
install.packages("devtools")
devtools::install_github("forestgeo/fgeo.install")

# If needed, installs dependencies from CRAN and fgeo packages from GitHub
fgeo.install::install_fgeo()
```

-----

  - To upgrade packages see `?devtools::update_packages()`
  - To remove packages see `?remove.packages()`

<details>

<summary><strong>Tips to avoid or fix common installation
problems</strong></summary>

#### Update R, RStudio, and R packages

  - [How?](https://fgeo.netlify.com/2018/02/08/2018-02-08-update-r-rstudio-and-r-packages/)
  - [Why?](https://fgeo.netlify.com/2018/03/06/2018-03-06-should-i-update-all-my-r-packages-frequently-yes-no-why/)

#### Instruct RStudio not to preserve your workspace between sessions

  - [Why?](https://r4ds.had.co.nz/workflow-projects.html#what-is-real)

In RStudio go to *Tools \> Global
Options…*

<img src="https://i.imgur.com/QqPyHJu.png" align="center" height=450/>

#### Use RStudio projects (or the [**here**](https://here.r-lib.org/) package)

  - [Why?](https://www.tidyverse.org/articles/2017/12/workflow-vs-script/)

<img src="https://user-images.githubusercontent.com/5856545/47810353-7d3ef900-dd19-11e8-951f-00afc2280198.png" align="center" height=350/>

#### Restart R many times each day

Press Cmd/Ctrl + Shift + F10 to restart RStudio or go to *Session \>
Restart R*.

#### Increase the rate limit to install from GitHub

  - Ensure you have an account on GitHub (<https://github.com/>).
  - Generate a GitHub token named exactly `GITHUB_PAT` by running
    `usethis::browse_github_pat()` in R.
  - You will be sent to GitHub and you should see something like this:

<img src="https://i.imgur.com/huJ6l7n.png" align="center" height=300/>

…

  - Make sure your token description says exactly `GITHUB_PAT` and click
    *Generate token*

…

<img src="https://i.imgur.com/iXWITVV.png" align="center" height=100/>

  - Store your new token in the environmental variable `GITHUB_PAT` by
    running `usethis::edit_r_environ()` in R.
  - A file called .Renviron will open. Type the name and value of your
    GitHub token. **Ensure to end this file with a new empty line**.
    Your .Renviron file should now look like this:

<img src="https://i.imgur.com/QSEuzbF.png" align="center" height=100/>

…

  - Save and close .Renviron.

#### Install package development utilities

Sometimes you may want to install the *source* version of an R package
from CRAN or GitHub. If that package contains a `src/` folder you will
need to install package development
    utilities.

  - [How?](https://support.rstudio.com/hc/en-us/articles/200486498-Package-Development-Prerequisites)

#### Troubleshoot: error: X11 library is missing: install XQuartz …

If you are a mac user, **fgeo** may fail to install with the error
below. Install XQuartz from <https://www.xquartz.org/> and try to
install **fgeo** again.

``` r
Error : .onLoad failed in loadNamespace() for 'tcltk', details:
  call: fun(libname, pkgname)
  error: X11 library is missing: install XQuartz from xquartz.macosforge.org
```

</details>

## Example

``` r
library(fgeo)
#> -- Attaching packages ----------------------------------------------- fgeo 0.0.0.9002 --
#> v fgeo.analyze 0.0.0.9003     v fgeo.tool    0.0.0.9005
#> v fgeo.plot    0.0.0.9402     v fgeo.x       0.0.0.9000
#> -- Conflicts ------------------------------------------------------- fgeo_conflicts() --
#> x fgeo.tool::filter() masks stats::filter()
```

### Explore **fgeo**

On an interactive session, `fgeo_help()` and `fgeo_browse_reference()`
help you to search documentation.

    if (interactive()) {
      # To search on the viewer; accepts keywords
      fgeo_help()
      # To search on a web browser
      fgeo_browse_reference() 
    }

### Access and manipulate data

`example_path()` allows you to access datasets stored in your R
libraries.

``` r
example_path()
#>  [1] "csv"           "mixed_files"   "rdata"         "rdata_one"    
#>  [5] "rds"           "taxa.csv"      "tsv"           "vft_4quad.csv"
#>  [9] "view"          "weird"         "xl"

(vft_file <- example_path("view/vft_4quad.csv"))
#> [1] "C:/Users/LeporeM/Documents/R/R-3.5.1/library/fgeo.x/extdata/view/vft_4quad.csv"
```

#### `read_<table>()`

`read_vft()` and `read_taxa()` import a ViewFullTable and ViewTaxonomy
from .tsv or .csv files.

``` r
read_vft(vft_file)
#> # A tibble: 500 x 32
#>     DBHID PlotName PlotID Family Genus SpeciesName Mnemonic Subspecies
#>     <int> <chr>     <int> <chr>  <chr> <chr>       <chr>    <chr>     
#>  1 385164 luquillo      1 Rubia~ Psyc~ brachiata   PSYBRA   <NA>      
#>  2 385261 luquillo      1 Urtic~ Cecr~ schreberia~ CECSCH   <NA>      
#>  3 384600 luquillo      1 Rubia~ Psyc~ brachiata   PSYBRA   <NA>      
#>  4 608789 luquillo      1 Rubia~ Psyc~ berteroana  PSYBER   <NA>      
#>  5 388579 luquillo      1 Areca~ Pres~ acuminata   PREMON   <NA>      
#>  6 384626 luquillo      1 Arali~ Sche~ morototoni  SCHMOR   <NA>      
#>  7 410958 luquillo      1 Rubia~ Psyc~ brachiata   PSYBRA   <NA>      
#>  8 385102 luquillo      1 Piper~ Piper glabrescens PIPGLA   <NA>      
#>  9 353163 luquillo      1 Areca~ Pres~ acuminata   PREMON   <NA>      
#> 10 481018 luquillo      1 Salic~ Case~ arborea     CASARB   <NA>      
#> # ... with 490 more rows, and 24 more variables: SpeciesID <int>,
#> #   SubspeciesID <chr>, QuadratName <chr>, QuadratID <int>, PX <dbl>,
#> #   PY <dbl>, QX <dbl>, QY <dbl>, TreeID <int>, Tag <chr>, StemID <int>,
#> #   StemNumber <int>, StemTag <int>, PrimaryStem <chr>, CensusID <int>,
#> #   PlotCensusNumber <int>, DBH <dbl>, HOM <dbl>, ExactDate <date>,
#> #   Date <int>, ListOfTSM <chr>, HighHOM <int>, LargeStem <chr>,
#> #   Status <chr>
```

#### `<input>_list()`

`rdata_list()` imports multiple .csv files into a list (see also
`rds_list()`, `csv_list()`, and friends).

``` r
(rdata_files <- example_path("rdata"))
#> [1] "C:/Users/LeporeM/Documents/R/R-3.5.1/library/fgeo.x/extdata/rdata"
dir(rdata_files)
#> [1] "tree5.RData" "tree6.RData"

(censuses <- rdata_list(rdata_files))
#> $tree5
#> # A tibble: 3 x 19
#>   treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>    <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#> 1    104    143 10009 10009   DACE~ 113      10.3  245.    439947        5
#> 2    119    158 1001~ 100104  MYRS~ 1021    183.   410.    466597        5
#> 3    180    225 1001~ 100174  CASA~ 921     165.   410.    466623        5
#> # ... with 9 more variables: dbh <dbl>, pom <chr>, hom <dbl>,
#> #   ExactDate <date>, DFstatus <chr>, codes <chr>, nostems <dbl>,
#> #   status <chr>, date <dbl>
#> 
#> $tree6
#> # A tibble: 3 x 19
#>   treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>    <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#> 1    104    143 10009 10009   DACE~ 113      10.3  245.    582850        6
#> 2    119    158 1001~ 100104  MYRS~ 1021    183.   410.    578696        6
#> 3    180    225 1001~ 100174  CASA~ 921     165.   410.    617049        6
#> # ... with 9 more variables: dbh <dbl>, pom <chr>, hom <dbl>,
#> #   ExactDate <date>, DFstatus <chr>, codes <chr>, nostems <dbl>,
#> #   status <chr>, date <dbl>
```

#### `list_<output>()`

`list_csv()` exports a each dataframe in a list to a corresponding .csv
file.

``` r
folder <- tempdir()
list_csv(censuses, folder)

dir(folder, pattern = "[.]csv$")
#> [1] "tree5.csv" "tree6.csv"
```

`list_df()` reduces a list of dataframes to a single dataframe.

``` r
list_df(censuses)
#> # A tibble: 6 x 19
#>   treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>    <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#> 1    104    143 10009 10009   DACE~ 113      10.3  245.    439947        5
#> 2    119    158 1001~ 100104  MYRS~ 1021    183.   410.    466597        5
#> 3    180    225 1001~ 100174  CASA~ 921     165.   410.    466623        5
#> 4    104    143 10009 10009   DACE~ 113      10.3  245.    582850        6
#> 5    119    158 1001~ 100104  MYRS~ 1021    183.   410.    578696        6
#> 6    180    225 1001~ 100174  CASA~ 921     165.   410.    617049        6
#> # ... with 9 more variables: dbh <dbl>, pom <chr>, hom <dbl>,
#> #   ExactDate <date>, DFstatus <chr>, codes <chr>, nostems <dbl>,
#> #   status <chr>, date <dbl>
```

#### `pick_<what>()` and `drop_<what>()`

`pick()` picks rows from a list of dataframes, applying conditions to a
`key` dataframe and propagating the picked row-indices to all other
dataframes in the list.

``` r
pick(censuses, dbh < 100)
#> $tree5
#> # A tibble: 2 x 19
#>   treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>    <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#> 1    119    158 1001~ 100104  MYRS~ 1021     183.  410.    466597        5
#> 2    180    225 1001~ 100174  CASA~ 921      165.  410.    466623        5
#> # ... with 9 more variables: dbh <dbl>, pom <chr>, hom <dbl>,
#> #   ExactDate <date>, DFstatus <chr>, codes <chr>, nostems <dbl>,
#> #   status <chr>, date <dbl>
#> 
#> $tree6
#> # A tibble: 2 x 19
#>   treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>    <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#> 1    119    158 1001~ 100104  MYRS~ 1021     183.  410.    578696        6
#> 2    180    225 1001~ 100174  CASA~ 921      165.  410.    617049        6
#> # ... with 9 more variables: dbh <dbl>, pom <chr>, hom <dbl>,
#> #   ExactDate <date>, DFstatus <chr>, codes <chr>, nostems <dbl>,
#> #   status <chr>, date <dbl>
```

Most functions are pipe-friendly. This is the same:

``` r
# Same
censuses %>% 
  pick(dbh < 100)
#> $tree5
#> # A tibble: 2 x 19
#>   treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>    <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#> 1    119    158 1001~ 100104  MYRS~ 1021     183.  410.    466597        5
#> 2    180    225 1001~ 100174  CASA~ 921      165.  410.    466623        5
#> # ... with 9 more variables: dbh <dbl>, pom <chr>, hom <dbl>,
#> #   ExactDate <date>, DFstatus <chr>, codes <chr>, nostems <dbl>,
#> #   status <chr>, date <dbl>
#> 
#> $tree6
#> # A tibble: 2 x 19
#>   treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>    <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#> 1    119    158 1001~ 100104  MYRS~ 1021     183.  410.    578696        6
#> 2    180    225 1001~ 100174  CASA~ 921      165.  410.    617049        6
#> # ... with 9 more variables: dbh <dbl>, pom <chr>, hom <dbl>,
#> #   ExactDate <date>, DFstatus <chr>, codes <chr>, nostems <dbl>,
#> #   status <chr>, date <dbl>
```

`pick_dbh_under()`, `drop_status()` and friends pick and drop rows from
a ForestGEO ViewFullTable or census table.

``` r
(census <- censuses[[2]])
#> # A tibble: 3 x 19
#>   treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>    <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#> 1    104    143 10009 10009   DACE~ 113      10.3  245.    582850        6
#> 2    119    158 1001~ 100104  MYRS~ 1021    183.   410.    578696        6
#> 3    180    225 1001~ 100174  CASA~ 921     165.   410.    617049        6
#> # ... with 9 more variables: dbh <dbl>, pom <chr>, hom <dbl>,
#> #   ExactDate <date>, DFstatus <chr>, codes <chr>, nostems <dbl>,
#> #   status <chr>, date <dbl>

census %>% 
  pick_dbh_under(100)
#> # A tibble: 2 x 19
#>   treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>    <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#> 1    119    158 1001~ 100104  MYRS~ 1021     183.  410.    578696        6
#> 2    180    225 1001~ 100174  CASA~ 921      165.  410.    617049        6
#> # ... with 9 more variables: dbh <dbl>, pom <chr>, hom <dbl>,
#> #   ExactDate <date>, DFstatus <chr>, codes <chr>, nostems <dbl>,
#> #   status <chr>, date <dbl>
```

`pick_main_stem()` and `pick_main_stemid()` pick the main stem or main
stemid(s) of each tree in each census.

``` r
stem <- download_data("luquillo_stem6_random")

dim(stem)
#> [1] 1320   19
dim(pick_main_stem(stem))
#> [1] 1000   19
```

#### `add_<column(s)>()`

`add_status_tree()`adds the column `status_tree` based on the status of
all stems of each tree.

``` r
stem %>% 
  select(CensusID, treeID, stemID, status) %>% 
  add_status_tree()
#> # A tibble: 1,320 x 5
#>    CensusID treeID stemID status status_tree
#>       <int>  <int>  <int> <chr>  <chr>      
#>  1        6    104    143 A      A          
#>  2        6    119    158 A      A          
#>  3       NA    180    222 G      A          
#>  4       NA    180    223 G      A          
#>  5        6    180    224 G      A          
#>  6        6    180    225 A      A          
#>  7        6    602    736 A      A          
#>  8        6    631    775 A      A          
#>  9        6    647    793 A      A          
#> 10        6   1086   1339 A      A          
#> # ... with 1,310 more rows
```

`add_index()` and friends add columns to a ForestGEO-like dataframe.

``` r
stem %>% 
  select(gx, gy) %>% 
  add_index()
#> Guessing: plotdim = c(320, 500)
#> * If guess is wrong, provide the correct argument `plotdim`
#> # A tibble: 1,320 x 3
#>       gx    gy index
#>    <dbl> <dbl> <dbl>
#>  1  10.3  245.    13
#>  2 183.   410.   246
#>  3 165.   410.   221
#>  4 165.   410.   221
#>  5 165.   410.   221
#>  6 165.   410.   221
#>  7 149.   414.   196
#>  8  38.3  245.    38
#>  9 143.   411.   196
#> 10  68.9  253.    88
#> # ... with 1,310 more rows
```

### Plot data

For simplicity, we will focus on only a few species.

``` r
stem_2sp <- stem %>% 
  filter(sp %in% c("PREMON", "CASARB"))
```

`autoplot()` and friends produce different output depending on the class
of input. You can create different input classes, for example, with
`sp()` and `sp_elev()`:

  - Use `sp(census)` to plot the column `sp` of a `census` dataset –
    i.e. to plot species distribution.

<!-- end list -->

``` r
class(sp(stem_2sp))
#> [1] "sp"         "tbl_df"     "tbl"        "data.frame"

autoplot(sp(stem_2sp))
```

![](man/figures/README-unnamed-chunk-15-1.png)<!-- -->

  - Use `sp_elev(census, elevation)` to plot the columns `sp` and `elev`
    of a `census` and `elevation` dataset, respectively – i.e. to plot
    species distribution and topography.

<!-- end list -->

``` r
data("elevation")
class(sp_elev(stem_2sp, elevation))
#> [1] "sp_elev" "list"

autoplot(sp_elev(stem_2sp, elevation))
```

![](man/figures/README-unnamed-chunk-16-1.png)<!-- -->

### Analyze

#### Abundance

`abundance()` and `basal_area()` calculate abundance and basal area,
optionally by groups.

``` r
abundance(
  pick_main_stem(census)
)
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1     3

by_species <- group_by(census, sp)

basal_area(by_species)
#> # A tibble: 3 x 2
#> # Groups:   sp [3]
#>   sp     basal_area
#>   <chr>       <dbl>
#> 1 CASARB      1669.
#> 2 DACEXC     29865.
#> 3 MYRSPL      1583.
```

#### Demography

`recruitment_ctfs()`, `mortality_ctfs()`, and `growth_ctfs()` calculate
recruitment, mortality, and growth. They all output a list. `to_df()`
converts the output from a list to a more convenient dataframe.

``` r
data("tree5")

to_df(
  mortality_ctfs(tree5, tree6)
)
#> Detected dbh ranges:
#>   * `census1` = 10.9-323.
#>   * `census2` = 10.5-347.
#> Using dbh `mindbh = 0` and above.
#> # A tibble: 1 x 9
#>       N     D    rate   lower  upper  time  date1  date2 dbhmean
#>   <dbl> <dbl>   <dbl>   <dbl>  <dbl> <dbl>  <dbl>  <dbl>   <dbl>
#> 1    27     1 0.00834 0.00195 0.0448  4.52 18938. 20590.    101.
```

#### Species-habitats association

`tt_test()` runs a torus translation test to determine habitat
associations of tree species. `to_df()` converts the output from a list
to a more convenient dataframe. `summary()` helps you to interpret the
result.

``` r
# This analysis makes sense only for tree tables
tree <- download_data("luquillo_tree5_random")
data("habitat")
result <- tt_test(tree, habitat)
#> Using `plotdim = c(320, 500)`. To change this value see `?tt_test()`.
#> Using `gridsize = 20`. To change this value see `?tt_test()`.

to_df(result)
#> # A tibble: 292 x 8
#>    habitat sp     N.Hab Gr.Hab Ls.Hab Eq.Hab Rep.Agg.Neut Obs.Quantile
#>  * <chr>   <chr>  <dbl>  <dbl>  <dbl>  <dbl>        <dbl>        <dbl>
#>  1 1       ALCFLO     2   1443    153      4            0        0.902
#>  2 2       ALCFLO     1    807    778     15            0        0.504
#>  3 3       ALCFLO     0      0    715    885           -1        0    
#>  4 4       ALCFLO     0      0    402   1198           -1        0    
#>  5 1       ALCLAT     0      0    544   1056           -1        0    
#>  6 2       ALCLAT     1   1432    156     12            0        0.895
#>  7 3       ALCLAT     0      0    324   1276           -1        0    
#>  8 4       ALCLAT     0      0    144   1456           -1        0    
#>  9 1       ANDINE     1   1117    466     17            0        0.698
#> 10 2       ANDINE     1   1081    510      9            0        0.676
#> # ... with 282 more rows

summary(result)
#> # A tibble: 73 x 5
#>    species habitat_1 habitat_2  habitat_3 habitat_4
#>  * <chr>   <chr>     <chr>      <chr>     <chr>    
#>  1 DACEXC  repelled  neutral    neutral   neutral  
#>  2 MYRSPL  neutral   aggregated neutral   repelled 
#>  3 CASARB  neutral   neutral    neutral   neutral  
#>  4 GUAGUI  neutral   neutral    repelled  repelled 
#>  5 PREMON  neutral   neutral    neutral   neutral  
#>  6 SCHMOR  neutral   neutral    neutral   neutral  
#>  7 DRYGLA  neutral   repelled   repelled  neutral  
#>  8 HOMRAC  neutral   neutral    neutral   repelled 
#>  9 OCOLEU  neutral   neutral    neutral   repelled 
#> 10 MANBID  neutral   neutral    neutral   neutral  
#> # ... with 63 more rows
```

[Get
started](https://forestgeo.github.io/fgeo/articles/fgeo.html#get-started)

## Related projects

Additional packages maintained by ForestGEO but not included in
**fgeo**:

  - [**fgeo.data**](https://forestgeo.github.io/fgeo.data/): Open
    datasets of ForestGEO.
  - [**fgeo.krig**](https://forestgeo.github.io/fgeo.krig/): Analyze
    soils.

Other packages not maintained by ForestGEO:

  - [CTFS-R Package](http://ctfs.si.edu/Public/CTFSRPackage/): The
    original package of CTFS functions. No longer supported by
    ForestGEO.
  - [**BIOMASS**](https://CRAN.R-project.org/package=BIOMASS): An R
    package to estimate above-ground biomass in tropical forests.

## R code from recent publications by ForestGEO partners

Data have been made available as required by the journal to enable
reproduction of the results presented in the paper. Please do not share
these data without permission of the ForestGEO plot Principal
Investigators (PIs). If you wish to publish papers based on these data,
you are also required to get permission from the PIs of the
corresponding ForestGEO plots.

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

Thanks to all partners of ForestGEO for sharing their ideas and code.
For feedback on **fgeo**, special thanks to Gabriel Arellano, Stuart
Davies, Lauren Krizel, Sean McMahon, and Haley Overstreet. There are
many other people that deserve special acknowledgment; I thank them in
the documentation and home page of each individual package that make up
the **fgeo** development.

---
output: github_document
editor_options: 
  chunk_output_type: console
---
<!-- README.md is generated from README.Rmd. Please edit that file -->



# <img src="https://i.imgur.com/vTLlhbp.png" align="right" height=88 /> Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage status](https://codecov.io/gh/forestgeo/fgeo/branch/master/graph/badge.svg)](https://codecov.io/github/forestgeo/fgeo?branch=master)
[![CRAN status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)



__fgeo__ helps you to install, load, and access the documentation of multiple packages to analyze forest diversity and dynamics. it allows you to manipulate and plot [ForestGEO](http://www.forestgeo.si.edu/) data, and to do common analyses including abundance, demography, and species-habitats associations.

* [Search functions and datasets](https://forestgeo.github.io/fgeo/articles/siteonly/reference.html)
* [Try __fgeo__ online](https://bit.ly/fgeo-demo)
* [Ask questions, report bugs, or propose features](https://github.com/forestgeo/fgeo/issues/new)

## Installation

__Expected R environment__

* R version is recent
* All packages are updated (run `update.packages()`)
* No other R session is running
* Current R session is clean (click _Session > Restart R_)

__Option 1: Install directly__

```R
install.packages("devtools")
devtools::install_github("forestgeo/fgeo", upgrade = "never")
```

(If you reach GitHub's rate limit see [`usethis::browse_github_pat()`](https://usethis.r-lib.org/reference/browse_github_pat.html)).

__Option 2: Install via [__fgeo.install__](https://github.com/forestgeo/fgeo.install#-fgeoinstall)__

```R
install.packages("devtools")
devtools::install_github("forestgeo/fgeo.install")

# If needed, installs dependencies from CRAN and fgeo packages from GitHub
fgeo.install::install_fgeo()
```

---

* To upgrade packages see `?devtools::update_packages()`
* To remove packages see `?remove.packages()`



<details> <summary><strong>Tips to avoid or fix common installation problems</strong></summary>

#### Update R, RStudio, and R packages

* [How?](https://fgeo.netlify.com/2018/02/08/2018-02-08-update-r-rstudio-and-r-packages/)
* [Why?](https://fgeo.netlify.com/2018/03/06/2018-03-06-should-i-update-all-my-r-packages-frequently-yes-no-why/)

#### Instruct RStudio not to preserve your workspace between sessions

* [Why?](https://r4ds.had.co.nz/workflow-projects.html#what-is-real)

In RStudio go to _Tools > Global Options..._

<img src="https://i.imgur.com/QqPyHJu.png" align="center" height=450/>

#### Use RStudio projects (or the [__here__](https://here.r-lib.org/) package)

* [Why?](https://www.tidyverse.org/articles/2017/12/workflow-vs-script/)

<img src="https://user-images.githubusercontent.com/5856545/47810353-7d3ef900-dd19-11e8-951f-00afc2280198.png" align="center" height=350/>

#### Restart R many times each day

Press Cmd/Ctrl + Shift + F10 to restart RStudio or go to _Session > Restart R_.


#### Increase the rate limit to install from GitHub

* Ensure you have an account on GitHub (https://github.com/).
* Generate a GitHub token named exactly `GITHUB_PAT` by running `usethis::browse_github_pat()` in R.
* You will be sent to GitHub and you should see something like this:

<img src="https://i.imgur.com/huJ6l7n.png" align="center" height=300/>

...

* Make sure your token description says exactly `GITHUB_PAT` and click _Generate token_

...

<img src="https://i.imgur.com/iXWITVV.png" align="center" height=100/>

* Store your new token in the environmental variable `GITHUB_PAT` by running `usethis::edit_r_environ()` in R.
* A file called .Renviron will open. Type the name and value of your GitHub token. __Ensure to end this file with a new empty line__. Your .Renviron file should now look like this:

<img src="https://i.imgur.com/QSEuzbF.png" align="center" height=100/>

...

* Save and close  .Renviron.

#### Install package development utilities

Sometimes you may want to install the _source_ version of an R package from CRAN or GitHub. If that package contains a `src/` folder you will need to install package development utilities.

* [How?](https://support.rstudio.com/hc/en-us/articles/200486498-Package-Development-Prerequisites)

#### Troubleshoot: error: X11 library is missing: install XQuartz ...

If you are a mac user, __fgeo__ may fail to install with the error below. Install XQuartz from https://www.xquartz.org/ and try to install __fgeo__ again.

```R
Error : .onLoad failed in loadNamespace() for 'tcltk', details:
  call: fun(libname, pkgname)
  error: X11 library is missing: install XQuartz from xquartz.macosforge.org
```

</details>



## Example


```r
library(fgeo)
#> -- Attaching packages -------------------------------------------- fgeo 0.0.0.9002 --
#> v fgeo.analyze 1.0.0     v fgeo.tool    1.0.0
#> v fgeo.plot    1.0.0     v fgeo.x       1.0.0
#> -- Conflicts ---------------------------------------------------- fgeo_conflicts() --
#> x fgeo.tool::filter() masks stats::filter()
```

### Explore __fgeo__

On an interactive session, `fgeo_help()` and `fgeo_browse_reference()` help you to search documentation.

```
if (interactive()) {
  # To search on the viewer; accepts keywords
  fgeo_help()
  # To search on a web browser
  fgeo_browse_reference() 
}
```

### Access and manipulate data

`example_path()` allows you to access datasets stored in your R libraries.


```r
example_path()
#>  [1] "csv"           "mixed_files"   "rdata"         "rdata_one"    
#>  [5] "rds"           "taxa.csv"      "tsv"           "vft_4quad.csv"
#>  [9] "view"          "weird"         "xl"

(vft_file <- example_path("view/vft_4quad.csv"))
#> [1] "C:/Users/LeporeM/Documents/R/R-3.5.2/library/fgeo.x/extdata/view/vft_4quad.csv"
```

#### `read_<table>()`

`read_vft()` and `read_taxa()` import a ViewFullTable and ViewTaxonomy from .tsv or .csv files.


```r
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

#### Importing multiple censuses from a directory into a list

(This and the following section don't use __fgeo__ because other packages already do this well.)

Combine `fs::dir_ls()` with `purrr::map()` to import multiple censuses from a directory into a list:

* Use `fs::dir_ls()` to create the paths to the files you want to import.
* Use `purrr::map()` to iterate over each path and apply a custom function to import them.


```r
library(purrr)
#> 
#> Attaching package: 'purrr'
#> The following object is masked from 'package:fgeo.tool':
#> 
#>     %||%
library(fs)

(rdata_files <- example_path("rdata"))
#> [1] "C:/Users/LeporeM/Documents/R/R-3.5.2/library/fgeo.x/extdata/rdata"
(paths <- fs::dir_ls(rdata_files))
#> C:/Users/LeporeM/Documents/R/R-3.5.2/library/fgeo.x/extdata/rdata/tree5.RData
#> C:/Users/LeporeM/Documents/R/R-3.5.2/library/fgeo.x/extdata/rdata/tree6.RData

# The formula syntax `~ fun(.x)` is a shortcut for `function(.x) fun(.x)`
censuses <- map(paths, ~ get(load(.x)))
censuses
#> $`C:/Users/LeporeM/Documents/R/R-3.5.2/library/fgeo.x/extdata/rdata/tree5.RData`
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
#> $`C:/Users/LeporeM/Documents/R/R-3.5.2/library/fgeo.x/extdata/rdata/tree6.RData`
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

#### Exporting multiple censuses from a list into a directory

* Use `purrr::walk2()` to map over two things in parallel -- each census to each path to a file. It is similar to `purrr::map2()` and `base::Map()` but prints nothing to the console.


```r
(files <- path_file(names(censuses)))
#> tree5.RData tree6.RData
(folder <- tempdir())
#> [1] "C:\\Users\\LeporeM\\AppData\\Local\\Temp\\1\\RtmpkzNEjv"
(paths <- path(folder, files))
#> C:/Users/LeporeM/AppData/Local/Temp/1/RtmpkzNEjv/tree5.RData
#> C:/Users/LeporeM/AppData/Local/Temp/1/RtmpkzNEjv/tree6.RData

walk2(censuses, paths, ~ save(.x, file = .y))

# Confirm that the folder contains the files we just saved
path_file(dir_ls(folder, regexp = "tree"))
#> tree5.RData tree6.RData
```

#### `pick_<what>()` and `drop_<what>()`

__fgeo__ is pipe-friendly. You may not use pipes but often they make code easier to read.

> Use %>% to emphasise a sequence of actions, rather than the object that the actions are being performed on.

-- <https://style.tidyverse.org/pipes.html>

`pick_dbh_under()`, `drop_status()` and friends pick and drop rows from a ForestGEO ViewFullTable or census table.


```r
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

`pick_main_stem()` and `pick_main_stemid()` pick the main stem or main stemid(s) of each tree in each census.




















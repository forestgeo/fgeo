
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/vTLlhbp.png" align="right" height=88 /> Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage
status](https://codecov.io/gh/forestgeo/fgeo/branch/master/graph/badge.svg)](https://codecov.io/github/forestgeo/fgeo?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)

**fgeo** installs and loads multiple R packages, functions, and datasets
to analyze trees abundance, demography, and habitats
(<a href=https://forestgeo.github.io/fgeo.abundance>fgeo.abundance</a>,
<a href=https://forestgeo.github.io/fgeo.demography>fgeo.demography</a>,
<a href=https://forestgeo.github.io/fgeo.habitat>fgeo.habitat</a>). It
also includes general-purpose functions to simplify the visualization
(<a href=https://forestgeo.github.io/fgeo.map>fgeo.map</a>) and
manipulation
(<a href=https://forestgeo.github.io/fgeo.tool>fgeo.tool</a>) of
ForestGEO datasets (e.g.
<a href=https://forestgeo.github.io/fgeo.x>fgeo.x</a>).

  - [Contact me](https://github.com/forestgeo/fgeo/issues/new) to ask
    Questions, report bugs, or propose features.
  - [Try **fgeo** before you install
it](https://bit.ly/fgeo-demo).

## [Quick search](https://forestgeo.github.io/fgeo/articles/siteonly/quick-search.html)

<details>

<summary><strong> Demo </strong></summary>

![](https://i.imgur.com/tSqisFN.gif)

</details>

## Installation

**Preconditions**

  - R version is recent
  - All packages are updated (run `update.packages()`)
  - No other R session is running
  - Current R session is clean (click *Session \> Restart R*)

<!-- end list -->

``` r
install.packages("devtools")
```

**Option 1: Install from GitHub**

You need an *authenticated* GitHub-account (see
[`usethis::browse_github_pat()`](https://usethis.r-lib.org/reference/browse_github_pat.html)).

``` r
devtools::install_github("forestgeo/fgeo")
```

**Option 2: Install via
[**fgeo.install**](https://github.com/forestgeo/fgeo.install#-fgeoinstall)**

You don’t need a GitHub account.

``` r
devtools::install_github("forestgeo/fgeo.install")

fgeo.install::install_dependencies()
fgeo.install::install_fgeo()
```

<details>

<summary><strong>More tips to avoid or fix common installation
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

-----

You can remove **fgeo** and all other packages with
`remove.packages("fgeo")`, `remove.packages("fgeo.abundance")`, and so
on.

## Example

Load all **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages ------------------------------------------------ fgeo 0.0.0.9002 --
#> v fgeo.abundance  0.0.0.9006     v fgeo.map        0.0.0.9402
#> v fgeo.demography 0.0.0.9103     v fgeo.tool       0.0.0.9004
#> v fgeo.habitat    0.0.0.9007     v fgeo.x          0.0.0.9000
#> 
```

Need help? Use `fgeo_help()` to search every help file in the **fgeo**
package.

``` r
fgeo_help()
```

![](https://i.imgur.com/k4wz4Ah.png)

You can narrow down your search by using a keyword.

``` r
fgeo_help("datasets")
```

![](https://i.imgur.com/YlgRljc.png)

``` r
# Short name
stem6 <- download_data("luquillo_stem6_random")
stem6
#> # A tibble: 1,320 x 19
#>    treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>     <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#>  1    104    143 10009 10009   DACE~ 113      10.3  245.    582850        6
#>  2    119    158 1001~ 100104  MYRS~ 1021    183.   410.    578696        6
#>  3    180    222 1001~ 100095  CASA~ 921     165.   410.        NA       NA
#>  4    180    223 1001~ 100096  CASA~ 921     165.   410.        NA       NA
#>  5    180    224 1001~ 100171  CASA~ 921     165.   410.    617046        6
#>  6    180    225 1001~ 100174  CASA~ 921     165.   410.    617049        6
#>  7    602    736 1006~ 100649  GUAG~ 821     149.   414.    614253        6
#>  8    631    775 10069 10069   PREM~ 213      38.3  245.    598429        6
#>  9    647    793 1007~ 100708  SCHM~ 821     143.   411.    614211        6
#> 10   1086   1339 10122 10122   DRYG~ 413      68.9  253.    603131        6
#> # ... with 1,310 more rows, and 9 more variables: dbh <dbl>, pom <chr>,
#> #   hom <dbl>, ExactDate <date>, DFstatus <chr>, codes <chr>,
#> #   countPOM <dbl>, status <chr>, date <dbl>
```

Determine the status of each tree based on the status of each stem.

``` r
stem6 <- add_status_tree(stem6, status_a = "A", status_d = "D")
alive_trees <- subset(stem6, status_tree == "A")
alive_trees
#> # A tibble: 1,182 x 20
#>    treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>     <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#>  1    104    143 10009 10009   DACE~ 113      10.3  245.    582850        6
#>  2    119    158 1001~ 100104  MYRS~ 1021    183.   410.    578696        6
#>  3    180    222 1001~ 100095  CASA~ 921     165.   410.        NA       NA
#>  4    180    223 1001~ 100096  CASA~ 921     165.   410.        NA       NA
#>  5    180    224 1001~ 100171  CASA~ 921     165.   410.    617046        6
#>  6    180    225 1001~ 100174  CASA~ 921     165.   410.    617049        6
#>  7    602    736 1006~ 100649  GUAG~ 821     149.   414.    614253        6
#>  8    631    775 10069 10069   PREM~ 213      38.3  245.    598429        6
#>  9    647    793 1007~ 100708  SCHM~ 821     143.   411.    614211        6
#> 10   1086   1339 10122 10122   DRYG~ 413      68.9  253.    603131        6
#> # ... with 1,172 more rows, and 10 more variables: dbh <dbl>, pom <chr>,
#> #   hom <dbl>, ExactDate <date>, DFstatus <chr>, codes <chr>,
#> #   countPOM <dbl>, status <chr>, date <dbl>, status_tree <chr>
```

Pick stems of 10 mm or more.

``` r
ten_plus <- pick_dbh_min(alive_trees, 10)
range(ten_plus$dbh, na.rm = TRUE)
#> [1]  10.2 992.0
```

Count distinct values of `stemID` and `treeID`.

``` r
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
largest_stem <- fgeo.tool::pick_main_stem(non_missing)
abundance(largest_stem)
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1   786
```

Count largest stems (unique `treeID`s) by species.

``` r
by_sp <- group_by(largest_stem, sp)
abundance(by_sp)
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

[Get
started](https://forestgeo.github.io/fgeo/articles/fgeo.html#get-started)

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
many other people that deserve special acknowledgements; I thank them in
the documentation and home page of each individual package that make up
the **fgeo** development.

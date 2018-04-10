
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 /> fgeo: Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage
status](https://coveralls.io/repos/github/forestgeo/fgeo/badge.svg)](https://coveralls.io/r/forestgeo/fgeo?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)

**fgeo** installs and loads multiple R packages of
[ForestGEO](http://www.forestgeo.si.edu/) in a single step. Together,
all packages of **fgeo** provide a wide range of tools to analyse forest
diversity and dynamics. To learn more about the structure of
ForestgGEO’s software see [this article](https://goo.gl/c5X6qk).

## Installation

    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo")

To learn the details about how to install packages from GitHub, read
[this blog
post](https://goo.gl/dQKEeg).

## Index

### Packages

| package                                                                 | Title                                           |
| :---------------------------------------------------------------------- | :---------------------------------------------- |
| <a href=https://forestgeo.github.io/bciex>bciex</a>                     | Forest Dynamics Data from Barro Colorado Island |
| <a href=https://forestgeo.github.io/fgeo>fgeo</a>                       | Easily Install and Load Packages of ForestGEO   |
| <a href=https://forestgeo.github.io/fgeo.abundance>fgeo.abundance</a>   | R packages for the Analysis of Forest Dynamics  |
| <a href=https://forestgeo.github.io/fgeo.demography>fgeo.demography</a> | Demography Tools                                |
| <a href=https://forestgeo.github.io/fgeo.habitat>fgeo.habitat</a>       | Habitat Analyses                                |
| <a href=https://forestgeo.github.io/fgeo.map>fgeo.map</a>               | Map ForestGEO’s Data                            |
| <a href=https://forestgeo.github.io/fgeo.tool>fgeo.tool</a>             | Utility Tools for ForestGEO Packages            |

### Functions

| package         | fun                                                                                     |
| :-------------- | :-------------------------------------------------------------------------------------- |
| fgeo            | <a href=https://forestgeo.github.io/fgeo/reference/>fgeo\_conflicts</a>                 |
| fgeo            | <a href=https://forestgeo.github.io/fgeo/reference/>fgeo\_core</a>                      |
| fgeo            | <a href=https://forestgeo.github.io/fgeo/reference/>fgeo\_imports</a>                   |
| fgeo            | <a href=https://forestgeo.github.io/fgeo/reference/>fgeo\_index</a>                     |
| fgeo            | <a href=https://forestgeo.github.io/fgeo/reference/>fgeo\_index\_functions</a>          |
| fgeo            | <a href=https://forestgeo.github.io/fgeo/reference/>fgeo\_index\_packages</a>           |
| fgeo            | <a href=https://forestgeo.github.io/fgeo/reference/>fgeo\_packages</a>                  |
| fgeo            | <a href=https://forestgeo.github.io/fgeo/reference/>fgeo\_suggests</a>                  |
| fgeo            | <a href=https://forestgeo.github.io/fgeo/reference/>fgeo\_update</a>                    |
| fgeo.abundance  | <a href=https://forestgeo.github.io/fgeo.abundance/reference/>abundance</a>             |
| fgeo.abundance  | <a href=https://forestgeo.github.io/fgeo.abundance/reference/>abundance\_tally</a>      |
| fgeo.abundance  | <a href=https://forestgeo.github.io/fgeo.abundance/reference/>basal\_area</a>           |
| fgeo.abundance  | <a href=https://forestgeo.github.io/fgeo.abundance/reference/>basal\_area\_ind</a>      |
| fgeo.demography | <a href=https://forestgeo.github.io/fgeo.demography/reference/>growth</a>               |
| fgeo.demography | <a href=https://forestgeo.github.io/fgeo.demography/reference/>growth\_df</a>           |
| fgeo.demography | <a href=https://forestgeo.github.io/fgeo.demography/reference/>mortality</a>            |
| fgeo.demography | <a href=https://forestgeo.github.io/fgeo.demography/reference/>mortality\_df</a>        |
| fgeo.demography | <a href=https://forestgeo.github.io/fgeo.demography/reference/>recruitment</a>          |
| fgeo.demography | <a href=https://forestgeo.github.io/fgeo.demography/reference/>recruitment\_df</a>      |
| fgeo.habitat    | <a href=https://forestgeo.github.io/fgeo.habitat/reference/>dist\_in\_torus</a>         |
| fgeo.habitat    | <a href=https://forestgeo.github.io/fgeo.habitat/reference/>ExpList</a>                 |
| fgeo.habitat    | <a href=https://forestgeo.github.io/fgeo.habitat/reference/>GetAutomatedKrigeParams</a> |
| fgeo.habitat    | <a href=https://forestgeo.github.io/fgeo.habitat/reference/>GetKrigedSoil</a>           |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>add\_sp</a>                     |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>contour\_elev</a>               |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>hide\_axis\_labels</a>          |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>hide\_legend\_color</a>         |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>label\_elev</a>                 |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>limit\_gx\_gy</a>               |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>map\_elev</a>                   |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>map\_gx\_gy</a>                 |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>map\_gx\_gy\_elev</a>           |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>map\_quad\_header</a>           |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>map\_sp\_elev</a>               |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>map\_tag\_header</a>            |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>maply\_quad</a>                 |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>maply\_sp\_elev</a>             |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>maply\_tag</a>                  |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>suffix\_edge\_tag</a>           |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>theme\_default</a>              |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>theme\_map\_quad</a>            |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>theme\_map\_tag</a>             |
| fgeo.map        | <a href=https://forestgeo.github.io/fgeo.map/reference/>wrap</a>                        |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_col\_row</a>              |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_col\_row2</a>             |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_hectindex</a>             |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_index</a>                 |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_lxly</a>                  |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_quad</a>                  |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_qxqy</a>                  |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_status\_tree</a>          |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_subquad</a>               |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>add\_var</a>                   |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>check\_crucial\_names</a>      |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>check\_unique</a>              |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>check\_unique\_vector</a>      |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>count\_duplicated</a>          |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>exists\_in\_pkg</a>            |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>fieldforms\_header</a>         |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>fieldforms\_output</a>         |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>fieldforms\_prepare</a>        |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>fill\_na</a>                   |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>guess\_plotdim</a>             |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>ls\_csv\_df</a>                |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>ls\_join\_df</a>               |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>ls\_list\_spreadsheets</a>     |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>ls\_name\_df</a>               |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>nms\_detect</a>                |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>nms\_extract\_all</a>          |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>nms\_extract\_anycase</a>      |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>nms\_extract1</a>              |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>nms\_has\_any</a>              |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>nms\_lowercase</a>             |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>nms\_restore</a>               |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>nms\_restore\_newvar</a>       |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>nms\_tidy</a>                  |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>recode\_subquad</a>            |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>replace\_null</a>              |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>restructure\_elev</a>          |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>row\_collapse\_censusid</a>    |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>row\_discard\_twice\_dead</a>  |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>row\_filter\_status</a>        |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>row\_keep\_alive\_stem</a>     |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>row\_keep\_alive\_tree</a>     |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>row\_top</a>                   |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>str\_as\_tidy\_names</a>       |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>str\_suffix\_match</a>         |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>to\_recensus</a>               |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>type\_ensure</a>               |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>type\_taxa</a>                 |
| fgeo.tool       | <a href=https://forestgeo.github.io/fgeo.tool/reference/>type\_vft</a>                  |

## Example

Load all **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages ---------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.habitat    0.0.0.9001
#> v fgeo.abundance  0.0.0.9002     v fgeo.map        0.0.0.9203
#> v fgeo.demography 0.0.0.9000     v fgeo.tool       0.0.0.9002
#> -- Conflicts ------------------------------------------------ fgeo_conflicts() --
#> x dplyr::filter()    masks stats::filter()
#> x dplyr::intersect() masks base::intersect()
#> x dplyr::lag()       masks stats::lag()
#> x dplyr::setdiff()   masks base::setdiff()
#> x dplyr::setequal()  masks base::setequal()
#> x dplyr::union()     masks base::union()
```

Update packages that changed since last installation.

    fgeo_update()

Table packages.

``` r
fgeo_index_packages()
#>           package                                           Title
#> 1           bciex Forest Dynamics Data from Barro Colorado Island
#> 2            fgeo   Easily Install and Load Packages of ForestGEO
#> 3  fgeo.abundance  R packages for the Analysis of Forest Dynamics
#> 4 fgeo.demography                                Demography Tools
#> 5    fgeo.habitat                                Habitat Analyses
#> 6        fgeo.map                            Map ForestGEO's Data
#> 7       fgeo.tool            Utility Tools for ForestGEO Packages
```

Table and explore functions.

``` r
library(dplyr)
funs <- fgeo_index_functions()
sample_n(funs, 10)
#>             package                 fun
#> 48         fgeo.map       maply_sp_elev
#> 24  fgeo.demography              growth
#> 86        fgeo.tool         nms_restore
#> 101       fgeo.tool         type_ensure
#> 7              fgeo fgeo_index_packages
#> 37         fgeo.map    hide_axis_labels
#> 35         fgeo.map              add_sp
#> 65        fgeo.tool             add_var
#> 11   fgeo.abundance           abundance
#> 90        fgeo.tool        replace_null
```

## Related projects

  - [CTFS-R Package](http://ctfs.si.edu/Public/CTFSRPackage/).

  - [BIOMASS](https://CRAN.R-project.org/package=BIOMASS): An R package
    to estimate above-ground biomass in tropical
        forests.
    
      - [Description](https://CRAN.R-project.org/package=BIOMASS)
      - [Manual](https://cran.r-project.org/web/packages/BIOMASS/BIOMASS.pdf)
      - [Vignette](https://cran.r-project.org/web/packages/BIOMASS/vignettes/VignetteBiomass.html)

-----

Please note that this project is released with a [Contributor Code of
Conduct](.github/CODE_OF_CONDUCT.md). By participating in this project
you agree to abide by its terms.

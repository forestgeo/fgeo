
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fgeo: Analyze forest diversity and dynamics <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 />

[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

(The developmental stage of this package is according to [this
website](https://www.tidyverse.org/lifecycle/).)

**fgeo** installs and loads multiple R packages of
[ForestGEO](http://www.forestgeo.si.edu/) in a single step. Together,
all packages of **fgeo** provide a wide range of tools to analyse forest
diversity and dynamics. To learn more about the structure of
ForestgGEO’s software see [this article](https://goo.gl/c5X6qk).

[Packages index](https://forestgeo.github.io/fgeo/reference/index.html).

## Installation

To install **fgeo** run the following code in R:

    missing_remotes <- !require(remotes)
    if (missing_remotes) {
      install.packages("remotes")
    }
    
    remotes::install_github("forestgeo/fgeo")

To learn the details about how to install packages from GitHub, read
[this blog post](https://goo.gl/dQKEeg).

## Usage

Load the core **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages ------------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.habitat    0.0.0.9001
#> v fgeo.abundance  0.0.0.9002     v fgeo.map        0.0.0.9203
#> v fgeo.demography 0.0.0.9000     v fgeo.tool       0.0.0.9002
#> 
```

Run this to update **fgeo**. This will re-install only the packages that
have changed since the last installation – so it will take a fraction of
what it took the first time you installed **fgeo**.

    fgeo_update()

For a detailed description of each function in each package go to the
corresponding package’s website via the
[Packages](https://forestgeo.github.io/fgeo/reference/index.html) tab of
**fgeo**’s [Home](https://forestgeo.github.io/fgeo/index.html) page.

You can get an overview of all functions exported by each package
(including some reexported from other packages) with `fgeo_functions()`
– which can also be helpful if you want to find a function based on
some keywords.

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

all_functions <- fgeo_functions()

matching_pattern <- grepl(pattern = "row", all_functions$fun)
filter(all_functions, matching_pattern)
#>            package                    fun
#> 1  fgeo.demography                 growth
#> 2  fgeo.demography              growth_df
#> 3        fgeo.tool            add_col_row
#> 4        fgeo.tool           add_col_row2
#> 5        fgeo.tool  row_collapse_censusid
#> 6        fgeo.tool row_discard_twice_dead
#> 7        fgeo.tool      row_filter_status
#> 8        fgeo.tool    row_keep_alive_stem
#> 9        fgeo.tool    row_keep_alive_tree
#> 10       fgeo.tool                row_top
```

## All functions by package

``` r
all_functions
#>             package                     fun
#> 1              fgeo                     %>%
#> 2              fgeo          fgeo_conflicts
#> 3              fgeo               fgeo_core
#> 4              fgeo          fgeo_functions
#> 5              fgeo            fgeo_imports
#> 6              fgeo           fgeo_packages
#> 7              fgeo           fgeo_suggests
#> 8              fgeo             fgeo_update
#> 9    fgeo.abundance               abundance
#> 10   fgeo.abundance         abundance_tally
#> 11   fgeo.abundance              basal_area
#> 12   fgeo.abundance          basal_area_ind
#> 13   fgeo.abundance                  enexpr
#> 14   fgeo.abundance                   enquo
#> 15   fgeo.abundance                    expr
#> 16   fgeo.abundance                   exprs
#> 17   fgeo.abundance                     quo
#> 18   fgeo.abundance                quo_name
#> 19   fgeo.abundance                    quos
#> 20   fgeo.abundance                     sym
#> 21   fgeo.abundance                    syms
#> 22  fgeo.demography                  growth
#> 23  fgeo.demography               growth_df
#> 24  fgeo.demography               mortality
#> 25  fgeo.demography            mortality_df
#> 26  fgeo.demography             recruitment
#> 27  fgeo.demography          recruitment_df
#> 28     fgeo.habitat           dist_in_torus
#> 29     fgeo.habitat                 ExpList
#> 30     fgeo.habitat GetAutomatedKrigeParams
#> 31     fgeo.habitat           GetKrigedSoil
#> 32         fgeo.map                     %>%
#> 33         fgeo.map                  add_sp
#> 34         fgeo.map            contour_elev
#> 35         fgeo.map        hide_axis_labels
#> 36         fgeo.map       hide_legend_color
#> 37         fgeo.map              label_elev
#> 38         fgeo.map             limit_gx_gy
#> 39         fgeo.map                map_elev
#> 40         fgeo.map               map_gx_gy
#> 41         fgeo.map          map_gx_gy_elev
#> 42         fgeo.map         map_quad_header
#> 43         fgeo.map             map_sp_elev
#> 44         fgeo.map          map_tag_header
#> 45         fgeo.map              maply_quad
#> 46         fgeo.map           maply_sp_elev
#> 47         fgeo.map               maply_tag
#> 48         fgeo.map         suffix_edge_tag
#> 49         fgeo.map           theme_default
#> 50         fgeo.map          theme_map_quad
#> 51         fgeo.map           theme_map_tag
#> 52         fgeo.map                    wrap
#> 53        fgeo.tool                     %>%
#> 54        fgeo.tool             add_col_row
#> 55        fgeo.tool            add_col_row2
#> 56        fgeo.tool           add_hectindex
#> 57        fgeo.tool               add_index
#> 58        fgeo.tool                add_lxly
#> 59        fgeo.tool                add_quad
#> 60        fgeo.tool                add_qxqy
#> 61        fgeo.tool         add_status_tree
#> 62        fgeo.tool             add_subquad
#> 63        fgeo.tool                 add_var
#> 64        fgeo.tool     check_crucial_names
#> 65        fgeo.tool            check_unique
#> 66        fgeo.tool     check_unique_vector
#> 67        fgeo.tool        count_duplicated
#> 68        fgeo.tool           exists_in_pkg
#> 69        fgeo.tool       fieldforms_header
#> 70        fgeo.tool       fieldforms_output
#> 71        fgeo.tool      fieldforms_prepare
#> 72        fgeo.tool                 fill_na
#> 73        fgeo.tool           guess_plotdim
#> 74        fgeo.tool               ls_csv_df
#> 75        fgeo.tool              ls_join_df
#> 76        fgeo.tool    ls_list_spreadsheets
#> 77        fgeo.tool              ls_name_df
#> 78        fgeo.tool              nms_detect
#> 79        fgeo.tool         nms_extract_all
#> 80        fgeo.tool     nms_extract_anycase
#> 81        fgeo.tool            nms_extract1
#> 82        fgeo.tool             nms_has_any
#> 83        fgeo.tool           nms_lowercase
#> 84        fgeo.tool             nms_restore
#> 85        fgeo.tool      nms_restore_newvar
#> 86        fgeo.tool                nms_tidy
#> 87        fgeo.tool          recode_subquad
#> 88        fgeo.tool            replace_null
#> 89        fgeo.tool        restructure_elev
#> 90        fgeo.tool   row_collapse_censusid
#> 91        fgeo.tool  row_discard_twice_dead
#> 92        fgeo.tool       row_filter_status
#> 93        fgeo.tool     row_keep_alive_stem
#> 94        fgeo.tool     row_keep_alive_tree
#> 95        fgeo.tool                 row_top
#> 96        fgeo.tool       str_as_tidy_names
#> 97        fgeo.tool        str_suffix_match
#> 98        fgeo.tool             to_recensus
#> 99        fgeo.tool             type_ensure
#> 100       fgeo.tool               type_taxa
#> 101       fgeo.tool                type_vft
```

-----

Please note that this project is released with a [Contributor Code of
Conduct](.github/CODE_OF_CONDUCT.md). By participating in this project
you agree to abide by its terms.

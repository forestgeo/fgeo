
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
#> -- Attaching packages ------------------------------------------ fgeo 0.0.0.9000 --
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

``` r
all_functions
#>             package                     fun
#> 1              fgeo          fgeo_conflicts
#> 2              fgeo               fgeo_core
#> 3              fgeo          fgeo_functions
#> 4              fgeo            fgeo_imports
#> 5              fgeo           fgeo_packages
#> 6              fgeo           fgeo_suggests
#> 7              fgeo             fgeo_update
#> 8    fgeo.abundance               abundance
#> 9    fgeo.abundance         abundance_tally
#> 10   fgeo.abundance              basal_area
#> 11   fgeo.abundance          basal_area_ind
#> 12   fgeo.abundance                  enexpr
#> 13   fgeo.abundance                   enquo
#> 14   fgeo.abundance                    expr
#> 15   fgeo.abundance                   exprs
#> 16   fgeo.abundance                     quo
#> 17   fgeo.abundance                quo_name
#> 18   fgeo.abundance                    quos
#> 19   fgeo.abundance                     sym
#> 20   fgeo.abundance                    syms
#> 21  fgeo.demography                  growth
#> 22  fgeo.demography               growth_df
#> 23  fgeo.demography               mortality
#> 24  fgeo.demography            mortality_df
#> 25  fgeo.demography             recruitment
#> 26  fgeo.demography          recruitment_df
#> 27     fgeo.habitat           dist_in_torus
#> 28     fgeo.habitat                 ExpList
#> 29     fgeo.habitat GetAutomatedKrigeParams
#> 30     fgeo.habitat           GetKrigedSoil
#> 31         fgeo.map                     %>%
#> 32         fgeo.map                  add_sp
#> 33         fgeo.map            contour_elev
#> 34         fgeo.map        hide_axis_labels
#> 35         fgeo.map       hide_legend_color
#> 36         fgeo.map              label_elev
#> 37         fgeo.map             limit_gx_gy
#> 38         fgeo.map                map_elev
#> 39         fgeo.map               map_gx_gy
#> 40         fgeo.map          map_gx_gy_elev
#> 41         fgeo.map         map_quad_header
#> 42         fgeo.map             map_sp_elev
#> 43         fgeo.map          map_tag_header
#> 44         fgeo.map              maply_quad
#> 45         fgeo.map           maply_sp_elev
#> 46         fgeo.map               maply_tag
#> 47         fgeo.map         suffix_edge_tag
#> 48         fgeo.map           theme_default
#> 49         fgeo.map          theme_map_quad
#> 50         fgeo.map           theme_map_tag
#> 51         fgeo.map                    wrap
#> 52        fgeo.tool                     %>%
#> 53        fgeo.tool             add_col_row
#> 54        fgeo.tool            add_col_row2
#> 55        fgeo.tool           add_hectindex
#> 56        fgeo.tool               add_index
#> 57        fgeo.tool                add_lxly
#> 58        fgeo.tool                add_quad
#> 59        fgeo.tool                add_qxqy
#> 60        fgeo.tool         add_status_tree
#> 61        fgeo.tool             add_subquad
#> 62        fgeo.tool                 add_var
#> 63        fgeo.tool     check_crucial_names
#> 64        fgeo.tool            check_unique
#> 65        fgeo.tool     check_unique_vector
#> 66        fgeo.tool        count_duplicated
#> 67        fgeo.tool           exists_in_pkg
#> 68        fgeo.tool       fieldforms_header
#> 69        fgeo.tool       fieldforms_output
#> 70        fgeo.tool      fieldforms_prepare
#> 71        fgeo.tool                 fill_na
#> 72        fgeo.tool           guess_plotdim
#> 73        fgeo.tool               ls_csv_df
#> 74        fgeo.tool              ls_join_df
#> 75        fgeo.tool    ls_list_spreadsheets
#> 76        fgeo.tool              ls_name_df
#> 77        fgeo.tool              nms_detect
#> 78        fgeo.tool         nms_extract_all
#> 79        fgeo.tool     nms_extract_anycase
#> 80        fgeo.tool            nms_extract1
#> 81        fgeo.tool             nms_has_any
#> 82        fgeo.tool           nms_lowercase
#> 83        fgeo.tool             nms_restore
#> 84        fgeo.tool      nms_restore_newvar
#> 85        fgeo.tool                nms_tidy
#> 86        fgeo.tool          recode_subquad
#> 87        fgeo.tool            replace_null
#> 88        fgeo.tool        restructure_elev
#> 89        fgeo.tool   row_collapse_censusid
#> 90        fgeo.tool  row_discard_twice_dead
#> 91        fgeo.tool       row_filter_status
#> 92        fgeo.tool     row_keep_alive_stem
#> 93        fgeo.tool     row_keep_alive_tree
#> 94        fgeo.tool                 row_top
#> 95        fgeo.tool       str_as_tidy_names
#> 96        fgeo.tool        str_suffix_match
#> 97        fgeo.tool             to_recensus
#> 98        fgeo.tool             type_ensure
#> 99        fgeo.tool               type_taxa
#> 100       fgeo.tool                type_vft
```

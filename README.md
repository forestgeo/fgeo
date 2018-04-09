---
output: 
  html_document:
    keep_md: yes
---
<!-- README.md is generated from README.Rmd. Please edit that file -->



# <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 /> fgeo: Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage status](https://coveralls.io/repos/github/forestgeo/fgeo/badge.svg)](https://coveralls.io/r/forestgeo/fgeo?branch=master)
[![CRAN status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)

__fgeo__ installs and loads multiple R packages of [ForestGEO](http://www.forestgeo.si.edu/) in a single step. Together, all packages of __fgeo__ provide a wide range of tools to analyse forest diversity and dynamics. To learn more about the structure of ForestgGEO's software see [this article](https://goo.gl/c5X6qk).

[Packages index](https://forestgeo.github.io/fgeo/reference/index.html).



## Installation

```
# install.packages("remotes")
remotes::install_github("forestgeo/fgeo")
```

To learn the details about how to install packages from GitHub, read [this blog post](https://goo.gl/dQKEeg).

## Index of fgeo packages

<!--html_preserve--><div id="htmlwidget-5c65cc5dbec3932db3dc" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-5c65cc5dbec3932db3dc">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7"],["<a href=https://forestgeo.github.io/bciex>bciex<\/a>","<a href=https://forestgeo.github.io/fgeo>fgeo<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance>fgeo.abundance<\/a>","<a href=https://forestgeo.github.io/fgeo.demography>fgeo.demography<\/a>","<a href=https://forestgeo.github.io/fgeo.habitat>fgeo.habitat<\/a>","<a href=https://forestgeo.github.io/fgeo.map>fgeo.map<\/a>","<a href=https://forestgeo.github.io/fgeo.tool>fgeo.tool<\/a>"],["Forest Dynamics Data from Barro Colorado Island","Easily Install and Load Packages of ForestGEO","R packages for the Analysis of Forest Dynamics","Demography Tools","Habitat Analyses","Map ForestGEO's Data","Utility Tools for ForestGEO Packages"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>package<\/th>\n      <th>Title<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"order":[],"autoWidth":false,"orderClasses":false,"columnDefs":[{"orderable":false,"targets":0}]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## Index of fgeo functions

<!--html_preserve--><div id="htmlwidget-8c7a841480b3bedcd980" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-8c7a841480b3bedcd980">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104"],["fgeo","fgeo","fgeo","fgeo","fgeo","fgeo","fgeo","fgeo","fgeo","fgeo","fgeo","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.abundance","fgeo.demography","fgeo.demography","fgeo.demography","fgeo.demography","fgeo.demography","fgeo.demography","fgeo.habitat","fgeo.habitat","fgeo.habitat","fgeo.habitat","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.map","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool","fgeo.tool"],["<a href=https://forestgeo.github.io/fgeo/reference/>%>%<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_conflicts<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_core<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_imports<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_index<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_index_functions<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_index_packages<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_link<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_packages<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_suggests<\/a>","<a href=https://forestgeo.github.io/fgeo/reference/>fgeo_update<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>abundance<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>abundance_tally<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>basal_area<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>basal_area_ind<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>enexpr<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>enquo<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>expr<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>exprs<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>quo<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>quo_name<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>quos<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>sym<\/a>","<a href=https://forestgeo.github.io/fgeo.abundance/reference/>syms<\/a>","<a href=https://forestgeo.github.io/fgeo.demography/reference/>growth<\/a>","<a href=https://forestgeo.github.io/fgeo.demography/reference/>growth_df<\/a>","<a href=https://forestgeo.github.io/fgeo.demography/reference/>mortality<\/a>","<a href=https://forestgeo.github.io/fgeo.demography/reference/>mortality_df<\/a>","<a href=https://forestgeo.github.io/fgeo.demography/reference/>recruitment<\/a>","<a href=https://forestgeo.github.io/fgeo.demography/reference/>recruitment_df<\/a>","<a href=https://forestgeo.github.io/fgeo.habitat/reference/>dist_in_torus<\/a>","<a href=https://forestgeo.github.io/fgeo.habitat/reference/>ExpList<\/a>","<a href=https://forestgeo.github.io/fgeo.habitat/reference/>GetAutomatedKrigeParams<\/a>","<a href=https://forestgeo.github.io/fgeo.habitat/reference/>GetKrigedSoil<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>%>%<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>add_sp<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>contour_elev<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>hide_axis_labels<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>hide_legend_color<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>label_elev<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>limit_gx_gy<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>map_elev<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>map_gx_gy<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>map_gx_gy_elev<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>map_quad_header<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>map_sp_elev<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>map_tag_header<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>maply_quad<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>maply_sp_elev<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>maply_tag<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>suffix_edge_tag<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>theme_default<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>theme_map_quad<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>theme_map_tag<\/a>","<a href=https://forestgeo.github.io/fgeo.map/reference/>wrap<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>%>%<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_col_row<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_col_row2<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_hectindex<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_index<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_lxly<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_quad<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_qxqy<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_status_tree<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_subquad<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>add_var<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>check_crucial_names<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>check_unique<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>check_unique_vector<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>count_duplicated<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>exists_in_pkg<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>fieldforms_header<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>fieldforms_output<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>fieldforms_prepare<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>fill_na<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>guess_plotdim<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>ls_csv_df<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>ls_join_df<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>ls_list_spreadsheets<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>ls_name_df<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>nms_detect<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>nms_extract_all<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>nms_extract_anycase<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>nms_extract1<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>nms_has_any<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>nms_lowercase<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>nms_restore<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>nms_restore_newvar<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>nms_tidy<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>recode_subquad<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>replace_null<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>restructure_elev<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>row_collapse_censusid<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>row_discard_twice_dead<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>row_filter_status<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>row_keep_alive_stem<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>row_keep_alive_tree<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>row_top<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>str_as_tidy_names<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>str_suffix_match<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>to_recensus<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>type_ensure<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>type_taxa<\/a>","<a href=https://forestgeo.github.io/fgeo.tool/reference/>type_vft<\/a>"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>package<\/th>\n      <th>fun<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"order":[],"autoWidth":false,"orderClasses":false,"columnDefs":[{"orderable":false,"targets":0}]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## Usage

Load the core __fgeo__ packages in one step.


```r
library(fgeo)
#> -- Attaching packages --------------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.habitat    0.0.0.9001
#> v fgeo.abundance  0.0.0.9002     v fgeo.map        0.0.0.9203
#> v fgeo.demography 0.0.0.9000     v fgeo.tool       0.0.0.9002
#> -- Conflicts ----------------------------------------------------- fgeo_conflicts() --
#> x dplyr::filter()    masks stats::filter()
#> x dplyr::intersect() masks base::intersect()
#> x dplyr::lag()       masks stats::lag()
#> x dplyr::setdiff()   masks base::setdiff()
#> x dplyr::setequal()  masks base::setequal()
#> x dplyr::union()     masks base::union()
```

## Example

Update __fgeo__. This will re-install only the packages that have changed since the last installation -- so it will take a fraction of what it took the first time you installed __fgeo__.

```
fgeo_update()
```

---

Please note that this project is released with a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.


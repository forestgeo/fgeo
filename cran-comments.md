## Test environments

* local windows 10 x64, R 3.5.2
* ubuntu 14.04 (on travis-ci), R 3.5.1
* win-builder (devel and release)

## R CMD check results

fgeo 1.1.1

WARNING
New submission
Strong dependencies not in mainstream repositories:
  fgeo.analyze, fgeo.plot, fgeo.tool, fgeo.x
Availability using Additional_repositories specification:
  fgeo.analyze   yes   https://forestgeo.github.io/drat/
  fgeo.plot      yes   https://forestgeo.github.io/drat/
  fgeo.tool      yes   https://forestgeo.github.io/drat/
  fgeo.x         yes   https://forestgeo.github.io/drat/

* checking dependencies in R code ... NOTE
Namespaces in Imports field not imported from:
  ‘fgeo.analyze’ ‘fgeo.plot’ ‘fgeo.tool’ ‘fgeo.x’
  All declared Imports should be used.

## Downstream dependencies

There are currently no reverse dependencies for this package.

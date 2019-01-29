## Test environments

* local windows 10 x64, R 3.5.2
* ubuntu 14.04 (on travis-ci), R 3.5.1
* win-builder (devel and release)

## R CMD check results

'fgeo' version '1.1.0'
1 ERROR, 1 WARNING

WARNING
New submission
Strong dependencies not in mainstream repositories:
  fgeo.analyze, fgeo.plot, fgeo.tool, fgeo.x
Availability using Additional_repositories specification:
  fgeo.analyze   yes   https://forestgeo.github.io/drat/
  fgeo.plot      yes   https://forestgeo.github.io/drat/
  fgeo.tool      yes   https://forestgeo.github.io/drat/
  fgeo.x         yes   https://forestgeo.github.io/drat/
Authors@R field gives persons with non-standard roles:
  Gabriel Arellano <gabriel.arellano.torres@gmail.com> [aut, rev]: rev
  Stuart Davies <daviess@si.edu> [aut, rev]: rev
  David Kenfack <KenfackD@si.edu > [aut, rev]: rev
  Lauren Krizel <KrizelL@si.edu> [rev]: rev
  Suzanne Lao <laoz@si.edu> [aut, rev]: rev
  Sean McMahon <mcmahons@si.edu> [aut, rev]: rev
  Haley Overstreet <OverstreetH@si.edu> [rev]: rev
  Sabrina Russo <srusso2@unl.edu> [aut, rev]: rev
  Kristina Teixeira <TeixeiraK@si.edu> [aut, rev]: rev
  Graham Zemunik <grah.zem@gmail.com> [aut, rev]: rev
  Daniel Zuleta <dfzuleta@gmail.com> [aut, rev]: rev

ERROR
Packages required but not available: 'fgeo.analyze', 'fgeo.plot'

## Downstream dependencies

I checked 4 reverse dependencies (0 from CRAN + 4 from <https://forestgeo.github.io/drat/>; summary at <https://github.com/forestgeo/fgeo/tree/master/revdep>):

 * We saw 0 new problems
 * We failed to check 0 packages

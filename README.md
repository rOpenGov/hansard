
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- rmarkdown v1 -->

# hansard: Accessing Westminster Parliament Data

[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/hansard)](https://cran.r-project.org/package=hansard)
[![GitHub
tag](https://img.shields.io/github/tag/evanodell/hansard.svg)](https://github.com/evanodell/hansard)
[![](https://cranlogs.r-pkg.org/badges/grand-total/hansard)](https://dgrtwo.shinyapps.io/cranview/)
[![Travis-CI Build
Status](https://travis-ci.org/evanodell/hansard.svg?branch=master)](https://travis-ci.org/evanodell/hansard)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/evanodell/hansard?branch=master&svg=true)](https://ci.appveyor.com/project/evanodell/hansard)
[![Coverage
Status](https://img.shields.io/codecov/c/github/evanodell/hansard/master.svg)](https://codecov.io/github/evanodell/hansard?branch=master)
[![DOI](https://zenodo.org/badge/72111315.svg)](https://zenodo.org/badge/latestdoi/72111315)

An R package to automatically fetch data from the UK Parliament API.
Ironically, Hansard data is not yet accessible through the API. To
explore all available data see <http://www.data.parliament.uk/>. Help on
the API itself is [here](http://explore.data.parliament.uk/).

Like the UK parliament API, this package is a work in progress.
Additional functionalities will be added to the package as they are
developed in the API. The most up-to-date documentation for this package
will always be available at <http://ropengov.github.io/hansard> and at
<https://docs.evanodell.com/hansard/>.

To install from CRAN run:

    install.packages("hansard")

Or, if using the [`pacman`](https://CRAN.R-project.org/package=pacman)
package:

    pacman::p_load(hansard)

To install the development version run:

    #install.packages("devtools")
    devtools::install_github("evanodell/hansard")

or

    pacman::p_load_current_gh("evanodell/hansard")

## Using hansard

For an introduction to `hansard`, please see the
[vignette](http://ropengov.github.io/hansard/articles/introduction.html).
If you are unfamiliar with web APIs [this introductory
course](https://zapier.com/learn/apis/) is useful.

#### API calls with console input

Previous versions (\<=0.3.4) of `hansard` included options for
console-based inputs to call data and interact with the API. This
feature has been removed from subsequent versions, and is available in
the [https://github.com/evanodell/hansard-console](%60hansardconsole%60)
package. There are no plans to submit this to CRAN, and it is not being
actively maintained.

### Disclaimer

This package is in no way officially related to or endorsed by the UK
Parliamentary Data Service. It is released under an MIT license.

### Acknowledgements

This package is part of [rOpenGov](http://ropengov.github.io). [Evan
Odell](https://evanodell.com) is the creator and maintainer.

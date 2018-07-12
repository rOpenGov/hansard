
<!-- README.md is generated from README.Rmd. Please edit that file -->
hansard: Accessing Westminster Parliament Data
==============================================

[![](http://cranlogs.r-pkg.org/badges/grand-total/hansard)](https://dgrtwo.shinyapps.io/cranview/) [![Build Status](https://travis-ci.org/EvanOdell/hansard.png?branch=master)](https://travis-ci.org/EvanOdell/hansard)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/hansard)](https://cran.r-project.org/package=hansard) [![DOI](https://zenodo.org/badge/72111315.svg)](https://zenodo.org/badge/latestdoi/72111315) [![Coverage Status](https://img.shields.io/codecov/c/github/EvanOdell/hansard/master.svg)](https://codecov.io/github/EvanOdell/hansard?branch=master)

An R package to automatically fetch data from the UK Parliament API. Ironically, Hansard data is not yet accessible through the API. To explore all available data see <http://www.data.parliament.uk/>. Help on the API itself is here: <http://api.data.parliament.uk/help/>.

Like the UK parliament API, this package is a work in progress. Additional functionalities will be added to the package as they are developed in the API.

To install from CRAN (version 0.3.4) run:

    install.packages("hansard")

To install the development version run:

    install.packages("devtools")
    devtools::install_github("EvanOdell/hansard")

Using hansard
-------------

For an introduction to `hansard`, the vignette `vignette("introduction", package = "hansard")` is the best place to start. If you are unfamiliar with APIs [https://zapier.com/learn/apis/](this%20introductory%20course) is a helpful introduction.

#### API calls with console input

Previous versions (&lt;=0.3.4) of `hansard` included options for console-based inputs to call data and interact with the API. This feature has been removed from subsequent versions, and is available in the [https://github.com/EvanOdell/hansard-console](%60hansardconsole%60%20package). There are no plans to submit this to CRAN, and it is not being actively maintained.

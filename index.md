# hansard: Accessing Westminster Parliament Data

An R package to automatically fetch data from the UK Parliament API.
Ironically, Hansard data (as in speeches) is not yet accessible through
the API. To explore all available data see
<http://www.data.parliament.uk/>. Documentation for the API itself is
available [here](https://explore.data.parliament.uk/).

Like the UK parliament API, this package is a work in progress.
Additional functionalities will be added to the package as they are
developed in the API. The most up-to-date documentation for this package
will always be available at <https://docs.evanodell.com/hansard/>.

To install from CRAN run:

``` R
install.packages("hansard")
```

To install the development version run:

``` R
#install.packages("remotes")
remotes::install_github("evanodell/hansard")
```

## Using hansard

For an introduction to `hansard`, please see the
[vignette](https://docs.evanodell.com/hansard/articles/introduction.html).

## Citing hansard

Please cite this package as:

Odell E (2017). *hansard: Provides Easy Downloading Capabilities for the
UK Parliament API*. doi:
[10.5281/zenodo.591264](https://doi.org/10.5281/zenodo.591264), R
package version 0.8.0.9000, URL:
<https://cran.r-project.org/package=hansard>.

A BibTeX entry for LaTeX users is

``` R
  @Manual{,
    title = {{hansard}: Provides Easy Downloading Capabilities for the UK Parliament API},
    author = {Evan Odell},
    note = {R package version 0.8.0.9000},
    doi = {10.5281/zenodo.591264},
    url = {https://cran.r-project.org/package=hansard},
  }
```

### Disclaimer

This package is in no way officially related to or endorsed by the UK
Parliamentary Data Service. It is released under an MIT license. Please
note that this project is released with a [Contributor Code of
Conduct](https://github.com/evanodell/hansard/blob/master/CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.

Data obtained through the `hansard` package is licensed under the Open
Government License. The code in `hansard` uses the MIT license.

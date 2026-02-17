# Parliamentary Thesaurus

Imports the parliamentary thesaurus. The API is rate limited to 5500
requests at a time, so some use of parameters is required.

## Usage

``` r
commons_terms(
  search = NULL,
  class = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_commons_terms(
  search = NULL,
  class = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- search:

  A string to search the parliamentary thesaurus for.

- class:

  The class of definition to be returned Accepts one of `'ID'`, `'ORG'`,
  `'SIT'`, `'NAME'`, `'LEG'`, `'CTP'`, `'PBT'` and `'TPG'`. Defaults to
  `NULL`.

- extra_args:

  Additional parameters and queries to pass to API. These queries must
  be strings and start with "&". See the [API
  documentation](http://explore.data.parliament.uk/) or the package
  vignette for more details. Defaults to `NULL`.

- tidy:

  Logical parameter. If `TRUE`, fixes the variable names in the tibble
  to remove special characters and superfluous text, and converts the
  variable names to a consistent style. Defaults to `TRUE`.

- tidy_style:

  The style to convert variable names to, if `tidy = TRUE`. Accepts any
  style accepted by
  [to_any_case](https://rdrr.io/pkg/snakecase/man/to_any_case.html).
  Defaults to `'snake'`.

- verbose:

  If `TRUE`, displayes messages on the console on the progress of the
  API request. Defaults to `TRUE`.

## Value

A tibble with results from the parliamentary thesaurus.

## Examples

``` r
if (FALSE) { # \dontrun{
x <- commons_terms(search = "estate")

x <- commons_terms(search = "estate", class = "ORG")
} # }
```

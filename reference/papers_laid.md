# Papers laid

Imports data on papers laid before the House.

## Usage

``` r
papers_laid(
  withdrawn = FALSE,
  house = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_papers_laid(
  withdrawn = FALSE,
  house = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- withdrawn:

  If `TRUE`, only returns withdrawn papers. Defaults to `FALSE`.

- house:

  The house the paper was laid in. Accepts `'commons'` and `'lords'`. If
  `NULL`, returns both House of Commons and House of Lords. This
  parameter is case-insensitive. Defaults to `NULL`.

- start_date:

  Only includes papers laid before the House on or after this date.
  Accepts character values in `'YYYY-MM-DD'` format, and objects of
  class `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can
  be coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes papers laid before the House on or before this date.
  Accepts character values in `'YYYY-MM-DD'` format, and objects of
  class `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can
  be coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to the
  current system date.

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

A tibble with details on papers laid before the given House.

## Examples

``` r
if (FALSE) { # \dontrun{
x <- papers_laid(withdrawn = FALSE, house = "commons")

x <- papers_laid(withdrawn = TRUE, house = NULL)
} # }
```

# Bulk Epetition data

Get data on all epetitions submitted to parliament, with the label,
sponsor, number of signatures, date created and epetition ID. For
greater detail on indidivual epetitions, see
[`epetition()`](https://ropengov.github.io/hansard/reference/epetition.md).

## Usage

``` r
epetition_tibble(
  min_signatures = 1,
  max_signatures = NULL,
  status = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_epetition_tibble(
  min_signatures = 1,
  max_signatures = NULL,
  status = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- min_signatures:

  The minimum number of signatures required for inclusion in the tibble.
  Defaults to 1.

- max_signatures:

  The maximum number of signatures required for inclusion in the tibble.
  If `NULL`, there is no maximum number of signatures. Defaults to
  `NULL`.

- status:

  The status of the petition, either `'open'` or `'closed'`. If `NULL`,
  returns all petitions both open and closed. Defaults to `NULL`.

- start_date:

  Only includes epetitions created on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes epetitions created on or before this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or a nything else that can be
  coerced to a date with
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

A tibble with details on electronic petitions submitted to parliament.

## See also

[`epetition()`](https://ropengov.github.io/hansard/reference/epetition.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- epetition_tibble()

y <- epetition_tibble(max_signatures = 500)

z <- epetition_tibble(start_date = "2016-12-01", end_date = "2017-04-25")
} # }
```

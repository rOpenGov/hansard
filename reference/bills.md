# Bill data

Imports data on House of Commons and House of Lords bills.

## Usage

``` r
bills(
  ID = NULL,
  amendments = FALSE,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_bills(
  ID = NULL,
  amendments = FALSE,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- ID:

  The ID of a given bill to return data on. If `NULL`, returns all
  bills, subject to other parameters. Defaults to `NULL`.

- amendments:

  If `TRUE`, returns all bills with amendments, subject to other
  parameters. Defaults to `FALSE`.

- start_date:

  Only includes bills introduced on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes bills introduced on or before this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
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

A tibble with details on bills before the House of Lords and the House
of Commons.

## See also

[`bill_stage_types()`](https://ropengov.github.io/hansard/reference/bill_stage_types.md)

[`bill_publications()`](https://ropengov.github.io/hansard/reference/bill_publications.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Download data on all bills
x <- bills()

# Download data on all bill amendments
x <- bills(amendments = TRUE)

# Download data on a specific bills
x <- bills(1719)

# Download data on all bills introduced after a given date
x <- bills(start_date = "2016-01-01")
} # }
```

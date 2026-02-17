# House of Lords Amendments.

Returns a tibble with all available House of Lords amendments, subject
to parameters.

## Usage

``` r
lords_amendments(
  decision = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_lords_amendments(
  decision = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- decision:

  The decision on the amendments. Accepts one of `'Withdrawn'`,
  `'Agreed'`, `'Disagreed'`, `'Pending'`, `'NotMoved'`, `'Disposed'`.
  This parameter is not case sensitive. Defaults to `NULL`.

- start_date:

  Only includes amendments to bills introduced on or after this date.
  Accepts character values in `'YYYY-MM-DD'` format, and objects of
  class `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can
  be coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes amendments to bills introduced on or before this date.
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

A tibble with details on amendments proposed by the House of Lords.

## Examples

``` r
if (FALSE) { # \dontrun{
x <- lords_amendments()

x <- lords_amendments(decision = "Withdrawn")
} # }
```

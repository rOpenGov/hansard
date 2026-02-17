# House of Lords divisions

Imports data on House of Lords divisions. Either a general query subject
to parameters, or the results of a specific division. Individual
divisions can be queried to return a short summary of the votes, or
details on how each peer voted.

## Usage

``` r
lords_divisions(
  division_id = NULL,
  summary = FALSE,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_lords_divisions(
  division_id = NULL,
  summary = FALSE,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- division_id:

  The id of a particular vote. If empty, returns a tibble with
  information on all lords divisions. Defaults to `NULL`.

- summary:

  If `TRUE`, returns a small tibble summarising a division outcome.
  Otherwise returns a tibble with details on how each peer voted. Has no
  effect if `division_id` is empty. Defaults to `FALSE`.

- start_date:

  Only includes divisions on or after this date. Accepts character
  values in `'YYYY-MM-DD'` format, and objects of class `Date`,
  `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be coerced to
  a date with [`as.Date()`](https://rdrr.io/r/base/as.Date.html).
  Defaults to `'1900-01-01'`.

- end_date:

  Only includes divisions on or before this date. Accepts character
  values in `'YYYY-MM-DD'` format, and objects of class `Date`,
  `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be coerced to
  a date with [`as.Date()`](https://rdrr.io/r/base/as.Date.html).
  Defaults to the current system date.

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

A tibble with the results of divisions in the House of Lords.

## Examples

``` r
if (FALSE) { # \dontrun{
x <- lords_divisions(division_id = 705891, summary = TRUE)

x <- lords_divisions(division_id = 705891, summary = FALSE)

# Return all lords divisions in 2016
x <- lords_divisions(NULL, FALSE,
  start_date = "2016-01-01",
  end_date = "2016-12-31"
)
} # }
```

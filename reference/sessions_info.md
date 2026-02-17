# Parliamentary Session data

Imports data on Parliamentary Sessions. Note that due to the date format
used by the API, if `days==TRUE` and the `end_date` and `start_date`
parameters are not set to the default values, the function downloads all
available data and then subsets the tibble between the two given dates.

## Usage

``` r
sessions_info(
  days = FALSE,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_sessions_info(
  days = FALSE,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- days:

  If `TRUE`, returns data for all available days. If `FALSE`, returns
  data on each parliamentary session. If `TRUE` and non-default
  `start_date` and/or `end_date` parameters are requested, the function
  must retrieve all days and subset based on the values passed to
  `start_date` and `end_date`. Not applicable to `lords_sessions`.
  Defaults to `FALSE`.

- start_date:

  Only includes sessions starting on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes sessions ending on or before this date. Accepts
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

A tibble with details on parliamentary sessions.

## Examples

``` r
if (FALSE) { # \dontrun{
x <- sessions_info(days = TRUE)

y <- sessions_info(days = FALSE)
} # }
```

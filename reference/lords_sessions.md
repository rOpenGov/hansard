# Lords sessions

Returns the session code and other basic details for individual House of
Lords sittings. Note that this API does not appear to have been updated
with data after 2017-01-31.

## Usage

``` r
lords_sessions(
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_lords_sessions(
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

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

## See also

[`lords_attendance_session()`](https://ropengov.github.io/hansard/reference/lords_attendance_session.md)

[`sessions_info()`](https://ropengov.github.io/hansard/reference/sessions_info.md)

## Examples

``` r
if (FALSE) { # \dontrun{

a <- lords_sessions(start_date = "2017-01-01", end_date = "2017-01-31")
} # }
```

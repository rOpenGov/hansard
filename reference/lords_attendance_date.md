# House of Lords attendance by date

Imports data on House of Lords attendance on a given date.

## Usage

``` r
lords_attendance_date(
  date = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_lords_attendance_date(
  date = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- date:

  Accepts a date to return attendance data for. Accepts character values
  in `'YYYY-MM-DD'` format, and objects of class `Date`, `POSIXt`,
  `POSIXct`, `POSIXlt` or anything else that can be coerced to a date
  with [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `NULL`.

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

A tibble with details on the lords who attended on a given date.

## Details

Please note that House of Lords attendance data is not as tidy as some
of the others that are accessible through this API, and so additional
work on the return from the API may be required.

Also note that this API does not appear to have been updated with data
after 2017-01-31.

## See also

[`lords_attendance_session()`](https://ropengov.github.io/hansard/reference/lords_attendance_session.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- lords_attendance_date(date = "2016-03-01")
} # }
```

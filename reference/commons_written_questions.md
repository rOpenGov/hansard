# House of Commons Written Questions

Imports data in a tibble on House of Commons written questions.

## Usage

``` r
commons_written_questions(
  mp_id = NULL,
  answering_department = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_commons_written_questions(
  mp_id = NULL,
  answering_department = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- mp_id:

  Accepts a member ID or a list of member IDs and returns a tibble with
  all written questions asked by that MP or list of MPs. If `NULL`,
  mp_id is not included as a query parameter. Defaults to `NULL`.

- answering_department:

  Accepts a string with a department name or partial name, or a list of
  such strings. The query acts as a search, so passing `'health'` will
  return all questions answered by the Department of Health. If `NULL`,
  answering_department is not included as a query parameter. Defaults to
  `NULL`.

- start_date:

  Only includes questions tabled on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes questions tabled on or before this date. Accepts
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

A tibble with details on written questions in the House of Commons.

## Examples

``` r
if (FALSE) { # \dontrun{
# Returns a tibble with written questions from Jon Trickett,
# answered by the Cabinet Office.
x <- commons_written_questions(
  mp_id = 410,
  answering_department = "cabinet office"
)

# Returns a tibble with written questions from Jon Trickett or Diane Abbott,
# and answered by the Cabinet Office or the Home Office.
x <- commons_written_questions(
  mp_id = c(410, 172),
  answering_department = c("cabinet", "home")
)
} # }
```

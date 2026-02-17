# House of Lords written questions

Imports data on House of Lords written questions asked by a given
peer(s), and/or directed to a given department.

## Usage

``` r
lords_written_questions(
  peer_id = NULL,
  answering_department = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_lords_written_questions(
  peer_id = NULL,
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

- peer_id:

  Accepts a member ID or list of IDs, and returns a tibble with all
  written questions asked by that member or members. If `NULL`, peer_id
  is not included in the query to the API and so all written questions
  are returned subject to other function parameters. Defaults to `NULL`.

- answering_department:

  Accepts a string with a department name or partial name or a list of
  departmental names, and returns all written questions by that
  department. The query acts as a search, so entering `'health'` will
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

A tibble with details on written questions in the House of Lords.

## See also

[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md)

[`commons_answered_questions()`](https://ropengov.github.io/hansard/reference/commons_answered_questions.md)

[`commons_oral_questions()`](https://ropengov.github.io/hansard/reference/commons_oral_questions.md)

[`commons_oral_question_times()`](https://ropengov.github.io/hansard/reference/commons_oral_question_times.md)

[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md)

[`mp_questions()`](https://ropengov.github.io/hansard/reference/mp_questions.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- lords_written_questions() # Returns all written questions ever

x <- lords_written_questions(
  peer_id = c(3526, 4176),
  answering_department = c(
    "cabinet",
    "Transport"
  )
)
} # }
```

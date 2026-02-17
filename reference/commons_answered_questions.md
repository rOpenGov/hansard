# House of Commons answered questions

Imports data on House of Commons answered questions. If all parameters
are left empty, imports all available answered questions in a tibble.

If `answering_department` and/or `answered_by` are given a vector with
multiple deparments/IDs, all possible combination of those criteria are
returned.

## Usage

``` r
commons_answered_questions(
  answering_department = NULL,
  answered_by = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_commons_answered_questions(
  answering_department = NULL,
  answered_by = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- answering_department:

  Accepts the name of a department or a list of department names.
  Returns a tibble with all answered questions in the House of Commons
  from the given department. Defaults to `NULL`.

- answered_by:

  Accepts the ID of an MP, or a list of IDs. Returns a tibble with all
  answered questions in the House of Commons by the given MP(s).
  Defaults to `NULL`.

- start_date:

  Only includes questions answered introduced on or after this date.
  Accepts character values in `'YYYY-MM-DD'` format, and objects of
  class `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can
  be coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes questions answered on or before this date. Accepts
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

A tibble with details on all answered questions in the House of Commons.

## See also

[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md)

[`commons_oral_questions()`](https://ropengov.github.io/hansard/reference/commons_oral_questions.md)

[`commons_oral_question_times()`](https://ropengov.github.io/hansard/reference/commons_oral_question_times.md)

[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md)

[`lords_written_questions()`](https://ropengov.github.io/hansard/reference/lords_written_questions.md)

[`mp_questions()`](https://ropengov.github.io/hansard/reference/mp_questions.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- commons_answered_questions(
  answering_department = c("health", "education"),
  answered_by = c("4019", "1542", "111"),
  start_date = "2017-01-01"
)

y <- commons_answered_questions(
  start_date = "2017-03-26",
  end_date = "2017-04-01"
)
} # }
```

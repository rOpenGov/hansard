# House of Commons Oral Questions

Imports data on House of Commons oral questions, based on the asking MP,
the answering department and the date. The `mp_id` and
`answering_department` parameters accept a single ID or department
names, or a list of IDs or department names, respectively.

## Usage

``` r
commons_oral_questions(
  mp_id = NULL,
  answering_department = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_commons_oral_questions(
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

  The ID of a given MP asking an oral question, or a list of MP Ids.
  Defaults to `NULL`.

- answering_department:

  The name of a department, or a list of departments. Defaults to
  `NULL`.

- start_date:

  Only includes questions answered on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). \] Defaults to
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

A tibble with details on all oral questions in the House of Commons.

## See also

[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md)

[`commons_answered_questions()`](https://ropengov.github.io/hansard/reference/commons_answered_questions.md)

[`commons_oral_question_times()`](https://ropengov.github.io/hansard/reference/commons_oral_question_times.md)

[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md)

[`lords_written_questions()`](https://ropengov.github.io/hansard/reference/lords_written_questions.md)

[`mp_questions()`](https://ropengov.github.io/hansard/reference/mp_questions.md)

## Examples

``` r
if (FALSE) { # \dontrun{

# Oral questions from a single MP to a single department
x <- commons_oral_questions(mp_id = 4019, answering_department = "education")


## Questions from multiple MPs and to multiple departments
y <- commons_oral_questions(
  mp_id = c(4019, 4051, 4588),
  answering_department = c("education", "health")
)
} # }
```

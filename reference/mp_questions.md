# Questions asked by a given MP or MPs

Accepts an ID number for a member of the House of Commons, and returns a
tibble of of all their oral and written questions.

## Usage

``` r
mp_questions(
  mp_id = NULL,
  question_type = "all",
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_mp_questions(
  mp_id = NULL,
  question_type = "all",
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

  The ID number of a member of the House of Commons, or a vector of IDs.
  Defaults to `NULL`.

- question_type:

  Accepts the arguments `'all'`, `'oral'` and `'written'`. This
  parameter is not case sensitive. Defaults to `'all'`.

- start_date:

  Only includes questions answered on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
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

A tibble with details on all questions asked by a member of the House of
Commons.

## See also

[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md)

[`commons_answered_questions()`](https://ropengov.github.io/hansard/reference/commons_answered_questions.md)

[`commons_oral_questions()`](https://ropengov.github.io/hansard/reference/commons_oral_questions.md)

[`commons_oral_question_times()`](https://ropengov.github.io/hansard/reference/commons_oral_question_times.md)

[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md)

[`lords_written_questions()`](https://ropengov.github.io/hansard/reference/lords_written_questions.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- mp_questions(c(172, 3967), "all")

y <- mp_questions(mp_id = 172, question_type = "all")

z <- mp_questions(c(172, 3967), "written")
} # }
```

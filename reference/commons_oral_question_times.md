# Commons oral question times

Imports data on House of Commons oral question times. Query with
parameters for the parliamentary session or the question ID. If
`tidy=TRUE`, datetime variables are converted to `POSIXct` class.

## Usage

``` r
commons_oral_question_times(
  session = NULL,
  question_id = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_commons_oral_question_times(
  session = NULL,
  question_id = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- session:

  Accepts a session in format `yyyy/yy` (e.g. `"2016/17"`) and returns a
  tibble of all oral question times from that session. Defaults to
  `NULL`.

- question_id:

  Accepts a question time ID, and returns a tibble of that question
  time.

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

A tibble with information on oral question times in the House of
Commons.

## See also

[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md)

[`commons_answered_questions()`](https://ropengov.github.io/hansard/reference/commons_answered_questions.md)

[`commons_oral_questions()`](https://ropengov.github.io/hansard/reference/commons_oral_questions.md)

[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md)

[`lords_written_questions()`](https://ropengov.github.io/hansard/reference/lords_written_questions.md)

[`mp_questions()`](https://ropengov.github.io/hansard/reference/mp_questions.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- commons_oral_question_times(session = "2016/17", question_id = "685697")
} # }
```

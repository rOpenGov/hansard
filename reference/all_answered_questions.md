# All answered parliamentary questions

Imports data on all answered parliamentary questions in the House of
Commons and/or in the House of Lords. The `mp_id`, `tabling_mp_id` and
`answering_body` parameters accept a single ID or department names, or a
list of IDs or department names, respectively.

This is the most flexible of the various functions that look up
questions, as it queries all types of questions in both houses with a
wide selection of parameters: The member who asks the question, the
member who answers it and the relevant department can all be used to
query the API. `mp_id`, `tabling_mp_id` and `answering_body` all accept
lists of multiple relevant search parameters. This can be in the form of
a list, a data.frame column, a character vector, etc.

## Usage

``` r
all_answered_questions(
  mp_id = NULL,
  tabling_mp_id = NULL,
  house = NULL,
  answering_body = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_all_answered_questions(
  mp_id = NULL,
  tabling_mp_id = NULL,
  house = NULL,
  answering_body = NULL,
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

  Accepts a member ID or vector of member IDs, and returns a tibble with
  all available questions answered by that member. Includes both oral
  and written questions, and includes members of the House of Commons
  and the House of Lords. If `NULL`, returns a tibble with all available
  answered questions, subject to other parameters. Defaults to `NULL`.

- tabling_mp_id:

  Accepts a member ID or vector of member IDs, and returns a tibble with
  all available questions asked by that member, subject to all other
  parameters. Includes both oral and written questions, and includes
  members of the House of Commons and the House of Lords. If `NULL`,
  returns a tibble with all available answered questions, subject to
  other parameters. Defaults to `NULL`.

- house:

  The house to return questions from. Accepts either the short name of
  the legislature (e.g. `'commons'` or `'lords'`) or the ID of the
  legislature (`1` for the House of Commons, `2` for the House of
  Lords). The short names are not case sensitive. If `NULL`, returns
  answers from both houses, subject to other parameters. Defaults to
  `NULL`.

- answering_body:

  The name of the government department that answers the question, or a
  vector of government deparment names. Accepts either the short name
  name of a department (e.g. `'Education'` for the Department for
  Education, `'Digital, Culture, Media and Sport'` for the Department
  for Digital, Culture, Media and Sport), or the ID of a particular
  department (e.g. 60 for the Department for Education). If `NULL`,
  returns answers from all departments, subject to other parameters.
  Defaults to `NULL`.

- start_date:

  The earliest date to include in the tibble. Accepts character values
  in `'YYYY-MM-DD'` format, and objects of class `Date`, `POSIXt`,
  `POSIXct`, `POSIXlt` or anything else that can be coerced to a date
  with [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  The latest date to include in the tibble. Defaults to `'1900-01-01'`.
  Accepts character values in `'YYYY-MM-DD'` format, and objects of
  class `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can
  be coerced to a date with
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

A tibble with details on all answered questions in the House of Commons
and the House of Lords.

## See also

[`commons_answered_questions()`](https://ropengov.github.io/hansard/reference/commons_answered_questions.md)

[`commons_oral_questions()`](https://ropengov.github.io/hansard/reference/commons_oral_questions.md)

[`commons_oral_question_times()`](https://ropengov.github.io/hansard/reference/commons_oral_question_times.md)

[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md)

[`lords_written_questions()`](https://ropengov.github.io/hansard/reference/lords_written_questions.md)

[`mp_questions()`](https://ropengov.github.io/hansard/reference/mp_questions.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# All questions answered by Nicola Blackwood from 1 January 2017 onwards
x <- all_answered_questions(4019, start_date = "2017-01-01")

# All questions answered by Nicola Blackwood from 1 January 2017 onwards
# returns variables in camelCase style
y <- all_answered_questions(4019,
  start_date = "2017-01-01",
  tidy_style = "small_camel"
)

# All questions asked by Andrew Dismore from 1 January 2017 onwards
z <- hansard_all_answered_questions(
  tabling_mp_id = 179,
  start_date = "2017-01-01"
)

# Return all questions asked in the House of Lords
# answered by the Department for Education.
a <- hansard_all_answered_questions(house = "lords", answering_body = 60)

# Returns all questions asked in the House of Lords
# answered by the Department for Education.
b <- hansard_all_answered_questions(house = 2, answering_body = "Education")

# Accepts multiple inputs for mp_id, tabling_mp_id and answering_body
w <- hansard_all_answered_questions(
  mp_id = c(4019, 3980),
  tabling_mp_id = c(338, 172),
  answering_body = c("health", "justice"),
  start_date = "2016-12-18",
  end_date = "2017-03-12"
)
} # }
```

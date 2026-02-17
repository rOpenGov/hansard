# Individual MP voting records

Accepts an ID number for a member of the House of Commons, and returns a
tibble of their votes.

## Usage

``` r
mp_vote_record(
  mp_id = NULL,
  lobby = "all",
  session = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_mp_vote_record(
  mp_id = NULL,
  lobby = "all",
  session = NULL,
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

  The ID number of a member of the House of Commons.

- lobby:

  Accepts one of `'all'`, `'aye'` or `'no'`. `'aye'` returns votes where
  the MP voted `'aye'`, `'no'` returns votes where the MP voted `'no'`,
  `'all'` returns all available votes by the MP. This parameter is not
  case sensitive. Defaults to `'all'`.

- session:

  The parliamentary session to return votes from, in `'YYYY/YY'` format.
  Defaults to `NULL`.

- start_date:

  Only includes divisions on or after this date. Accepts character
  values in `'YYYY-MM-DD'` format, and objects of class `Date`,
  `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be coerced to
  a date with [`as.Date()`](https://rdrr.io/r/base/as.Date.html).
  Defaults to `'1900-01-01'`.

- end_date:

  Only includes divisions on or before this date. Accepts character
  values in `'YYYY-MM-DD'` format, and objects of class `Date`,
  `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be coerced to
  a date with [`as.Date()`](https://rdrr.io/r/base/as.Date.html).
  Defaults to the current system date.

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

A tibble with details on the voting record of the given MP.

## Examples

``` r
if (FALSE) { # \dontrun{
x <- mp_vote_record(172, lobby = "all")

x <- mp_vote_record(172, lobby = "aye")

x <- mp_vote_record(172, lobby = "no")

x <- mp_vote_record(172, session = "2016/17")
} # }
```

# General and By-Elections

Imports data on general and by-elections from the 2010 General Election
onwards.

If both `ID` and `type` are used to query the API, `ID` takes precedence
and `type` is ignored.

## Usage

``` r
elections(
  ID = NULL,
  type = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  label = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_elections(
  ID = NULL,
  type = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  label = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- ID:

  Accepts an ID for a general or by-election from the 2010 General
  Election onwards, and returns the date and type of the elction. If
  `NULL`, returns the date and type of all available elections, subject
  to other parameters. Defaults to `NULL`.

- type:

  Accepts `'General Election'` or `'By-election'` as arguments if ID is
  `NULL`, and returns all General Elections or all By-elections, as
  specified, subject to other parameters. Defaults to `NULL`.

- start_date:

  Only includes elections held on or after this date. Accepts character
  values in `'YYYY-MM-DD'` format, and objects of class `Date`,
  `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be coerced to
  a date with [`as.Date()`](https://rdrr.io/r/base/as.Date.html).
  Defaults to `'1900-01-01'`.

- end_date:

  Only includes elections held on or before this date. Accepts character
  values in `'YYYY-MM-DD'` format, and objects of class `Date`,
  `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be coerced to
  a date with [`as.Date()`](https://rdrr.io/r/base/as.Date.html).
  Defaults to the current system date.

- label:

  Label of the election. By-elections are in `'dd-mmm-yyyy By-election'`
  format; e.g. `'23-Feb-2017 By-election'`, and general elections use
  `'YYYY General Election'` format. The parameter cannot search, so
  check your formatting, spelling and make sure there were actually
  elections with the label specified. If `NULL`, returns all
  Elections/By-elections subject to other parameters. Defaults to
  `NULL`.

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

A tibble with details on all elections from the 2010 General Election
onwards, subject to function parameters. Includes the election ID, the
date, and the type of election(s).

## See also

[`election_results()`](https://ropengov.github.io/hansard/reference/election_results.md)

[`election_candidates()`](https://ropengov.github.io/hansard/reference/election_candidates.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- elections(517994)
} # }
```

# House of Commons Division Dates

Returns a tibble with the divisions (votes) in the House of Commons on a
given date.

## Usage

``` r
commons_division_date(
  date = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_commons_division_date(
  date = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- date:

  Returns all divisions on a given date. Defaults to `NULL`.

- extra_args:

  Additional parameters to pass to API. Defaults to `NULL`.

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

A tibble with the dates of divisions in the House of Commons.

## Examples

``` r
if (FALSE) { # \dontrun{
# all commons divisions on 19 April 2017
x <- commons_division_date("2017-04-19")
} # }
```

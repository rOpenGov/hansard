# House of Commons constituencies

Imports data on House of Commons constituencies, returning a tibble of
all current and/or former Westminster constituencies, subject to
parameters.

## Usage

``` r
constituencies(
  current = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_constituencies(
  current = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- current:

  If `TRUE`, returns only current constituencies. If `FALSE`, returns
  only former constituencies. If `NULL`, returns all current and former
  constituencies. Defaults to `NULL`.

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

A tibble with details of Westminster constituencies.

## Examples

``` r
if (FALSE) { # \dontrun{
x <- constituencies()

y <- constituencies(current = FALSE)
} # }
```

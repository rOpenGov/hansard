# House publications

Imports data on House of Commons and House of Lords publications.

## Usage

``` r
publication_logs(
  ID = NULL,
  house = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_publication_logs(
  ID = NULL,
  house = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- ID:

  Publication ID. Defaults to `NULL`. If not `NULL`, requests a tibble
  with information on the given publication.

- house:

  The house that produced the particular publication. Accepts
  `'commons'` and `'lords'`. If `NULL` or not `'commons'` or `'lords'`,
  returns publications from both House of Commons and House of Lords.
  This parameter is case-insensitive. Defaults to `NULL`.

- start_date:

  Only includes publications issued on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes publications issued on or before this date. Accepts
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

A tibble with details from publications in the House of Commons and
House of Lords

## Examples

``` r
if (FALSE) { # \dontrun{
# All publications in the house of commons
x <- publication_logs(house = "commons")

# Returns a given publication
y <- publication_logs(683267)
} # }
```

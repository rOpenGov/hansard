# House of Commons divisions

Imports data on House of Commons divisions (votes), either full details
on how each member voted, or a summary of vote totals.

## Usage

``` r
commons_divisions(
  division_id = NULL,
  division_uin = NULL,
  summary = FALSE,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_commons_divisions(
  division_id = NULL,
  division_uin = NULL,
  summary = FALSE,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- division_id:

  The id of a particular vote. If empty, returns a tibble with
  information on all commons divisions, subject to all other parameters.
  Defaults to `NULL`. Only accepts a single division ID at a time, but
  to return details on a list of division IDs use with `lapply`. The
  `division_id` takes priority over the `division_uid` parameter.

- division_uin:

  The UIN of a particular vote. If empty, returns a tibble with
  information on all commons divisions, subject to all other parameters.
  Defaults to `NULL`. Only accepts a single division UIN at a time, but
  to return details on a list of division UINs use with `lapply`.

- summary:

  If `TRUE`, returns a small tibble summarising a division outcome.
  Otherwise returns a tibble with details on how each MP voted. Has no
  effect if `division_id` is empty. Defaults to `FALSE`.

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

A tibble with the results of divisions in the House of Commons.

## Examples

``` r
if (FALSE) { # \dontrun{

## All commons divisions
x <- commons_divisions()

## Vote breakdown of specific commons division
y <- commons_divisions(division_id = 694163, summary = FALSE)
} # }
```

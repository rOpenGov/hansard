# Early Day Motions by MP or Peer

Imports data on early day motions signed, sponsored or primarily
sponsored by a given MP or Peer.

## Usage

``` r
mp_edms(
  mp_id = NULL,
  primary_sponsor = TRUE,
  sponsor = TRUE,
  signatory = TRUE,
  full_data = FALSE,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_mp_edms(
  mp_id = NULL,
  primary_sponsor = TRUE,
  sponsor = TRUE,
  signatory = TRUE,
  full_data = FALSE,
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

  The ID number of an MP or Peer. Required parameter, Defaults to
  `NULL`. Accepts single IDs in numerical or character format, or a
  list, data.frame column, etc. If given multiple IDs, the results are
  combined into a single tibble.

- primary_sponsor:

  Includes all early day motions where the given member is the primary
  sponsor in the tibble. Defaults to `TRUE`.

- sponsor:

  Includes all early day motions where the given member a sponsor (but
  not the primary sponsor) in the tibble. Defaults to `TRUE`.

- signatory:

  Includes all early day motions signed (but not sponsored or primarily
  sponsored) by the given member in the tibble. Defaults to `TRUE`.

- full_data:

  If `TRUE`, returns all available data on the EDMs signed or sponsored
  by a member. Defaults to `FALSE`. Note that this can be a very slow
  process compared to other `hansard` functions.

- start_date:

  Only includes early day motions signed on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes early day motions signed on or before this date. Accepts
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

A tibble with information on the tibbles signed, sponsored and/or
primarily sponsored by the given MP.

## See also

[`early_day_motions()`](https://ropengov.github.io/hansard/reference/early_day_motions.md)

## Examples

``` r
if (FALSE) { # \dontrun{

# All EDMs primarily sponsored, sponsored or signed by Mike Crockart
x <- mp_edms(
  mp_id = 3967, primary_sponsor = TRUE,
  sponsor = TRUE, signatory = TRUE
)

# Detailed data on all EDMs primarily sponsored by Mike Crockart
y <- mp_edms(
  mp_id = 3967, primary_sponsor = TRUE,
  sponsor = TRUE, signatory = FALSE, full_data = TRUE
)
} # }
```

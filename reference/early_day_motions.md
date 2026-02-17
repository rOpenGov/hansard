# Early day motion data

Return data on the content, signatories, and sponsors of early day
motions (EDMS).

## Usage

``` r
early_day_motions(
  edm_id = NULL,
  session = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  signatures = 1,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_early_day_motions(
  edm_id = NULL,
  session = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  signatures = 1,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- edm_id:

  Accepts the ID number of an early day motion, and returns data on that
  motion. If `NULL`, returns all available Early Day Motions. Note that
  there, are as of 2017-06-15, 43,330 early day motions on listed in the
  API, so requesting all early day motions without other parameters is
  slow and very demanding on the API itself. Defaults to `NULL`.

- session:

  Accepts a parliamentary session, in `'yyyy/yy'` format. Defaults to
  `NULL`.

- start_date:

  Only includes early day motions tabled on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes early day motions tabled on or before this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to the
  current system date.

- signatures:

  The minimum number of signatures required for inclusion in the tibble.
  Defaults to 1.

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

A tibble with details on the content, signatories and sponsors of all or
a specified early day motions.

## Details

Early Day Motion IDs reset for each parliamentary session, so not
including a query for `session` but including an `edm_id` will return
multiple early day motions with the same ID code from different
parliamentary sessions.

## See also

[`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md)

## Examples

``` r
if (FALSE) { # \dontrun{

# Returns all EDMs with a given ID
x <- early_day_motions(edm_id = 1073)

# Return a specific early day motion by ID
x <- early_day_motions(edm_id = 1073, session = "2017/19")
} # }
```

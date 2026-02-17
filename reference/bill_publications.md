# Bill Publications

Returns details of all publications associated with a specific bill or
all bills.

## Usage

``` r
bill_publications(
  ID = NULL,
  publication_type = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = FALSE
)

hansard_bill_publications(
  ID = NULL,
  publication_type = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = FALSE
)
```

## Arguments

- ID:

  The ID of a specific bill to return publications for. If `NULL`,
  returns all bill publications subject to other parameters. Defaults to
  `NULL`.

- publication_type:

  The type of bill publication to return, in the form of a string. For a
  character vector of bill publication types, see
  [`bill_publication_types()`](https://ropengov.github.io/hansard/reference/bill_publication_types.md).
  If `NULL`, returns all publications of all types, subject to other
  parameters. Defaults to `NULL`.

- start_date:

  Only includes bill publications on or after this date. Accepts
  character values in `'YYYY-MM-DD'` format, and objects of class
  `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be
  coerced to a date with
  [`as.Date()`](https://rdrr.io/r/base/as.Date.html). Defaults to
  `'1900-01-01'`.

- end_date:

  Only includes bill publicationson or before this date. Accepts
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

A tibble with details on bill publications.

## See also

[`bill_stage_types()`](https://ropengov.github.io/hansard/reference/bill_stage_types.md)

[`bills()`](https://ropengov.github.io/hansard/reference/bills.md)

[`bill_publication_types()`](https://ropengov.github.io/hansard/reference/bill_publication_types.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Requesting a specific publication
x <- bill_publications(ID = 752025)

# Requesting all publications after a given date
y <- bill_publications(start_date = "2018-01-01")
} # }
```

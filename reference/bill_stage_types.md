# Bill Stage Types

Returns a tibble with all possible bill stage types.

## Usage

``` r
bill_stage_types(tidy = TRUE, tidy_style = "snake", verbose = TRUE)

hansard_bill_stage_types(tidy = TRUE, tidy_style = "snake", verbose = TRUE)
```

## Arguments

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

A tibble of bill stage types.

## See also

[`bills()`](https://ropengov.github.io/hansard/reference/bills.md)

[`bill_publications()`](https://ropengov.github.io/hansard/reference/bill_publications.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- bill_stage_types()
} # }
```

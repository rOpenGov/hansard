# Early Day Motion Text

A quick and dirty function for a specific use case, use with caution.

## Usage

``` r
edm_text(id, tidy = TRUE, tidy_style = "snake", verbose = TRUE)
```

## Arguments

- id:

  The ID of an individual Early Day Motion, or a vector of IDs, as found
  in the `about` column of returns from
  [`early_day_motions()`](https://ropengov.github.io/hansard/reference/early_day_motions.md)

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

A tibble of containing the EDM text and its ID.

## Examples

``` r
if (FALSE) { # \dontrun{
y <- edm_text(c("811291", "811292", "811293"))
} # }
```

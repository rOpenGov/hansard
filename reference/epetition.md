# Individual epetitions

Imports data on a given epetition. For bulk epetion data, see
[`epetition_tibble()`](https://ropengov.github.io/hansard/reference/epetition_tibble.md).

## Usage

``` r
epetition(
  ID = NULL,
  by_constituency = FALSE,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_epetition(
  ID = NULL,
  by_constituency = FALSE,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- ID:

  The ID of a given petition. If `NULL`, returns all epetitions.
  Defaults to `NULL`. See
  [`epetition_tibble()`](https://ropengov.github.io/hansard/reference/epetition_tibble.md)
  for a greater degree of flexibility when querying all epetitions.

- by_constituency:

  Accepts either `TRUE` or `FALSE`. If `TRUE`, provides a tibble with a
  breakdown of signatures for each petition, by constituency. Defaults
  to `FALSE`.

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

A tibble with details on electronic petitions submitted to parliament.

## See also

[`epetition_tibble()`](https://ropengov.github.io/hansard/reference/epetition_tibble.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- epetition(ID = 706964, by_constituency = TRUE)
} # }
```

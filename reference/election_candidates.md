# Election candidate details

Returns the name and party of all candidates standing in an election,
for each constituency. Note that for general elections this can return a
very large tibble with hundreds of variables.

## Usage

``` r
election_candidates(
  ID = NULL,
  constit_details = FALSE,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_election_candidates(
  ID = NULL,
  constit_details = FALSE,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- ID:

  Accepts an ID for a general or by-election from the 2010 General
  Election onwards, and returns the results. If `NULL`, returns all
  available election results. Defaults to `NULL`.

- constit_details:

  If `TRUE`, returns additional details on each constituency, including
  its GSS (Government Statistical Service) code. Defaults to `FALSE`.

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

## See also

[`elections()`](https://ropengov.github.io/hansard/reference/elections.md)

[`election_results()`](https://ropengov.github.io/hansard/reference/election_results.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- election_candidates(ID = 382037)

y <- election_candidates()

z <- election_candidates(constit_details = TRUE)
} # }
```

# General and By-Election Results

Imports results from general and by-elections from the 2010 General
Election onwards.

## Usage

``` r
election_results(
  ID = NULL,
  all_data = FALSE,
  calculate_percent = FALSE,
  constit_details = FALSE,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_election_results(
  ID = NULL,
  all_data = FALSE,
  calculate_percent = FALSE,
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

- all_data:

  If `TRUE`, returns vote share for all parties standing in any
  constituency in the election/elections returned. Defaults to `FALSE`.
  Note that aside from shorthand for the Conservatives, Labour, Liberal
  Democrat and Independent (Con, Lab, Lib and Ind, respectively) being
  converted to their full names, party names are not tidied, so will
  contain spaces in the case of parties with multiple words in their
  name, such as the Liberal Democrats. If a party did not stand in a
  constituency its vote count is listed as NA. There is a drawback to
  using this parameter, as multiple candidates from the same party in a
  constituency, or multiple independent candidates, have their vote
  totals combined.

- calculate_percent:

  If `TRUE`, calculates the turnout percentage for each constituency in
  the tibble and the majority of the winning candidate to one decimal
  place, and includes this information in the tibble in additional
  columns labelled 'turnout_percentage' and 'majority_percentage'.
  Defaults to `FALSE`.

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

## Value

A tibble with the results of all general and by-elections, or of a
specified general election or by-election.

## See also

[`elections()`](https://ropengov.github.io/hansard/reference/elections.md)

[`election_candidates()`](https://ropengov.github.io/hansard/reference/election_candidates.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- election_results(ID = 382037)

y <- election_results()

z <- election_results(calculate_percent = TRUE, constit_details = TRUE)

w <- election_results(ID = 730039, all_data = TRUE)
} # }
```

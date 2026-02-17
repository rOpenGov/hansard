# Search for an MP or Peer by name and constituency

Note that there are problems with the remote endpoint for this API, and
that correct search queries may not return any results.

## Usage

``` r
members_search(
  search = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_members_search(
  search = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- search:

  Accepts any lucene query string, using \* as a multiple character
  wildcard, and ? as the single character wildcard. Searchs are not case
  sensitive. If `NULL`, returns a tibble with all members of both houses
  of parliament. Defaults to `NULL`.

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

A tibble with the results of the search.

## Details

Function searches for the string and returns a tibble with all matches
from both houses of parliament. Returns all partial matches in the
members' names, constituencies, twitter handle and webpage. The default
search is `NULL`, which returns a tibble of all members of both houses,
the same result as
[`members()`](https://ropengov.github.io/hansard/reference/members.md).

## See also

[`members()`](https://ropengov.github.io/hansard/reference/members.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- members_search("*chris*")

x <- members_search(search = "*chris*")
} # }
```

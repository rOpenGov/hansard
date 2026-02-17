# Members of both houses

Imports basic details on current and former Members of Parliament
including the Lords and the Commons. For more details on a given member
see mnis_full_biog from the mnis package.

## Usage

``` r
members(
  ID = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_members(
  ID = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

commons_members(
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_commons_members(
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

lords_members(
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_lords_members(
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- ID:

  The ID of a member of the House of Commons or the House of Lords to
  return data on. If `NULL`, returns a tibble of all members of both
  houses. Defaults to `NULL`.

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

A tibble with data on members of the House of Commons
(`commons_members()`), the House of Lords, (`lords_members()`), or both
(`members()`).

## Member details functions

- `members`:

  Basic details on a given member from either house

- `commons_members`:

  MPs in the House of Commons

- `lords_members`:

  Peers in the House of Lords

## See also

[`members_search()`](https://ropengov.github.io/hansard/reference/members_search.md)

## Examples

``` r
if (FALSE) { # \dontrun{
a <- members()

x <- members(172)

y <- commons_members()

z <- lords_members()
} # }
```

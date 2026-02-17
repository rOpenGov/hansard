# Voting record of members of the House of Lords

Accepts an ID number for a member of the House of Commons, and returns a
tibble of their votes.

## Usage

``` r
lord_vote_record(
  peer_id = NULL,
  lobby = "all",
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_lord_vote_record(
  peer_id = NULL,
  lobby = "all",
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- peer_id:

  The ID number of a member of the House of Lords. A value must be
  included for this parameter. Use the
  [`lords_members()`](https://ropengov.github.io/hansard/reference/members.md)
  to find IDs for members of the House of Lords. Defaults to `NULL`.

- lobby:

  Accepts one of `'all'`, `'content'`, `'notcontent'`. `'content'`
  returns votes where the peer voted 'Content', `'notcontent'` returns
  votes where the peer voted 'Not Content' and `'all'` returns all
  available votes by the peer. This parameter is not case sensitive.
  Defaults to `'all'`.

- start_date:

  Only includes divisions on or after this date. Accepts character
  values in `'YYYY-MM-DD'` format, and objects of class `Date`,
  `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be coerced to
  a date with [`as.Date()`](https://rdrr.io/r/base/as.Date.html).
  Defaults to `'1900-01-01'`.

- end_date:

  Only includes divisions on or before this date. Accepts character
  values in `'YYYY-MM-DD'` format, and objects of class `Date`,
  `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be coerced to
  a date with [`as.Date()`](https://rdrr.io/r/base/as.Date.html).
  Defaults to the current system date.

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

A tibble with details on the voting record of a member of the House of
Lords.

## Examples

``` r
if (FALSE) { # \dontrun{
x <- lord_vote_record(530, lobby = "all")

x <- lord_vote_record(530, lobby = "content")

x <- lord_vote_record(530, lobby = "notcontent")

x <- lord_vote_record(530, lobby = "not-content")
# This will also work
} # }
```

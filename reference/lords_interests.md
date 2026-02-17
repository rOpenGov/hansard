# Peers' registered interests

Registered financial interests of members of the House of Lords. If
`peer_id=NULL` the actual details of registered interests are stored in
a nested data frame.

## Usage

``` r
lords_interests(
  peer_id = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_lords_interests(
  peer_id = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- peer_id:

  The ID of a member of the House of lords. If `NULL`, returns a tibble
  with all listed financial interests for all members. Defaults to
  `NULL`.

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

A tibble with details on the interests of peers in the House of Lords.

## Examples

``` r
if (FALSE) { # \dontrun{
x <- lords_interests(4170)

y <- lords_interests()
} # }
```

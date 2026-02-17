# TV broadcast data

Imports data on TV broadcasts, clips of individual members and
parliamentary TV channels.

## Usage

``` r
tv_programmes(
  legislature = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_tv_programmes(
  legislature = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

tv_clips(
  mp_id = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_tv_clips(
  mp_id = NULL,
  start_date = "1900-01-01",
  end_date = Sys.Date(),
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

tv_channels(tidy = TRUE, tidy_style = "snake", verbose = TRUE)

hansard_tv_channels(tidy = TRUE, tidy_style = "snake", verbose = TRUE)
```

## Arguments

- legislature:

  Accepts one of either `'commons'` or `'lords'`. If `NULL`, returns all
  TV programmes for all chambers.

- start_date:

  Only includes broadcasts on or after this date. Accepts character
  values in `'YYYY-MM-DD'` format, and objects of class `Date`,
  `POSIXt`, `POSIXct`, `POSIXlt` or anything else that can be coerced to
  a date with [`as.Date()`](https://rdrr.io/r/base/as.Date.html).
  Defaults to `'1900-01-01'`.

- end_date:

  Only includes broadcasts on or before this date. Accepts character
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

- mp_id:

  Accepts the ID of an MP or peer, and returns all clips featuring that
  MP or peer. If `NULL`, returns data on all available clips. Defaults
  to `NULL`.

## Value

A tibble with details on TV broadcasts.

A tibble with details on TV broadcasts featuring the given MP, or all
available clips.

A tibble with details on the different broadcasting channels.

## TV Programme functions

- tv_programmes:

  TV programmse broadcast, per legislature and date

- tv_clips:

  Clips of a given MP or Peer

- tv_channels:

  Details on the different parliamentary TV channels

## Examples

``` r
if (FALSE) { # \dontrun{
x <- tv_programmes("commons",
  start_date = "2016-11-01",
  end_date = "2016-12-01"
)
} # }

if (FALSE) { # \dontrun{
x <- tv_clips(4591)
} # }
```

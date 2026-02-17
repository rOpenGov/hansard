# House of Lords attendance by session

Imports data on House of Lords attendance from each parliamentary
session. Please note that the attendance data is not as tidy as some of
the others that are accessible through this API, and so additional work
to prepare this data in a way that you want may be required.

## Usage

``` r
lords_attendance_session(
  session_id = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_lords_attendance_session(
  session_id = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- session_id:

  The ID of the House of Lords session. If `NULL`, returns a list of all
  sessions, subject to other parameters. Defaults to `NULL`.

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

A tibble with details on the lords who attended a given session.

## Details

To return a tibble with all codes from available individual sessions,
use `lords_attendance_session(session_id=NULL)`, or use
[`lords_sessions()`](https://ropengov.github.io/hansard/reference/lords_sessions.md)
to retrieve codes for a given date range. Attendance from multiple
sessions can be accessed by using `lapply` with the output from
[`lords_sessions()`](https://ropengov.github.io/hansard/reference/lords_sessions.md).

Please note that House of Lords attendance data is not as tidy as some
of the others that are accessible through this API, and so additional
work on the return from the API may be required.

Also note that this API does not appear to have been updated with data
after 2017-01-31.

## See also

[`lords_attendance_date()`](https://ropengov.github.io/hansard/reference/lords_attendance_date.md)

[`lords_sessions()`](https://ropengov.github.io/hansard/reference/lords_sessions.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- lords_attendance_session(session_id = 706178)

# Returns a list of data frames with details of
# attendance for each day of a given vector of sessions.
u <- lords_sessions(start_date = "2017-01-01")
m <- lapply(u$about, lords_attendance_session)
} # }
```

# Changelog

## hansard 0.8.0.9000

- Now using `httr` to handle API requests and return more helpful
  errors.

- New
  [`edm_text()`](https://ropengov.github.io/hansard/reference/edm_text.md)
  function to return the content of Early Day Motions.

## hansard 0.8.0

CRAN release: 2019-11-13

- Replacing deprecated `tidyr` functions with up-to-date ones
  ([\#14](https://github.com/rOpenGov/hansard/issues/14), thanks
  [@counterpig](https://github.com/counterpig)). This may result in some
  slight differences in data structures, please check your code.

### Changes

- [`election_candidates()`](https://ropengov.github.io/hansard/reference/election_candidates.md)
  returns a tibble, with different formats and names than previous
  versions that will be easier to work with. Please check your code as
  the structure may have changed in a way that breaks existing code.

## hansard 0.7.1

CRAN release: 2019-09-08

- Updates to vignette to prevent calls to API in demos.

## hansard 0.7.0

CRAN release: 2019-05-21

### Changes

- Now using the `snakecase` package to tidy tibble names. This has
  resulted in minor changes to style options, please check the
  `tidy_style` parameter values if there are errors.

- [`commons_divisions()`](https://ropengov.github.io/hansard/reference/commons_divisions.md)
  now accepts `division_id` or `division_uin`
  ([\#13](https://github.com/rOpenGov/hansard/issues/13)). Thanks to
  [@basilesimon](https://github.com/basilesimon) for getting the ball
  rolling with this parameter.

### Bug Fixes

- Fixed vignette to reduce calls to API when building, to eliminate CRAN
  errors and prevent hammering the API.

- Fixed a couple typos in custom tidying functions.

## hansard 0.6.3

CRAN release: 2019-01-10

### Bug Fixes

- The max number of items per page has changed at some point. Please
  check your code to ensure that functions return the data you expect.
  If it is returning tibbles with multiples of 100 rows it is likely
  that your data is incomplete.

- Fixed an bug where the the
  [`early_day_motions()`](https://ropengov.github.io/hansard/reference/early_day_motions.md)
  function mishandled list columns.

### Dependency changes

- Removed need for `stringi` and `httr` packages, and dropped some
  `dplyr` dependencies

### Function changes

- `hansard_generic` function is now defunct.

## hansard 0.6.2

### Code changes

- If `tidy=TRUE`, URLs are consistently removed from `about` columns in
  all functions.

### Documentation updates

- Improvements to some example descriptions

## hansard 0.6.1

### Code changes

- [`members_search()`](https://ropengov.github.io/hansard/reference/members_search.md)
  now allows custom lucene queries, with or without wildcards.

## hansard 0.6.0

CRAN release: 2018-03-02

### Code changes

- Changed default value of `verbose` parameter to `TRUE`.

- Adapted
  [`members()`](https://ropengov.github.io/hansard/reference/members.md)
  to fit follow changes in API structure.

### Bug fixes

- Remove URL from `about` column from `all_answered_questions` if
  `tidy=TRUE`.

- Fixed error in
  [`members_search()`](https://ropengov.github.io/hansard/reference/members_search.md)
  that produced a 404 error if left empty.

### Testing

- Expanded test coverage

## hansard 0.5.9

### Bug fixes

- Fixed bugs where capitalised conjunctions in department names were
  causing queries to fail.

## hansard 0.5.8

### New Functions

- [`bill_publications()`](https://ropengov.github.io/hansard/reference/bill_publications.md)
  function introduced, to retrieve data on publications associated with
  different bills.

### Performance improvements

- Transitioned from if and else statements to `dplyr`’s `case_when()`
  and `if_else()` functions for internal use. Also replacing
  [`gsub()`](https://rdrr.io/r/base/grep.html) with  
  faster `stringi` functions in some cases. These changes are intended
  to  
  increase speed and improve ease of maintenance.

## hansard 0.5.7

- Internal rewrites to make maintenance easier and produce a few very
  small increases in speed in several functions.

- Fixed some typos in documentation, brought documentation into line
  with the recommended 80 character maximum width for each line.

## hansard 0.5.6

- Fixed bug on
  [`constituencies()`](https://ropengov.github.io/hansard/reference/constituencies.md)
  so that the `NULL` default value of parameter `current` works
  properly.

## hansard 0.5.5

CRAN release: 2017-10-09

### Function changes

`lords_attendance()` has been deprecated. Please use
[`lords_attendance_date()`](https://ropengov.github.io/hansard/reference/lords_attendance_date.md)
for attendance data for a given date, and
[`lords_attendance_session()`](https://ropengov.github.io/hansard/reference/lords_attendance_session.md)
for attendance from a given session ID.
([\#4](https://github.com/rOpenGov/hansard/issues/4),
[@pssguy](https://github.com/pssguy))

New function
[`lords_sessions()`](https://ropengov.github.io/hansard/reference/lords_sessions.md)
returns a tibble with details of all sessions in the House of Lords
between two given dates.

### Bug Fixes

[`commons_oral_question_times()`](https://ropengov.github.io/hansard/reference/commons_oral_question_times.md)
now only returns one question ID.

### General improvements

Tidying with
[`commons_divisions()`](https://ropengov.github.io/hansard/reference/commons_divisions.md)
now separates vote number from division ID, and the function no longer
returns two rows to summarise a division when only one is needed.

Changes to syntax for
[`constituencies()`](https://ropengov.github.io/hansard/reference/constituencies.md).
The `current` parameter can now distinguish between current
constituencies (`TRUE`), former (`FALSE`) and all constituencies
(`NULL`).

Simplification of some internal code, which may have a marginal effect
on speed, and will make maintenance and adding features easier going
forward.

Switch from using `stringr` to `stringi` for internal string processing.

[`sessions_info()`](https://ropengov.github.io/hansard/reference/sessions_info.md)
is now faster.

## hansard 0.5.4

### General improvements

Speeding up of some tests.

Better tidying on
[`lords_interests()`](https://ropengov.github.io/hansard/reference/lords_interests.md).

Changes to structure of
[`lord_vote_record()`](https://ropengov.github.io/hansard/reference/lord_vote_record.md)
to make it slightly faster and more consistent with other functions.

## hansard 0.5.3

### New features

[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md),
[`commons_answered_questions()`](https://ropengov.github.io/hansard/reference/commons_answered_questions.md),
[`commons_oral_questions()`](https://ropengov.github.io/hansard/reference/commons_oral_questions.md),
[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md),
[`lords_written_questions()`](https://ropengov.github.io/hansard/reference/lords_written_questions.md)
now accept arrays of member IDs and department names.

Added `verbose` parameter to all functions. If `verbose`=`TRUE`,
messages displaying the progress of the API call are sent to the
console.

### General improvements

Sped up edm details retrieval in
[`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md)
where `full_data`==`TRUE` and there are multiple MP IDs.

Major increase in speed for `constituencies(current=TRUE)`.

Small increase in speed for all functions.

[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md)
can now handle departmental ID numbers passed as characters.

Now uses the `stringr` package to remove case sensitivity from queries.

### Bug Fixes

Fixed bug that prevented
[`lords_written_questions()`](https://ropengov.github.io/hansard/reference/lords_written_questions.md)
from retrieving more than 500 results at a time.

## hansard 0.5.2

CRAN release: 2017-08-13

### New features

[`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md)
now accepts lists and character vectors of MP IDs, and returns them all
in one tibble.

[`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md)
now includes `start_date` and `end_date` parameters

### Bug Fixes

Fixed
[`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md)
to return more useful error if the requested MP does not have any Early
Day Motions that meet the search parameters.

The `signatory` parameter in
[`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md)
is now behaving properly.

### Documentation updates

General improvement to documentation

## hansard 0.5.0

CRAN release: 2017-07-10

### New features

All functions have a wrapper function with the same name, but with
`hansard_` prefixed. Existing names have remained untouched.

Addition of `house` and `answering_body` parameters to
[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md)
function.

### Bug Fixes

Fixed bug in
[`lord_vote_record()`](https://ropengov.github.io/hansard/reference/lord_vote_record.md)
which produced an error if requesting both lobbies, but a peer had only
voted in one of the lobbies.

## hansard 0.4.9

### New features

Party name columns in
[`election_candidates()`](https://ropengov.github.io/hansard/reference/election_candidates.md)
and `election_results(all_data=TRUE)` are now in alphabetical order.

### Bug Fixes

Fixed bug in
[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md)
that wasn’t returning results when `tabling_mp_id` is a parameter.

### Documentation changes

[`lords_interests()`](https://ropengov.github.io/hansard/reference/lords_interests.md)
and
[`bill_stage_types()`](https://ropengov.github.io/hansard/reference/bill_stage_types.md)
seperated from `members` and `bills`, respectively, into their own
distinct functions.

## hansard 0.4.8

### New features

New `all_data` parameter in
[`election_results()`](https://ropengov.github.io/hansard/reference/election_results.md)
to return the number of votes cast for each party in each constituency.

New
[`election_candidates()`](https://ropengov.github.io/hansard/reference/election_candidates.md)
function, which returns the name of all candidates standing in an
election.

New
[`epetition_tibble()`](https://ropengov.github.io/hansard/reference/epetition_tibble.md)
function, which returns a tibble with all epetitions submitted to
parliament, subject to parameters. This function offers more flexibility
for returning basic details about a group of epetitions than the
existing
[`epetition()`](https://ropengov.github.io/hansard/reference/epetition.md)
function, which is designed to provide more detailed information on a
single epetition.

## hansard 0.4.7

### New features

Additional URL stripping from variable values if `tidy`=TRUE.

Added `tabling_mp_id` parameter to
[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md).

### Bug Fixes

Fixed bug in
[`members()`](https://ropengov.github.io/hansard/reference/members.md)
where looking up a single member returned a tibble with two rows.

Fixed bug in
[`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md)
where additional data was not being returned if `full_data`=TRUE.

Fixed bug in
[`election_results()`](https://ropengov.github.io/hansard/reference/election_results.md)
where it did not return data if `constit_details`=TRUE.

Fixed bugs where empty queries in
[`election_results()`](https://ropengov.github.io/hansard/reference/election_results.md),
[`members()`](https://ropengov.github.io/hansard/reference/members.md)
and possibly other functions were returning incorrect errors in some
environments or circumstances.

## hansard 0.4.6

CRAN release: 2017-06-05

### New features

Added optional `tidy_style` parameter, allowing users to decide which
style of “snake_case”, “camelCase” and “period.case” they want variable
names to be in, if `tidy`=TRUE.

The
[`elections()`](https://ropengov.github.io/hansard/reference/elections.md)
function now accepts `start_date` and `end_date` parameters. As the API
called by the
[`elections()`](https://ropengov.github.io/hansard/reference/elections.md)
function only accepts one additional argument not included in the
package (the label of the election), changed the `extra_args` parameter
to `label` to query that argument.

The `tidy` parameter now changes date values to POSIXct class with
[`as.POSIXct()`](https://rdrr.io/r/base/as.POSIXlt.html) when the API
returns date information, or to POSIXct with the `parse_date_time` from
the `lubridate` package where the API returns both date and time
information.

`tidy` parameter now strips out more unneeded character strings from API
response.

### Bug fixes

Updated
[`elections()`](https://ropengov.github.io/hansard/reference/elections.md)
to work with new API syntax.

## hansard 0.4.5

### Date Classes

[`hansard()`](https://ropengov.github.io/hansard/reference/hansard.md)
functions with `start_date` and `end_date` parameters now accept any
input that can be coerced to a date with the
[`as.Date()`](https://rdrr.io/r/base/as.Date.html) function.

## hansard 0.4.4

### Election types

Added a `type` parameter to
[`elections()`](https://ropengov.github.io/hansard/reference/elections.md),
to return all elections of a particular type.

### Constituency details

Added optional `constit_details` parameter to `election_result()`
function. If TRUE, `constit_details` retrieves additional constituency
details from
[`constituencies()`](https://ropengov.github.io/hansard/reference/constituencies.md),
most notably including GSS code.

### Bug fixes

Fixed bug on
[`commons_oral_question_times()`](https://ropengov.github.io/hansard/reference/commons_oral_question_times.md)
where some calls did not return tibbles.

Fixed bug in `lords_divisons()` that did prevented vote summary queries
from being returned.

Removed superfluous `x` from names in
[`elections()`](https://ropengov.github.io/hansard/reference/elections.md)
when tidy=TRUE.

## hansard 0.4.3

### Voting margins

Added optional `calculate_percent` parameter to `election_result()`
function. If `TRUE`, `calculate_percent` calculates the turnout
percentage for each constituency in the tibble and the majority of the
winning candidate to one decimal place, and includes this information in
the tibble in columns labelled `turnout_percentage` and
`majority_percentage`. Defaults to FALSE.

## hansard 0.4.2

### tibbling

[`hansard()`](https://ropengov.github.io/hansard/reference/hansard.md)
now uses tibbles instead of data frames as the data class returned from
API calls.

## hansard 0.4.1

Fixes discrepency between output displayed and vignette and actual
package output ([\#7](https://github.com/rOpenGov/hansard/issues/7),
[@pssguy](https://github.com/pssguy)).

tidy parameter in
[`members_search()`](https://ropengov.github.io/hansard/reference/members_search.md)
now does some additional tidying up.

## hansard 0.4.0

CRAN release: 2017-03-24

Major re-write, breaks compatibility with previous versions, please
check your code to ensure it still works with the new package, as
console input functionality has been removed from all functions. These
changes ensure greater consistency insyntax across the package, in both
the body and formals of the functions.

If you need the old console based functions, they can be accessed
through the `hansardconsole` package at
<https://github.com/EvanOdell/hansard-console>.

Changes have been made to most functions, including:

[`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md):
Console interface is gone, now operates as a function with the ID for a
given MP accepted as the only function parameter. Returns all answered
questions if blank.

[`bills()`](https://ropengov.github.io/hansard/reference/bills.md):
Rewritten, now with the ability to look up bills by ID, as well as bill
amendments. Added
[`bill_stage_types()`](https://ropengov.github.io/hansard/reference/bill_stage_types.md)
function.

[`commons_answered_questions()`](https://ropengov.github.io/hansard/reference/commons_answered_questions.md):
Changed parameter name `answeredBy` to `answered_by`; improved ability
to search by date, dropped console inputs.

[`commons_divisions()`](https://ropengov.github.io/hansard/reference/commons_divisions.md):
Removed console inputs, simplified options.

[`commons_oral_question_times()`](https://ropengov.github.io/hansard/reference/commons_oral_question_times.md):
Simplified function, removed need for console input.

[`commons_oral_questions()`](https://ropengov.github.io/hansard/reference/commons_oral_questions.md):
Simpler process, same result, more flexibility in requests

[`commons_answered_questions()`](https://ropengov.github.io/hansard/reference/commons_answered_questions.md):
Removed need for console input.

[`commons_terms()`](https://ropengov.github.io/hansard/reference/commons_terms.md):
Simplified formals.

[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md):
Removed need for console input.

[`constituencies()`](https://ropengov.github.io/hansard/reference/constituencies.md):
Simplified formals.

[`early_day_motions()`](https://ropengov.github.io/hansard/reference/early_day_motions.md):
Changed all camelCase to snake_case.

[`election_results()`](https://ropengov.github.io/hansard/reference/election_results.md):
Removed console input, simplified formals.

[`elections()`](https://ropengov.github.io/hansard/reference/elections.md):
Removed console input, simplified formals.

`lords_attendance()`: Removed console input, simplified formals.

[`lord_vote_record()`](https://ropengov.github.io/hansard/reference/lord_vote_record.md):
Removed console input, simplified formals.

[`lords_divisions()`](https://ropengov.github.io/hansard/reference/lords_divisions.md):
Removed console input, simplified formals.

[`members()`](https://ropengov.github.io/hansard/reference/members.md):
Added additional
[`commons_members()`](https://ropengov.github.io/hansard/reference/members.md),
`commons_interests()`,
[`lords_members()`](https://ropengov.github.io/hansard/reference/members.md)
and
[`lords_interests()`](https://ropengov.github.io/hansard/reference/lords_interests.md)
functions.

[`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md):
Improved functionality, can now call full text of early day motions.

[`mp_questions()`](https://ropengov.github.io/hansard/reference/mp_questions.md):
Changed `questionType` to `question_type`

[`mp_vote_record()`](https://ropengov.github.io/hansard/reference/mp_vote_record.md):
Minor re-write

[`papers_laid()`](https://ropengov.github.io/hansard/reference/papers_laid.md):
Incorporates new features in the API

[`publication_logs()`](https://ropengov.github.io/hansard/reference/publication_logs.md):
Minor re-write, now includes start and end dates.

[`sessions_info()`](https://ropengov.github.io/hansard/reference/sessions_info.md):
Added `start_date()` and `end_date()` parameters

[`tv_channels()`](https://ropengov.github.io/hansard/reference/tv_programmes.md)
New function.

[`tv_clips()`](https://ropengov.github.io/hansard/reference/tv_programmes.md):
New function, previously part of `tv_programmes`.

[`tv_programmes()`](https://ropengov.github.io/hansard/reference/tv_programmes.md):
Minor re-write, now includes ability to select legislature.

Adding of `research_briefings_lists()` functions.

## hansard 0.3.4

CRAN release: 2016-12-13

### Bug fixes

The `lords_attendance()` function was not working. It was returning
empty data frames when searching by date and failing entirely when
trying to retrieve all attendance. This was due to url encoding issues,
which have now been identified and fixed.
([\#4](https://github.com/rOpenGov/hansard/issues/4),
[@meenaparam](https://github.com/meenaparam))

Fixed spelling of amendments, so that `lords_ammendments()` is now
[`lords_amendments()`](https://ropengov.github.io/hansard/reference/lords_amendments.md).
The `lords_ammendments()` function has been deprecated, and will be
removed in a future release.

## hansard 0.3.3

### Bug Fixes

## hansard 0.3.2

### Bug Fixes

## hansard 0.3.0

### Requesting data through function parameters

In response to a request, I’ve added three new functions that allow you
to request the voting record of both MPs and members of the House of
Lords by using their ID as a function parameter, rather than as a
console input. They are:

`lords_vote_record()`

[`mp_questions()`](https://ropengov.github.io/hansard/reference/mp_questions.md)

[`mp_vote_record()`](https://ropengov.github.io/hansard/reference/mp_vote_record.md)

[`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md)

The option to use console input has been preserved in
[`commons_divisions()`](https://ropengov.github.io/hansard/reference/commons_divisions.md),
[`lords_divisions()`](https://ropengov.github.io/hansard/reference/lords_divisions.md),
[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md)
and
[`commons_oral_questions()`](https://ropengov.github.io/hansard/reference/commons_oral_questions.md),
along with other features not available in the new functions.

### Bug fixes

This update fixes an issue with
[`lords_written_questions()`](https://ropengov.github.io/hansard/reference/lords_written_questions.md)
and
[`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md)
where the functions returned a 404 error on some requests.

## hansard 0.2.5

CRAN release: 2016-11-12

### Introducing the hansard package

Provides functions to download data from the data.parliament.uk APIs.

Because of the structure of the data.parliament.uk API, there is a named
function for each type of available data for ease of use. Functions for
each new API will be added as and when they become available on
data.parliament.uk. See the package documentation for details on each
function and the type of data available.

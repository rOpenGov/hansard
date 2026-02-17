# Introduction to hansard

`hansard` is an R package to pull data from the UK parliament through
the <http://www.data.parliament.uk/> API. It emphasises simplicity and
ease of use, so that users unfamiliar with APIs can easily retrieve
large volumes of high quality data. Each function accepts a single
argument at a time, and functions that require additional information to
retrieve the data you requested will ask for it after you execute the
function. Functions retrieve data in json format and convert it to a
tibble. The `hansard_generic` function supports the building of API
requests for XML, csv or HTML formats if required. Note that the API is
rate limited to returning 5500 rows per request in some circumstances.

## Installing hansard

### From CRAN

    install.packages("hansard")

### From GitHub (Development Version)

    install.packages("devtools")
    devtools::install_github("EvanOdell/hansard")

### Load hansard

    library(hansard)

## Using hansard

`hansard` contains functions for calling data for the UK Parliament API.
The functions are designed to call data from a specific
<http://www.data.parliament.uk/> API. The parameter options for each
function vary, depending on the specific information available from each
API, but there are four constant parameters in every function (with the
exception of the `hansard_generic()` and
[`research_topics_list()`](https://ropengov.github.io/hansard/reference/research_briefings_lists.md)
functions [described below](#special-functions)): `extra_args`, `tidy`,
`tidy_style` and `verbose`.

#### `tidy`

`tidy` is a logical parameter accepting either `TRUE` or `FALSE`,
defaulting to `TRUE`. If `TRUE`, `hansard` will fix variable names,
which by default contain non alpha-numeric characters and appear to use
an inconsistent/idiosyncratic naming convention, at least by the
standards of the various naming conventions used in R. Dates and
datetimes are converted to POSIXct class. Some extra URL data included
in the API is also stripped out.

#### `tidy_style`

The naming convention for variables used if `tidy==TRUE` is indicated by
`tidy_style`. `tidy_style` accepts one of `"snake_case"`, `"camelCase"`
and `"period.case"`, defaulting to `"snake_case"`. All variable names
will be converted to match the given naming convention.

#### `verbose`

`verbose` is a logical parameter accepting either `TRUE` or `FALSE`,
defaulting to `FALSE`. If `TRUE`, the function will print the progress
of the API query to the console.

#### `hansard_` prefixes

In addition to the more generic sounding function names, each function
in hansard has a wrapper where the name is prefixed with `hansard_`. For
example, both
[`bills()`](https://ropengov.github.io/hansard/reference/bills.md) and
[`hansard_bills()`](https://ropengov.github.io/hansard/reference/bills.md)
will return the same result.

Almost all `hansard` functions (the exceptions being the functions that
retrieve more reference style data:
[`bill_stage_types()`](https://ropengov.github.io/hansard/reference/bill_stage_types.md),
[`commons_division_date()`](https://ropengov.github.io/hansard/reference/commons_division_date.md),
[`commons_terms()`](https://ropengov.github.io/hansard/reference/commons_terms.md)
[`constituencies()`](https://ropengov.github.io/hansard/reference/constituencies.md),
[`election_candidates()`](https://ropengov.github.io/hansard/reference/election_candidates.md),
[`election_results()`](https://ropengov.github.io/hansard/reference/election_results.md),
[`members()`](https://ropengov.github.io/hansard/reference/members.md),
[`members_search()`](https://ropengov.github.io/hansard/reference/members_search.md),
`research_briefings_lists()` and `hansard_generic()`) include a
`start_date` and `end_date` parameter, which can be used to set the
earliest (`start_date`) and latest (`end_date`) data to be returned from
the API.

### Example using the `commons_divisions()` and `mp_vote_record()` functions

The
[`commons_divisions()`](https://ropengov.github.io/hansard/reference/commons_divisions.md)
function returns divisions in the House of Commons, including the result
of votes and information on what we being voted on.
[`mp_vote_record()`](https://ropengov.github.io/hansard/reference/mp_vote_record.md)
returns a data frame the voting record of a given MP on each division
they voted in. The example below returns all Commons Divisions where
Diane Abbott voted aye in 2017. To find the parliamentary ID of Diane
Abbott (or any other member of the House of Commons or House of Lords),
use the [`members_search()` function described
below](#special-functions).

``` r
library(hansard)
z <- mp_vote_record(172, "aye", start_date = "2017-01-01",
                    end_date = "2017-02-07", verbose = FALSE)
z
```

    ## # A tibble: 11 × 5
    ##    about  title                                   uin   date_value date_datatype
    ##    <chr>  <chr>                                   <chr> <chr>      <chr>        
    ##  1 685695 EU (Notification of Withdrawal) Bill C… CD:2… 2017-02-0… POSIXct      
    ##  2 685768 EU (Notification of Withdrawal) Bill C… CD:2… 2017-02-0… POSIXct      
    ##  3 685669 EU (Notification of Withdrawal) Bill: … CD:2… 2017-02-0… POSIXct      
    ##  4 685670 EU (Notification of Withdrawal) Bill C… CD:2… 2017-02-0… POSIXct      
    ##  5 685672 EU (Notification of Withdrawal) Bill C… CD:2… 2017-02-0… POSIXct      
    ##  6 678297 Opposition Motion: Prisons              CD:2… 2017-01-2… POSIXct      
    ##  7 678341 Opposition Motion: School Funding       CD:2… 2017-01-2… POSIXct      
    ##  8 677700 Wales Bill: Lords Amendment 36 - Amdt … CD:2… 2017-01-2… POSIXct      
    ##  9 671450 Opposition Motion: NHS and social care… CD:2… 2017-01-1… POSIXct      
    ## 10 670447 Commonwealth Development Corporation B… CD:2… 2017-01-1… POSIXct      
    ## 11 670448 Commonwealth Development Corporation B… CD:2… 2017-01-1… POSIXct

Using
[`commons_divisions()`](https://ropengov.github.io/hansard/reference/commons_divisions.md),
we can see the result of one of those votes, ID 722300, the Early
Parliamentary General Election bill that dissolved parliament for the
2017 General Election. The function default is to return a list of every
MP and how they voted:

``` r
x <- commons_divisions(722300, verbose = FALSE)
head(x)
```

    ## # A tibble: 6 × 7
    ##   number member_party   type     member_printed_value vote_id about label_value 
    ##   <chr>  <chr>          <chr>    <chr>                <chr>   <chr> <chr>       
    ## 1 1      Labour         aye_vote Ms Diane Abbott      722300  172   Biography i…
    ## 2 10     Labour         aye_vote Dr Rosena Allin-Khan 722300  4573  Biography i…
    ## 3 100    Labour         aye_vote Mary Creagh          722300  1579  Biography i…
    ## 4 101    Labour (Co-op) aye_vote Stella Creasy        722300  4088  Biography i…
    ## 5 102    Conservative   aye_vote Tracey Crouch        722300  3950  Biography i…
    ## 6 103    Labour         aye_vote Jon Cruddas          722300  1406  Biography i…

With the `summary` parameter, we can return a brief summary table of
votes:

``` r
y <- commons_divisions(division_id = 722300, summary = TRUE, verbose = FALSE)
tibble::glimpse(y)
```

    ## Rows: 1
    ## Columns: 13
    ## $ abstain_count                     <chr> "0"
    ## $ ayes_count                        <chr> "522"
    ## $ noes_vote_count                   <chr> "13"
    ## $ did_not_vote_count                <chr> "0"
    ## $ error_vote_count                  <chr> "0"
    ## $ non_eligible_count                <chr> "0"
    ## $ suspended_or_expelled_votes_count <chr> "0"
    ## $ margin                            <chr> "509"
    ## $ date                              <dttm> 2017-04-19
    ## $ division_number                   <chr> "196"
    ## $ session                           <chr> "2016/17"
    ## $ title                             <chr> "Early Parliamentary General Electio…
    ## $ uin                               <chr> "CD:2017-04-19:264"

The results of votes in the House of Lords can be retrieved with the
`lords_divisions` function. The voting record of individual Lords can be
retrieved using the `lords_vote_record` functions.

### Multiple Parameter Functions

The following functions accept vectors of member IDs and departmental
names for applicable parameters:

- [`all_answered_questions()`](https://ropengov.github.io/hansard/reference/all_answered_questions.md)

- [`commons_answered_questions()`](https://ropengov.github.io/hansard/reference/commons_answered_questions.md)

- [`commons_oral_questions()`](https://ropengov.github.io/hansard/reference/commons_oral_questions.md)

- [`commons_written_questions()`](https://ropengov.github.io/hansard/reference/commons_written_questions.md)

- [`lords_written_questions()`](https://ropengov.github.io/hansard/reference/lords_written_questions.md)

- [`mp_edms()`](https://ropengov.github.io/hansard/reference/mp_edms.md)

For example, the following function returns all questions answered by
Nichola Blackwood (4019) or Sam Gyimah (3980), asked by Keith Vaz (338)
or Diane Abbot (172), and covered by the Department for Health or the
Ministry of Justice, between 2016-12-18 and 2017-03-12.

``` r
w <- all_answered_questions(mp_id = c(4019, 3980), tabling_mp_id = c(338, 172),
                            answering_body = c("health", "justice"),
                            start_date = "2016-12-18", end_date = "2017-03-12")

tibble::glimpse(w) ## need to fix this
```

    ## Rows: 23
    ## Columns: 31
    ## $ about                               <chr> "705625", "705626", "705627", "678…
    ## $ answering_body                      <chr> "Department of Health", "Departmen…
    ## $ question_text                       <chr> "To ask the Secretary of State for…
    ## $ tabling_member_printed              <chr> "Keith Vaz", "Keith Vaz", "Keith V…
    ## $ uin                                 <chr> "65590", "65591", "65592", "61355"…
    ## $ attachment                          <list> [<data.frame[2 x 3]>], [<data.fra…
    ## $ grouped_question_uin                <list> "list(c(\"65591\", \"65592\"))", …
    ## $ answer_text_value                   <chr> "<p>73 clinical commissioning grou…
    ## $ answering_member_about              <chr> "4019", "4019", "4019", "4019", "4…
    ## $ answering_member_label_value        <chr> "Biography information for Barones…
    ## $ answering_member_constituency_value <chr> "Oxford West and Abingdon", "Oxfor…
    ## $ answering_member_printed_value      <chr> "Nicola Blackwood", "Nicola Blackw…
    ## $ date_of_answer_value                <dttm> 2017-03-07, 2017-03-07, 2017-03-0…
    ## $ answer_date_time                    <dttm> 2017-03-07 17:15:39, 2017-03-07 1…
    ## $ date_of_answer_datatype             <chr> "POXIXct", "POXIXct", "POXIXct", "…
    ## $ is_ministerial_correction_value     <chr> "false", "false", "false", "false"…
    ## $ is_ministerial_correction_datatype  <chr> "boolean", "boolean", "boolean", "…
    ## $ answering_dept_id_value             <chr> "17", "17", "17", "17", "17", "17"…
    ## $ answering_dept_short_name_value     <chr> "Health", "Health", "Health", "Hea…
    ## $ answering_dept_sort_name_value      <chr> "Health", "Health", "Health", "Hea…
    ## $ date_value                          <chr> "2017-02-27", "2017-02-27", "2017-…
    ## $ date_datatype                       <chr> "dateTime", "dateTime", "dateTime"…
    ## $ hansard_heading_value               <chr> "Diabetes", "Diabetes", "Diabetes"…
    ## $ house_id_value                      <chr> "1", "1", "1", "1", "1", "1", "1",…
    ## $ registered_interest_value           <chr> "false", "false", "false", "false"…
    ## $ registered_interest_datatype        <chr> "boolean", "boolean", "boolean", "…
    ## $ tabling_member_about                <chr> "338", "338", "338", "338", "338",…
    ## $ tabling_member_label_value          <chr> "Biography information for Keith V…
    ## $ tabling_member_constituency_value   <chr> "Leicester East", "Leicester East"…
    ## $ legislature_pref_label_value        <chr> "House of Commons", "House of Comm…
    ## $ legislature_about                   <chr> "25259", "25259", "25259", "25259"…

### Special functions

Several functions have special or experimental features:

- `research_briefings_lists()` An experimental feature that creates
  lists of possible parameters, and allows the user to call to the API
  based on the content of the list. Currently only available with the
  `research_briefings_lists` function.

- `hansard_generic()` A basic wrapper function for any of the available
  APIs. Users must specify the exact path they want the function to call
  from, and must also specify JSON formatting.

- [`members_search()`](https://ropengov.github.io/hansard/reference/members_search.md)
  A search function for members of the House of Commons and House of
  Lords.

### The `research_briefings()` function

The
[`research_briefings()`](https://ropengov.github.io/hansard/reference/research_briefings.md)
function includes the feature of requesting data using lists created
using the `research_briefings_lists` functions:

``` r
research_topics_list <- research_topics_list()

research_topics_list[[7]]
```

    ## [1] "Defence"

In this case I have given them the same name as their function, but you
can assign any name you wish to them.

Having created the lists, they can be used to specify which topics and
subtopics to call, although strings can also be used. In the example
below, `a` and `c` contain the same data.

``` r
a <- research_briefings(topic = research_topics_list[[7]])

c <- research_briefings(topic = "Defence")
```

If a specific subtopic is called, but the topic is not specified, the
function will still return all data within that specific subtopic. Note
that this is slower than specifying the topic and subtopic.

If a specified subtopic is not a subtopic of the specified topic, the
function will not return any data.

### The `hansard_generic()` function

The `hansard_generic()` function allows you to put in your own paths to
the API. Information on all the paths available in the API can be found
on the [DDP Explorer website](http://explore.data.parliament.uk/).

``` r
x <- hansard_generic("commonsansweredquestions.json")
```

Note that the API defaults to returning 10 items per page, but allows up
to 500 items per page, the default used by `hansard`.

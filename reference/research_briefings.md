# Parliamentary Research Briefings

Imports data on Parliamentary Research Briefings. To see a list of
possible topics call
[`research_topics_list()`](https://ropengov.github.io/hansard/reference/research_briefings_lists.md)
or
[`research_subtopics_list()`](https://ropengov.github.io/hansard/reference/research_briefings_lists.md)
for both topics and subtopics. To see a list of briefing types, call
[`research_types_list()`](https://ropengov.github.io/hansard/reference/research_briefings_lists.md).
This function can return results with newlines in the text of the
abstract or description of the research briefing, represented as
`'\\n'`.

## Usage

``` r
research_briefings(
  topic = NULL,
  subtopic = NULL,
  type = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)

hansard_research_briefings(
  topic = NULL,
  subtopic = NULL,
  type = NULL,
  extra_args = NULL,
  tidy = TRUE,
  tidy_style = "snake",
  verbose = TRUE
)
```

## Arguments

- topic:

  The topic of the parliamentary briefing. Defaults to `NULL`.

- subtopic:

  The subtopic of the parliamentary briefing. Defaults to `NULL`.

- type:

  The type of research briefing. Defaults to `NULL`.

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

A tibble with details on parliamentary research briefings on the given
topic.

## See also

[`research_subtopics_list()`](https://ropengov.github.io/hansard/reference/research_briefings_lists.md)

[`research_types_list()`](https://ropengov.github.io/hansard/reference/research_briefings_lists.md)

[`research_topics_list()`](https://ropengov.github.io/hansard/reference/research_briefings_lists.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- research_briefings("Housing and planning")

# Requests can be made using lists created using `research_topics_list`
# and `research_subtopics_list`

research_topics_list <- research_topics_list()

x <- research_briefings(topic = research_topics_list[[7]])

research_subtopics_list <- research_subtopics_list()

x <- research_briefings(subtopic = research_subtopics_list[[7]][10])

# Requests for certain briefing types can also be made using lists
# created with `research_types_list`.

research_types_list <- research_types_list()

x <- research_briefings(type = research_types_list[[3]])
} # }
```

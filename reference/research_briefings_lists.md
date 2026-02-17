# Lists of research briefing topics, subtopics and types.

Returns lists of research briefing topics, subtopics and types. These
functions do not accept any arguments.

## Usage

``` r
research_topics_list()

hansard_research_topics_list()

research_subtopics_list()

hansard_research_subtopics_list()

research_types_list()

hansard_research_types_list()
```

## Value

A list with the different research topics/subtopics/types available.

## Member details functions

- research_topics_list:

  A list with the different research topics available

- research_subtopics_list:

  A list of Parliamentary Research Briefings topics

- research_types_list:

  A list of types of Parliamentary Research Briefings

## See also

[`research_briefings()`](https://ropengov.github.io/hansard/reference/research_briefings.md)

## Examples

``` r
if (FALSE) { # \dontrun{
research_topics_list <- research_topics_list()

research_subtopics_list <- research_subtopics_list()

research_types_list <- research_types_list()
} # }
```




#' research_topics_list
#'
#' Prints or assigns to an object a list of Parliamentary Research Briefings topics.
#' @rdname research_briefings_lists
#' @export
#' @keywords  Parliamentary Research Briefings
#' @examples
#'
#' research_topics_list <- research_topics_list()
#'
#'
research_topics_list <- function() {

  x <- jsonlite::fromJSON("http://lda.data.parliament.uk/researchbriefingtopics.json?", flatten = TRUE)

  y <- x$result$items$prefLabel._value

  research_topics_list <- as.list(y)

  research_topics_list

}



#' research_subtopics_list
#'
#' Prints or assigns to an object a list of Parliamentary Research Briefings subtopics, grouped by topic.
#' @rdname research_briefings_lists
#' @export
#' @keywords Parliamentary Research Briefings
#' @examples
#'
#' research_subtopics_list <- research_subtopics_list()
#'
#'
#'
research_subtopics_list <- function() {

  x <- jsonlite::fromJSON("http://lda.data.parliament.uk/researchbriefingtopics.json?", flatten = TRUE)

  y <- x$result$items$prefLabel._value

  research_topics_list <- as.list(y)

  research_subtopics_list <- list()

  for (i in research_topics_list) {

    i <- URLencode(i)

    g <- jsonlite::fromJSON(paste0("http://lda.data.parliament.uk/researchbriefingsubtopics/", i, ".json?"), flatten = TRUE)


    i <- URLdecode(i)

    research_subtopics_list[[i]] <- g$result$items$prefLabel._value

  }

  research_subtopics_list

}



#' research_types_list
#'
#' Prints or assigns to an object a list of types of Parliamentary Research Briefings.
#' @rdname research_briefings_lists
#' @export
#' @keywords  Parliamentary Research Briefings
#' @examples
#' research_types_list <- research_types_list()
#'
#'
#'
#'

research_types_list <- function() {

  x <- jsonlite::fromJSON("http://lda.data.parliament.uk/researchbriefingtypes.json?")

  research_types_list <- as.list(x$result$items$prefLabel$`_value`)

  research_types_list
}


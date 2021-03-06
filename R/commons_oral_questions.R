

#' House of Commons Oral Questions
#'
#' Imports data on House of Commons oral questions, based on the asking MP,
#' the answering department and the date. The \code{mp_id} and
#' \code{answering_department} parameters accept a single ID or department
#' names, or a list of IDs or department names, respectively.
#'
#' @param mp_id The ID of a given MP asking an oral question, or a list of
#' MP Ids. Defaults to \code{NULL}.
#' @param answering_department The name of a department, or a list of
#' departments. Defaults to \code{NULL}.
#' @param start_date Only includes questions answered on or after this date.
#' Accepts character values in \code{'YYYY-MM-DD'} format, and objects of
#' class \code{Date}, \code{POSIXt}, \code{POSIXct}, \code{POSIXlt} or anything
#' else that can be coerced to a date with \code{as.Date()}. Defaults to \code{'1900-01-01'}.
#' @param end_date Only includes questions answered on or before this date.
#' Accepts character values in \code{'YYYY-MM-DD'} format, and objects of class
#' \code{Date}, \code{POSIXt}, \code{POSIXct}, \code{POSIXlt} or anything else
#' that can be coerced to a date with \code{as.Date()}. Defaults to the current
#' system date.
#' @inheritParams all_answered_questions
#' @return A tibble with details on all oral questions in the House of Commons.
#' @seealso \code{\link{all_answered_questions}}
#' @seealso \code{\link{commons_answered_questions}}
#' @seealso \code{\link{commons_oral_question_times}}
#' @seealso \code{\link{commons_written_questions}}
#' @seealso \code{\link{lords_written_questions}}
#' @seealso \code{\link{mp_questions}}
#' @export
#' @examples \dontrun{
#' x <- commons_oral_questions(mp_id=4019, answering_department = 'education')
#'
#' x <- commons_oral_questions(mp_id=c(4019,4051,4588),
#'                             answering_department = c('education', 'health'))
#' }

commons_oral_questions <- function(mp_id = NULL, answering_department = NULL,
                                   start_date = "1900-01-01",
                                   end_date = Sys.Date(),
                                   extra_args = NULL, tidy = TRUE,
                                   tidy_style = "snake_case", verbose = TRUE) {

    if (length(mp_id) > 1 || length(answering_department) > 1) {

        df <- commons_oral_questions_multi(mp_id, answering_department,
                                           start_date, end_date,
                                           extra_args, verbose)

    } else {

        mp_id <- dplyr::if_else(
          is.null(mp_id) == FALSE && is.na(mp_id) == FALSE,
          paste0(
            "&tablingMember=http://data.parliament.uk/members/", mp_id),
          "")

        json_query <- dplyr::if_else(
          is.null(answering_department) == FALSE &&
            is.na(answering_department) == FALSE,
          utils::URLencode(paste0("/answeringdepartment.json?q=",
                                  answering_department)), ".json?")

        dates <- paste0("&_properties=AnswerDate&max-AnswerDate=",
                        as.Date(end_date),
                        "&min-AnswerDate=",
                        as.Date(start_date))

        baseurl <- paste0(url_util,  "commonsoralquestions")

        if (verbose == TRUE) {
            message("Connecting to API")
        }

        oral <- jsonlite::fromJSON(paste0(baseurl, json_query, mp_id,
                                          dates, extra_args, "&_pageSize=1"),
                                   flatten = TRUE)

        jpage <- floor(oral$result$totalResults/500)

        query <- paste0(baseurl, json_query, mp_id, dates,
                        extra_args, "&_pageSize=500&_page=")

        df <- loop_query(query, jpage, verbose)  # in utils-loop.R

    }

    if (nrow(df) == 0) {

        message("The request did not return any data.
                Please check your parameters.")

    } else {

        if (tidy == TRUE) {

            df <- coq_tidy(df, tidy_style)  ## in utils-commons.R

        }

        df

    }

}


#' @rdname commons_oral_questions
#' @export
hansard_commons_oral_questions <- commons_oral_questions

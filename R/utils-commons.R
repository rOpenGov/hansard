
# commons_oral_questions_multi -----------------------------------------

commons_oral_questions_multi <- function(mp_id, answering_department,
                                         start_date, end_date,
                                         extra_args, verbose) {

    if (is.null(mp_id) == TRUE) {

        mp_id_list <- NA

    } else {

        mp_id_list <- as.list(mp_id)

    }

    if (is.null(answering_department) == TRUE) {

        dep_list <- NA

    } else {

        dep_list <- as.list(answering_department)

    }

    search_grid <- expand.grid(dep_list, mp_id_list, stringsAsFactors = FALSE)

    names(search_grid)[names(search_grid) == "Var1"] <- "department"
    names(search_grid)[names(search_grid) == "Var2"] <- "member"

    dat <- vector("list", nrow(search_grid))

    for (i in 1:nrow(search_grid)) {

        dat[[i]] <- hansard::commons_oral_questions(
          mp_id = search_grid$member[[i]],
          answering_department = search_grid$department[[i]],
          end_date = end_date,
          start_date = start_date,
          extra_args = extra_args,
          verbose = verbose,
          tidy = FALSE)

    }

    dat <- dat[sapply(dat, function(d) is.null(d) == FALSE)]

    df <- dplyr::bind_rows(dat)

    names(df)[names(df) == "_about"] <- "about"

    df

}



# commons_written_questions_multi -----------------------------------------

commons_written_questions_multi <- function(mp_id, answering_department,
                                            start_date, end_date,
                                            extra_args, verbose) {

    if (is.null(mp_id) == TRUE) {

        mp_id_list <- NA

    } else {

        mp_id_list <- as.list(mp_id)

    }

    if (is.null(answering_department) == TRUE) {

        dep_list <- NA

    } else {

        dep_list <- as.list(answering_department)

    }

    search_grid <- expand.grid(dep_list, mp_id_list, stringsAsFactors = FALSE)

    names(search_grid)[names(search_grid) == "Var1"] <- "department"
    names(search_grid)[names(search_grid) == "Var2"] <- "member"

    dat <- vector("list", nrow(search_grid))

    for (i in 1:nrow(search_grid)) {

        dat[[i]] <- hansard::commons_written_questions(
          mp_id = search_grid$member[[i]],
          answering_department = search_grid$department[[i]],
          end_date = end_date,
          start_date = start_date,
          extra_args = extra_args,
          verbose = verbose,
          tidy = FALSE)

    }

    dat <- dat[sapply(dat, function(d) is.null(d) == FALSE)]

    df <- dplyr::bind_rows(dat)

    names(df)[names(df) == "_about"] <- "about"

    df

}



# commons_answered_questions_multiple -----------------------------------------

caq_multi <- function(answering_department, answered_by,
                      start_date, end_date, extra_args, verbose) {

    if (is.null(answered_by) == TRUE) {

        mp_id_list <- NA

    } else {

        mp_id_list <- as.list(answered_by)

    }

    if (is.null(answering_department) == TRUE) {

        dep_list <- NA

    } else {

        dep_list <- as.list(answering_department)

    }

    search_grid <- expand.grid(dep_list, mp_id_list, stringsAsFactors = FALSE)

    names(search_grid)[names(search_grid) == "Var1"] <- "department"
    names(search_grid)[names(search_grid) == "Var2"] <- "member"

    dat <- vector("list", nrow(search_grid))

    for (i in 1:nrow(search_grid)) {

        dat[[i]] <- hansard::commons_answered_questions(
          answering_department = search_grid$department[[i]],
          answered_by = search_grid$member[[i]],
          end_date = end_date,
          start_date = start_date,
          extra_args = extra_args,
          verbose = verbose,
          tidy = FALSE)

    }

    dat <- dat[sapply(dat, function(d) is.null(d) == FALSE)]

    df <- dplyr::bind_rows(dat)

    names(df)[names(df) == "_about"] <- "about"

    df

}



# commons_answered_questions_multiple_tidy -----------------------------------------

caq_tidy <- function(df, tidy_style) {

    if (nrow(df) > 0) {

        df$dateOfAnswer._value <- as.POSIXct(df$dateOfAnswer._value)

        df$dateOfAnswer._datatype <- "POSIXct"

        df$answeringMember._about <- stringi::stri_replace_all_fixed(
          df$answeringMember._about,
          "http://data.parliament.uk/members/", "",
          vectorize_all = FALSE)

        df$AnsweringBody <- unlist(df$AnsweringBody)

    }

    df <- hansard_tidy(df, tidy_style)

    df

}


# commons divisions date -----------------------------------------
# First tidying function

cdd_tidy <- function(df, tidy_style) {

    if (nrow(df) > 0) {

        df$date._value <- as.POSIXct(df$date._value)

        df$date._datatype <- "POSIXct"

    }

    df <- hansard_tidy(df, tidy_style)

    df

}



# commons_divs tidying -----------------------------------------



cd_tidy <- function(df, tidy_style, division_id, summary) {

    if (nrow(df) > 0) {

        if (is.null(division_id) == TRUE) {

            df$date._datatype <- "POSIXct"

            df$date._value <- as.POSIXct(df$date._value)

        } else {

            if (summary == TRUE) {

                df$date <- as.POSIXct(df$date)

            } else {

                df$`_about` <- gsub("http://data.parliament.uk/resources/", "",
                                    df$`_about`)

                df$voteId <- gsub("/.*$", "", df$`_about`)

                df$`_about` <- gsub("^.*/*/", "", df$`_about`)

                names(df)[names(df) == "_about"] <- "number"

                df <- tidyr::unnest(df)

                df$type <- gsub("http://data.parliament.uk/schema/parl#", "",
                                df$type)

                df$type <- gsub("([[:lower:]])([[:upper:]])", "\\1_\\2",
                                df$type)

                if (tidy_style == "camelCase") {

                  df$type <- gsub("(^|[^[:alnum:]])([[:alnum:]])", "\\U\\2",
                                  df$type,
                    perl = TRUE)

                  substr(df$type, 1, 1) <- tolower(substr(df$type, 1, 1))

                } else if (tidy_style == "period.case") {

                  df$type <- gsub("_", ".", df$type)

                  df$type <- tolower(df$type)

                } else {

                  df$type <- tolower(df$type)

                }
            }
        }
    }



    df <- hansard_tidy(df, tidy_style)

    if (summary == FALSE) {

        df$about <- gsub("http://data.parliament.uk/members/", "", df$about)

    }

    df

}



## commons_written_questions utilities -----------------------------------------


cwq_tidy <- function(df, tidy_style) {

    if (nrow(df) > 0) {

        df$AnswerDate._value <- as.POSIXct(df$AnswerDate._value)

        df$dateTabled._value <- as.POSIXct(df$dateTabled._value)

        df$dateTabled._datatype <- "POSIXct"

        df$AnswerDate._datatype <- "POSIXct"

        df$tablingMemberPrinted <- unlist(df$tablingMemberPrinted)

        df$AnsweringBody <- unlist(df$AnsweringBody)

        df$tablingMember._about <- gsub(
          "http://data.parliament.uk/members/", "", df$tablingMember._about
          )

    }

    df <- hansard_tidy(df, tidy_style)

    df

}



## commons_oral_questions_times utilities -----------------------------------------


coqt_tidy <- function(df, tidy_style) {

    if (nrow(df) > 0) {

        df$session <- as.character(df$session)

        df <- tidyr::unnest_(df, "AnswerBody")

        df$`_about1` <- NULL

        df$AnswerDateTime._value <- gsub("T", " ", df$AnswerDateTime._value)

        df$AnswerDateTime._value <- lubridate::parse_date_time(
          df$AnswerDateTime._value, "Y-m-d H:M:S"
          )

        df$AnswerDateTime._datatype <- "POSIXct"

        df$date._value <- gsub("T", " ", df$date._value)

        df$date._value <- lubridate::parse_date_time(
          df$date._value, "Y-m-d H:M:S"
          )

        df$date._datatype <- "POSIXct"

        df$modified._value <- gsub("T", " ", df$modified._value)

        df$modified._value <- lubridate::parse_date_time(
          df$modified._value, "Y-m-d H:M:S"
          )

        df$modified._datatype <- "POSIXct"

        df$`_about` <- gsub("http://data.parliament.uk/resources/", "",
                            df$`_about`)

    }

    df <- hansard_tidy(df, tidy_style)

    df

}


## commons_oral_questions utilities -----------------------------------------

coq_tidy <- function(df, tidy_style) {

    if (nrow(df) > 0) {

        df$AnswerDateTime._value <- gsub("T", " ", df$AnswerDateTime._value)

        df$AnswerDateTime._value <- lubridate::parse_date_time(
          df$AnswerDateTime._value, "Y-m-d H:M:S"
          )

        df$AnswerDateTime._datatype <- "POSIXct"

        df$AnswerDate._value <- as.POSIXct(df$AnswerDate._value)

        df$AnswerDate._datatype <- "POSIXct"

        df$tablingMemberPrinted <- unlist(df$tablingMemberPrinted)

        df$AnsweringBody <- unlist(df$AnsweringBody)

        df$tablingMember._about <- gsub(
          "http://data.parliament.uk/members/", "", df$tablingMember._about
          )

    }

    df <- hansard_tidy(df, tidy_style)

    df

}

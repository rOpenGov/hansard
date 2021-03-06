
library(hansard)
context("commons functions")

test_that("commons functions return expected format", {
    skip_on_cran()

    xcaq <- hansard_commons_answered_questions(
      answering_department = c('health','education'),
      answered_by = c(4019, 1542, 111), verbose=TRUE,
      start_date = '2017-02-01', end_date= '2017-06-18')
    expect_length(xcaq, 10)
    expect_type(xcaq, "list")
    expect_true(tibble::is_tibble(xcaq))
    expect_equal(nrow(xcaq), 1309)

    # Divisions

    xcd <- hansard_commons_divisions(division_id = 694163,
                                     summary = FALSE, verbose=TRUE)
    expect_length(xcd, 7)
    expect_type(xcd, "list")
    expect_true(tibble::is_tibble(xcd))

    xcds <- hansard_commons_divisions(division_id = 694163,
                                      summary = TRUE, verbose=TRUE)
    expect_length(xcds, 13)
    expect_type(xcds, "list")
    expect_true(tibble::is_tibble(xcds))

    xcdall <- hansard_commons_divisions(start_date = "2017-02-01",
                                        end_date = "2017-03-01", verbose=TRUE)
    expect_length(xcdall, 5)
    expect_type(xcdall, "list")
    expect_true(tibble::is_tibble(xcdall))

    # Divisions by Date
    cdd <- commons_division_date("2017-02-24", verbose=TRUE)
    expect_length(cdd, 5)
    expect_type(cdd, "list")
    expect_true(tibble::is_tibble(cdd))
    expect_equal(nrow(cdd), 5)

    ## Questions
    xcoqt <- hansard_commons_oral_question_times(session = "2016/17",
                                                 question_id = "685697",
                                                 verbose=TRUE) #
    expect_length(xcoqt, 16)
    expect_type(xcoqt, "list")
    expect_true(tibble::is_tibble(xcoqt))

    xcoqs <- hansard_commons_oral_question_times(session = "2015/16",
                                                 verbose=TRUE)
    expect_length(xcoqs, 15)
    expect_type(xcoqs, "list")
    expect_true(tibble::is_tibble(xcoqs))

    xcoqe <- hansard_commons_oral_questions(
      mp_id=c(4019,4051,4588),
      answering_department = c('education', 'health'),
      verbose=TRUE, tidy_style = "period.case")
    expect_length(xcoqe, 24)
    expect_type(xcoqe, "list")
    expect_true(tibble::is_tibble(xcoqe))

    xcwq <- hansard_commons_written_questions(
      mp_id=c(410,172), c('cabinet','home'), verbose=TRUE,
      start_date = '2017-02-01', end_date= '2017-03-18')
    expect_length(xcwq, 12)
    expect_type(xcwq, "list")
    expect_true(tibble::is_tibble(xcwq))
    expect_equal(nrow(xcwq), 61)

    # Commons Terms

    xcte <- hansard_commons_terms(search = "estate", verbose=TRUE)
    expect_length(xcte, 20)
    expect_type(xcte, "list")
    expect_true(tibble::is_tibble(xcte))

    xctec <- hansard_commons_terms(search = "estate",
                                   class = "ORG", verbose=TRUE)
    expect_length(xctec, 19)
    expect_type(xctec, "list")
    expect_true(tibble::is_tibble(xctec))

})

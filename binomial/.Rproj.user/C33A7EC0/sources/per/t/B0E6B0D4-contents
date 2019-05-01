source("/Users/induk/Desktop/CAL Spring 19/stat 133/R/workout/workout03/Binomial/R/binomial.R")

context("Check binomial input validity")

test_that("check_prob", {

  expect_true(check_prob(0.5))
  expect_length(check_prob(1),1)
  expect_error(check_prob(1.7))
})

test_that("check_trials", {

  expect_true(check_trials(1))
  expect_error(check_trials(0.2))
  expect_error(check_trials(-2))
  expect_length(check_trials(1), 1)
})

test_that("check_success", {

  expect_true(check_success(2,3))
  expect_error(check_success(3,2))
  expect_error(check_success(-2,-3))
  expect_length(check_success(2,3), 1)
})

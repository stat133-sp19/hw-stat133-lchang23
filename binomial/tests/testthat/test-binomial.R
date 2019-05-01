source("/Users/induk/Desktop/CAL Spring 19/stat 133/R/workout/workout03/Binomial/R/binomial.R")

context("Check binomial main functions input validity")

test_that("bin_choose", {

  expect_length(bin_choose(5,2),1)
  expect_equal(bin_choose(3,2),3)
  expect_error(bin_choose(2,3))
})

test_that("bin_probability", {

  expect_length(bin_probability(3,10,0.5),1)
  expect_equal(bin_probability(2,5,0.5),0.3125)
  expect_error(bin_probability(2,5,-0.5))
})

test_that("bin_distribution", {

  expect_error(bin_distribution(0.5,0.5))
  expect_length(bin_distribution(5,0.5),2)
  expect_error(bin_distribution(5,1.2))
})

test_that("bin_cumulative", {

  expect_error(bin_cumulative(0.5,0.5))
  expect_length(bin_cumulative(5,0.5),3)
  expect_error(bin_cumulative(5,1.2))
})

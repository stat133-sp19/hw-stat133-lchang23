source("/Users/induk/Desktop/CAL Spring 19/stat 133/R/workout/workout03/Binomial/R/binomial.R")

context("Check summary measures input validity")

test_that("aux_mean", {

  expect_lt(aux_mean(10,0.3),5)
  expect_equal(aux_mean(10,0.3),3)
  expect_gt(aux_mean(10,0.3),2)
})

test_that("aux_variance", {

  expect_lt(aux_variance(10,0.3),5)
  expect_equal(aux_variance(10,0.3),2.1)
  expect_gt(aux_variance(10,0.3),2)
})

test_that("aux_mode", {

  expect_lt(aux_mode(10,0.3),5)
  expect_equal(aux_mode(10,0.3),3)
  expect_gt(aux_mode(10,0.3),2)
})

test_that("aux_mode", {

  expect_equal(aux_mode(3,0.3),1)
  expect_equal(aux_mode(10,0.3),3)
  expect_equal(aux_mode(4,0.5),2)
})

test_that("aux_skewness", {

  expect_lt(aux_skewness(5,0.2),0.70)
  expect_equal(aux_skewness(10,0.5),0)
  expect_gt(aux_skewness(15,0.7),-0.30)
})

test_that("aux_kurtosis", {

  expect_lt(aux_kurtosis(5,0.2),0.075)
  expect_equal(aux_kurtosis(5,0.2),0.05)
  expect_gt(aux_kurtosis(15,0.7),-0.09)
})

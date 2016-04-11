library(assertthat)
library(ExtraAssertions)
context("Function arguments")

test_that("in_options works on all classes", {
	# Should work
	expect_true(assert_that(in_option(2, 1:3)))
	expect_true(assert_that(in_option("a", letters[1:3])))

	# Should fail
	expect_error(assert_that(in_option(2, 3:10)))
	expect_error(assert_that(in_option("a", LETTERS)))
})

test_that("in_options finds scalars", {
	# Fail on scalar
	expect_error(assert_that(in_option(2:4, 3:10)))
	expect_error(assert_that(in_option(c("a", "b"), LETTERS)))
})



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

test_that("is_class works on all classes", {
	# Example data
	m <- replicate(3, rnorm(5))

	# Should work
	expect_true(assert_that(is_class(iris, "data.frame")))
	expect_true(assert_that(is_class(m, "matrix")))
	expect_true(assert_that(is_class(letters, "character")))

	# Should fail
	expect_error(assert_that(is_class(mtcars, "character")))
	expect_error(assert_that(is_class(letters, "matrix")))
	expect_error(assert_that(is_class(2, 1:2)))
})

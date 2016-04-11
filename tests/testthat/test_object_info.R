library(assertthat)
library(ExtraAssertions)
context("Object Information")

test_that("Rownames are detected", {
	# Should work
	expect_true(assert_that(has_rownames(iris)))

	# Should fail
	m <- replicate(3, rnorm(10))
	expect_error(assert_that(has_rownames(m)))
})

test_that("Rownames are detected", {
	# Should work
	expect_true(assert_that(has_colnames(iris)))

	# Should fail
	m <- replicate(3, rnorm(10))
	expect_error(assert_that(has_colnames(m)))
})

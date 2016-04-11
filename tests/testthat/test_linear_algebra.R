library(assertthat)
library(ExtraAssertions)
context("Object Information")

test_that("Not full rank detected", {
	# Example data
	empty <- as.matrix(iris[0, ])
	mod <- model.matrix(~Species, data=iris)
	mod1 <- cbind(mod, mod[,2])

	# Should work
	expect_true(assert_that(is_fullrank(mod)))

	# Should fail
	expect_error(assert_that(is_fullrank(empty)))
	expect_error(assert_that(is_fullrank(mod1)))
})

test_that("Missing intercept", {
	# Example data
	mod1 <- model.matrix(~Species, data=iris)
	mod2 <- model.matrix(~Species+0, data=iris)
	mod3 <- mod2
	mod3[,1] <- 2

	# Should work
	expect_true(assert_that(has_intercept(mod1)))

	# Should fail
	expect_error(assert_that(has_intercept(mod2)))
	expect_error(assert_that(has_intercept(mod3)))
})

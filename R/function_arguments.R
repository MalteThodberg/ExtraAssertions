#' Check if value is a valid option
#'
#' Checks whether the value is scalar and in the supplied options. No class checks are performed.
#'
#' @param x value.
#' @param options possible options for x to take.
#' @import assertthat
#' @return TRUE or FALSE
#' @export
in_option <- function(x, options) {
	assert_that(is.scalar(x))
	x %in% options
}
assertthat::on_failure(in_option) <- function(call, env) {
	paste0(deparse(call$x), " is not in possible options: ", deparse(call$options))
}

#' Check if object is valid class
#'
#' Checks whether the object is valid class.
#'
#' @param x value.
#' @param options possible classes for x.
#' @import assertthat
#' @return TRUE or FALSE
#' @export
is_class <- function(x, options) {
	class(x) %in% options
}
assertthat::on_failure(is_class) <- function(call, env) {
	paste0(deparse(call$x), "is not an object of class: ", deparse(call$options))
}

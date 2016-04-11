#' Check if model matrix is full rank
#'
#' Checks whether the value is full rank matrix.
#'
#' @param x value.
#' @import assertthat
#' @return TRUE or FALSE
#' @export
is_fullrank <- function(x){
	assert_that(is.matrix(x))
	assert_that(not_empty(x))
	qr(x)$rank >= ncol(x)
}
assertthat::on_failure(is_fullrank) <- function(call, env) {
	paste0(deparse(call$x), " is not full rank!")
}

#' Check if model matrix has intercept
#'
#' Checks whether the value is a full rank matrix with an intercept term as the first colum.
#'
#' @param x value.
#' @import assertthat
#' @return TRUE or FALSE
#' @export
has_intercept <- function(x){
	assert_that(is_fullrank(x))

	vals <- unique(x[,1])
	all(length(vals) == 1 & vals == 1)
}
assertthat::on_failure(has_intercept) <- function(call, env) {
	paste0(deparse(call$x), " does not have an intercept-term as the first column!")
}

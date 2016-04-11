#' Check if object has rownames
#'
#' Check if object has rownames. Note it is not checked first whether the object is a matrix or dataframe.
#'
#' @param x object.
#'
#' @return TRUE or FALSE
#' @export
has_rownames <- function(x) {
	!is.null(rownames(x))
}
assertthat::on_failure(has_rownames) <- function(call, env) {
	paste0(deparse(call$x), " does not have row names!")
}

#' Check if object has colnames
#'
#' Check if object has colnames. Note it is not checked first whether the object is a matrix or dataframe.
#'
#' @param x object.
#'
#' @return TRUE or FALSE
#' @export
has_colnames <- function(x) {
	!is.null(colnames(x))
}
assertthat::on_failure(has_colnames) <- function(call, env) {
	paste0(deparse(call$x), " does not have column names!")
}

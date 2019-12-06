#' Secure Container
#'
#' Find password with following rules:
#'
#' - It is a six-digit number.
#' - The value is within the range given in your puzzle input.
#' - Two adjacent digits are the same (like 22 in 122345).
#' - Going from left to right, the digits never decrease;
#' they only ever increase or stay the same (like 111123 or 135679).
#'
#' If no_large_group is defined, the two adjacent matching digits are not part of
#' a larger group of matching digits.
#'
#' @param min,max range of password
#' @param no_large_group
#'
#' @examples
#' secure_container(245318, 765747)
#' secure_container(245318, 765747, no_large_group = TRUE)
#'
#' @export
#'
secure_container <- function(min, max = min, no_large_group = FALSE) {
  res <- 0
  for (i in seq(min, max, 1)) {
    if (has_adjacent(i, no_large_group = no_large_group) && always_increase(i)) res <- res + 1
  }
  return(res)
}

has_adjacent <- function(x, no_large_group) {
  groups <- rle(strsplit(as.character(x), "")[[1]])$lengths
  if (no_large_group) {
    return(any(groups == 2))
  } else {
    return(any(groups > 1))
  }
}

always_increase <- function(x) {
  all(diff(as.numeric(strsplit(as.character(x), "")[[1]])) >= 0)
}

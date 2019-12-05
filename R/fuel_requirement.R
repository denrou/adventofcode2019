#' Fuel Requirement
#'
#' Fuel required to launch a given module is based on its mass.
#' Specifically, to find the fuel required for a module,
#' take its mass, divide by three, round down, and subtract 2.
#'
#' @param mass A numeric vector
#'
#' @examples
#' sum(sapply(day_1, fuel_requirement))
#'
#' @export
#'
fuel_requirement <- function(mass) {
  mass_fuel_total <- 0
  while (mass > 0) {
    mass            <- max(0, floor(mass / 3) - 2)
    mass_fuel_total <- mass_fuel_total + mass
  }
  return(mass_fuel_total)
}

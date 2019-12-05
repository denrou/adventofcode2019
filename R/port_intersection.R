#' Port Intersection
#'
#' The wires twist and turn, but the two wires occasionally cross paths.
#' To fix the circuit, you need to find the intersection point closest to the central port.
#' Because the wires are on a grid, use the Manhattan distance for this measurement.
#' While the wires do technically cross right at the central port where they both start,
#' this point does not count, nor does a wire count as crossing with itself.
#'
#' @param wire1,wire2 A character vector of wires
#' @param use_time A logical should the answer return time or manhatan distance
#'
#' @importFrom rlang !!
#' @importFrom magrittr %>%
#'
#' @examples
#' port_intersection(day_3[[1]], day_3[[2]])
#' port_intersection(day_3[[1]], day_3[[2]], use_time = TRUE)
#'
#' @export
#'
port_intersection <- function(wire1, wire2, use_time = FALSE) {
  circuit_1 <- build_circuit(wire1)
  circuit_2 <- build_circuit(wire2)
  junctions <- dplyr::intersect(circuit_1, circuit_2)[-1, ]
  if (!use_time) return(min(abs(junctions[[1]]) + abs(junctions[[2]])))
  return(min(purrr::pmap_dbl(junctions, get_time_to_junction, circuit_1, circuit_2)))
}

build_circuit <- function(wire) {
  direction  <- substr(wire, 1, 1)
  value      <- as.numeric(substr(wire, 2, 100))
  horizontal <- purrr::map2_dbl(direction, value, function(d, x) {
    if (d %in% c("U", "D")) return(0)
    if (d == "L") return(- x)
    if (d == "R") return(x)
  })
  vertical <- purrr::map2_dbl(direction, value, function(d, x) {
    if (d %in% c("L", "R")) return(0)
    if (d == "D") return(x)
    if (d == "U") return(- x)
  })
  circuit <- matrix(nrow = sum(abs(value)), ncol = 2)
  x <- y <- 0
  idx <- 1
  for (i in seq_along(wire)) {
    circuit[idx:(idx+abs(value[i])), 1] <- x:(x + horizontal[i])
    circuit[idx:(idx+abs(value[i])), 2] <- y:(y + vertical[i])
    x <- x + horizontal[i]
    y <- y + vertical[i]
    idx <- sum(abs(value[1:i]))
  }
  return(as.data.frame(circuit))
}


get_time_to_junction <- function(V1, V2, circuit_1, circuit_2) {
  distance_1 <- extract_time(circuit_1, V1, V2)
  distance_2 <- extract_time(circuit_2, V1, V2)
  distance_1 + distance_2
}

extract_time <- function(circuit, V1, V2) {
  circuit %>%
    dplyr::mutate(time = seq_len(dplyr::n())) %>%
    dplyr::filter(V1 %in% !!V1, V2 %in% !!V2) %>%
    dplyr::group_by(V1, V2) %>%
    dplyr::summarise_all(dplyr::first) %>%
    dplyr::pull("time")
}

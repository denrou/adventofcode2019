#' Gravity Assist
#'
#' An Intcode program is a list of integers separated by commas (like 1,0,0,3,99).
#' To run one, start by looking at the first integer (called position 0).
#' Here, you will find an opcode - either 1, 2, or 99.
#' The opcode indicates what to do;
#' for example, 99 means that the program is finished and should immediately halt.
#' Encountering an unknown opcode means something went wrong.
#'
#' Opcode 1 adds together numbers read from two positions and stores the result
#' in a third position.
#' The three integers immediately after the opcode tell you these three positions -
#' the first two indicate the positions from which you should read the input values,
#'  and the third indicates the position at which the output should be stored.
#'
#' For example, if your Intcode computer encounters 1,10,20,30,
#' it should read the values at positions 10 and 20, add those values,
#' and then overwrite the value at position 30 with their sum.
#'
#' Opcode 2 works exactly like opcode 1,
#' except it multiplies the two inputs instead of adding them.
#' Again, the three integers after the opcode indicate where the inputs and
#' outputs are, not their values.
#'
#' Once you're done processing an opcode, move to the next one by stepping
#' forward 4 positions.
#'
#' @param opcode a vector of numeric values
#'
#' @examples
#' gravity_assist(day_2, 12, 2)[1]
#'
#' find_pair_output <- function(output) {
#'   for (noun in seq_len(99)) {
#'     for(verb in seq_len(99)) {
#'       if (gravity_assist(day_2, noun, verb)[1] == output) return(100 * noun + verb)
#'     }
#'   }
#' }
#' find_pair_output(19690720)
#'
#' @export
#'
gravity_assist <- function(opcode, noun = opcode[2], verb = opcode[3]) {
  opcode[2] <- noun
  opcode[3] <- verb
  read_idx <- 1
  while (opcode[read_idx] != 99) {
    if (opcode[read_idx] == 1) fun <- `+` else if (opcode[read_idx] == 2) fun <- `*`
    x                 <- opcode[read_idx + 1] + 1
    y                 <- opcode[read_idx + 2] + 1
    write_idx         <- opcode[read_idx + 3] + 1
    opcode[write_idx] <- fun(opcode[x], opcode[y])
    read_idx          <- read_idx + 4
  }
  return(opcode)
}

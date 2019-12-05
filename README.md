
<!-- README.md is generated from README.Rmd. Please edit that file -->

# adventofcode

<!-- badges: start -->

<!-- badges: end -->

My attempt to [Advent Of Code](https://adventofcode.com/2019) as an R
package. Each solution is stored as a function, and solution is given as
an example for the function. Unit tests are also provided :)

## Installation

You can install the released version of adventofcode from
[github](https://github.com/denrou/adventofcode2019) with:

``` r
install.packages("adventofcode")
```

## Example

This is a basic example which shows you how to solve problem from day 1:

``` r
library(adventofcode)
sum(sapply(day_1, fuel_requirement))
#> [1] 5055835
```

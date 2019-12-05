## code to prepare `day_1` dataset goes here

day_1 <- as.numeric(readLines("data-raw/day_1_input"))

day_2 <- as.numeric(strsplit(readLines("data-raw/day_2_input"), ",")[[1]])

day_3 <- strsplit(readLines("data-raw/day_3_input"), ",")

usethis::use_data(day_1, day_2, day_3, overwrite = TRUE)

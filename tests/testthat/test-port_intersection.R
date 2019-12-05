test_that("port intersection works", {
  expect_equal(port_intersection(c("R8","U5","L5","D3"),c("U7","R6","D4","L4")), 6)
  expect_equal(port_intersection(c("R75","D30","R83","U83","L12","D49","R71","U7","L72"),c("U62","R66","U55","R34","D71","R55","D58","R83")), 159)
  expect_equal(port_intersection(c("R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"),c("U98","R91","D20","R16","D67","R40","U7","R15","U6","R7")), 135)
  expect_equal(port_intersection(c("R8","U5","L5","D3"),c("U7","R6","D4","L4"), use_time = TRUE), 30)
  expect_equal(port_intersection(c("R75","D30","R83","U83","L12","D49","R71","U7","L72"),c("U62","R66","U55","R34","D71","R55","D58","R83"), use_time = TRUE), 610)
  expect_equal(port_intersection(c("R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"),c("U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"), use_time = TRUE), 410)
})

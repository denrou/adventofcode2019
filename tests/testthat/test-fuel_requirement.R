test_that("multiplication works", {
  expect_equal(fuel_requirement(12), 2)
  expect_equal(fuel_requirement(14), 2)
  expect_equal(fuel_requirement(1969), 966)
  expect_equal(fuel_requirement(100756), 50346)
})

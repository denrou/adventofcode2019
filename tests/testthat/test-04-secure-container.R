test_that("Secure container works", {
  expect_equal(secure_container(111111), 1)
  expect_equal(secure_container(223450), 0)
  expect_equal(secure_container(123789), 0)
  expect_equal(secure_container(112233, no_large_group = TRUE), 1)
  expect_equal(secure_container(123444, no_large_group = TRUE), 0)
  expect_equal(secure_container(111122, no_large_group = TRUE), 1)
})

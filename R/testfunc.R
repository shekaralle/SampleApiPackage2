testfunc <- function(){
testthat::test_that("Status Code Successful",{
  result <- apiCall2("http://api.open-notify.org/astros.json")
  expect_that(result,equals(200))
}
)
testthat::test_that("Status Code Error",{
  result <- apiCall2("http://api.open-notify.org/astros.json.")
  expect_that(result,equals(404))
}
)
}

testfunc()

library(testthat)

describe("plumber API", {
  it("/version returns version", {
    expect_equal(api_version(), 1)
  })

  it("/releases returns releases", {
    expect_gt(nchar(api_v1_icalendar()), 1)
    expect_match(api_v1_icalendar("Labour Force"), "Labour Force")
  })
})

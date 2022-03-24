library(testthat)

describe("plumber API", {
  it("/version returns version", {
    expect_equal(api_version(), 1)
  })

  it("/releases returns releases", {
    # TODO:
    # expect_equal(api_v1_releases(), NULL)
  })
})

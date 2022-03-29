library(testthat)

describe("plumber API", {
  it("exposes an iCalendar endpoint", {
    expect_match(api_v1_icalendar(), "^BEGIN:VCALENDAR")
    expect_match(api_v1_icalendar("Labour Force, Australia"), "Labour Force, Australia")
  })
})

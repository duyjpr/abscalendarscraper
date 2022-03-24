#* @apiTitle ABS calendar web scraper
#* @apiDescription Scrapes releases from ABS website and presents them in other formats.

#* Latest version. Useful for a diagnostics.
#* @get /version
api_version <- function() {
  1
}

#* Get ABS releases in iCalendar format
#* @get /v1/icalendar
#* @param title:[string] Release titles to select. Case sensitive. Leave empty to return all releases.
#* @serializer contentType list(type = "text/calendar")
#' @importFrom rlang .data .env
api_v1_icalendar <- function(title = "") {
  title <- stringr::str_trim(title)
  title <- title[nchar(title) > 0]

  releases <- read_abs_calendar()
  if(length(title) > 0) {
    releases <- releases |>
      dplyr::filter(stringr::str_detect(.data$title, stringr::fixed(.env$title)))
  }
  to_ical(releases)
}

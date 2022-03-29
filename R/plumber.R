#* @apiTitle ABS calendar web scraper
#* @apiDescription Scrapes releases from ABS website and presents them in other formats.
#* @apiVersion 1

#* Welcome page. Currently redirects to GitHub repo.
#* @get /
function(res) {
  dest_url <- "https://github.com/duyjpr/abscalendarscraper"

  res$status <- 302 # Moved
  res$setHeader("Location", dest_url)
  paste0("See: ", dest_url)
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
      dplyr::filter(.data$title %in% .env$title)
  }
  to_ical(releases)
}

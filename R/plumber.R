#* @apiTitle ABS calendar web scraper
#* @apiDescription Scrapes releases from ABS website and presents them in other formats. Source on [GitHub](https://github.com/duyjpr/abscalendarscraper).
#* @apiVersion 1

#* Browser home page. Currently redirects to GitHub repo, but may change in future.
#* @get /
function(res) {
  dest_url <- "https://github.com/duyjpr/abscalendarscraper"

  res$status <- 302 # Moved
  res$setHeader("Location", dest_url)
  paste0("See: ", dest_url)
}

#* Check service status. Useful for diagnostics. Response body will be "OK" if service is up and running.
#* @get /status
#* @serializer text
function() {
  "OK"
}

#* Get ABS releases in iCalendar format.
#* @get /v1/icalendar
#* @param title:[string] (Optional) Release titles (names) to select. Leave empty to return all releases. Case sensitive, and must match the whole release title. E.g. "Labour Force, Australia".
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

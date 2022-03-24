#* @apiTitle ABS calendar web scraper
#* @apiDescription Scrapes releases from ABS website and presents them in other formats.

#* Latest version. Useful for a diagnistics.
#* @get /version
api_version <- function() {
  1
}

#* Get ABS releases in iCalendar format
#* @get /v1/releases
#* @param title:[string] Release titles to select. Case insensitive. Leave empty to return all releases.
#* @param format:string Format to return. Recognised values: `icalendar`
api_v1_releases <- function(title = "", format = "icalendar") {
  # TODO
  list(title=title, format=format)
}

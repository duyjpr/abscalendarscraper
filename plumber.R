# Required by buildpack to indicate a plumber project
# https://github.com/virtualstaticvoid/heroku-buildpack-r/

#* Latest version
#* @get /version
function() {
  1
}

#* Get ABS releases in iCalendar format
#* @get /v1/icalendar
#* @param title:[string] Release titles to select. Case insensitive. Leave empty to return all releases.
function(title = "") {
  # TODO
  title
}

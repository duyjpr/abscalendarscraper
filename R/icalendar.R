ical_date <- function(x) {
  x |>
    lubridate::with_tz("UTC") |>
    lubridate::format_ISO8601() |>
    paste0("Z")
}
ical_escape_newlines <- function(x) {
  x |>
    stringr::str_replace_all(stringr::fixed("\n"), "\\n")
}

to_ical_event <- function(time, title, description, ref_period, latest_url, ...) {
  # Expected output:
  #
  # BEGIN:VEVENT
  # UID:...
  # DTSTAMP:...
  # DTSTART:...
  # SUMMARY:...
  # DESCRIPTION:...
  # END:VEVENT

  uid <-
    sprintf(
      "%s.%s@calendar.abs"
      , stringr::str_replace_all(title, "[^[:alnum:]]+", "_")
      , stringr::str_replace_all(ref_period, "[^[:alnum:]]+", "_")
    )
  dtstamp <- lubridate::now() |> ical_date()
  dtstart <- time |> ical_date()
  dtend <- dtstart
  summary <- paste(title, ref_period, sep=", ")
  description <- paste(description, latest_url, sep="\n\n") |>
    ical_escape_newlines()

  paste(
    "BEGIN:VEVENT"
    , paste0("UID:", uid)
    , paste0("DTSTAMP:", dtstamp)
    , paste0("DTSTART:", dtstart)
    , paste0("DTEND:", dtend)
    , paste0("SUMMARY:", summary)
    , paste0("DESCRIPTION:", description)
    , "END:VEVENT"

    , sep="\n"
  )
}

to_ical <- function(events) {
  # Expected output:
  #
  # BEGIN:VCALENDAR
  # VERSION:2.0
  # PRODID:...
  # BEGIN:VEVENT
  # ...
  # END:VEVENT
  # END:VCALENDAR

  ical_events <-
    do.call(to_ical_event, events) |>
    paste(collapse="\n")

  paste(
    "BEGIN:VCALENDAR"
    , "VERSION:2.0"
    , "PRODID:f8f843f9-8d21-4e11-9a62-aef615a226d1"
    , ical_events
    , "END:VCALENDAR"
    , sep="\n"
  )
}

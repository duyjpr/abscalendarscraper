<!-- badges: start -->
[![R-CMD-check](https://github.com/duyjpr/abscalendarscraper/workflows/R-CMD-check/badge.svg)](https://github.com/duyjpr/abscalendarscraper/actions/workflows/R-CMD-check.yaml)
[![Deploy to Heroku](https://github.com/duyjpr/abscalendarscraper/workflows/Deploy%20to%20Heroku/badge.svg)](https://github.com/duyjpr/abscalendarscraper/actions/workflows/deploy-to-heroku.yaml)
<!-- badges: end -->

# ABS calendar scraper

Scrapes the [ABS release calendar](https://www.abs.gov.au/release-calendar/future-releases) and presents entries in iCalendar format, ready to import into another calendar app.

## Examples

-   All ABS releases:  
    <https://desolate-waters-06980.herokuapp.com/v1/icalendar>

-   Only Labour Force and Detailed Labour Force:  
    <https://desolate-waters-06980.herokuapp.com/v1/icalendar?title=Labour%20Force%2C%20Australia&title=Labour%20Force%2C%20Australia%2C%20Detailed>
    
-   Selected titles `title1`...`titleN`:  
    `https://desolate-waters-06980.herokuapp.com/v1/icalendar?title={title1}...&title={titleN}`

    Release titles are the large names at the top of of release pages, e.g. "Labour Force, Australia". Must be [percent-encoded](https://en.wikipedia.org/wiki/Percent-encoding).

## API docs

To try out other examples, see the API docs:

-   <https://desolate-waters-06980.herokuapp.com/__docs__/>

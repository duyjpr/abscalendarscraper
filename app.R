# Required by buildpack to run app
# https://github.com/virtualstaticvoid/heroku-buildpack-r/

invisible(lapply(Sys.glob("R/*.R"), source))

port <- as.numeric(Sys.getenv("PORT"))
if(is.na(port)) port <- NULL # dev environment

server <- plumber::plumb("R/plumber.R")
server$run("0.0.0.0", port)

# Required by buildpack to run app
# https://github.com/virtualstaticvoid/heroku-buildpack-r/

port <- Sys.getenv("PORT")
server <- plumber::plumb("plumber.R")
server$run("0.0.0.0", as.numeric(port))

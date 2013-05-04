# Module dependencies.
application_root = __dirname
express = require 'express'  #Web framework
path = require 'path'  #Utilities for dealing with file paths
fs = require 'fs'

#Create server
app = express()

# Configure server
app.configure = () -> 
    #parses request body and populates request.body
    app.use express.bodyParser() 

    #checks request.body for HTTP method overrides
    app.use express.methodOverride() 

    #perform route lookup based on url and HTTP method
    app.use app.router 

    #Where to serve static content
    app.use express.static path.join application_root, 'site'  

    #Show all errors in development
    app.use express.errorHandler {dumpExceptions: true, showStack: true}


#Start server
port = 4040
app.listen port, () -> 
    console.log 'Express server listening on port %d in %s mode', port, app.settings.env 

# Routes
app.get '/library/:name', (request, response) -> 
    lib = require "./site/libraries/#{request.params.name}"
    response.send lib

app.get '/libraries', (request, response) ->
  libs = fs.readdirSync "./site/libraries"
  response.send (library: lib for lib in libs)

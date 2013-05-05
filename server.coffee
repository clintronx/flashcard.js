# Module dependencies.
application_root = __dirname
express = require 'express'  #Web framework
path = require 'path'  #Utilities for dealing with file paths
fs = require 'fs'

#Create server
app = express()

# Configure server
app.configure () -> 
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
LIB_DIR = "./site/libraries"

#get all decks properties
#returns json array of deck property models
#[{name: "filename", size: "number of cards in the deck"},...]
app.get '/decks', (request, response) ->
  filenames = fs.readdirSync LIB_DIR

  deckProperties = []
  for filename in filenames
    try
      contents = JSON.parse fs.readFileSync("#{LIB_DIR}/#{filename}")
    catch e
      console.log "error encountered processing file #{filename} - ensure file is properly formatted JSON - skipping file"
      continue
    
    deckProperties.push
      name: filename
      size: if contents.length then contents.length else 1

  response.send deckProperties

#get all cards from the deck
app.get '/deck/:name', (request, response) -> 
    lib = require "#{LIB_DIR}/#{request.params.name}"
    response.send lib

#get a single card from the deck
app.get '/deck/:name/:id', (request, response) -> 
    lib = require "#{LIB_DIR}/#{request.params.name}"
    response.send lib[request.params.id]
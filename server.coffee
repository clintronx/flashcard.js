# Module dependencies.
application_root = __dirname
express = require 'express'  #Web framework
path = require 'path'  #Utilities for dealing with file paths
fs = require 'fs'

#Create server
app = express()

# Configure server
app.configure () ->
  #Where to serve static content
  app.use express.static path.join application_root, 'site'

  #Show all errors in development
  app.use express.errorHandler {dumpExceptions: true, showStack: true}


#Start server
port = process.env.PORT || 4040
app.listen port, () ->
  console.log 'Express server listening on port %d in %s mode', port, app.settings.env

# Routes
LIB_DIR = "./site/libraries"

isDeckFilename = (filename) ->
  path.extname(filename) is '.json'

#get all decks properties
#returns json array of deck property models
#[{name: "filename", size: "number of cards in the deck"},...]
app.get '/flashcard/decks', (request, response) ->
  fs.readdir LIB_DIR, (err, files) ->

    deckFilenames = files.filter isDeckFilename

    deckProperties = for filename in deckFilenames
      cards = JSON.parse fs.readFileSync "#{LIB_DIR}/#{filename}"

      name: filename
      size: cards.length

    response.send deckProperties

#get all cards from the deck
app.get '/flashcard/deck/:name', (request, response) ->
  lib = require "#{LIB_DIR}/#{request.params.name}"
  response.send lib

#get a single card from the deck
app.get '/flashcard/deck/:name/:id', (request, response) ->
  lib = require "#{LIB_DIR}/#{request.params.name}"
  response.send lib[request.params.id]

handleIndexRequest = (request, response) ->
  response.sendfile __dirname + '/site/index.html'

app.get '/deck/*'   , handleIndexRequest
app.get '/player/*' , handleIndexRequest

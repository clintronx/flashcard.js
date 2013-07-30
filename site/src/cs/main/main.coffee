require.config
  waitSeconds: 60

  onError: ( requireType, requireModules ) ->
    if requireType is 'timeout'
      alert 'Your Connection Seems to be very slow at the moment.\nPlease try again later.'

  paths:
    jquery:                         [ "//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min", "../../../vendor/jquery/1.9.1/jquery-1.9.1.min" ]
    lodash:                         [ "//cdnjs.cloudflare.com/ajax/libs/lodash.js/1.2.1/lodash.min", "../../../vendor/lodash/1.2.1/lodash.min" ]
    backbone:                       [ "//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.0.0/backbone-min", "../../../vendor/backbone/1.0.0/backbone-min" ]
    Handlebars:                       "../../../vendor/require-handlebars/0.4.0/Handlebars"
    hbs:                              "../../../vendor/require-handlebars/0.4.0/hbs"
    bootstrap:                        "../../../vendor/bootstrap/2.3.2/js/bootstrap.min"

    Router:                           "./Router"
    Cards:                            "./collections/Cards"
    Decks:                            "./collections/Decks"
    Card:                             "./models/Card"
    Deck:                             "./models/Deck"
    CardView:                         "./views/CardView"
    DecksView:                        "./views/DecksView"
    GridView:                         "./views/GridView"
    NavbarView:                       "./views/NavbarView"
    PlayerView:                       "./views/PlayerView"

  shim:
    lodash:
      exports:    "_"
    backbone:
      deps:       [ "lodash", "jquery" ]
      exports:    "Backbone"
    bootstrap:
      deps:       ["jquery"]

  hbs:
    disableI18n: true

require [
  "jquery"
  "backbone"
  "Router"
], ($, Backbone, Router) ->
  $ ->
    window.app =
      version: "0.1.0"
      router: new Router()
